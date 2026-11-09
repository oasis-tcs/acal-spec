# ACAL Adoption and Implementation Guide

## Purpose

This guide is a companion for anyone adopting the Attribute-Centric Authorization Language
(ACAL), evaluating it for a new deployment, or migrating from XACML 3.0.

It is intended to be useful to:

1. Organizations evaluating ACAL for new deployments
2. XACML 3.0 implementers planning migration or parallel support
3. Developers working with one concrete representation who want to understand how
   the others compare
4. Architects choosing between XML (XACML v4.0), JSON (JACAL v1.0), and YAML (YACAL v1.0)

This guide is explanatory and informative. It does not replace any normative
specification. All normative conformance requirements are defined in ACAL Core
(`acal-core-v1.0.md`) and the respective representation specifications.

---

## What is ACAL: The Abstract Successor to XACML

ACAL (Attribute-Centric Authorization Language) Version 1.0 is the successor to
XACML 3.0, produced by the OASIS XACML Technical Committee.

The central architectural decision in ACAL is the separation of policy semantics from
serialization syntax. XACML 3.0 expressed everything in XML — the abstract model and
the concrete representation were fused into a single specification. This made it
impossible to express the same policy in another format without building an entirely
new specification from scratch.

ACAL addresses this by defining an *abstract model* in UML that captures all policy
semantics without reference to any serialization format. Concrete representations —
XML, JSON, YAML — are then defined as separate companion specifications that map the
abstract model to a particular format. This is the same design pattern used by many
modern standards (ASN.1, Protobuf, OpenAPI) where the information model and the
encoding are defined independently.

The result is a specification family:

| Specification | Role | Short name |
|---|---|---|
| ACAL Core v1.0 | Abstract model, processing rules, conformance | ACAL |
| ACAL Core – XML Representation Profile v4.0 | XML serialization of ACAL | XACML v4.0 |
| ACAL Core – JSON Representation Profile v1.0 | JSON serialization of ACAL | JACAL v1.0 |
| ACAL Core – YAML Representation Profile v1.0 | YAML serialization of ACAL | YACAL v1.0 |

ACAL is the authoritative source for all policy semantics, evaluation behavior,
conformance requirements, and standard identifier definitions. Each representation
specification maps that abstract model to its format and defines any format-specific
processing rules.

An implementation that speaks XACML v4.0 and one that speaks JACAL v1.0 are both
ACAL-conformant implementations sharing the same policy semantics. A policy expressed
in XACML v4.0 and the same policy expressed in JACAL v1.0 represent the same ACAL
instance with the same meaning.

---

## XACML to ACAL: Key Changes

ACAL 1.0 is a significant evolution of XACML 3.0. The changes fall into three
categories: structural simplifications, new capabilities, and the abstract model
separation itself.

### Structural Simplifications

| Change | XACML 3.0 | ACAL 1.0 |
|---|---|---|
| Policy hierarchy | `Policy` and `PolicySet` are distinct constructs | `Policy` absorbs `PolicySet`; a policy may directly contain nested policies |
| Target syntax | `AnyOf / AllOf / Match` nested structure | A single Boolean expression — the same structure as a Rule `Condition` |
| Rule target | Rules have their own `Target` | Rules have no target; targeting is done at the policy level |
| Obligations and Advice | `ObligationExpression` and `AdviceExpression` are separate, under separate wrapper elements | `NoticeExpression` is a single unified type; the `IsObligation` flag distinguishes obligation from advice |
| Combiner parameters | `CombinerParameter` supported | Removed |
| Combining algorithms | Rule combining and policy combining are separate sets, including `only-one-applicable` | A single unified set; legacy algorithms removed |
| Attribute DataType | Declared per `AttributeValue`; mixed types in one attribute were possible | Declared once on `Attribute`; all values in the attribute share one type |

### New Capabilities

| Capability | Notes |
|---|---|
| Short identifiers (`ShortIdSet`) | User-defined aliases for long URIs, reducing verbosity throughout policies; a standard ACAL short-identifier set is provided for all built-in identifiers |
| `QuantifiedExpression` | `ForAny`, `ForAll`, `Map`, and `Select` expressions, incorporating concepts from the XACML 3.0 Entities Profile |
| `Entity` data type | Abstract entity references, also from the Entities Profile |
| `SharedVariableDefinition` | Reusable parameterized variable definitions, shareable across policies in a `Bundle` |
| `Bundle` | A portable container for policies, shared variable definitions, and short identifier sets; facilitates cross-PDP policy exchange |
| New functions | Ternary conditional (`ternary-if`); sum, average, min, and max aggregate functions |
| Named arguments | Function arguments may be passed by name (`NamedArgument`) in addition to positional order |

### Identifier Namespace

All standard identifiers have moved from the `urn:oasis:names:tc:xacml:` prefix to
`urn:oasis:names:tc:acal:`. The old prefix is deprecated. The XSD namespace prefix
`http://www.w3.org/2001/XMLSchema#` for data types is likewise replaced by
`urn:oasis:names:tc:acal:1.0:data-type:`.

### Function Argument Order Changes

The argument order for the following functions has been **reversed** from XACML 3.0.
Review every call site when migrating:

`string-starts-with`, `anyURI-starts-with`, `string-ends-with`, `anyURI-ends-with`,
`string-contains`, `anyURI-contains`, `x500Name-match`, `rfc822Name-match`,
`string-regexp-match`, `anyURI-regexp-match`, `ipAddress-regexp-match`,
`dnsName-regexp-match`, `rfc822Name-regexp-match`, `x500Name-regexp-match`.

### XPath and JSONPath Moved to Profiles

All XPath-specific functionality — XPath-based `AttributeSelector`, XPath expression
data type, XPath functions — has been moved to the ACAL XPath Profile, a separate
companion specification. Core ACAL and each representation remain valid without XPath
support. This allows the core specifications to be leaner and XPath support to be
declared explicitly as a claimed profile.

Similarly, the JSONPath Profile defines JSONPath-based `AttributeSelector` extensions
and is independent of both the core and the XPath Profile.

---

## The Three Representations

All three representations are first-class citizens of the ACAL specification family.
They are not derivatives of one another. Each maps the ACAL abstract model to its
format independently.

### XACML v4.0 (XML)

XACML v4.0 is the continuation of the XACML line. It is the XML representation of ACAL.

| Aspect | Details |
|---|---|
| Schema mechanism | W3C XML Schema 1.1 (structural) + Schematron or XSD 1.1 assertions (higher-order constraints) |
| Type discrimination | Element names identify types (`<Rule>`, `<Policy>`, `<Apply>`, etc.) |
| Function arguments | Child elements of `<Apply>` serve as positional arguments via XML substitution groups; `<NamedArgument>` is available for named arguments |
| Namespace handling | XML namespace prefixes (`xmlns:xacml="urn:oasis:names:tc:xacml:4.0:core:schema"`) |
| Short identifier support | Present; `{name}` notation in attribute values |
| Validation toolchain | Xerces2, Saxon, standard XSD 1.1 and Schematron processors |
| Best fit | Organizations with existing XML toolchains, enterprise integrations, and prior XACML deployments |

XACML v4.0 is the direct migration path for XACML 3.0 deployments. The structural
changes (Target simplification, Policy/PolicySet merge, Obligations/Advice unification)
require migration effort, but the authoring model and tooling ecosystem are familiar.

### JACAL v1.0 (JSON)

JACAL v1.0 is the JSON representation of ACAL.

