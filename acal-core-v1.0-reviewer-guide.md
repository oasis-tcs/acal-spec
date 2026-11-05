# ACAL Expression Languages: An Evaluator and Implementer Guide

## Purpose

This document is a companion guide for anyone seeking to understand the
Attribute-Centric Authorization Language (ACAL), its relationship to
XACML, and the choice among its three concrete expression languages:
XML (XACML v4.0), JSON (JACAL v1.0), and YAML (YACAL v1.0).

It is intended to be useful to:

1. Organizations evaluating ACAL for new deployments
2. XACML implementers considering migration or extension
3. Developers working with any one concrete representation who want to
   understand how the others compare
4. Reviewers of the YACAL specification who want context beyond the
   specification text itself

This guide is explanatory and informative. It does not replace any
normative specification.

---

## What is ACAL: The Abstract Successor to XACML

ACAL (Attribute-Centric Authorization Language) Version 1.0 is a
successor to XACML 3.0, produced by the OASIS XACML Technical
Committee.

The central architectural decision in ACAL is the separation of policy
semantics from serialization syntax. XACML 3.0, while semantically
rich, expressed everything in XML — the abstract model and the concrete
representation were fused into a single specification. This made it
impossible to express the same policy in another format without building
an entirely new specification from scratch.

ACAL addresses this by defining an *abstract model* in UML that
captures all policy semantics without reference to any serialization
format. Concrete representations — XML, JSON, YAML — are then defined
as separate companion specifications that map the abstract model to a
particular format. This is the same design pattern used by many modern
standards (ASN.1, Protobuf, OpenAPI) where the information model and
the encoding are defined independently.

The result is a specification family:

| Specification | Role | Short name |
|---|---|---|
| ACAL Core v1.0 | Abstract model, processing rules, conformance | ACAL |
| ACAL Core – XML Representation Profile v4.0 | XML serialization of ACAL | XACML v4.0 |
| ACAL Core – JSON Representation Profile v1.0 | JSON serialization of ACAL | JACAL v1.0 |
| ACAL Core – YAML Representation Profile v1.0 | YAML serialization of ACAL | YACAL v1.0 |

ACAL is the authoritative source for all policy semantics, evaluation
behavior, conformance requirements, and standard identifier definitions.
Each representation specification maps that abstract model to its format
and defines any format-specific processing rules.

An implementation that speaks XACML v4.0 and one that speaks
JACAL v1.0 are both ACAL-conformant implementations sharing the same
policy semantics. A policy expressed in XACML v4.0 and the same policy
expressed in JACAL v1.0 represent the same ACAL instance with the same
meaning.

---

## XACML to ACAL: Key Changes

ACAL 1.0 is a significant evolution of XACML 3.0. The changes fall
into three categories: structural simplifications, new capabilities,
and the abstract model separation itself.

### Structural Simplifications

| Change | XACML 3.0 | ACAL 1.0 |
|---|---|---|
| Policy hierarchy | `Policy` and `PolicySet` are distinct constructs | `Policy` absorbs `PolicySet`; a policy may directly contain nested policies |
| Target syntax | `AnyOf / AllOf / Match` nested structure | A single Boolean expression — the same structure as a Rule `Condition` |
| Rule target | Rules have their own `Target` | Rules have no target; targeting is done at the policy level |
| Obligations and Advice | `ObligationExpression` and `AdviceExpression` are separate, under separate wrapper elements | `NoticeExpression` is a single unified type; the `IsObligation` flag distinguishes obligation from advice |
| Combiner parameters | `CombinerParameter` supported | Removed |
| Combining algorithms | Rule combining and policy combining are separate sets, including `only-one-applicable` | A single unified set; legacy algorithms removed |

### New Capabilities

| Capability | Notes |
|---|---|
| Short identifiers (`ShortIdSet`) | User-defined aliases for long URIs, reducing verbosity throughout policies; a standard ACAL short-identifier set is provided for all built-in identifiers |
| `QuantifiedExpression` | `ForAny`, `ForAll`, `Map`, and `Select` expressions, incorporating concepts from the XACML 3.0 Entities Profile |
| `Entity` data type | Abstract entity references, also from the Entities Profile |
| `SharedVariableDefinition` | Reusable parameterized variable definitions, shareable across policies in a `Bundle` |
| `Bundle` | A portable container for policies, shared variable definitions, and short identifier sets; facilitates cross-PDP policy exchange |
| New functions | Ternary conditional (`ternary-if`); sum, average, min, and max aggregate functions |
| `Attribute.DataType` | A common data type declared on the whole attribute, preventing mixed-type bags that were a source of errors in XACML 3.0 |

### Identifier Namespace

All standard identifiers have moved from the `urn:oasis:names:tc:xacml:`
prefix to `urn:oasis:names:tc:acal:`. The old prefix is deprecated.

### XPath Moved to a Profile

All XPath-specific functionality — XPath-based `AttributeSelector`,
XPath expression data type, XPath functions — has been moved to the
ACAL XPath Profile, a separate companion specification. Core ACAL and
each expression language remain valid without XPath support. This
allows the core specifications to be leaner and XPath support to be
declared explicitly as a claimed profile.

Similarly, the JSONPath Profile defines JSONPath-based
`AttributeSelector` extensions and is independent of both the core and
the XPath Profile.

### Integer Limits: Exact or Error, Within a Documented Interval