| Aspect | Details |
|---|---|
| Schema mechanism | JSON Schema Draft 2020-12, using `$dynamicRef`/`$dynamicAnchor` for profile extensibility |
| Type discrimination | A wrapper key identifies expression and combiner-input types (`"Rule": {...}`, `"Apply": {...}`) |
| Function arguments | `Argument` array on `Apply` objects; each entry is a wrapper-keyed object identifying the argument type |
| Namespace handling | Not applicable; namespaced identifiers are plain string URIs |
| Short identifier support | Present; `{name}` notation in string values |
| Validation toolchain | Any JSON Schema Draft 2020-12 validator (e.g. jsonschema by Sourcemeta, AJV) |
| Best fit | REST API ecosystems, microservices, cloud-native deployments, OpenID Connect environments |

JACAL uses `Argument` arrays for function arguments in `Apply` objects and wrapper keys
throughout for all polymorphic contexts. The `CombinerInput` array holds `Rule`,
`Policy`, and `PolicyReference` entries, each identified by its wrapper key.

### YACAL v1.0 (YAML)

YACAL v1.0 is the YAML representation of ACAL.

| Aspect | Details |
|---|---|
| Schema mechanism | JSON Schema Draft 2020-12 semantics, serialized in YAML; validated over parsed YAML data |
| Type discrimination | Same wrapper-key approach as JACAL |
| Function arguments | `Argument` sequence on `Apply` mappings; same wrapper-key pattern as JACAL |
| Namespace handling | Not applicable; short identifiers serve an equivalent ergonomic purpose |
| Short identifier support | Present and most visible, because YAML readability benefits most from compressed identifiers |
| Constraint catalog | Separate `acal-core-yaml-v1.0-constraints.yaml` for higher-order invariants not suitable for JSON Schema encoding |
| Validation toolchain | Any YAML 1.2 + JSON Schema Draft 2020-12 capable processor |
| Best fit | Human policy authors, configuration-as-code workflows, DevOps/GitOps pipelines |

YACAL follows the same abstract type mapping as JACAL but uses YAML block style for
presentation. The absence of curly-brace and bracket overhead makes deep policy trees
easier to read as plain text.

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

### Notes on Identifier Files

The identifier files in all three representations contain the same ACAL standard
identifier inventory — attribute categories, data types, functions, status codes,
combining algorithms, and so on — expressed in each format. The authoritative
definitions live in the ACAL Core specification itself; the machine-readable artifacts
are representation-specific serializations of that same inventory.

### Why YACAL Has More Artifact Files

The YACAL file count is higher because YACAL externalizes layers that are either
embedded or handled differently in the peer representations.

| Layer | XACML v4.0 | JACAL v1.0 | YACAL v1.0 |
|---|---|---|---|
| Structural validation | XSD 1.1 | JSON Schema | `acal-core-yaml-v1.0-structure.schema.yaml` |
| Higher-order constraints | Schematron + XSD 1.1 assertions | Partly in JSON Schema; implementation guidance | `acal-core-yaml-v1.0-constraints.yaml` |
| Profile composition | Via XSD imports | `$dynamicRef`/`$dynamicAnchor` in JSON Schema | Explicit composition examples |

The extra files reflect packaging clarity, not extra YACAL semantics. YACAL is not
more semantically complex than XACML or JACAL; it is more explicit about where each
validation responsibility lives.

---

## Alignment Across the Three Representations

| Capability | XACML v4.0 (XML) | JACAL v1.0 (JSON) | YACAL v1.0 (YAML) |
|---|---|---|---|
| Prose specification | Present | Present | Present |
| Core structural schema | XSD 1.1 | JSON Schema Draft 2020-12 | JSON Schema Draft 2020-12, serialized as YAML |
| Higher-order constraint layer | Schematron + XSD 1.1 assertions | Partly in JSON Schema; partly implementation guidance | Separate YAML constraint catalog |
| Short-identifier reference set | XML `ShortIdSet` | JSON `ShortIdSet` | YAML `ShortIdSet` |
| XPath Profile | Present | Present | Present |
| JSONPath Profile | Present | Present | Present |
| Profile extension composition | Via XSD imports | `$dynamicRef`/`$dynamicAnchor` | Same mechanism as JACAL, with explicit composition schema examples |
| Normative artifact declaration in spec | Present | Present | Present |

---

## Choosing Your Representation

The three representations express the same semantics. Choosing among them is primarily
a question of ecosystem fit, tooling, and team workflow.

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

- You have existing XACML 3.0 policies to migrate and want the smallest translation
  surface
- Your integration ecosystem is XML-native (enterprise middleware, SOAP services,
  XML signing)
- Your team has deep XML and XSD expertise
- You require the most mature tooling and validator implementations

### When to prefer JACAL v1.0

- Your policy evaluation stack is already JSON-native (REST APIs, microservices,
  OpenID Connect)
- Your PEP produces JSON requests natively
- Machine-generated policies are more common than human-authored ones
- You want the widest selection of off-the-shelf JSON Schema validators

### When to prefer YACAL v1.0

- Human authors write and maintain policies directly
- You are using a configuration-as-code or GitOps workflow where policy files live in
  a source repository alongside application configuration
- Short identifiers and YAML block style would meaningfully reduce policy verbosity
  for your team
- Your team is not invested in either XML or JSON toolchains and can choose freely

---

## Cross-Representation Examples

The following examples present the same policy constructs expressed in all three
representations. Each example introduces one or two new concepts while building on
previous ones. Together they provide a landscape across the range of common ACAL
policy patterns.

In every case the three representations are semantically equivalent. The differences
are purely notational.

**Note on function arguments:** In JACAL and YACAL, the function arguments of an
`Apply` object are held in an `Argument` array (or sequence). Each entry uses a
wrapper key to identify its type (`Apply`, `Value`, `AttributeDesignator`, etc.).
In XACML v4.0 XML, child elements of `<Apply>` serve as arguments via XML substitution
groups — the element names themselves identify the types, with no additional wrapper
needed.

---

### Example 1: A Simple Permit Rule

The smallest complete ACAL construct. A single `Rule` with a `Condition` that permits
a user with the role `doctor` to perform a `read` action.

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

- In XML, child elements of `<Apply>` are the function arguments directly, identified
  by element name.
- In JACAL and YACAL, the `Argument` array holds the function arguments. Each entry
  uses a single wrapper key that identifies the expression type — this is the
  *wrapper key* pattern shared across both JSON and YAML representations.
- YAML block style presents the nesting naturally without brackets or braces, making
  the logical structure visible at a glance.
- `string-is-in` tests whether a literal value appears in the bag returned by an
  `AttributeDesignator`. This replaces the older `string-equal` + `one-and-only`
  idiom common in XACML 3.0.

---

### Example 2: Short Identifiers

This example repeats Example 1 using short identifiers. It shows the short identifier
set that enables this, then the rule written in all three representations.

Short identifiers are available in all three representations. They are most visible in
YACAL because YAML's line-oriented block style makes full URIs especially disruptive
to readability.

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

The `ShortIdSetReference` imports the ACAL standard identifier set, which defines
`access-subject`, `action`, `action-id`, `and`, `string-is-in`, and all other
built-in identifiers. The local `ShortId` entry adds a deployment-specific alias for
the `role` attribute.

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

- Short identifier notation `{name}` is identical across all three representations.
  It is not a YACAL-specific feature.
- Short identifiers resolve at evaluation time; they are not a syntactic shortcut that
  changes policy meaning. A document using short identifiers and one using full URIs
  for the same values are semantically identical.
- The standard ACAL identifier set (`urn:oasis:names:tc:acal:1.0:core:identifiers`) is
  provided as a reference artifact in all three formats. Any deployment using only
  standard identifiers needs only to add its own local attributes and categories.

---

### Example 3: A Policy with Multiple Rules and a Combining Algorithm

This example shows a full `Policy` object: a combining algorithm, three rules, and
the `CombinerInput` structure that holds them. The policy uses `deny-unless-permit` —
access is denied by default; any matching permit rule overrides the default.

**Plain language**: Grant `view` access to a website page according to content tier:
public pages to anyone; registered pages to registered or premium users; premium pages
to premium users only.

---