XACML 3.0 stated no range for `integer` values. Its one overflow rule
is in `integer-to-double` (an integer outside the range of a double
gives `Indeterminate`), and its Arithmetic Evaluation section (7.5)
applied IEEE 754 evaluation "enhanced with double precision" to integer
functions as well as double ones, without saying what an integer
result too large to represent becomes. ACAL Core now defines `integer` as the unbounded value space
of `xs:integer`
([Annex C.2.6](acal-core-v1.0.md#c26-data-types-defined-by-reference-to-xml-schema))
and lets an implementation support only part of it:

- An implementation should not impose a predetermined bound on the
  magnitude of an `integer` value that it evaluates. Every implementation documents its
  *supported integer interval* (all integers, if it imposes no
  predetermined bound), which Core requires to include at least
  −2<sup>63</sup> to 2<sup>63</sup>−1.
- When an evaluation requires an `integer` value outside that
  interval, cannot obtain a required `integer` value because an input
  acceptance limit applies, or cannot preserve a required `integer`
  value because an execution resource runs out, that evaluation returns
  `Indeterminate` with `processing-error`. A result is never
  wrapped, reduced modulo a bound, saturated or rounded, so two PDPs
  can differ only as *a value versus an error*, never as two different
  values.
- A limit that the evaluator applies to integers (a fixed width, a
  maximum magnitude), whether built in or configured, is an edge of the
  documented interval, not "resource exhaustion". Memory, time or stack
  limits reached during evaluation are resource exhaustion, even when
  configured in advance.
- *Input acceptance limits* are separate: bounds on what a request or
  policy may contain (request size, number or string length), applied
  at the parser, at a gateway or in the PDP. An implementation may
  refuse a request **before evaluation** if it exceeds such a limit or
  contains an integer outside the interval; if it returns a decision,
  that decision is `Indeterminate`, with status `processing-error` if a
  status code is returned. A request it
  admits is evaluated normally, and an unused out-of-range value then
  causes no error. Implementations document their input limits and
  which path they take.
- The interval applies to the values the specification names
  (literals, attribute values, selector results, function arguments and
  results), not to an implementation's internal steps. So the result of
  `integer-add` with several arguments, or of `integer-sum` over a bag,
  does not depend on argument or bag order.
- An out-of-range ACAL `integer` literal makes its policy `Indeterminate`
  whenever the policy is evaluated, the same treatment an unsupported
  function gets.

**What to check:**

- **The 64-bit floor is a choice.** It gives every conforming PDP a
  common range, so a policy whose integer values stay inside it is not
  affected by integer limits on any PDP. The alternative is no floor at
  all. That would admit smaller (for example 32-bit) embedded PDPs, but
  there would then be no range that works on every conforming PDP.
- **Portability is not the same as testability.** The new
  [Section 10.1.9](acal-core-v1.0.md#1019-implementation-defined-integer-limits)
  explains that an out-of-range *literal* shows up on the first test,
  whereas an out-of-range *request* value fails only for the requests
  that carry it. It also explains that moving policies between PDPs
  with different intervals, in either direction, can change a decision
  from `Deny` to `Permit` (`permit-unless-deny` on the smaller
  interval; `deny-unless-permit` on the larger). Confirm that these
  cases, and the advice given for them, are the ones your deployments
  face.
- **`integer-mod(−2^63, −1)`** is 0 on a 64-bit implementation, even
  though `integer-divide` with the same arguments is `Indeterminate`
  there (the quotient 2<sup>63</sup> is outside the interval).
  `integer-abs(−2^63)` is `Indeterminate`. These are the boundary cases
  where a native two's-complement implementation wraps or has undefined
  behavior, so they are worth adding to conformance tests.
- **Refusal before evaluation is optional, and documented.** It lets a
  safety-critical or security-hardened deployment reject bad input at
  the boundary, and lets an unbounded implementation evaluate it
  instead. A refused request never reaches a combining algorithm, so
  the `permit-unless-deny` effect above does not apply to it, but the
  PEP's handling of `Indeterminate` still decides access (a
  permit-biased PEP permits). Confirm this split matches how your
  deployments validate input.
- **Representations.** JACAL no longer limits a JSON *number* to
  ±(2<sup>53</sup>−1). A processor accepts a JSON number only if it
  reads the exact value, may reject one that exceeds its input limits,
  and documents those limits. Writing integers beyond ±(2<sup>53</sup>−1)
  as typed strings is recommended, because JSON software outside ACAL
  that uses binary64 numbers can round them before the PDP sees them.
  YACAL follows the same model. Rejecting a representation because its
  integer is outside the interval counts as refusing the whole request
  or policy, never as an error inside an admitted request.

---

## The Three Expression Languages

All three representations are first-class citizens of the ACAL
specification family. They are not derivatives of one another. Each
maps the ACAL abstract model to its format independently.

### XACML v4.0 (XML)

XACML v4.0 is the continuation of the XACML line. It is the XML
representation of ACAL.

| Aspect | Details |
|---|---|
| Schema mechanism | W3C XML Schema 1.1 (structural) + Schematron or XSD 1.1 assertions (higher-order constraints) |
| Type discrimination | Element names identify types (`<Rule>`, `<Policy>`, `<Apply>`, etc.) |
| Literal typing | A uniform `<Value>` surface form is used; the effective ACAL `DataType` determines whether the value is a fixed primitive literal, a restricted string literal, or a structured value |
| Namespace handling | XML namespace prefixes (`xmlns:xacml="urn:oasis:names:tc:xacml:4.0:core:schema"`) |
| Short identifier support | Present; `{name}` notation in attribute values |
| Validation toolchain | Xerces2, Saxon, standard XSD 1.1 and Schematron processors |
| Best fit | Organizations with existing XML toolchains, enterprise integrations, and prior XACML deployments |

XACML v4.0 is the direct migration path for XACML 3.0 deployments. The
structural changes (Target simplification, Policy/PolicySet merge,
Obligations/Advice unification) require migration effort, but the
authoring model and tooling ecosystem are familiar.

### JACAL v1.0 (JSON)

JACAL v1.0 is the JSON representation of ACAL.

| Aspect | Details |
|---|---|
| Schema mechanism | JSON Schema Draft 2020-12, using `$dynamicRef`/`$dynamicAnchor` for profile extensibility |
| Type discrimination | Wrapper keys identify polymorphic types by name (`"Apply": {...}` inside `Apply`'s own `Argument` array; `"Rule": {...}` inside `Policy`'s `CombinerInput` array) rather than by element name as XML does |
| Literal typing | JSON booleans, integers, and non-integer numbers imply the fixed ACAL primitive literal types; strings rely on context or explicit `DataType` when needed |
| Namespace handling | Not applicable; namespaced identifiers are plain string URIs |
| Short identifier support | Present; `{name}` notation in string values |
| Validation toolchain | Any JSON Schema Draft 2020-12 validator (e.g. jsonschema by Sourcemeta, AJV) |
| Best fit | REST API ecosystems, microservices, cloud-native deployments, OpenID Connect environments |

JACAL identifies polymorphic values by wrapper key rather than by
element name — the `{"Apply": {...}}` / `{"Value": ...}` pattern used
throughout this document. Where XML uses element name to identify
expression type, JACAL uses a wrapper key around the value, and each
polymorphic array property holds a mix of such wrapped values. `Apply`'s
own `Argument` array is the most common example (not an `Expression`
property — see the worked examples below), but `Policy`'s
`CombinerInput` and `Rule`'s `NoticeExpression` follow the same
wrapper-key convention.

### YACAL v1.0 (YAML)

YACAL v1.0 is the YAML representation of ACAL.

| Aspect | Details |
|---|---|
| Schema mechanism | JSON Schema Draft 2020-12 semantics, serialized in YAML; validated over parsed YAML data |
| Type discrimination | Same wrapper-key approach as JACAL |
| Literal typing | YAML Core Schema booleans, integers, and floats imply the fixed ACAL primitive literal types; strings rely on context or explicit `DataType` when needed |
| Namespace handling | Not applicable; short identifiers serve an equivalent ergonomic purpose |
| Short identifier support | Present and most visible, because YAML readability benefits most from compressed identifiers |
| Constraint catalog | Separate `acal-core-yaml-v1.0-constraints.yaml` for higher-order invariants not suitable for JSON Schema encoding |
| Validation toolchain | Any YAML 1.2 + JSON Schema Draft 2020-12 capable processor |
| Best fit | Human policy authors, configuration-as-code workflows, DevOps/GitOps pipelines |

YACAL follows the same abstract type mapping as JACAL but uses YAML
block style for presentation. The absence of curly-brace and bracket
overhead makes deep policy trees easier to read as plain text.

YACAL is the newest of the three representations. Its artifact set is
more explicit — a separate structural schema, a constraint catalog, and
explicit composition examples — because YAML validation is distributed
across layers that are less consolidated in YAML tooling than in
XSD-based or JSON-Schema-native ecosystems. This is a packaging
difference, not a semantic one; the same layers exist in all three
representations.

---

## Published Artifact Sets

### XACML v4.0 (XML) Artifacts

| File | Role | Status |
|---|---|---|
| `acal-core-xml-v4.0.md` | XML representation specification | Normative prose |
| `acal-core-xml-v4.0-schema.xsd` | Structural XML schema (XSD 1.1) | Normative |
| `acal-core-xml-v4.0-schematron.sch` | Higher-order constraint schema (Schematron) | Normative |
| `acal-core-xml-v4.0-identifiers.xml` | Reference short-identifier set in XML format | Informative |
| `acal-xpath-xml-v4.0-schema.xsd` | XPath Profile structural extension | Normative when XPath support is claimed |
| `acal-xpath-xml-v4.0-identifiers.xml` | XPath Profile identifier set | Informative |
| `acal-jsonpath-xml-v4.0-schema.xsd` | JSONPath Profile structural extension | Normative when JSONPath support is claimed |

### JACAL v1.0 (JSON) Artifacts

| File | Role | Status |
|---|---|---|
| `acal-core-json-v1.0.md` | JSON representation specification | Normative prose |
| `acal-core-json-v1.0-schema.json` | Core JSON Schema | Normative |
| `acal-core-json-v1.0-identifiers.json` | Reference short-identifier set in JSON format | Informative |
| `acal-xpath-json-v1.0-schema.json` | XPath Profile structural extension | Normative when XPath support is claimed |
| `acal-xpath-json-v1.0-identifiers.json` | XPath Profile identifier set | Informative |
| `acal-jsonpath-json-v1.0-schema.json` | JSONPath Profile structural extension | Normative when JSONPath support is claimed |

### YACAL v1.0 (YAML) Artifacts

| File | Role | Status |
|---|---|---|
| `acal-core-yaml-v1.0.md` | YAML representation specification | Normative prose |
| `acal-core-yaml-v1.0-structure.schema.yaml` | Core structural schema (JSON Schema serialized in YAML) | Normative |
| `acal-core-yaml-v1.0-constraints.yaml` | Higher-order constraint catalog | Normative |
| `acal-core-yaml-v1.0-identifiers.yaml` | Core short-identifier set in YAML format | Normative |
| `acal-xpath-yaml-v1.0-structure.schema.yaml` | XPath Profile structural extension | Normative when XPath support is claimed |
| `acal-xpath-yaml-v1.0-identifiers.yaml` | XPath Profile identifier set | Normative when XPath support is claimed |
| `acal-jsonpath-yaml-v1.0-structure.schema.yaml` | JSONPath Profile structural extension | Normative when JSONPath support is claimed |
| `yacal-root-structure-example-core-only.schema.yaml` | Composition example: core-only support | Informative |
| `yacal-root-structure-example-using-jsonpath-profile-only.schema.yaml` | Composition example: JSONPath-only support | Informative |
| `yacal-root-structure-example-using-xpath-and-jsonpath-profiles.schema.yaml` | Composition example: XPath and JSONPath together | Informative |
| `yacal-root-structure-example-custom-plus-profile.schema.yaml` | Composition example: custom extension combined with standard profiles | Informative |

### Notes on the Identifier Files

The identifier files in all three representations contain the same ACAL
standard identifier inventory — attribute categories, data types,
functions, status codes, combining algorithms, and so on — expressed in
each format. The authoritative definitions of those identifiers still
live in the ACAL Core specification itself, but the machine-readable
artifact status is representation-specific. In the current YACAL work
product, the core and XPath identifier files are normative artifacts;
the XML and JSON identifier files are companion serializations of the
same underlying ACAL identifier set.

### Why YACAL Has More Artifact Files

The YACAL file count is higher because YACAL externalizes layers that
are either embedded or handled differently in the peer representations.

| Layer | XACML v4.0 | JACAL v1.0 | YACAL v1.0 |
|---|---|---|---|
| Structural validation | XSD 1.1 | JSON Schema | `acal-core-yaml-v1.0-structure.schema.yaml` |
| Higher-order constraints | Schematron + XSD 1.1 assertions | Partly in JSON Schema; implementation guidance | `acal-core-yaml-v1.0-constraints.yaml` |
| Profile composition | Implicit via XSD imports | `$dynamicRef`/`$dynamicAnchor` in JSON Schema | Explicit composition examples |

The extra files reflect packaging clarity, not extra YACAL semantics.
YACAL is not more semantically complex than XACML or JACAL; it is more
explicit about where each validation responsibility lives.

---

## Alignment Across the Three Representations

| Capability | XACML v4.0 (XML) | JACAL v1.0 (JSON) | YACAL v1.0 (YAML) |
|---|---|---|---|
| Prose specification | Present | Present | Present |
| Core structural schema | XSD 1.1 | JSON Schema Draft 2020-12 | JSON Schema Draft 2020-12, serialized as YAML |
| Higher-order constraint layer | Schematron + XSD 1.1 assertions | Partly in JSON Schema; partly implementation guidance | Separate YAML constraint catalog |
| Short-identifier reference set | XML `ShortIdSet` | JSON `ShortIdSet` | YAML `ShortIdSet` |
| Primitive literal typing | Effective `DataType` determines the concrete `ValueType` subtype behind the uniform `<Value>` surface | Native JSON primitive forms imply the fixed ACAL primitive literal types | Native YAML Core Schema scalar forms imply the fixed ACAL primitive literal types |
| XPath Profile | Present | Present | Present |
| JSONPath Profile | Present | Present | Present |
| Profile extension composition | Via XSD imports | `$dynamicRef`/`$dynamicAnchor` | Same mechanism as JACAL, with explicit composition schema examples |
| Normative artifact declaration in spec | Present | Present | Present |

---

## Choosing Your Expression Language

The three expression languages represent the same semantics. Choosing
among them is primarily a question of ecosystem fit, tooling, and team
workflow.

| Decision factor | XACML v4.0 (XML) | JACAL v1.0 (JSON) | YACAL v1.0 (YAML) |
|---|---|---|---|
| Existing XACML 3.0 deployment | Direct migration path | Requires translation | Requires translation |
| XML toolchain available | Native | Not needed | Not needed |
| REST / JSON API ecosystem | Awkward | Native | Conversion needed |
| Human authoring readability | Verbose; tooling helps | Readable with tooling | Most readable as plain text |
| Machine generation | Mature ecosystem | Simple string construction | Simple string construction |
| Namespace disambiguation | XML namespace prefixes | Not applicable | Short identifiers serve ergonomically |
| Validation toolchain maturity | Large; decades of tooling | Growing; good coverage | Newest |
| Configuration-as-code / GitOps | Possible | Common | Most natural fit |
| Schema extensibility mechanism | XSD imports | `$dynamicRef`/`$dynamicAnchor` | Same as JACAL |

### When to prefer XACML v4.0

- You have existing XACML 3.0 policies to migrate and want the
  smallest translation surface
- Your integration ecosystem is XML-native (enterprise middleware,
  SOAP services, XML signing)
- Your team has deep XML and XSD expertise
- You require the most mature tooling and validator implementations

### When to prefer JACAL v1.0

- Your policy evaluation stack is already JSON-native (REST APIs,
  microservices, OpenID Connect)
- Your PEP produces JSON requests natively
- Machine-generated policies are more common than human-authored ones
- You want the widest selection of off-the-shelf JSON Schema validators

### When to prefer YACAL v1.0

- Human authors write and maintain policies directly
- You are using a configuration-as-code or GitOps workflow where
  policy files live in a source repository alongside application
  configuration
- Short identifiers and YAML block style would meaningfully reduce
  policy verbosity for your team
- Your team is not invested in either XML or JSON toolchains and can
  choose freely

---

## Cross-Language Examples

The following examples present the same policy constructs expressed in
all three representation languages. Each example introduces one new
concept while building on the previous one. Together they provide a
landscape across the range of common ACAL policy patterns.

In every case the three representations are semantically equivalent.
The differences are purely notational.

---

### Example 1: A Simple Permit Rule

The smallest complete ACAL construct. A single `Rule` with a
`Condition` that permits a user with the role `doctor` to perform a
`read` action.

**Plain language**: A user with role `doctor` may read any resource.

---

**XACML v4.0 (XML)**

```xml
<Rule xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
      Id="rule-doctor-read" Effect="Permit">
  <Description>A doctor may read any resource.</Description>
  <Condition>
    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
      <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
        <Value>doctor</Value>
        <AttributeDesignator
          Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
          AttributeId="urn:example:attribute:role"/>
      </Apply>
      <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
        <Value>read</Value>
        <AttributeDesignator
          Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
          AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"/>
      </Apply>
    </Apply>
  </Condition>
</Rule>
```

**JACAL v1.0 (JSON)**

```json
{
  "Rule": {
    "Id": "rule-doctor-read",
    "Effect": "Permit",
    "Description": "A doctor may read any resource.",
    "Condition": {
      "Apply": {
        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
        "Argument": [
          {
            "Apply": {
              "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
              "Argument": [
                { "Value": "doctor" },
                {
                  "AttributeDesignator": {
                    "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                    "AttributeId": "urn:example:attribute:role"
                  }
                }
              ]
            }
          },
          {
            "Apply": {
              "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
              "Argument": [
                { "Value": "read" },
                {
                  "AttributeDesignator": {
                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                    "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id"
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
}
```

**YACAL v1.0 (YAML)**

```yaml
Rule:
  Id: rule-doctor-read
  Effect: Permit
  Description: A doctor may read any resource.
  Condition:
    Apply:
      FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
      Argument:
        - Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
            Argument:
              - Value: doctor
              - AttributeDesignator:
                  Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                  AttributeId: "urn:example:attribute:role"
        - Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
            Argument:
              - Value: read
              - AttributeDesignator:
                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                  AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
```

**What this shows**

- In XML, child elements of `<Apply>` are the function arguments. Each
  expression type is identified by its element name (`<Value>`,
  `<AttributeDesignator>`, `<Apply>`).
- In JACAL and YACAL, the `Argument` array carries the function
  arguments. Each entry is a mapping with a single key that identifies
  the expression type — this is the *wrapper key* pattern shared across
  both JSON and YAML representations.
- YAML block style presents the nesting naturally without brackets or
  braces, making the logical structure visible at a glance.
- The `string-is-in` function tests whether a literal value appears
  in the bag returned by an `AttributeDesignator`. This replaces the
  older `string-equal` + `one-and-only` idiom common in XACML 3.0.

---

### Example 2: Short Identifiers

This example repeats Example 1 using short identifiers. It shows the
short identifier set that enables this, then the rule written in all
three representations with short identifiers applied.

Short identifiers are available in all three representations. They are
most visible in YACAL because YAML's line-oriented block style makes
full URIs especially disruptive to readability.

**Short identifier set** (shown in YACAL format)

```yaml
ShortIdSet:
  Id: "urn:example:guide:identifiers"
  ShortIdSetReference:
    - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  ShortId:
    - Name: "role"
      Value: "urn:example:attribute:role"
```

The `ShortIdSetReference` imports the ACAL standard identifier set,
which defines `access-subject`, `action`, `action-id`, `and`,
`string-is-in`, and all other built-in identifiers. The local `ShortId`
entry adds a deployment-specific alias for the `role` attribute.

**XACML v4.0 with short identifiers**

```xml
<Rule xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
      Id="rule-doctor-read" Effect="Permit">
  <Description>A doctor may read any resource.</Description>
  <Condition>
    <Apply FunctionId="{and}">
      <Apply FunctionId="{string-is-in}">
        <Value>doctor</Value>
        <AttributeDesignator
          Category="{access-subject}"
          AttributeId="{role}"/>
      </Apply>
      <Apply FunctionId="{string-is-in}">
        <Value>read</Value>
        <AttributeDesignator
          Category="{action}"
          AttributeId="{action-id}"/>
      </Apply>
    </Apply>
  </Condition>
</Rule>
```

**JACAL v1.0 with short identifiers**

```json
{
  "Rule": {
    "Id": "rule-doctor-read",
    "Effect": "Permit",
    "Description": "A doctor may read any resource.",
    "Condition": {
      "Apply": {
        "FunctionId": "{and}",
        "Argument": [
          {
            "Apply": {
              "FunctionId": "{string-is-in}",
              "Argument": [
                { "Value": "doctor" },
                {
                  "AttributeDesignator": {
                    "Category": "{access-subject}",
                    "AttributeId": "{role}"
                  }
                }
              ]
            }
          },
          {
            "Apply": {
              "FunctionId": "{string-is-in}",
              "Argument": [
                { "Value": "read" },
                {
                  "AttributeDesignator": {
                    "Category": "{action}",
                    "AttributeId": "{action-id}"
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
}
```

**YACAL v1.0 with short identifiers**

```yaml
Rule:
  Id: rule-doctor-read
  Effect: Permit
  Description: A doctor may read any resource.
  Condition:
    Apply:
      FunctionId: "{and}"
      Argument:
        - Apply:
            FunctionId: "{string-is-in}"
            Argument:
              - Value: doctor
              - AttributeDesignator:
                  Category: "{access-subject}"
                  AttributeId: "{role}"
        - Apply:
            FunctionId: "{string-is-in}"
            Argument:
              - Value: read
              - AttributeDesignator:
                  Category: "{action}"
                  AttributeId: "{action-id}"
```

**What this shows**

- Short identifier notation `{name}` is identical across all three
  representations. It is not a YACAL-specific feature.
- The readability benefit is largest in YACAL because full URIs consume
  entire lines in YAML block style, obscuring the policy structure.
- Short identifiers resolve at evaluation time; they are not a syntactic
  shortcut that changes policy meaning. A YACAL document using short
  identifiers and one using full URIs for the same values are
  semantically identical.
- The standard ACAL identifier set (`urn:oasis:names:tc:acal:1.0:core:identifiers`)
  is provided as a reference artifact in all three formats
  (`acal-core-yaml-v1.0-identifiers.yaml`, `acal-core-json-v1.0-identifiers.json`,
  `acal-core-xml-v4.0-identifiers.xml`). Any deployment using standard
  identifiers only needs to add its own local attributes and categories.

---

### Example 3: A Policy with Multiple Rules and a Combining Algorithm

This example shows a full `Policy` object: a combining algorithm,
three rules, and the `CombinerInput` structure that holds them.
The policy uses `deny-unless-permit` — access is denied by default;
any matching permit rule overrides the default.

**Plain language**: Grant `view` access to a website page according
to content tier: public pages to anyone; registered pages to
registered or premium users; premium pages to premium users only.

---

**XACML v4.0 (XML)**

```xml
<Policy xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
        PolicyId="urn:example:policy:website-content-access"
        Version="1.0"
        CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit">
  <Description>
    Permit view access to website pages by content tier and account type.
  </Description>
  <Rule Id="PermitPublicContentView" Effect="Permit">
    <Description>Any user may view public content.</Description>
    <Condition>
      <Apply FunctionId="{and}">
        <Apply FunctionId="{string-is-in}">
          <Value>view</Value>
          <AttributeDesignator
            Category="{action}" AttributeId="{action-id}" MustBePresent="true"/>
        </Apply>
        <Apply FunctionId="{string-is-in}">
          <Value>public</Value>
          <AttributeDesignator
            Category="{resource}" AttributeId="{content-tier}" MustBePresent="true"/>
        </Apply>
      </Apply>
    </Condition>
  </Rule>
  <Rule Id="PermitRegisteredContentView" Effect="Permit">
    <Description>Registered and premium users may view registered content.</Description>
    <Condition>
      <Apply FunctionId="{and}">
        <Apply FunctionId="{string-is-in}">
          <Value>view</Value>
          <AttributeDesignator
            Category="{action}" AttributeId="{action-id}" MustBePresent="true"/>
        </Apply>
        <Apply FunctionId="{string-is-in}">
          <Value>registered</Value>
          <AttributeDesignator
            Category="{resource}" AttributeId="{content-tier}" MustBePresent="true"/>
        </Apply>
        <Apply FunctionId="{or}">
          <Apply FunctionId="{string-is-in}">
            <Value>registered</Value>
            <AttributeDesignator
              Category="{access-subject}" AttributeId="{account-type}" MustBePresent="true"/>
          </Apply>
          <Apply FunctionId="{string-is-in}">
            <Value>premium</Value>
            <AttributeDesignator
              Category="{access-subject}" AttributeId="{account-type}" MustBePresent="true"/>
          </Apply>
        </Apply>
      </Apply>
    </Condition>
  </Rule>
  <Rule Id="PermitPremiumContentView" Effect="Permit">
    <Description>Only premium users may view premium content.</Description>
    <Condition>
      <Apply FunctionId="{and}">
        <Apply FunctionId="{string-is-in}">
          <Value>view</Value>
          <AttributeDesignator
            Category="{action}" AttributeId="{action-id}" MustBePresent="true"/>
        </Apply>
        <Apply FunctionId="{string-is-in}">
          <Value>premium</Value>
          <AttributeDesignator
            Category="{resource}" AttributeId="{content-tier}" MustBePresent="true"/>
        </Apply>
        <Apply FunctionId="{string-is-in}">
          <Value>premium</Value>
          <AttributeDesignator
            Category="{access-subject}" AttributeId="{account-type}" MustBePresent="true"/>
        </Apply>
      </Apply>
    </Condition>
  </Rule>
</Policy>
```

**JACAL v1.0 (JSON)**

```json
{
  "Policy": {
    "PolicyId": "urn:example:policy:website-content-access",
    "Version": "1.0",
    "Description": "Permit view access to website pages by content tier and account type.",
    "CombiningAlgId": "{deny-unless-permit}",
    "CombinerInput": [
      {
        "Rule": {
          "Id": "PermitPublicContentView",
          "Effect": "Permit",
          "Description": "Any user may view public content.",
          "Condition": {
            "Apply": {
              "FunctionId": "{and}",
              "Argument": [
                { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                    { "Value": "view" },
                    { "AttributeDesignator": { "Category": "{action}", "AttributeId": "{action-id}", "MustBePresent": true } }
                ] } },
                { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                    { "Value": "public" },
                    { "AttributeDesignator": { "Category": "{resource}", "AttributeId": "{content-tier}", "MustBePresent": true } }
                ] } }
              ]
            }
          }
        }
      },
      {
        "Rule": {
          "Id": "PermitRegisteredContentView",
          "Effect": "Permit",
          "Description": "Registered and premium users may view registered content.",
          "Condition": {
            "Apply": {
              "FunctionId": "{and}",
              "Argument": [
                { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                    { "Value": "view" },
                    { "AttributeDesignator": { "Category": "{action}", "AttributeId": "{action-id}", "MustBePresent": true } }
                ] } },
                { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                    { "Value": "registered" },
                    { "AttributeDesignator": { "Category": "{resource}", "AttributeId": "{content-tier}", "MustBePresent": true } }
                ] } },
                { "Apply": { "FunctionId": "{or}", "Argument": [
                    { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                        { "Value": "registered" },
                        { "AttributeDesignator": { "Category": "{access-subject}", "AttributeId": "{account-type}", "MustBePresent": true } }
                    ] } },
                    { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                        { "Value": "premium" },
                        { "AttributeDesignator": { "Category": "{access-subject}", "AttributeId": "{account-type}", "MustBePresent": true } }
                    ] } }
                ] } }
              ]
            }
          }
        }
      },
      {
        "Rule": {
          "Id": "PermitPremiumContentView",
          "Effect": "Permit",
          "Description": "Only premium users may view premium content.",
          "Condition": {
            "Apply": {
              "FunctionId": "{and}",
              "Argument": [
                { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                    { "Value": "view" },
                    { "AttributeDesignator": { "Category": "{action}", "AttributeId": "{action-id}", "MustBePresent": true } }
                ] } },
                { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                    { "Value": "premium" },
                    { "AttributeDesignator": { "Category": "{resource}", "AttributeId": "{content-tier}", "MustBePresent": true } }
                ] } },
                { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                    { "Value": "premium" },
                    { "AttributeDesignator": { "Category": "{access-subject}", "AttributeId": "{account-type}", "MustBePresent": true } }
                ] } }
              ]
            }
          }
        }
      }
    ]
  }
}
```

**YACAL v1.0 (YAML, with short identifiers)**

```yaml
Policy:
  PolicyId: "urn:example:policy:website-content-access"
  Version: "1.0"
  Description: >-
    Permit view access to website pages by content tier and account type.
  CombiningAlgId: "{deny-unless-permit}"
  CombinerInput:
    - Rule:
        Id: PermitPublicContentView
        Description: Any user may view public content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "{and}"
            Argument:
              - Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: view
                    - AttributeDesignator:
                        Category: "{action}"
                        AttributeId: "{action-id}"
                        MustBePresent: true
              - Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: public
                    - AttributeDesignator:
                        Category: "{resource}"
                        AttributeId: "{content-tier}"
                        MustBePresent: true
    - Rule:
        Id: PermitRegisteredContentView
        Description: Registered and premium users may view registered content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "{and}"
            Argument:
              - Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: view
                    - AttributeDesignator:
                        Category: "{action}"
                        AttributeId: "{action-id}"
                        MustBePresent: true
              - Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: registered
                    - AttributeDesignator:
                        Category: "{resource}"
                        AttributeId: "{content-tier}"
                        MustBePresent: true
              - Apply:
                  FunctionId: "{or}"
                  Argument:
                    - Apply:
                        FunctionId: "{string-is-in}"
                        Argument:
                          - Value: registered
                          - AttributeDesignator:
                              Category: "{access-subject}"
                              AttributeId: "{account-type}"
                              MustBePresent: true
                    - Apply:
                        FunctionId: "{string-is-in}"
                        Argument:
                          - Value: premium
                          - AttributeDesignator:
                              Category: "{access-subject}"
                              AttributeId: "{account-type}"
                              MustBePresent: true
    - Rule:
        Id: PermitPremiumContentView
        Description: Only premium users may view premium content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "{and}"
            Argument:
              - Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: view
                    - AttributeDesignator:
                        Category: "{action}"
                        AttributeId: "{action-id}"
                        MustBePresent: true
              - Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: premium
                    - AttributeDesignator:
                        Category: "{resource}"
                        AttributeId: "{content-tier}"
                        MustBePresent: true
              - Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: premium
                    - AttributeDesignator:
                        Category: "{access-subject}"
                        AttributeId: "{account-type}"
                        MustBePresent: true
```

**What this shows**

- In XML, `<Rule>` elements appear as direct children of `<Policy>`.
  In JACAL and YACAL, rules appear in a `CombinerInput` array. This
  is because `CombinerInput` is a polymorphic container that can hold
  `Rule`, `Policy`, or `PolicyReference` objects, and JACAL/YACAL
  require an explicit named container for polymorphic sequences.
- XML does not have a named `CombinerInput` container — the ordering
  and mixing of `<Rule>` elements and nested `<Policy>` elements is
  positional and implicit. JACAL and YACAL make the container explicit.
- The identifiers `{deny-unless-permit}`, `{and}`, `{or}`,
  `{string-is-in}`, `{action}`, `{action-id}`, `{resource}`, and
  `{access-subject}` are all in the standard ACAL short-identifier set
  and require no local definition. The deployment-specific identifiers
  `{content-tier}` and `{account-type}` would be added to a local
  `ShortIdSet`.
- In XACML 3.0 a Policy target used `<AnyOf><AllOf><Match>`. In ACAL
  1.0 a Policy target is a plain Boolean expression (the same `Apply`
  construct used in Rule conditions), eliminating a separate syntax tier.
  This example omits a Target to show the structure without it; a Target
  could be added as a sibling of `CombiningAlgId` using the same
  `Apply` pattern shown in the Condition above.

---

### Example 4: NoticeExpression (Obligations and Advice)

This example adds a `NoticeExpression` to a permit rule. In XACML 3.0,
obligations and advice were expressed with `ObligationExpression` and
`AdviceExpression` under separate `<ObligationExpressions>` and
`<AdviceExpressions>` wrapper elements. In ACAL 1.0 they share a single
`NoticeExpression` type; the `IsObligation` flag distinguishes
obligation from advice, and if it is omitted the resulting notice is not
marked as an obligation.

**Plain language**: A physician may write to a patient chart. When
they do, an email notification must be sent to the patient.

---

**XACML v4.0 (XML)**

```xml
<Rule xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
      Id="rule-physician-write" Effect="Permit">
  <Description>
    A physician may write to a patient chart, with patient notification.
  </Description>
  <Condition>
    <Apply FunctionId="{and}">
      <Apply FunctionId="{string-is-in}">
        <Value>physician</Value>
        <AttributeDesignator
          Category="{access-subject}" AttributeId="{role}"/>
      </Apply>
      <Apply FunctionId="{string-is-in}">
        <Value>write</Value>
        <AttributeDesignator
          Category="{action}" AttributeId="{action-id}"/>
      </Apply>
    </Apply>
  </Condition>
  <NoticeExpression Id="urn:example:notice:notify-patient"
                   AppliesTo="Permit" IsObligation="true">
    <AttributeAssignmentExpression AttributeId="urn:example:notice:mailto">
      <AttributeDesignator
        Category="{resource}" AttributeId="{patient-email}" MustBePresent="true"/>
    </AttributeAssignmentExpression>
    <AttributeAssignmentExpression AttributeId="urn:example:notice:message">
      <Value>Your medical chart was updated by your physician.</Value>
    </AttributeAssignmentExpression>
  </NoticeExpression>
</Rule>
```

**JACAL v1.0 (JSON)**

```json
{
  "Rule": {
    "Id": "rule-physician-write",
    "Effect": "Permit",
    "Description": "A physician may write to a patient chart, with patient notification.",
    "Condition": {
      "Apply": {
        "FunctionId": "{and}",
        "Argument": [
          {
            "Apply": {
              "FunctionId": "{string-is-in}",
              "Argument": [
                { "Value": "physician" },
                { "AttributeDesignator": { "Category": "{access-subject}", "AttributeId": "{role}" } }
              ]
            }
          },
          {
            "Apply": {
              "FunctionId": "{string-is-in}",
              "Argument": [
                { "Value": "write" },
                { "AttributeDesignator": { "Category": "{action}", "AttributeId": "{action-id}" } }
              ]
            }
          }
        ]
      }
    },
    "NoticeExpression": [
      {
        "Id": "urn:example:notice:notify-patient",
        "AppliesTo": "Permit",
        "IsObligation": true,
        "AttributeAssignmentExpression": [
          {
            "AttributeId": "urn:example:notice:mailto",
            "Expression": {
              "AttributeDesignator": {
                "Category": "{resource}",
                "AttributeId": "{patient-email}",
                "MustBePresent": true
              }
            }
          },
          {
            "AttributeId": "urn:example:notice:message",
            "Expression": { "Value": "Your medical chart was updated by your physician." }
          }
        ]
      }
    ]
  }
}
```

**YACAL v1.0 (YAML, with short identifiers)**

```yaml
Rule:
  Id: rule-physician-write
  Effect: Permit
  Description: >-
    A physician may write to a patient chart, with patient notification.
  Condition:
    Apply:
      FunctionId: "{and}"
      Argument:
        - Apply:
            FunctionId: "{string-is-in}"
            Argument:
              - Value: physician
              - AttributeDesignator:
                  Category: "{access-subject}"
                  AttributeId: "{role}"
        - Apply:
            FunctionId: "{string-is-in}"
            Argument:
              - Value: write
              - AttributeDesignator:
                  Category: "{action}"
                  AttributeId: "{action-id}"
  NoticeExpression:
    - Id: "urn:example:notice:notify-patient"
      AppliesTo: Permit
      IsObligation: true
      AttributeAssignmentExpression:
        - AttributeId: "urn:example:notice:mailto"
          Expression:
            AttributeDesignator:
              Category: "{resource}"
              AttributeId: "{patient-email}"
              MustBePresent: true
        - AttributeId: "urn:example:notice:message"
          Expression:
            Value: Your medical chart was updated by your physician.
```

**What this shows**

- In XACML 3.0, obligations and advice had separate element types
  (`ObligationExpression`, `AdviceExpression`) under separate wrapper
  elements (`ObligationExpressions`, `AdviceExpressions`). In ACAL 1.0
  `NoticeExpression` is a single unified list on the rule or policy
  object. The `IsObligation` flag carries the distinction in data rather
  than in element name.
- XML puts `NoticeExpression` elements as direct children of `<Rule>`;
  JACAL and YACAL put them in a `NoticeExpression` array on the rule
  mapping.
- Each `AttributeAssignmentExpression` carries one value assignment to
  be passed to the enforcing system. The `Expression` holds the value
  source — a literal, an attribute designator, or an apply expression.
- In JACAL/YACAL the `Expression` on an `AttributeAssignmentExpression`
  is a single mapping (not an array) because exactly one expression
  produces the assignment value.

---

## YACAL-Specific Details

The sections below address questions that arise specifically from
YACAL's artifact set and design decisions. For structural and semantic
questions, the authoritative reference is the YACAL specification
(`acal-core-yaml-v1.0.md`) and the ACAL Core specification
(`acal-core-v1.0.md`).

### Why the Structural Artifact Uses JSON Schema Semantics

This point is important because reviewers may reasonably worry that it
creates an implicit YAML-to-JSON dependency.

It does not.

The YACAL structural artifact is a JSON Schema Draft 2020-12 vocabulary
document serialized in YAML. The validated instance is the *parsed
YACAL document as YAML data*. This is a schema-notation choice, not a
claim that YACAL is defined through JACAL or through conversion to JSON.

The key guardrails are:

1. YAML parsing is governed by YAML 1.2 and the YACAL prose rules
2. Structural validation is performed over parsed YAML data
3. Richer constraints are handled by the separate constraint catalog
4. ACAL Core remains the abstract authority for semantics

Mapping the choice back to the peer representations:

| If you are used to thinking in terms of... | The closest YACAL equivalent is... |
|---|---|
| XSD for shape | `acal-core-yaml-v1.0-structure.schema.yaml` |
| Schematron or XSD 1.1 assertions for richer invariants | `acal-core-yaml-v1.0-constraints.yaml` |
| XML identifier files | `acal-core-yaml-v1.0-identifiers.yaml` and profile identifier artifacts |
| XSD imports and extension points | Profile schemas plus composition schemas |

### How to Read the Constraint Artifact

The YACAL constraint catalog records higher-order rules that are
normative in ACAL but awkward, undesirable, or insufficiently portable
to encode purely in a structural schema. It is the YACAL analogue of
the XACML Schematron layer.

The constraint catalog does not introduce new ACAL semantics. It
captures rules that are already normative in ACAL Core. Examples
include:

1. Uniqueness by key (e.g. no two `ShortId` entries with the same name
   in the same `ShortIdSet`)
2. Uniqueness by effective subtype
3. Scoped-reference rules
4. Recursive-reference and cycle rules
5. Cross-property agreement rules

### Why Short Identifiers Matter More in YACAL

Short identifiers are part of ACAL generally, not unique to YACAL.
They are more visible in YACAL because YAML is intended to be read and
written as a human-friendly format.

| Factor | Why it matters more in YACAL |
|---|---|
| Long URIs dominate the page | YAML is sparse and line-oriented; full identifiers overwhelm the policy structure quickly |
| YAML has no namespace-prefix mechanism comparable to XML namespaces | Short identifiers give YACAL an ergonomic way to avoid repeating long URI strings |
| The promise of YAML is readability | If examples are filled with long identifiers, the readability benefit of YACAL is not visible |
| YAML examples are often read as authoring examples | Short identifiers better represent how human-authored YACAL looks in practice |

This does not mean:

1. Full identifiers are discouraged
2. YACAL depends on short identifiers
3. YACAL defines a different identifier inventory from ACAL

It means only that short identifiers are an especially important part
of making YAML readable at policy scale, and that YACAL examples
should lead with them when doing so improves clarity.

### YACAL-Specific Restrictions

YACAL imposes several YAML-specific restrictions that do not arise in
JACAL, because YAML offers syntax features that ACAL does not use.

Notably:

1. YAML null values are forbidden entirely. YACAL does not permit
   `null`, `Null`, `NULL`, `~`, or an undefined value as a substitute
   for omission.
2. YAML tags, anchors, aliases, merge keys, and multi-document streams
   are forbidden.
3. YAML octal integer notation is forbidden.

These restrictions keep the YAML surface aligned with the ACAL abstract
model and avoid format-specific ambiguities before structural
validation.

---

## Review Guidance for ACAL Experts with Limited YAML Experience

The most useful review order for YACAL:

1. Read the YACAL prose specification for the mapping and conformance
   model
2. Treat the structural schema as the machine-readable shape companion
3. Treat the constraint catalog as the higher-order validation companion
4. Treat the profile artifacts as modular extensions of the core
5. Treat the composition schemas as deployment examples, not as new
   syntax layers

The most important thing not to infer is that YACAL is defined through
JSON or XML. It is not.

Likewise, the extra YACAL files do not imply extra YACAL semantics.
Most of that additional surface area is explicit packaging of
validation and composition responsibilities that are less visible, or
differently packaged, in the peer work products.

---

## Bottom Line

ACAL 1.0 separates what XACML 3.0 kept fused: the policy language
semantics from the XML syntax that carried them. The result is a
specification family where all three representations — XML (XACML v4.0),
JSON (JACAL v1.0), and YAML (YACAL v1.0) — are peers that express the
same ACAL model with different notations.

Choosing among them is primarily an ecosystem question. Organizations
with existing XACML deployments have a direct migration path through
XACML v4.0. JSON-native service environments are well served by JACAL.
Human-authored, configuration-as-code policy workflows are well served
by YACAL.

All three representations should be evaluated against the ACAL Core
specification for semantic authority. Normative conformance
requirements for the abstract model are defined in ACAL Core
(`acal-core-v1.0.md`), not in any representation-specific document.