**XACML v4.0 (XML)**

```xml
<Policy xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
        PolicyId="urn:example:policy:website-content-access"
        Version="1.0"
        CombiningAlgId="{deny-unless-permit}">
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

- In XML, `<Rule>` elements appear as direct children of `<Policy>`. In JACAL and
  YACAL, rules appear in a `CombinerInput` array. This is because `CombinerInput` is
  a polymorphic container that can hold `Rule`, `Policy`, or `PolicyReference` objects,
  and JACAL/YACAL require an explicit named container for polymorphic sequences.
- XML does not have a named `CombinerInput` element — the ordering and mixing of
  `<Rule>` elements and nested `<Policy>` elements is positional and implicit using
  substitution groups.
- The policy has no explicit `Target` here; it applies to any request. A `Target`
  could be added as a sibling of `CombiningAlgId` using the same boolean `Apply`
  expression pattern shown in the conditions above.

---

### Example 4: NoticeExpression (Obligations and Advice)

This example adds a `NoticeExpression` to a permit rule. In XACML 3.0, obligations
and advice were expressed with `ObligationExpression` and `AdviceExpression` under
separate wrapper elements. In ACAL 1.0 they share a single `NoticeExpression` type;
the `IsObligation` flag distinguishes obligation from advice. When `IsObligation` is
absent, the notice is informative advice rather than a binding obligation.

**Plain language**: A physician may write to a patient chart. When they do, an email
notification must be sent to the patient.

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
  (`ObligationExpression`, `AdviceExpression`) under separate wrapper elements. In
  ACAL 1.0 `NoticeExpression` is a single unified list. The `IsObligation` flag
  carries the distinction in data rather than in element name.
- Each `AttributeAssignmentExpression` carries one value assignment to be passed to
  the enforcing system. The `Expression` holds the value source — a literal, an
  attribute designator, or an apply expression. Note that `Expression` is the
  property name within `AttributeAssignmentExpression` (singular, one expression
  per assignment), distinct from the `Argument` array used by `Apply`.
- `AttributeAssignmentExpression` items within a `NoticeExpression` are **not** required
  to be unique by the `(AttributeId, Category)` pair, as they were not in XACML 3.0. Whether
  a given notice accepts repeated attribute assignments, and how the PEP combines them, is
  part of the definition of that individual obligation or advice, not of ACAL itself. Note
  that a single `AttributeAssignmentExpression` evaluating to a bag already produces one
  `AttributeAssignment` per bag value, all sharing the same pair.
- Even so, where a notice argument is logically a single value assembled from several parts,
  prefer building it into one assignment with `string-concatenate` rather than emitting
  several assignments that the PEP must reassemble. Neither the order of attribute
  assignments nor the order of values within a bag is guaranteed to be preserved, so the
  single-value form is unambiguous. See the Rule 3 example in [[ACAL-Core](#acal-core)].
- `NoticeExpression` Ids are likewise **not** required to be unique within a `Policy` or `Rule`.
  The `Id` identifies what the notice *means* to the PEP — what it must do, or is being
  informed of — exactly as `ObligationId` did in XACML 3.0. It is a *concept* identifier,
  not an instance identifier, so a policy MAY emit the same notice `Id` more than once with
  different `AttributeAssignmentExpression`s.

---

#### Variant: Emitting the Same Notice Twice with Different Arguments

When the same obligation (e.g. "send-mail") must be discharged for multiple recipients or
with different payloads, emit one `NoticeExpression` **per recipient**, all carrying the
**same** `Id`. The `Id` names the obligation — it is what tells the PEP to send mail — and
the `AttributeAssignmentExpression`s carry the per-instance data that differs between them.

This is the same shape as an XACML 3.0 `ObligationId`, so obligations already defined by
existing profiles (e.g. `add-history` from the separation-of-duties profile) can be emitted
repeatedly without inventing a new identifier for each occurrence.

**Plain language**: A physician may write to a patient chart. When they do, an email
notification must be sent to both the patient and the patient's next of kin.

---

**XACML v4.0 (XML)**

```xml
<Rule xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
      Id="rule-physician-write" Effect="Permit">
  <Description>
    A physician may write to a patient chart, notifying both the patient and next of kin.
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
  <NoticeExpression Id="urn:example:notice:send-mail"
                   AppliesTo="Permit" IsObligation="true">
    <AttributeAssignmentExpression AttributeId="urn:example:notice:mailto">
      <AttributeDesignator
        Category="{resource}" AttributeId="{patient-email}" MustBePresent="true"/>
    </AttributeAssignmentExpression>
    <AttributeAssignmentExpression AttributeId="urn:example:notice:message">
      <Value>Your medical chart was updated by your physician.</Value>
    </AttributeAssignmentExpression>
  </NoticeExpression>
  <NoticeExpression Id="urn:example:notice:send-mail"
                   AppliesTo="Permit" IsObligation="true">
    <AttributeAssignmentExpression AttributeId="urn:example:notice:mailto">
      <AttributeDesignator
        Category="{resource}" AttributeId="{next-of-kin-email}" MustBePresent="true"/>
    </AttributeAssignmentExpression>
    <AttributeAssignmentExpression AttributeId="urn:example:notice:message">
      <Value>Your next of kin's medical chart was updated by a physician.</Value>
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
    "Description": "A physician may write to a patient chart, notifying both the patient and next of kin.",
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
        "Id": "urn:example:notice:send-mail",
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
      },
      {
        "Id": "urn:example:notice:send-mail",
        "AppliesTo": "Permit",
        "IsObligation": true,
        "AttributeAssignmentExpression": [
          {
            "AttributeId": "urn:example:notice:mailto",
            "Expression": {
              "AttributeDesignator": {
                "Category": "{resource}",
                "AttributeId": "{next-of-kin-email}",
                "MustBePresent": true
              }
            }
          },
          {
            "AttributeId": "urn:example:notice:message",
            "Expression": { "Value": "Your next of kin's medical chart was updated by a physician." }
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
    A physician may write to a patient chart, notifying both the patient and next of kin.
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
    - Id: "urn:example:notice:send-mail"
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
    - Id: "urn:example:notice:send-mail"
      AppliesTo: Permit
      IsObligation: true
      AttributeAssignmentExpression:
        - AttributeId: "urn:example:notice:mailto"
          Expression:
            AttributeDesignator:
              Category: "{resource}"
              AttributeId: "{next-of-kin-email}"
              MustBePresent: true
        - AttributeId: "urn:example:notice:message"
          Expression:
            Value: Your next of kin's medical chart was updated by a physician.
```

**What this shows**

- Both `NoticeExpression` entries carry the **same** `Id` (`urn:example:notice:send-mail`).
  This is legal: notice Ids are not required to be unique within a policy or rule. The `Id`
  is what tells the PEP *which obligation to discharge* — send mail — so both entries route
  to the same PEP handler.
- The two notices differ only in `mailto` and `message`. Those `AttributeAssignmentExpression`s
  are the per-instance data; the `Id` is the concept. No separate `action` assignment is needed
  to tag the notification type, because the `Id` already carries that meaning.
- A PEP receiving two `send-mail` obligations dispatches them independently — once per
  recipient. The obligations are distinguished by their arguments, not by their `Id`.
- Because the `Id` behaves exactly like an XACML 3.0 `ObligationId`, obligations defined by
  existing profiles work unchanged: a policy can emit `add-history` twice with different
  parameters, or the same obligation from two rules that permit access for two different
  reasons.

---

### Example 5: Target as a Boolean Expression

In XACML 3.0, a policy `Target` used a dedicated `AnyOf / AllOf / Match` syntax —
a three-tier nesting where `AnyOf` expressed OR, `AllOf` expressed AND, and each
`Match` expressed a single equality-style comparison between a literal and an
attribute designator. This syntax was entirely separate from the `Apply` expression
language used in Rule `Condition` elements.

In ACAL 1.0 the `Target` is simply a `BooleanExpression` — the same `Apply`
structure used everywhere else. Any function available in conditions is equally
available in targets.

**Plain language**: A policy applies only to `view` or `download` actions on resources
classified as `confidential`.

---

**XACML 3.0 Target (shown for migration reference — XML only)**

```xml
<!-- XACML 3.0 syntax — not valid in ACAL 1.0 -->
<Target>
  <AnyOf>
    <AllOf>
      <Match MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">view</AttributeValue>
        <AttributeDesignator
          Category="urn:oasis:names:tc:xacml:3.0:attribute-category:action"
          AttributeId="urn:oasis:names:tc:xacml:1.0:action:action-id"
          DataType="http://www.w3.org/2001/XMLSchema#string"
          MustBePresent="false"/>
      </Match>
      <Match MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">confidential</AttributeValue>
        <AttributeDesignator
          Category="urn:oasis:names:tc:xacml:3.0:attribute-category:resource"
          AttributeId="urn:example:attribute:classification"
          DataType="http://www.w3.org/2001/XMLSchema#string"
          MustBePresent="false"/>
      </Match>
    </AllOf>
    <AllOf>
      <Match MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">download</AttributeValue>
        <AttributeDesignator
          Category="urn:oasis:names:tc:xacml:3.0:attribute-category:action"
          AttributeId="urn:oasis:names:tc:xacml:1.0:action:action-id"
          DataType="http://www.w3.org/2001/XMLSchema#string"
          MustBePresent="false"/>
      </Match>
      <Match MatchId="urn:oasis:names:tc:xacml:1.0:function:string-equal">
        <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">confidential</AttributeValue>
        <AttributeDesignator
          Category="urn:oasis:names:tc:xacml:3.0:attribute-category:resource"
          AttributeId="urn:example:attribute:classification"
          DataType="http://www.w3.org/2001/XMLSchema#string"
          MustBePresent="false"/>
      </Match>
    </AllOf>
  </AnyOf>
</Target>
```

**XACML v4.0 (XML)**

```xml
<Target>
  <Apply FunctionId="{and}">
    <Apply FunctionId="{or}">
      <Apply FunctionId="{string-is-in}">
        <Value>view</Value>
        <AttributeDesignator Category="{action}" AttributeId="{action-id}"/>
      </Apply>
      <Apply FunctionId="{string-is-in}">
        <Value>download</Value>
        <AttributeDesignator Category="{action}" AttributeId="{action-id}"/>
      </Apply>
    </Apply>
    <Apply FunctionId="{string-is-in}">
      <Value>confidential</Value>
      <AttributeDesignator Category="{resource}" AttributeId="{classification}"/>
    </Apply>
  </Apply>
</Target>
```

**JACAL v1.0 (JSON)**

```json
"Target": {
  "Apply": {
    "FunctionId": "{and}",
    "Argument": [
      {
        "Apply": {
          "FunctionId": "{or}",
          "Argument": [
            { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                { "Value": "view" },
                { "AttributeDesignator": { "Category": "{action}", "AttributeId": "{action-id}" } }
            ] } },
            { "Apply": { "FunctionId": "{string-is-in}", "Argument": [
                { "Value": "download" },
                { "AttributeDesignator": { "Category": "{action}", "AttributeId": "{action-id}" } }
            ] } }
          ]
        }
      },
      {
        "Apply": {
          "FunctionId": "{string-is-in}",
          "Argument": [
            { "Value": "confidential" },
            { "AttributeDesignator": { "Category": "{resource}", "AttributeId": "{classification}" } }
          ]
        }
      }
    ]
  }
}
```

**YACAL v1.0 (YAML)**

```yaml
Target:
  Apply:
    FunctionId: "{and}"
    Argument:
      - Apply:
          FunctionId: "{or}"
          Argument:
            - Apply:
                FunctionId: "{string-is-in}"
                Argument:
                  - Value: view
                  - AttributeDesignator:
                      Category: "{action}"
                      AttributeId: "{action-id}"
            - Apply:
                FunctionId: "{string-is-in}"
                Argument:
                  - Value: download
                  - AttributeDesignator:
                      Category: "{action}"
                      AttributeId: "{action-id}"
      - Apply:
          FunctionId: "{string-is-in}"
          Argument:
            - Value: confidential
            - AttributeDesignator:
                Category: "{resource}"
                AttributeId: "{classification}"
```

**What this shows**

- The XACML 3.0 `AnyOf / AllOf / Match` structure is gone. There is only one
  expression language — the same `Apply` tree used in `Condition` — and it serves
  both `Target` and `Condition` uniformly.
- The XACML 3.0 `Match` element compared one literal to one attribute designator
  using a fixed function. The ACAL `Apply` expression has no such restriction: any
  function, any arity, any combination is valid.
- The XACML 3.0 `AnyOf/AllOf` nesting encoded OR-of-ANDs structurally. In ACAL,
  logical structure is expressed using `{or}` and `{and}` functions explicitly —
  the same functions used elsewhere, no special syntax.
- Rules in ACAL have no `Target`. All targeting logic belongs in the enclosing policy's
  `Target` and in each rule's `Condition`.

---

### Example 6: Nested Policies (Policy Absorbs PolicySet)

In XACML 3.0, combining multiple policies required a separate `PolicySet` container
type. In ACAL 1.0, a `Policy` can contain nested `Policy` objects directly in its
`CombinerInput` array alongside `Rule` and `PolicyReference` entries. The `PolicySet`
type is eliminated.

**Plain language**: A top-level policy combines two sub-policies: one for read
operations and one for write operations, each with their own rules and combining
algorithm.

---

**XACML 3.0 approach (shown for migration reference — XML only)**

```xml
<!-- XACML 3.0: requires PolicySet to contain sub-policies -->
<PolicySet xmlns="urn:oasis:names:tc:xacml:3.0:core:schema:wd-17"
           PolicySetId="urn:example:policyset:document-access"
           Version="1.0"
           PolicyCombiningAlgId="urn:oasis:names:tc:xacml:3.0:policy-combining-algorithm:deny-unless-permit">
  <Policy PolicyId="urn:example:policy:read-access" Version="1.0"
          RuleCombiningAlgId="urn:oasis:names:tc:xacml:3.0:rule-combining-algorithm:deny-unless-permit">
    <!-- read rules here -->
  </Policy>
  <Policy PolicyId="urn:example:policy:write-access" Version="1.0"
          RuleCombiningAlgId="urn:oasis:names:tc:xacml:3.0:rule-combining-algorithm:deny-unless-permit">
    <!-- write rules here -->
  </Policy>
</PolicySet>
```

**XACML v4.0 (XML)**

```xml
<Policy xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
        PolicyId="urn:example:policy:document-access"
        Version="1.0"
        CombiningAlgId="{deny-unless-permit}">
  <Description>Document access: combines read and write sub-policies.</Description>

  <Policy PolicyId="urn:example:policy:read-access"
          Version="1.0"
          CombiningAlgId="{deny-unless-permit}">
    <Target>
      <Apply FunctionId="{string-is-in}">
        <Value>read</Value>
        <AttributeDesignator Category="{action}" AttributeId="{action-id}"/>
      </Apply>
    </Target>
    <Rule Id="PermitReaders" Effect="Permit">
      <Condition>
        <Apply FunctionId="{string-is-in}">
          <Value>reader</Value>
          <AttributeDesignator Category="{access-subject}" AttributeId="{role}"/>
        </Apply>
      </Condition>
    </Rule>
  </Policy>

  <Policy PolicyId="urn:example:policy:write-access"
          Version="1.0"
          CombiningAlgId="{deny-unless-permit}">
    <Target>
      <Apply FunctionId="{string-is-in}">
        <Value>write</Value>
        <AttributeDesignator Category="{action}" AttributeId="{action-id}"/>
      </Apply>
    </Target>
    <Rule Id="PermitWriters" Effect="Permit">
      <Condition>
        <Apply FunctionId="{string-is-in}">
          <Value>writer</Value>
          <AttributeDesignator Category="{access-subject}" AttributeId="{role}"/>
        </Apply>
      </Condition>
    </Rule>
  </Policy>
</Policy>
```

**JACAL v1.0 (JSON)**

```json
{
  "Policy": {
    "PolicyId": "urn:example:policy:document-access",
    "Version": "1.0",
    "Description": "Document access: combines read and write sub-policies.",
    "CombiningAlgId": "{deny-unless-permit}",
    "CombinerInput": [
      {
        "Policy": {
          "PolicyId": "urn:example:policy:read-access",
          "Version": "1.0",
          "CombiningAlgId": "{deny-unless-permit}",
          "Target": {
            "Apply": {
              "FunctionId": "{string-is-in}",
              "Argument": [
                { "Value": "read" },
                { "AttributeDesignator": { "Category": "{action}", "AttributeId": "{action-id}" } }
              ]
            }
          },
          "CombinerInput": [
            {
              "Rule": {
                "Id": "PermitReaders",
                "Effect": "Permit",
                "Condition": {
                  "Apply": {
                    "FunctionId": "{string-is-in}",
                    "Argument": [
                      { "Value": "reader" },
                      { "AttributeDesignator": { "Category": "{access-subject}", "AttributeId": "{role}" } }
                    ]
                  }
                }
              }
            }
          ]
        }
      },
      {
        "Policy": {
          "PolicyId": "urn:example:policy:write-access",
          "Version": "1.0",
          "CombiningAlgId": "{deny-unless-permit}",
          "Target": {
            "Apply": {
              "FunctionId": "{string-is-in}",
              "Argument": [
                { "Value": "write" },
                { "AttributeDesignator": { "Category": "{action}", "AttributeId": "{action-id}" } }
              ]
            }
          },
          "CombinerInput": [
            {
              "Rule": {
                "Id": "PermitWriters",
                "Effect": "Permit",
                "Condition": {
                  "Apply": {
                    "FunctionId": "{string-is-in}",
                    "Argument": [
                      { "Value": "writer" },
                      { "AttributeDesignator": { "Category": "{access-subject}", "AttributeId": "{role}" } }
                    ]
                  }
                }
              }
            }
          ]
        }
      }
    ]
  }
}
```

**YACAL v1.0 (YAML)**

```yaml
Policy:
  PolicyId: "urn:example:policy:document-access"
  Version: "1.0"
  Description: "Document access: combines read and write sub-policies."
  CombiningAlgId: "{deny-unless-permit}"
  CombinerInput:
    - Policy:
        PolicyId: "urn:example:policy:read-access"
        Version: "1.0"
        CombiningAlgId: "{deny-unless-permit}"
        Target:
          Apply:
            FunctionId: "{string-is-in}"
            Argument:
              - Value: read
              - AttributeDesignator:
                  Category: "{action}"
                  AttributeId: "{action-id}"
        CombinerInput:
          - Rule:
              Id: PermitReaders
              Effect: Permit
              Condition:
                Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: reader
                    - AttributeDesignator:
                        Category: "{access-subject}"
                        AttributeId: "{role}"
    - Policy:
        PolicyId: "urn:example:policy:write-access"
        Version: "1.0"
        CombiningAlgId: "{deny-unless-permit}"
        Target:
          Apply:
            FunctionId: "{string-is-in}"
            Argument:
              - Value: write
              - AttributeDesignator:
                  Category: "{action}"
                  AttributeId: "{action-id}"
        CombinerInput:
          - Rule:
              Id: PermitWriters
              Effect: Permit
              Condition:
                Apply:
                  FunctionId: "{string-is-in}"
                  Argument:
                    - Value: writer
                    - AttributeDesignator:
                        Category: "{access-subject}"
                        AttributeId: "{role}"
```

**What this shows**

- A `Policy` is now the only container type. Nesting policies is accomplished by
  placing a `Policy` entry in the outer policy's `CombinerInput` sequence, alongside
  any `Rule` or `PolicyReference` entries.
- The same `CombiningAlgId` property applies at every level — there is no separate
  "rule combining algorithm" vs "policy combining algorithm" distinction. One
  `CombinerInput` holds whatever mix of rules, sub-policies, and policy references
  the author needs, and one combining algorithm governs them all.
- Each nested `Policy` may have its own `Target`, `CombiningAlgId`, and `CombinerInput`.
  Nesting depth is not limited by the model.
- For XACML 3.0 migrators: every `PolicySet` maps to a `Policy`; the `Policy`
  children of the `PolicySet` become entries in the outer policy's `CombinerInput`.

---

### Example 7: Attribute DataType — Type Safety for Request Attributes

In XACML 3.0, the `DataType` was declared individually on each `AttributeValue` inside
an `Attribute` element. This allowed a single attribute to accumulate values of
different types — an unintentional mixed-type bag that was a source of evaluation
errors.

In ACAL 1.0, `DataType` is declared once on the `Attribute` itself (in a request
context) and once on the `AttributeDesignator` in a policy. All values in the attribute
share the declared type. Schema enforcement prevents mixed-type bags.

**Plain language**: A request sets a subject's `role` attribute to multiple string
values. The policy references it via an `AttributeDesignator` with a matching type.

---

**XACML 3.0 request fragment (shown for migration reference)**

```xml
<!-- XACML 3.0: DataType on each AttributeValue — mixed types were possible -->
<Attributes xmlns="urn:oasis:names:tc:xacml:3.0:core:schema:wd-17"
            Category="urn:oasis:names:tc:xacml:1.0:subject-category:access-subject">
  <Attribute AttributeId="urn:example:attribute:role" IncludeInResult="false">
    <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">physician</AttributeValue>
    <AttributeValue DataType="http://www.w3.org/2001/XMLSchema#string">researcher</AttributeValue>
    <!-- Nothing prevented: DataType="http://www.w3.org/2001/XMLSchema#integer" here -->
  </Attribute>
</Attributes>
```

**XACML v4.0 request fragment**

```xml
<!-- ACAL 1.0: DataType on Attribute — all values share one type -->
<RequestEntity xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
               Category="{access-subject}">
  <Attribute AttributeId="{role}" DataType="{string}">
    <Value>physician</Value>
    <Value>researcher</Value>
  </Attribute>
</RequestEntity>
```

**JACAL v1.0 request fragment**

```json
{
  "RequestEntity": {
    "Category": "{access-subject}",
    "Attribute": [
      {
        "AttributeId": "{role}",
        "DataType": "{string}",
        "Value": ["physician", "researcher"]
      }
    ]
  }
}
```

**YACAL v1.0 request fragment**

```yaml
RequestEntity:
  Category: "{access-subject}"
  Attribute:
    - AttributeId: "{role}"
      DataType: "{string}"
      Value:
        - physician
        - researcher
```

**Corresponding policy-side AttributeDesignator**

In a policy condition or target, the designator matches attributes by `AttributeId`,
`DataType`, and optionally `Issuer`. The declared `DataType` must match:

```yaml
AttributeDesignator:
  Category: "{access-subject}"
  AttributeId: "{role}"
  DataType: "{string}"
  MustBePresent: true
```

**What this shows**

- `DataType` moves from individual `Value` elements/objects to the `Attribute` itself.
  An attribute has exactly one data type; all its values conform to it.
- For XACML 3.0 migrators: remove `DataType` from each `AttributeValue` and add it
  to the enclosing `Attribute`. If your XACML 3.0 policies have mixed-type attributes
  (even accidentally), split them into separate single-type attributes before migrating.
- The `DataType` on an `AttributeDesignator` in a policy must match the `DataType`
  declared on the corresponding `Attribute` in the request. If they do not match, the
  attribute will not be found.
- `DataType` is optional on `AttributeDesignator` (and on `Attribute`); when omitted,
  it defaults to `urn:oasis:names:tc:acal:1.0:data-type:string`.

---

### Example 8: QuantifiedExpression — ForAny

`QuantifiedExpression` types allow iteration over a bag of values. `ForAny` evaluates
an iterant expression for each value in a domain bag and returns `true` if the iterant
is true for at least one value. `ForAll`, `Select`, and `Map` follow the same structure
with different semantics (universal test, bag filter, and bag transform respectively).

**Plain language**: Permit a user to access sensitive data if they hold at least one
role whose identifier begins with the prefix `data-custodian`. The prefix test cannot
be expressed as a simple `string-is-in` check because the actual role values are
dynamic and the predicate is structural.

---

**XACML v4.0 (XML)**

```xml
<Rule xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
      Id="rule-data-custodian" Effect="Permit">
  <Description>
    Permit if the subject holds any role prefixed with data-custodian.
  </Description>
  <Condition>
    <ForAny>
      <VariableId>currentRole</VariableId>
      <Domain>
        <AttributeDesignator
          Category="{access-subject}"
          AttributeId="{role}"
          MustBePresent="true"/>
      </Domain>
      <Iterant>
        <Apply FunctionId="{string-starts-with}">
          <Value>data-custodian</Value>
          <VariableReference VariableId="currentRole"/>
        </Apply>
      </Iterant>
    </ForAny>
  </Condition>
</Rule>
```

**JACAL v1.0 (JSON)**

```json
{
  "Rule": {
    "Id": "rule-data-custodian",
    "Effect": "Permit",
    "Description": "Permit if the subject holds any role prefixed with data-custodian.",
    "Condition": {
      "ForAny": {
        "VariableId": "currentRole",
        "Domain": {
          "AttributeDesignator": {
            "Category": "{access-subject}",
            "AttributeId": "{role}",
            "MustBePresent": true
          }
        },
        "Iterant": {
          "Apply": {
            "FunctionId": "{string-starts-with}",
            "Argument": [
              { "Value": "data-custodian" },
              { "VariableReference": { "VariableId": "currentRole" } }
            ]
          }
        }
      }
    }
  }
}
```

**YACAL v1.0 (YAML)**

```yaml
Rule:
  Id: rule-data-custodian
  Effect: Permit
  Description: >-
    Permit if the subject holds any role prefixed with data-custodian.
  Condition:
    ForAny:
      VariableId: currentRole
      Domain:
        AttributeDesignator:
          Category: "{access-subject}"
          AttributeId: "{role}"
          MustBePresent: true
      Iterant:
        Apply:
          FunctionId: "{string-starts-with}"
          Argument:
            - Value: "data-custodian"
            - VariableReference:
                VariableId: currentRole
```

**What this shows**

- `ForAny` has three required properties: `VariableId` (the loop variable name),
  `Domain` (a non-literal expression evaluating to a bag), and `Iterant` (an
  expression evaluated per domain value, must return boolean for `ForAny`/`ForAll`).
- The loop variable is referenced inside `Iterant` using `VariableReference`. The
  variable is scoped to the quantified expression and does not require a separate
  `VariableDefinition`.
- `ForAny` returns `true` if the iterant is `true` for any domain value; `false` if
  it is `false` for all values; `Indeterminate` if any evaluation yields
  `Indeterminate` without a prior `true`.
- `ForAll` uses the same structure and returns `true` only if the iterant is `true`
  for every domain value.
- `Select` returns a sub-bag of domain values for which the iterant is `true`.
- `Map` returns a new bag produced by evaluating the iterant for each domain value
  (the iterant may return any type for `Map`).
- **Argument order note**: `string-starts-with` in ACAL 1.0 takes `(prefix, string)`
  — the prefix first, the value second. This is reversed from XACML 3.0.

---

### Example 9: Bundle and SharedVariableDefinition

A `Bundle` is the top-level container for a PDP's complete policy configuration. It
holds: one or more `Policy` objects, zero or more `SharedVariableDefinition` objects,
zero or more `ShortIdSet` objects, and an optional `PolicyReference` designating the
evaluation entry point.

A `SharedVariableDefinition` defines a named, reusable expression that can be
referenced from any policy or other shared variable within the bundle. This replaces
the per-policy `VariableDefinition` for logic that spans multiple policies.

**Plain language**: A bundle containing a shared variable that computes whether the
current time is within business hours, and a policy that references that variable
to grant office system access.

---

**XACML v4.0 (XML)**

```xml
<Bundle xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
  <ShortIdSet Id="urn:example:ids:common">
    <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:core:identifiers</ShortIdSetReference>
  </ShortIdSet>

  <SharedVariableDefinition
      Id="urn:example:shared:is-business-hours"
      Version="1.0">
    <Description>True when current time is between 09:00 and 17:00.</Description>
    <Expression>
      <Apply FunctionId="{and}">
        <Apply FunctionId="{integer-greater-than-or-equal}">
          <Apply FunctionId="{time-hour-from-time}">
            <Apply FunctionId="{time-one-and-only}">
              <AttributeDesignator
                Category="{environment}"
                AttributeId="{current-time}"
                MustBePresent="true"/>
            </Apply>
          </Apply>
          <Value DataType="{integer}">9</Value>
        </Apply>
        <Apply FunctionId="{integer-less-than}">
          <Apply FunctionId="{time-hour-from-time}">
            <Apply FunctionId="{time-one-and-only}">
              <AttributeDesignator
                Category="{environment}"
                AttributeId="{current-time}"
                MustBePresent="true"/>
            </Apply>
          </Apply>
          <Value DataType="{integer}">17</Value>
        </Apply>
      </Apply>
    </Expression>
  </SharedVariableDefinition>

  <Policy PolicyId="urn:example:policy:office-access"
          Version="1.0"
          CombiningAlgId="{deny-unless-permit}">
    <ShortIdSetReference>urn:example:ids:common</ShortIdSetReference>
    <Rule Id="PermitDuringBusinessHours" Effect="Permit">
      <Condition>
        <SharedVariableReference Id="urn:example:shared:is-business-hours"/>
      </Condition>
    </Rule>
  </Policy>

  <PolicyReference Id="urn:example:policy:office-access" Version="1.0"/>
</Bundle>
```

**JACAL v1.0 (JSON)**

```json
{
  "Bundle": {
    "ShortIdSet": [
      {
        "Id": "urn:example:ids:common",
        "ShortIdSetReference": ["urn:oasis:names:tc:acal:1.0:core:identifiers"]
      }
    ],
    "SharedVariableDefinition": [
      {
        "Id": "urn:example:shared:is-business-hours",
        "Version": "1.0",
        "Description": "True when current time is between 09:00 and 17:00.",
        "Expression": {
          "Apply": {
            "FunctionId": "{and}",
            "Argument": [
              {
                "Apply": {
                  "FunctionId": "{integer-greater-than-or-equal}",
                  "Argument": [
                    { "Apply": { "FunctionId": "{time-hour-from-time}", "Argument": [
                        { "Apply": { "FunctionId": "{time-one-and-only}", "Argument": [
                            { "AttributeDesignator": {
                                "Category": "{environment}",
                                "AttributeId": "{current-time}",
                                "MustBePresent": true
                            } }
                        ] } }
                    ] } },
                    { "Value": 9 }
                  ]
                }
              },
              {
                "Apply": {
                  "FunctionId": "{integer-less-than}",
                  "Argument": [
                    { "Apply": { "FunctionId": "{time-hour-from-time}", "Argument": [
                        { "Apply": { "FunctionId": "{time-one-and-only}", "Argument": [
                            { "AttributeDesignator": {
                                "Category": "{environment}",
                                "AttributeId": "{current-time}",
                                "MustBePresent": true
                            } }
                        ] } }
                    ] } },
                    { "Value": 17 }
                  ]
                }
              }
            ]
          }
        }
      }
    ],
    "Policy": [
      {
        "PolicyId": "urn:example:policy:office-access",
        "Version": "1.0",
        "CombiningAlgId": "{deny-unless-permit}",
        "ShortIdSetReference": ["urn:example:ids:common"],
        "CombinerInput": [
          {
            "Rule": {
              "Id": "PermitDuringBusinessHours",
              "Effect": "Permit",
              "Condition": {
                "SharedVariableReference": {
                  "Id": "urn:example:shared:is-business-hours"
                }
              }
            }
          }
        ]
      }
    ],
    "PolicyReference": {
      "Id": "urn:example:policy:office-access",
      "Version": "1.0"
    }
  }
}
```

**YACAL v1.0 (YAML)**

```yaml
Bundle:
  ShortIdSet:
    - Id: "urn:example:ids:common"
      ShortIdSetReference:
        - "urn:oasis:names:tc:acal:1.0:core:identifiers"

  SharedVariableDefinition:
    - Id: "urn:example:shared:is-business-hours"
      Version: "1.0"
      Description: True when current time is between 09:00 and 17:00.
      Expression:
        Apply:
          FunctionId: "{and}"
          Argument:
            - Apply:
                FunctionId: "{integer-greater-than-or-equal}"
                Argument:
                  - Apply:
                      FunctionId: "{time-hour-from-time}"
                      Argument:
                        - Apply:
                            FunctionId: "{time-one-and-only}"
                            Argument:
                              - AttributeDesignator:
                                  Category: "{environment}"
                                  AttributeId: "{current-time}"
                                  MustBePresent: true
                  - Value: 9
            - Apply:
                FunctionId: "{integer-less-than}"
                Argument:
                  - Apply:
                      FunctionId: "{time-hour-from-time}"
                      Argument:
                        - Apply:
                            FunctionId: "{time-one-and-only}"
                            Argument:
                              - AttributeDesignator:
                                  Category: "{environment}"
                                  AttributeId: "{current-time}"
                                  MustBePresent: true
                  - Value: 17

  Policy:
    - PolicyId: "urn:example:policy:office-access"
      Version: "1.0"
      CombiningAlgId: "{deny-unless-permit}"
      ShortIdSetReference:
        - "urn:example:ids:common"
      CombinerInput:
        - Rule:
            Id: PermitDuringBusinessHours
            Effect: Permit
            Condition:
              SharedVariableReference:
                Id: "urn:example:shared:is-business-hours"

  PolicyReference:
    Id: "urn:example:policy:office-access"
    Version: "1.0"
```

**What this shows**

- A `Bundle` is the root document when delivering a complete PDP configuration. It
  is an optional XACML v4.0 element (marked O in the conformance table) but is the
  recommended transport unit for multi-policy deployments.
- `SharedVariableDefinition` objects live at bundle scope, not policy scope. They are
  referenced via `SharedVariableReference` from any expression in any policy in the
  bundle. Policy-scoped `VariableDefinition` objects remain available for logic that
  does not need to be shared.
- The `PolicyReference` at the bundle level designates the entry-point policy for
  evaluation. The `Policy` sequence MUST be non-empty when `PolicyReference` is
  present.
- `SharedVariableDefinition` supports parameters, enabling reusable parameterized
  computations. A calling `SharedVariableReference` passes arguments positionally or
  by name (using `NamedArgument`). The `is-business-hours` variable in this example
  has no parameters; a timezone-aware version could accept a timezone string as a
  parameter.
- The YACAL `Value: 9` (an integer literal) uses the JSON-type inference rule: a
  bare YAML integer maps to `LiteralIntegerType` without needing an explicit `DataType`
  property.

---

## Representation-Specific Details

### XML (XACML v4.0)

**Schema validation layers**

XACML v4.0 uses two complementary validation layers:

1. **XSD 1.1** (`acal-core-xml-v4.0-schema.xsd`) for structural validation. XSD 1.1
   assertions (`xs:assert`) encode many higher-order constraints directly in the schema.
2. **Schematron** (`acal-core-xml-v4.0-schematron.sch`) for implementations that
   support only XSD 1.0. The Schematron rules are equivalent to the XSD 1.1 assertions
   and must be applied alongside an XSD 1.0 version of the schema (generated from the
   XSD 1.1 schema via the provided `xsd1.1-to-1.0.xsl` stylesheet).

**Argument mechanism**

In XACML v4.0, `<Apply>` child elements serve as arguments through XML substitution
groups. Every expression element (`<Value>`, `<AttributeDesignator>`, `<Apply>`,
`<VariableReference>`, `<ForAny>`, etc.) is in the `xacml:Argument` substitution
group. No explicit `<Argument>` wrapper element is used for positional arguments.
Named arguments use the explicit `<NamedArgument Name="...">` element with an
expression child.

**Short identifiers in XML**

Short identifier notation `{name}` is used in XML attribute values wherever an
`IdentifierType` is expected: `PolicyId`, `CombiningAlgId`, `FunctionId`,
`AttributeId`, `Category`, `DataType`, and so on.

**Profile composition**

XPath and JSONPath profiles are composed via standard XSD imports. The profile schema
files (`acal-xpath-xml-v4.0-schema.xsd`, `acal-jsonpath-xml-v4.0-schema.xsd`) extend
the core schema's extensible types.

---

### JSON (JACAL v1.0)

**Wrapper key pattern**

JACAL uses a single-key object to identify the type of any polymorphic value. Every
entry in a `CombinerInput` array, every entry in an `Argument` array, and every
`Condition` or `Target` value is a mapping with exactly one key — the type name. The
value under that key is the type's content object.

Examples: `{"Rule": {...}}`, `{"Apply": {...}}`, `{"Value": "doctor"}`,
`{"AttributeDesignator": {...}}`, `{"ForAny": {...}}`.

**Argument vs Expression**

- `Apply.Argument` is the array of function arguments. Each entry is a wrapper-keyed
  expression or named argument.
- `AttributeAssignmentExpression.Expression` is a single (not array) wrapper-keyed
  expression providing the assignment value.
- `QuantifiedExpressionType.Domain` and `.Iterant` are single wrapper-keyed
  expressions.

**Profile composition**

JACAL uses JSON Schema's `$dynamicRef` / `$dynamicAnchor` mechanism. Extensible types
in the core schema define a `$dynamicRef` anchor. A combining schema for a specific
deployment overrides the anchor with a `$dynamicAnchor` that lists the concrete
subtypes from each claimed profile. See the `examples/` directory for composition
schema examples.

**Integer values in JSON**

Bare JSON integers (e.g. `9`, `17`) are valid as literal integer arguments where the
context implies `LiteralIntegerType`. An explicit `DataType` is not needed for
`boolean`, `integer`, or `number` (double) — these are inferred from the JSON type.
For other data types, a `{"DataType": "...", "Value": "..."}` object form is used.

---

### YAML (YACAL v1.0)

**Schema validation layers**

YACAL externalizes the same two layers as its peers, in YAML-appropriate form:

1. **Structural schema** (`acal-core-yaml-v1.0-structure.schema.yaml`): a JSON Schema
   Draft 2020-12 vocabulary document serialized in YAML. Validation is performed over
   the parsed YAML data, not over raw YAML text. This is a schema-notation choice,
   not a claim that YACAL is derived from JACAL or requires JSON conversion.
2. **Constraint catalog** (`acal-core-yaml-v1.0-constraints.yaml`): normative
   higher-order rules not suited for pure JSON Schema encoding — uniqueness by key,
   scoped-reference rules, cycle detection, cross-property agreement. This is the YACAL
   analogue of the XACML Schematron layer.

**YAML-specific restrictions**

YACAL imposes restrictions on YAML features that have no ACAL counterpart:

- `null`, `Null`, `NULL`, `~`, and absent values are forbidden. Use explicit property
  omission to represent absence.
- YAML tags, anchors, aliases, merge keys (`<<`), and multi-document streams are
  forbidden.
- YAML octal integer notation is forbidden.

These restrictions keep the YAML surface aligned with the ACAL abstract model and
prevent format-specific ambiguities before structural validation.

**Short identifiers in YAML**

Short identifiers are especially ergonomic in YACAL because YAML is sparse and
line-oriented. Full URIs consume entire lines and obscure policy structure. Any
deployment using the standard ACAL identifier set needs only to reference
`urn:oasis:names:tc:acal:1.0:core:identifiers` and add local aliases for its own
attributes, categories, and functions.

**Profile composition**

YACAL uses the same `$dynamicRef`/`$dynamicAnchor` mechanism as JACAL. The
`yacal-root-structure-example-*.schema.yaml` files in the repository illustrate
how to compose a combining schema for common profile combinations.

**Why YACAL has more artifact files**

The higher file count reflects explicit packaging of validation responsibilities that
are less consolidated in YAML tooling than in XSD or JSON Schema ecosystems. There are
no additional YACAL semantics beyond what XACML v4.0 and JACAL v1.0 express. The extra
files are the structural schema, the constraint catalog, and the composition examples —
each has a direct analogue in the peer representations.

---

## XACML 3.0 Migration Checklist

The following checklist covers the mechanical changes required when migrating XACML 3.0
XML policies to XACML v4.0. For migration to JACAL or YACAL, apply the same semantic
changes and additionally translate the serialization format.

### Model changes

- [ ] **Replace `PolicySet` with `Policy`**: every `<PolicySet>` becomes a `<Policy>`.
  Its `Policy` children become entries in the outer `Policy`'s `CombinerInput`.
  `PolicyCombiningAlgId` becomes `CombiningAlgId`.
- [ ] **Remove rule `Target` elements**: rules no longer have targets. Move any
  rule-level targeting logic into the enclosing policy's `Target` or merge it into the
  rule's `Condition`.
- [ ] **Rewrite `Target` expressions**: replace every `<AnyOf><AllOf><Match>` block
  with an equivalent `<Apply>` boolean expression tree. The `<Match MatchId="...">` maps
  to the corresponding function `Apply`.
- [ ] **Unify obligations and advice**: replace `<ObligationExpressions>` /
  `<AdviceExpressions>` wrapper elements and the `<ObligationExpression>` /
  `<AdviceExpression>` types with `<NoticeExpression>` elements. Set
  `IsObligation="true"` for obligations; omit or set `false` for advice.
- [ ] **Remove `CombinerParameter` elements**: there is no equivalent in ACAL 1.0.
  If these were used for algorithm-specific configuration, review the algorithms
  involved — most standard algorithms do not require them.
- [ ] **Move `DataType` from `AttributeValue` to `Attribute`**: each `<Attribute>`
  element gains a `DataType` attribute; each `<AttributeValue>` loses it. If any
  attribute has mixed-type values, split it into separate attributes.
- [ ] **Rename `Attributes` to `RequestEntity`** in request documents;
  rename `Attributes` in response/result to `ResultEntity`.
- [ ] **Remove `EarliestVersion` and `LatestVersion` from `PolicyReference` elements**; .
- [ ] **Remove `IncludeInResult` attributes in response documents (Results)**.
- [ ] **Replace AttributeValue elements with a Value elements**.
- [ ] **Change Decision element to an XML attribute in response document**.
- [ ] (optional) **Remove IncludeInResult, ReturnPolicyIdList, CombinedDecision and DataType attributes that are set to default values, if you wish to simplify your request documents.**

### Identifier namespace

- [ ] **Replace `urn:oasis:names:tc:xacml:` prefix** with
  `urn:oasis:names:tc:acal:` on all standard identifiers (functions, data types,
  combining algorithms, attribute categories, status codes).
- [ ] **Replace `http://www.w3.org/2001/XMLSchema#` data type prefix** with
  `urn:oasis:names:tc:acal:1.0:data-type:` (or the corresponding short identifier).
- [ ] **Adopt short identifiers** (optional but recommended): define a
  `<ShortIdSet>` referencing the standard ACAL identifier set and add local aliases
  for deployment-specific attributes and categories.

### Function argument order

- [ ] **Review all calls to argument-reversed functions**: `string-starts-with`,
  `anyURI-starts-with`, `string-ends-with`, `anyURI-ends-with`, `string-contains`,
  `anyURI-contains`, `x500Name-match`, `rfc822Name-match`, `string-regexp-match`,
  `anyURI-regexp-match`, `ipAddress-regexp-match`, `dnsName-regexp-match`,
  `rfc822Name-regexp-match`, `x500Name-regexp-match`. The argument order in ACAL 1.0
  is reversed from XACML 3.0. Test with representative data after reversal.

### Combining algorithms

- [ ] **Remove legacy combining algorithms**: `only-one-applicable` and the legacy
  XACML 3.0 algorithm variants are not present in ACAL 1.0. Replace with a standard
  ACAL algorithm. The most common replacements are `deny-unless-permit` (previously
  `first-applicable` in lenient deployments) and `deny-overrides` or `permit-overrides`.

### XPath and profiles

- [ ] **Declare XPath support explicitly**: if your policies use XPath-based
  `AttributeSelector` or XPath expression values, add the XPath Profile schema
  (`acal-xpath-xml-v4.0-schema.xsd`) to your validation setup and note the XPath
  profile as claimed in your conformance statement.
- [ ] **Review `AttributeSelector` changes**: `DataType` and `MustBePresent` are now
  optional with defaults. The `Path` expression type is abstract in ACAL Core and
  made concrete by the XPath (or JSONPath) Profile.

---

## Conformance

Conformance in ACAL is layered. A conformant implementation MUST satisfy the normative
requirements in ACAL Core (`acal-core-v1.0.md`) for the abstract model and processing
behavior, and additionally satisfy the normative requirements of each claimed
representation specification.

**Core conformance** requires implementing the mandatory elements of the abstract model:
policy evaluation, combining algorithms, attribute retrieval, the mandatory expression
types, and the mandatory standard functions and data types.

**Representation conformance** requires implementing the serialization and
deserialization rules of the claimed representation (XACML v4.0, JACAL v1.0, or
YACAL v1.0). An implementation may claim conformance to one, two, or all three
representations.

**Profile conformance** is claimed separately. An implementation that supports
XPath-based `AttributeSelector` must claim the XPath Profile; one that supports
JSONPath-based `AttributeSelector` must claim the JSONPath Profile. Neither is
required for core or representation conformance.

Optional features within the core (marked O in the conformance tables of the
representation specifications) include: `Bundle`, `QuantifiedExpression` types,
`AttributeSelector`, `EntityAttributeSelector`, `VariableDefinition`,
`SharedVariableDefinition`, and `PolicyReference`. An implementation that does not
support an optional feature must handle a document containing that feature in
accordance with the error-handling rules defined in ACAL Core.

---

## Bottom Line

ACAL 1.0 separates what XACML 3.0 kept fused: the policy language semantics from the
XML syntax that carried them. The result is a specification family where all three
representations — XML (XACML v4.0), JSON (JACAL v1.0), and YAML (YACAL v1.0) — are
peers that express the same ACAL model with different notations.

Choosing among them is primarily an ecosystem question. Organizations with existing
XACML deployments have a direct migration path through XACML v4.0. JSON-native service
environments are well served by JACAL. Human-authored, configuration-as-code policy
workflows are well served by YACAL.

All three representations are governed by the ACAL Core specification for semantic
authority. Normative conformance requirements for the abstract model are defined in
ACAL Core (`acal-core-v1.0.md`), not in any representation-specific document.
