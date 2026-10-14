---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: YACAL Version 1.0 (YAML Representation of ACAL)
subtitle: Committee Specification Draft 02
version: "1.0"
stage_revision: csd02 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access control", "authorization", "ABAC", "policy language", "YAML", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version

- https://docs.oasis-open.org/acal/yacal/core/v%version%/%stage_revision%/acal-core-yaml-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/acal/yacal/core/v%version%/%stage_revision%/acal-core-yaml-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/acal/yacal/core/v%version%/%stage_revision%/acal-core-yaml-v%version%-%stage_revision%.md

### Previous version

N/A

### Latest version

- https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.html (Authoritative)
- https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.pdf
- https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.md

### Technical Committee

[OASIS Attribute-Centric Authorization Language (ACAL) \[supersedes XACML\]](https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=67afe552-0921-49b7-9a85-018dc7d3ef1d)

### Chairs

- Bill Parducci (bill@parducci.net), Individual

### Secretaries

- Bill Parducci (bill@parducci.net), Individual

### Editors

- Steven Legg (steven.legg@viewds.com), ViewDS Identity Solutions
- Cyril Dangerville (cyril.dangerville@thalesgroup.com), THALES
- William Parducci (bill@parducci.net), Individual

### Additional artifacts

This document is one component of a Work Product that also includes the following machine-readable YACAL artifacts.

Normative artifacts:

- [Core YACAL structural schema](acal-core-yaml-v%version%-structure.schema.yaml)
- [Core YACAL constraint catalog](acal-core-yaml-v%version%-constraints.yaml)
- [Core YACAL short-identifier set](acal-core-yaml-v%version%-identifiers.yaml)

The XPath and JSONPath Profiles are separate Work Products with their own machine-readable artifacts; see those profiles' specifications for details.

Informative example artifacts:

- `yacal-root-structure-example-core-only.schema.yaml`
- `yacal-root-structure-example-using-jsonpath-profile-only.schema.yaml`
- `yacal-root-structure-example-using-xpath-and-jsonpath-profiles.schema.yaml`
- `yacal-root-structure-example-custom-plus-profile.schema.yaml`

NOTE: any machine-readable content (Computer Language Definitions) declared Normative for this Work Product is provided in separate plain text files. In the event of a discrepancy between any such plain text file and display content in the Work Product's prose narrative document(s), the content in the separate plain text file prevails.

### Abstract

This document defines YACAL, a YAML-based concrete representation of the Attribute-Centric Authorization Language (ACAL) Version 1.0 abstract model. YACAL specifies a mapping from every ACAL abstract model type to a corresponding YAML structure, using YAML 1.2 block style with the Core Schema. YACAL is a first-class ACAL representation, parallel in authority to the XML and JSON representations. This specification defines YAML syntax and YAML-specific processing rules for ACAL constructs, together with companion machine-readable structural, constraint, and identifier artifacts. ACAL semantics are defined by [[ACAL-Core-1.0](#acal-core-10)], not by any concrete representation. Conversion between peer concrete representations is outside the scope of this specification.

### Citation Format

When referencing this document, the following citation format should be used:

**[YACAL-Core-1.0]**
_%title%_.
Edited by Steven Legg, Cyril Dangerville and William Parducci. %date%. OASIS %subtitle%. https://docs.oasis-open.org/acal/yacal/core/v%version%/%stage_revision%/acal-core-yaml-v%version%-%stage_revision%.html. Latest version: https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.html

### Related Work

This document is related to:

* _Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html
* _JACAL Version 1.0 (JSON Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/jacal/core/v1.0/acal-core-json-v1.0.html
* _XACML Version 4.0 (eXtensible Access Control Markup Language)_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html

## License, Document Status, and Notices

Copyright © OASIS Open 2026. All Rights Reserved.  For license and copyright information, and complete status, please see Annex A which contains the License, Document Status and Notices.

---

# Table of Contents

- [1 Scope](#1-scope)
- [2 Definitions and Acronyms](#2-definitions-and-acronyms)
  - [2.1 Definitions](#21-definitions)
    - [2.1.1 Terms Defined Elsewhere](#211-terms-defined-elsewhere)
    - [2.1.2 Terms Defined in This Document](#212-terms-defined-in-this-document)
  - [2.2 Abbreviations and Acronyms](#22-abbreviations-and-acronyms)
- [3 Document Conventions](#3-document-conventions)
  - [3.1 Key Words](#31-key-words)
  - [3.2 Typographic Conventions](#32-typographic-conventions)
  - [3.3 YAML Presentation Conventions](#33-yaml-presentation-conventions)
- [4 Introduction (non-normative)](#4-introduction-non-normative)
  - [4.1 Relationship to ACAL](#41-relationship-to-acal)
  - [4.2 Relationship to Peer Representations](#42-relationship-to-peer-representations)
  - [4.3 Design Principles](#43-design-principles)
- [5 Syntax (normative)](#5-syntax-normative)
  - [5.1 YAML Baseline](#51-yaml-baseline)
    - [5.1.1 YAML Version](#511-yaml-version)
    - [5.1.2 Core Schema](#512-core-schema)
    - [5.1.3 String Quoting](#513-string-quoting)
    - [5.1.4 Prohibited YAML Features](#514-prohibited-yaml-features)
  - [5.2 Document Structure](#52-document-structure)
    - [5.2.1 Root Element](#521-root-element)
    - [5.2.2 Property Names](#522-property-names)
    - [5.2.3 Property Ordering](#523-property-ordering)
    - [5.2.4 Omitted Properties](#524-omitted-properties)
  - [5.3 Simple Type Mapping](#53-simple-type-mapping)
    - [5.3.1 Mapping Model](#531-mapping-model)
    - [5.3.2 Selected Simple Types Mapped to Native YAML Scalars](#532-selected-simple-types-mapped-to-native-yaml-scalars)
    - [5.3.3 Restricted String Types](#533-restricted-string-types)
    - [5.3.4 Enumeration Types](#534-enumeration-types)
    - [5.3.5 Identifier-Like and URI Types](#535-identifier-like-and-uri-types)
    - [5.3.6 Simple Type Summary](#536-simple-type-summary)
  - [5.4 Complex Type Mapping](#54-complex-type-mapping)
    - [5.4.1 Default Mapping Rules for Complex ACAL Types](#541-default-mapping-rules-for-complex-acal-types)
    - [5.4.2 Property Mapping Rules](#542-property-mapping-rules)
    - [5.4.3 Null and Omission](#543-null-and-omission)
    - [5.4.4 ValueType Mapping Rules](#544-valuetype-mapping-rules)
    - [5.4.5 StructuredValueType Mapping](#545-structuredvaluetype-mapping)
    - [5.4.6 Polymorphism and Wrapper-Key Discrimination](#546-polymorphism-and-wrapper-key-discrimination)
    - [5.4.7 Inheritance and Subtype Resolution](#547-inheritance-and-subtype-resolution)
    - [5.4.8 Extensible Abstract Types](#548-extensible-abstract-types)
    - [5.4.9 Ordering and Presentation Rules](#549-ordering-and-presentation-rules)
    - [5.4.10 AnyType Mapping](#5410-anytype-mapping)
    - [5.4.11 ContentType Mapping](#5411-contenttype-mapping)
    - [5.4.12 AttributeType Mapping](#5412-attributetype-mapping)
    - [5.4.13 EntityType Mapping](#5413-entitytype-mapping)
    - [5.4.14 Common Scalar Property Conventions](#5414-common-scalar-property-conventions)
  - [5.5 Expression Representation](#55-expression-representation)
    - [5.5.1 ExpressionType](#551-expressiontype)
    - [5.5.2 ApplyType](#552-applytype)
    - [5.5.3 AttributeDesignatorType](#553-attributedesignatortype)
    - [5.5.4 EntityAttributeDesignatorType](#554-entityattributedesignatortype)
    - [5.5.5 VariableReferenceType](#555-variablereferencetype)
    - [5.5.6 SharedVariableReferenceType](#556-sharedvariablereferencetype)
    - [5.5.7 FunctionType](#557-functiontype)
    - [5.5.8 QuantifiedExpressionTypes](#558-quantifiedexpressiontypes)
    - [5.5.9 BooleanExpressionType](#559-booleanexpressiontype)
    - [5.5.10 AttributeSelectorType](#5510-attributeselectortype)
    - [5.5.11 EntityAttributeSelectorType](#5511-entityattributeselectortype)
  - [5.6 Policy and Rule Representation](#56-policy-and-rule-representation)
    - [5.6.1 PolicyType](#561-policytype)
    - [5.6.2 RuleType](#562-ruletype)
    - [5.6.3 CombinerInputType](#563-combinerinputtype)
    - [5.6.4 VariableDefinitionType](#564-variabledefinitiontype)
    - [5.6.5 ParameterType](#565-parametertype)
    - [5.6.6 PolicyReferenceType](#566-policyreferencetype)
    - [5.6.7 PolicyIssuer](#567-policyissuer)
    - [5.6.8 PatternMatchIdReferenceType](#568-patternmatchidreferencetype)
    - [5.6.9 PolicyDefaultsType](#569-policydefaultstype)
    - [5.6.10 ArgumentType and NamedArgumentType](#5610-argumenttype-and-namedargumenttype)
  - [5.7 Bundle Representation](#57-bundle-representation)
    - [5.7.1 BundleType](#571-bundletype)
    - [5.7.2 SharedVariableDefinitionType](#572-sharedvariabledefinitiontype)
  - [5.8 Request and Response Representation](#58-request-and-response-representation)
    - [5.8.1 RequestType](#581-requesttype)
    - [5.8.2 RequestEntityType](#582-requestentitytype)
    - [5.8.3 RequestAttributeType](#583-requestattributetype)
    - [5.8.4 MultiRequestsType](#584-multirequeststype)
    - [5.8.5 RequestReferenceType](#585-requestreferencetype)
    - [5.8.6 ResponseType](#586-responsetype)
    - [5.8.7 ResultType](#587-resulttype)
    - [5.8.8 ResultEntityType](#588-resultentitytype)
    - [5.8.9 ApplicablePolicyReference](#589-applicablepolicyreference)
    - [5.8.10 RequestDefaultsType](#5810-requestdefaultstype)
  - [5.9 Notice Representation](#59-notice-representation)
    - [5.9.1 NoticeExpressionType](#591-noticeexpressiontype)
    - [5.9.2 AttributeAssignmentExpressionType](#592-attributeassignmentexpressiontype)
    - [5.9.3 NoticeType](#593-noticetype)
    - [5.9.4 AttributeAssignmentType](#594-attributeassignmenttype)
  - [5.10 Status Representation](#510-status-representation)
    - [5.10.1 StatusType](#5101-statustype)
    - [5.10.2 StatusCodeType](#5102-statuscodetype)
    - [5.10.3 StatusDetailType](#5103-statusdetailtype)
    - [5.10.4 MissingAttributeDetailType](#5104-missingattributedetailtype)
  - [5.11 Short Identifier Representation](#511-short-identifier-representation)
    - [5.11.1 ShortIdSetType](#5111-shortidsettype)
    - [5.11.2 ShortIdType](#5112-shortidtype)
    - [5.11.3 ShortIdSetReference](#5113-shortidsetreference)
    - [5.11.4 Usage in Policies](#5114-usage-in-policies)
  - [5.12 Constraint Handling](#512-constraint-handling)
    - [5.12.1 Constraint Categories](#5121-constraint-categories)
    - [5.12.2 Property-Level Constraints](#5122-property-level-constraints)
    - [5.12.3 Object-Level Constraints and Cross-Property Invariants](#5123-object-level-constraints-and-cross-property-invariants)
    - [5.12.4 Enforcement Expectations](#5124-enforcement-expectations)
- [6 Safety, Security and Privacy Considerations (non-normative)](#6-safety-security-and-privacy-considerations-non-normative)
  - [6.1 YAML Parser and Processor Safety](#61-yaml-parser-and-processor-safety)
  - [6.2 Interoperability and Content Handling](#62-interoperability-and-content-handling)
- [7 Conformance](#7-conformance)
  - [7.1 Introduction](#71-introduction)
  - [7.2 Conformance Categories](#72-conformance-categories)
  - [7.3 Conformance Tables](#73-conformance-tables)
    - [7.3.1 ACAL Object-Type Conformance](#731-acal-object-type-conformance)
    - [7.3.2 Machine-Readable Artifact Support](#732-machine-readable-artifact-support)
  - [7.4 Conformant YACAL Document](#74-conformant-yacal-document)
  - [7.5 Conformant YACAL Processor](#75-conformant-yacal-processor)
  - [7.6 Validation Support and Error Reporting](#76-validation-support-and-error-reporting)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
- [Annex C YACAL Identifiers and Machine-Readable Artifacts](#annex-c-yacal-identifiers-and-machine-readable-artifacts)
  - [C.1 Core Short-Identifier Set](#c1-core-short-identifier-set)
  - [C.2 Core YACAL Artifacts](#c2-core-yacal-artifacts)
  - [C.3 Informative Composition Schemas](#c3-informative-composition-schemas)
- [Annex D Complete Example: Website Content Access Policy](#annex-d-complete-example-website-content-access-policy)
- [Annex E Complete Example: Healthcare Chart Access Policy](#annex-e-complete-example-healthcare-chart-access-policy)
- [Annex F How to generate HTML and PDF versions](#annex-f-how-to-generate-html-and-pdf-versions)
  - [Online generation](#online-generation)
  - [Offline generation](#offline-generation)
    - [Prerequisites](#prerequisites)
    - [CSS stylesheet](#css-stylesheet)
    - [HTML generation](#html-generation)
    - [PDF generation](#pdf-generation)
- [Appendix 1 Acknowledgments](#appendix-1-acknowledgments)
  - [Leadership](#leadership)
  - [Participants](#participants)
- [Appendix 2 Changes From Previous Version](#appendix-2-changes-from-previous-version)
  - [Revision History](#revision-history)


------------------------------------------------------------------------

# 1 Scope

This specification defines the YAML syntax of the
[[ACAL-Core-1.0](#acal-core-10)] model and the YAML-specific syntax and
processing rules that are not already specified by
[[ACAL-Core-1.0](#acal-core-10)].

YACAL is a concrete representation of ACAL.  It is a peer to the XML
and JSON ACAL representations and is not defined as a derivative of
either one.  Conversion between YACAL and other concrete
representations is outside the scope of this specification and, if
standardized, should be defined separately as interoperability
guidance.

For ACAL semantics, evaluation behavior, and abstract conformance
requirements, this specification relies on [[ACAL-Core-1.0](#acal-core-10)].

------------------------------------------------------------------------

# 2 Definitions and Acronyms

## 2.1 Definitions

### 2.1.1 Terms Defined Elsewhere

ACAL
: Attribute-Centric Authorization Language Version 1.0

### 2.1.2 Terms Defined in This Document

YACAL
: YAML Representation of ACAL Version 1.0 (this specification)

YAML mapping
: A YAML node consisting of key-value pairs

YAML sequence
: A YAML node consisting of an ordered list of values

YAML scalar
: A YAML node consisting of a single value (string, integer, float,
  boolean, or null)

wrapper key
: A mapping key whose name identifies the type of the value it
  contains; used for type discrimination in polymorphic contexts

## 2.2 Abbreviations and Acronyms

This document uses the following abbreviations and acronyms:

**ACAL**

: Attribute-Centric Authorization Language

**YACAL**

: YAML Representation of ACAL

**YAML**

: YAML Ain't Markup Language [[YAML1.2](#yaml12)]

------------------------------------------------------------------------

# 3 Document Conventions

## 3.1 Key Words

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [[RFC2119](#rfc2119)]
and [[RFC8174](#rfc8174)] when, and only when, they appear in all
capitals, as shown here.

## 3.2 Typographic Conventions

YAML examples are presented in block style using code fences.  Property
names from the ACAL abstract model are rendered in `monospace`.
References to ACAL abstract model types use the form `TypeName` in
monospace.

## 3.3 YAML Presentation Conventions

Unless otherwise stated, examples use YAML 1.2 block style and the Core
Schema.  Flow style may appear in short inline examples, but block style
is the preferred presentation form in this specification.

------------------------------------------------------------------------

# 4 Introduction (non-normative)

The Attribute-Centric Authorization Language (ACAL) Version 1.0
[[ACAL-Core-1.0](#acal-core-10)] defines an abstract policy language for
attribute-based access control (ABAC) decisions.  The ACAL abstract
model is independent of any concrete representation format; concrete
representations are defined by companion specifications.

YACAL defines the YAML representation of ACAL.  It is one of multiple
concrete projections of the same ACAL model.

YAML is a human-friendly data serialization language with native mapping,
sequence, and scalar constructs that suit ACAL's object structure well.
YACAL uses those constructs while preserving the semantics of the ACAL
abstract model.

## 4.1 Relationship to ACAL

YACAL is a concrete representation format for ACAL.  Every construct in
the ACAL abstract model has a corresponding YACAL representation defined
in this specification.  The normative reference for semantics,
evaluation rules, and abstract conformance requirements is
[[ACAL-Core-1.0](#acal-core-10)].  This specification defines how ACAL abstract
model types are expressed in YAML.

The authoritative definitions of ACAL simple types, object structures,
inheritance relationships, and `ValueType` subtypes remain in
[[ACAL-Core-1.0](#acal-core-10)] Section 7.  Likewise, the mandatory-versus-
optional support classification of ACAL object types remains in
[[ACAL-Core-1.0](#acal-core-10)] Section 11.2.  YACAL does not redefine those
abstract model elements; it defines only their YAML representation.

## 4.2 Relationship to Peer Representations

YACAL is structurally aligned with the other ACAL concrete
representations.  The mapping from ACAL to YACAL follows the same broad
design patterns used across the concrete representations:

-   type discrimination through wrapper mapping keys
-   polymorphic types through mutually exclusive required keys
-   ordered collections through YAML sequences
-   implicit data types for primitive values

Each concrete representation is specified independently against the ACAL
abstract model.  Transformations between concrete representations, where
needed, belong in separate interoperability guidance and do not define
YACAL conformance or semantics.

## 4.3 Design Principles

The design of YACAL is guided by the following principles, in priority
order:

1.  **Conformance**: every YACAL document must be conformant with the ACAL core.
    YACAL must not semantically extend the ACAL core.
2.  **Interoperability discipline**: any separate interoperability
    guidance for translating between concrete representations should
    preserve all ACAL-significant information.
3.  **Readability**: YACAL should take advantage of YAML's block style
    to improve human readability.
4.  **Consistency**: YACAL uses the same property names, type
    discrimination patterns, and structural conventions as the peer ACAL
    representations where doing so preserves YAML clarity.

------------------------------------------------------------------------

# 5 Syntax (normative)

## 5.1 YAML Baseline

### 5.1.1 YAML Version

YACAL documents MUST conform to YAML 1.2 [[YAML1.2](#yaml12)].
YAML 1.1 features that are absent from or incompatible with YAML 1.2
(such as sexagesimal number notation, implicit date parsing, and
locale-dependent boolean values like `yes`, `no`, `on`, `off`) MUST NOT
be relied upon.

### 5.1.2 Core Schema

YACAL documents MUST be interpreted using the YAML 1.2 Core Schema.
Under the Core Schema, the following scalar resolutions apply (depending on the matched regular expression in this order, cf. [[YAML1.2](#yaml12)] Section 10.3.2):

| YAML Scalar regex | Examples | Resolved YAML Type | ACAL DataType |
|---|---|---|---|
| `null \| Null \| NULL \| ~` | `null` | null | *Not a valid ACAL value; see Section 5.4.3* |
| `true \| True \| TRUE \| false \| False \| FALSE` | `true`, `false` | Boolean | `urn:oasis:names:tc:acal:1.0:data-type:boolean` |
| `[-+]? [0-9]+` | `42`, `-7`, `0` | Integer (base 10) | `urn:oasis:names:tc:acal:1.0:data-type:integer` |
| `0o [0-7]+` | `0o7` | Integer (base 8) | *Not a valid ACAL value, see Section 5.1.4* |
| `0x [0-9a-fA-F]+` | `0x3A` | Integer (base 16) | `urn:oasis:names:tc:acal:1.0:data-type:hexBinary` |
| `[-+]? ( \. [0-9]+ \| [0-9]+ ( \. [0-9]* )? ) ( [eE] [-+]? [0-9]+ )?` | `0.`, `-0.0`, `.5`, `+12e03`, `-2E+05` | Float (number) | `urn:oasis:names:tc:acal:1.0:data-type:double` |
| `[-+]? ( \.inf \| \.Inf \| \.INF )` | `.inf`, `-.Inf`, `+.INF` | Float (Infinity) | `urn:oasis:names:tc:acal:1.0:data-type:double` |
| `\.nan \| \.NaN \| \.NAN` | `.nan`, `.NAN` | Float (not-a-number) | `urn:oasis:names:tc:acal:1.0:data-type:double` |
| `*` (default) | `hello`, `view`, `Permit` | String | `urn:oasis:names:tc:acal:1.0:data-type:string` |

The Core Schema guarantees that unquoted scalars like `2026-03-23` are
resolved as strings (not dates), and `010` is resolved as the integer 10
(not octal 8), eliminating the type ambiguity present in YAML 1.1.

### 5.1.3 String Quoting

YAML does not require quotes around string scalars unless the value
contains characters that would cause misinterpretation. Quoting is
not merely a stylistic convention: during parsing, non-plain scalars
(quoted scalars and block scalars) are unconditionally
assigned the non-specific tag `!`, which resolves to
`tag:yaml.org,2002:str` (string).  Plain (unquoted) scalars are
assigned the non-specific tag `?`, which is then resolved by
schema-specific rules; under the
Core Schema required by [Section 5.1.2](#512-core-schema), this means `true` resolves to `!!bool`, `42` to `!!int`, `1.0` to `!!float`, and so on.

In YACAL:

-   **URIs MUST be quoted** (double or single quotes). This is a YACAL
    presentation rule: YAML itself reads a colon inside a plain scalar as
    part of the scalar unless the colon is followed by a space, but
    quoting keeps every URI unambiguous whatever characters it contains:

    ```yaml
    # Correct:
    FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-equal"

    # Valid YAML, but not permitted by this YACAL rule:
    FunctionId: urn:oasis:names:tc:acal:1.0:function:string-equal
    ```

-   **Short identifiers do not require quotes** because they contain
    only alphanumeric characters and hyphens:

    ```yaml
    FunctionId: string-equal
    ```

-   **Simple string values do not require quotes** when they consist
    solely of characters that are unambiguous under the Core Schema:

    ```yaml
    Value: view
    Value: clinician
    Effect: Permit
    ```

-   **String values that resemble other scalar types MUST be quoted**
    to prevent misresolution:

    ```yaml
    # The string "true", not the boolean true:
    Value: "true"

    # The string "1.0" (e.g., a version), not the float 1.0:
    Version: "1.0"

    # The string "null", not YAML null:
    Value: "null"
    ```

### 5.1.4 Prohibited YAML Features

The following YAML features MUST NOT be used in conformant YACAL
documents:

-   **Tags** (`!!tag` or `!custom-tag`): YACAL relies on structural
    context and the Core Schema for type resolution, not tags.
-   **Anchors and aliases** (`&anchor` / `*alias`): these have no
    representation in the ACAL abstract model and would break the
    direct structural correspondence to the ACAL abstract model.
-   **Multiple documents** (`---` / `...` separators): a YACAL
    document is a single YAML document.  Bundles are expressed using
    `BundleType`, not YAML multi-document streams.
-   **Merge keys** (`<<`): a YAML 1.1 feature not part of YAML 1.2.
-   **Null** values (`null`, `Null`, `NULL`, `~`, or a key present with an empty value such as `myProperty:`). Omitting an optional property is not a null value; see [Section 5.4.3](#543-null-and-omission).
-   **Octal notation** for integers (to align with JSON integer type), i.e. any value matching the pattern `0o[0-7]+` is forbidden.

## 5.2 Document Structure

### 5.2.1 Root Element

A YACAL document, including a standalone short-identifier set
([Section 5.11.1](#5111-shortidsettype)), is a single YAML mapping
with exactly one key at the root level.  The key identifies the
document type:

| Root Key | ACAL Type | Description |
|---|---|---|
| `Policy` | `PolicyType` | A single policy |
| `Bundle` | `BundleType` | A collection of policies, shared variables, and identifiers |
| `Request` | `RequestType` | An authorization decision request |
| `Response` | `ResponseType` | An authorization decision response |
| `ShortIdSet` | `ShortIdSetType` | A set of short identifiers |
| `SharedVariableDefinition` | `SharedVariableDefinitionType` | A shared variable definition |

Example:

```yaml
Policy:
  PolicyId: "urn:example:yacal:policy:my-first-policy"
  Version: "1.0"
  CombiningAlgId: deny-unless-permit
  ShortIdSetReference:
    - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  CombinerInput:
    - Rule:
        Id: AllowRead
        Effect: Permit
```

### 5.2.2 Property Names

All property names in YACAL use PascalCase, following the ACAL abstract
model property set as normalized for YAML presentation: `PolicyId`, `CombiningAlgId`,
`AttributeDesignator`, `MustBePresent`, etc.

### 5.2.3 Property Ordering

The ordering of keys within a YAML mapping is not significant for
YACAL semantics.  However, for readability and consistency, YACAL
documents SHOULD order properties in the same sequence as they appear
in the ACAL abstract model definition.

### 5.2.4 Omitted Properties

An optional property that is absent from a YACAL document takes the default value defined by the ACAL abstract model, if one is defined. A property MUST NOT be present with a null value (`null`, `Null`, `NULL`, `~` or undefined value in YAML) as a substitute for omission
(see [Section 5.4.3](#543-null-and-omission)).

------------------------------------------------------------------------

## 5.3 Simple Type Mapping

### 5.3.1 Mapping Model

This section defines the default YACAL mapping rules for ACAL simple
types.  The simple types themselves remain defined by
[[ACAL-Core-1.0](#acal-core-10)] Section 7.1, including the ACAL-defined simple
types in ACAL Core Section 7.1.2.3.  Unless a more specific rule
applies, a simple ACAL value is represented as a YAML scalar.

YACAL relies on YAML 1.2 Core Schema resolution, but ACAL lexical and
value-space constraints remain normative.  YAML resolution therefore
determines the YAML scalar category, not the ACAL type definition
itself.  A YAML scalar is not conformant merely because it is legal
YAML; it MUST also satisfy the constraints of the ACAL simple type being
represented.

### 5.3.2 Selected Simple Types Mapped to Native YAML Scalars

The following table defines the YAML scalar forms used for selected ACAL
simple types whose lexical space aligns with native YAML scalars.  It
specifies the YACAL representation only; the underlying ACAL type
definitions remain those of [[ACAL-Core-1.0](#acal-core-10)] Section 7.1.

| ACAL Type | YAML Form | Notes |
|---|---|---|
| `String` | YAML string scalar | Quote when required by [Section 5.1.3](#513-string-quoting) |
| `Boolean` | YAML boolean scalar | MUST use `true` or `false` |
| `Integer` | YAML integer scalar | MUST resolve as integer under the Core Schema |
| `Double` | YAML float scalar | MUST resolve as float under the Core Schema, except for an integer scalar under an explicit or inherited standard ACAL Double `DataType` ([Section 5.4.4](#544-valuetype-mapping-rules), rule 3) |
| `NonNegativeInteger` | YAML integer scalar without the `-` sign, i.e. matching the regex `-?[0-9]+` under the Core Schema||
| `URI`| YAML string scalar matching the same syntax as JSON schema's `format` assertion set to `uri-reference`||

Examples:

```yaml
MustBePresent: true
ReturnPolicyIdList: false
MaxDelegationDepth: 3
Value: 3.14159
Description: This rule permits read access to public content.
```

A value of ACAL type `Double` MUST use a lexical form that YAML resolves
as a float rather than an integer, unless an explicit or inherited
`DataType` that is the standard ACAL Double applies to it
([Section 5.4.4](#544-valuetype-mapping-rules), rule 3).  For example, `3.0` and `-0.5`
represent doubles, whereas `3` represents an integer unless the
standard ACAL Double is declared for it.

### 5.3.3 Restricted String Types

Each ACAL simple type whose value space is defined by a restricted
string lexical form is represented as a YAML string scalar that matches
the lexical constraints of that type.

Restricted string types MUST NOT use YAML tags or any YAML-specific
typing mechanism to indicate their ACAL type.  Their type is determined
by property context or wrapper context.

Examples of ACAL core restricted string types include `VersionType`,
`VersionMatchType`, `ShortIdNameType`, `ShortIdValueType`, and
`LocalIdentifierType`; their authoritative definitions remain in
[[ACAL-Core-1.0](#acal-core-10)] Section 7.1.2.3.

Examples:

```yaml
Version: "1.0"
Version: "2.1.3"
Version: "1.*"
Id: PermitPublicContentView
VariableId: is_admin
```

`VersionType` and `VersionMatchType` values MUST be quoted because forms
such as `1.0` would otherwise be resolved as non-string YAML scalars.

### 5.3.4 Enumeration Types

Each ACAL enumerated type defined by ACAL core or the relevant ACAL
profile is represented as a YAML string scalar whose value is exactly
one of the permitted lexical enumeration values.

Unless quoting is required by [Section 5.1.3](#513-string-quoting),
enumeration values MAY be written as unquoted YAML strings.

Examples:

```yaml
Effect: Permit
Effect: Deny
Decision: Permit
Decision: NotApplicable
```

### 5.3.5 Identifier-Like and URI Types

`IdentifierType`, `URI`, and similar identifier-valued simple types are
represented as YAML string scalars.

Absolute URIs MUST be quoted:

```yaml
CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit"
Id: "urn:example:yacal:shared:is-business-hours"
```

Short identifiers MAY be unquoted when they are unambiguous YAML
strings:

```yaml
CombiningAlgId: deny-unless-permit
FunctionId: string-equal
```

The three ACAL identifier forms remain valid in YACAL:

1. absolute URI
2. short identifier name
3. identifier containing embedded short-identifier references

All such forms are subject to the quoting rules in
[Section 5.1.3](#513-string-quoting).

### 5.3.6 Simple Type Summary

The following rules summarize simple type mapping in YACAL:

1. ACAL simple values are represented as YAML scalars.
2. Native YAML scalar types SHOULD be used where their Core Schema
   resolution matches the ACAL simple type exactly.
3. Restricted strings and identifiers are represented as YAML strings,
   not as custom YAML-typed nodes.
4. Enumeration values are represented as YAML strings using the exact
   enumeration literal.
5. Quoting is a YAML presentation concern, but when needed to preserve
   the intended ACAL type, quoting is mandatory.

------------------------------------------------------------------------

## 5.4 Complex Type Mapping

### 5.4.1 Default Mapping Rules for Complex ACAL Types

The authoritative definitions of ACAL complex types, their properties,
multiplicities, inheritance relationships, and abstract-versus-concrete
status remain in [[ACAL-Core-1.0](#acal-core-10)] Section 7.  This section
defines only how those ACAL structures are represented in YAML.

Unless a more specific rule in this specification applies, a complex
ACAL type is represented as a YAML mapping.

The following terms are used in this section:

- **concrete type**: a non-abstract ACAL type
- **abstract type**: an ACAL type that cannot be instantiated directly
- **direct position**: a context in which the property or document root
  already determines the ACAL type
- **polymorphic position**: a context in which the actual concrete type
  must be distinguished among multiple possible subtypes

The default rules are:

1. A concrete complex ACAL type in a direct position SHALL be
   represented as a YAML mapping whose keys are the ACAL property names
   of that type.
2. An abstract ACAL type has no direct standalone representation.  It
   is represented through one of its concrete subtypes according to the
   wrapper-key rules in [Section 5.4.6](#546-polymorphism-and-wrapper-key-discrimination).
3. Unless this specification says otherwise, each property appears at
   the same mapping level as its peers; YACAL does not introduce an
   extra nesting level for the ACAL type name.
4. The root document forms defined in [Section 5.2.1](#521-root-element)
   are special cases of this model in which the document type is made
   explicit by the single root key.

### 5.4.2 Property Mapping Rules

For each property of a complex ACAL type, apply the following rules
unless a more specific type section overrides them.  The property names,
multiplicities, defaults, and inheritance semantics come from the ACAL
core type definitions; the rules below describe only how those
properties are written in YAML.

1. A single-valued property is represented directly using the YAML
   representation of its ACAL type.
2. A multivalued property is represented as a YAML sequence whose items
   are the YAML representations of the property's item type.
3. If the lower bound of a property's multiplicity is `1`, the property
   MUST be present.
4. If the lower bound of a property's multiplicity is `0`, the property
   MAY be omitted.
5. If a multivalued property is present, it MUST contain at least one
   item unless a more specific rule explicitly permits an empty
   sequence.
6. If an ACAL property has a default value, that property MAY be
   omitted and the ACAL default semantics apply.  If the property is
   present, its value MUST conform to the ACAL type and any default
   constraints.
7. A YAML mapping used for a complex ACAL type MUST NOT contain duplicate
   property keys.

Examples:

```yaml
ShortIdSetReference:
  - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  - "urn:example:yacal:ids:local"

Argument:
  - Value: read
  - Value: write
```

### 5.4.3 Null and Omission

The YAML scalars `null`, `Null`, `NULL` and `~` are not valid YACAL values and MUST NOT be used as a generic
stand-in for absence. Similarly, a property with undefined value (e.g. `myProperty: # Empty`) is forbidden in YACAL.

To omit an optional property, the property MUST simply be absent from
the mapping.  An omitted property is not equivalent to a present
property whose value is YAML `null`.

### 5.4.4 ValueType Mapping Rules

The ACAL `ValueType` model is defined in
[[ACAL-Core-1.0](#acal-core-10)] Section 7.23.  The ACAL `ValueType` and its
literal subtypes are mapped specially because YAML provides native
scalar forms.

`ValueType` is abstract.  In YACAL, its concrete representations follow
the same conceptual split as ACAL:

1. fixed-datatype primitive values
2. lexical-datatype primitive values
3. structured values

Unless a more specific parent-context rule applies, a `ValueType` is
represented in one of the following forms:

1. as a YAML scalar when the ACAL data type is implicit from the Core
   Schema resolution or from the surrounding ACAL context
2. as a YAML mapping containing `DataType` and `Value` when the data
   type is not implicit or when an explicit `DataType` is required for
   unambiguous interpretation
3. as a YAML mapping containing `DataType` and profile-defined
   structured-value properties, as defined in
   [Section 5.4.5](#545-structuredvaluetype-mapping)

The following rules apply to primitive `ValueType` forms:

1. A YAML boolean scalar represents `LiteralBooleanType`.  Its ACAL
   `DataType` is fixed to
   `urn:oasis:names:tc:acal:1.0:data-type:boolean`.
2. A YAML integer scalar represents `LiteralIntegerType`, and its ACAL
   `DataType` is fixed to
   `urn:oasis:names:tc:acal:1.0:data-type:integer`, unless an explicit
   or inherited `DataType` that is the standard ACAL Double applies to
   the scalar and the scalar's text is a decimal integer as specified
   in rule 3, in which case the scalar represents `LiteralDoubleType`
   (rule 3).  The remaining requirements of this rule apply only to a
   YAML integer scalar or `Value` string that represents
   `LiteralIntegerType`.  An ACAL integer
   MAY also be represented as a mapping with a `DataType` of
   `urn:oasis:names:tc:acal:1.0:data-type:integer` and a `Value`
   string in the lexical space of `xs:integer`, and an integer that
   cannot be carried as a YAML integer scalar without loss of
   precision MAY be represented that way.  A YACAL processor SHALL
   NOT alter the value denoted by a YAML integer scalar.  A YACAL
   processor SHALL NOT accept a YAML integer scalar as an ACAL integer
   unless it has determined the exact integer value from the decimal
   digits of the scalar (it cannot, for example, when a YAML parser
   has replaced the scalar with a fixed-width or floating-point
   approximation).  A YACAL processor SHALL NOT accept the `Value`
   string of the mapping form if the string is not in the lexical
   space of `xs:integer`.  A YACAL processor SHALL NOT continue with
   an altered integer value in place of a representation that it does
   not accept.  A YACAL processor MAY reject an integer scalar or a
   `Value` string, without determining the integer that it denotes,
   because it exceeds an input acceptance limit
   ([[ACAL-Core-1.0](#acal-core-10)] Section 2.1.2 and Annex C.2.6).
   Rejecting an integer scalar or a `Value` string because the
   integer that it denotes is outside the processor's supported
   integer interval is a refusal of the containing request or policy,
   which [[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6 governs; a YACAL
   processor SHALL NOT reject a representation for that reason within
   a request that the implementation has admitted to evaluation.  A
   YACAL processor that does not reject, under this item, a YAML
   integer scalar that this specification permits and whose exact
   value it has determined, or a `Value` string in the lexical space
   of `xs:integer`, SHALL accept it as denoting the exact integer.
3. A YAML float scalar represents `LiteralDoubleType`.  Its ACAL
   `DataType` is fixed to
   `urn:oasis:names:tc:acal:1.0:data-type:double`.  A YAML integer
   scalar that this specification permits also represents
   `LiteralDoubleType` when an explicit or inherited `DataType` that is
   the standard ACAL Double applies to it and its text is a decimal
   integer (matching `[-+]?[0-9]+`, which is in the lexical space of
   `xs:double`); it then denotes the `xs:double` value that the lexical
   mapping of `xs:double` ([[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6)
   assigns to the scalar's text.  For example,
   `DataType: "urn:oasis:names:tc:acal:1.0:data-type:double"` with
   `Value: 3` represents the double 3.0.  A YAML scalar in hexadecimal
   notation SHALL NOT be used for this form.
4. A YAML string scalar represents either:
   1. `LiteralStringType`, if no inherited or explicit non-string
      `DataType` applies
   2. `LiteralRestrictedStringType`, if an inherited or explicit ACAL
      lexical `DataType` such as `anyURI`, `date`, or `rfc822Name`
      applies
5. Rules 2 and 3 are applied before fixed-datatype agreement is
   checked.  If a fixed-datatype primitive value is accompanied by an
   explicit `DataType`, that `DataType` MUST match the fixed data type
   of the resulting concrete literal subtype, and SHOULD be omitted when
   the data type is otherwise implicit.  An explicit standard ACAL
   Double `DataType` that is needed to select rule 3's
   `LiteralDoubleType` representation SHALL NOT be omitted.
6. If a YAML string scalar is used with an explicit or inherited
   `DataType`, that string MUST satisfy the lexical constraints of the
   effective ACAL data type.

YAML Core Schema resolution determines whether an unquoted scalar is a
boolean, integer, float, or string before the ACAL typing rules above
are applied.  An explicit or inherited `DataType` supplements YAML
resolution.  A YACAL processor SHALL NOT treat a `DataType` as changing
the YAML-resolved scalar category.  A YACAL processor SHALL NOT select a
different fixed-datatype literal subtype on the basis of a `DataType`,
except
that rule 3 makes a decimal YAML integer scalar under the standard ACAL
Double represent `LiteralDoubleType`.  A YAML float scalar SHALL NOT
represent `LiteralIntegerType`.

Primitive implicit examples:

```yaml
# Boolean — implicit DataType: boolean
Value: true

# Integer — implicit DataType: integer
Value: 42

# Double — implicit DataType: double
Value: 3.14

# String — implicit DataType: string
Value: view
```

When a string resembles another YAML scalar type, it MUST be quoted:

```yaml
Value: "true"
Value: "1.0"
```

When the data type is not implicit from either YAML scalar resolution or
the surrounding ACAL context, explicit typing is required:

```yaml
DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
Value: "https://example.com/policies/permit-read"
```

Explicit `DataType` complements YAML Core Schema resolution.  Rule 3
changes only the ACAL literal subtype assigned to a decimal integer
scalar under the standard ACAL Double; the scalar remains a YAML
integer scalar.

The ACAL `DataType` of a `ValueType` is determined by the following
precedence:

1. the fixed data type of the concrete literal subtype, if any (for a
   decimal YAML integer scalar under an explicit or inherited standard
   ACAL Double, the subtype is `LiteralDoubleType`, per rule 3)
2. an explicit `DataType` in the `ValueType` mapping
3. a parent-context inference rule defined by ACAL for the containing
   object or expression
4. the ACAL default of string, if no other rule determines the data type

If an enclosing ACAL object already fixes or infers the `DataType` of
the value, the nested `ValueType` SHOULD omit its own `DataType`.  If
both the enclosing context and the nested `ValueType` specify a
`DataType`, the two values MUST agree.

Typical parent contexts that may fix or infer the `DataType` of a
contained `ValueType` include:

- typed attribute-value containers
- `ParameterType` default expressions
- `ApplyType` arguments whose function signature fixes the expected type
- `PolicyReferenceType` and `SharedVariableReferenceType` arguments
- quantified-expression rules defined by ACAL for the `Iterant`
- other ACAL parent objects whose sections define a `DataType`
  inference rule

Examples of inherited `DataType`:

```yaml
RequestAttribute:
  - AttributeId: "urn:example:yacal:subject:role"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
    Value:
      - clinician

Parameter:
  - Name: threshold
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:integer"
    Expression:
      Value: 10000
```

In both examples above, the nested value SHOULD omit its own `DataType`
because the surrounding context already fixes it.

### 5.4.5 StructuredValueType Mapping

`StructuredValueType` is the abstract structured-value branch of
`ValueType` defined by [[ACAL-Core-1.0](#acal-core-10)] Section 7.23.  A
concrete `StructuredValueType` subtype is represented as a YAML mapping
containing the profile-defined properties of that subtype.

When a structured value is used in expression position, that mapping is
the value associated with the `Value` wrapper key; YACAL does not add an
extra wrapper for the concrete structured subtype unless the relevant
profile explicitly defines one.

If the surrounding context does not already determine the ACAL data
type, the representation MUST include a `DataType` property identifying
the structured value's data type.

If the surrounding context already determines the `DataType`, the
structured value MAY be represented by its profile-defined properties
without repeating `DataType`.

A concrete structured-value subtype MUST NOT redefine `DataType` with a
conflicting meaning or create ambiguity between the core `DataType`
property and profile-defined properties.

Examples, using the implementation-defined structured value of the
informative composition schema
`yacal-root-structure-example-custom-plus-profile.schema.yaml`
([Annex C.3](#c3-informative-composition-schemas)), against which they
validate:

```yaml
Value:
  DataType: "urn:example:yacal:data-type:template"
  TemplateLanguage: "urn:example:yacal:template-language:mustache"
  Template: "Dear {{name}}"
```

```yaml
RequestAttribute:
  - AttributeId: "urn:example:yacal:resource:notice-template"
    DataType: "urn:example:yacal:data-type:template"
    Value:
      - TemplateLanguage: "urn:example:yacal:template-language:mustache"
        Template: "Dear {{name}}"
```

### 5.4.6 Polymorphism and Wrapper-Key Discrimination

When a value is in a polymorphic position, YACAL represents it as a YAML
mapping with exactly one wrapper key.

The wrapper key identifies the concrete subtype, and the corresponding
value is the direct YAML representation of that subtype.

The following rules apply:

1. Exactly one wrapper key MUST be present.
2. A mapping with zero wrapper keys in a polymorphic position is
   invalid.
3. A mapping with more than one wrapper key in a polymorphic position is
   invalid.
4. The wrapper key names are those assigned by this specification for
   the relevant polymorphic context.
5. The value associated with the wrapper key MUST conform to the direct
   representation rules of the identified subtype.
6. No additional sibling keys are permitted alongside the wrapper key in
   the same polymorphic wrapper mapping.
7. In a sequence of polymorphic values, each sequence item is wrapped
   independently.
8. A wrapper key identifies the concrete subtype used in that context,
   not each intermediate abstract supertype in the inheritance chain.

Examples:

```yaml
Expression:
  Apply:
    FunctionId: string-equal

CombinerInput:
  - Rule:
      Id: AllowRead
      Effect: Permit
```

### 5.4.7 Inheritance and Subtype Resolution

ACAL inheritance affects which properties a subtype carries, but it does
not require nested YAML wrappers for each inheritance layer.

When a concrete subtype inherits properties from one or more supertypes,
the YAML representation of the subtype includes all inherited
properties, together with the subtype's own properties, in one mapping
unless a more specific section of this specification states otherwise.

Subtype resolution follows these rules:

1. In a direct position, the surrounding property or document context
   determines the expected ACAL type.
2. In a polymorphic position, the wrapper key determines the concrete
   subtype.
3. If a concrete non-final type is itself permitted in a polymorphic
   position, that direct use is identified by the wrapper key assigned
   to that concrete type in the relevant context.
4. Abstract supertypes may contribute inherited properties and
   constraints, but they do not appear as separate YAML wrapper layers
   unless they are themselves the polymorphic discriminator in a
   context-specific rule.
5. If a subtype overrides or specializes a property inherited from a
   supertype, the YAML representation follows the effective ACAL subtype
   definition for that property.

Examples of this flattening include:

- `EntityAttributeDesignatorType`, which inherits common named-attribute
  designator properties without introducing a separate
  `NamedAttributeDesignator` wrapper
- `PolicyType` and `RuleType`, which can appear as concrete
  `CombinerInputType` subtypes in polymorphic positions but use their
  direct property mappings in non-polymorphic positions

### 5.4.8 Extensible Abstract Types

Some abstract ACAL types are designed to be extended by ACAL profiles
or by implementation-defined profile-compatible subtypes.  YACAL uses
the same wrapper-key and inheritance model for these extensions.

The generic rules are:

1. A profile-defined concrete subtype of an abstract ACAL type SHALL use
   the inherited-property flattening model of
   [Section 5.4.7](#547-inheritance-and-subtype-resolution).
2. In a polymorphic position, a profile-defined concrete subtype SHALL
   be identified by the wrapper key assigned by the relevant profile
   specification.
3. In a direct position created by a profile-specific property whose
   type is already fixed to that concrete subtype, no extra polymorphic
   wrapper is required unless the profile says otherwise.
4. This specification does not assign wrapper keys to profile-defined
   subtypes unless they are part of the YACAL core vocabulary.

Important examples of extensible abstract types in ACAL include:

- `PolicyDefaultsType`
- `RequestDefaultsType`
- `StructuredValueType`
- `AttributeSelectorType`
- `EntityAttributeSelectorType`

### 5.4.9 Ordering and Presentation Rules

Within a YAML mapping, property ordering is not semantically
significant.  Within a YAML sequence, item ordering is preserved.

Sequence order is semantically significant where ACAL defines ordered
evaluation or ordered collections.  Where ACAL does not assign semantic
meaning to ordering, processors MUST preserve the sequence as given but
need not treat the order as semantically relevant.

### 5.4.10 AnyType Mapping

`AnyType` is used where ACAL permits representation-defined or
profile-defined arbitrary content, notably in `ContentType` and
`StatusDetailType`.

In YACAL, an `AnyType` value is represented directly as a YAML node
without any extra wrapper:

1. a YAML mapping for structured object content
2. a YAML sequence for structured list content
3. a YAML scalar for textual or scalar payloads

The chosen YAML form MUST be consistent with the enclosing ACAL object,
its `MediaType`, any `Encoding`, and any applicable ACAL profile.

If the content is XML or another non-YAML-native textual format, the
`AnyType` value SHOULD be represented as a YAML string, typically quoted
or block-scalar style.

YAML tags, anchors, aliases, merge keys, and multi-document streams are
prohibited in `AnyType` content just as they are elsewhere in YACAL.

### 5.4.11 ContentType Mapping

`ContentType` is represented as a YAML mapping with the following
properties:

| Property | Required | Type | Notes |
|---|---|---|---|
| `MediaType` | No | String | Media type of the content body. If omitted, the default value `application/yaml` applies, and the `Body` SHALL be a YAML 1.2 document. The values `application/json` and `application/xml` SHALL be used for JSON objects and XML documents respectively.  |
| `Encoding` | No | String | Content encoding, used only when the `Body` string is encoded rather than directly represented. The Encoding value `base64` indicates that the Body is Base64-encoded as per [[RFC4648](#rfc4648)]. Other Encoding values may be defined by other YACAL Profiles. |
| `Body` | Yes | `AnyType` | Direct representation of the content payload |

The `Body` value is the direct YACAL representation of the underlying
content and follows the rules in
[Section 5.4.10](#5410-anytype-mapping).

For structured content that is naturally represented using YAML
mappings, sequences, or scalars, the `Body` SHOULD normally use those
native YAML forms:

```yaml
Content:
  Body:
    patient:
      id: "P-12345"
      ward: cardiology
```

For XML, JSON or other textual structured content, the `Body` SHOULD normally
be represented as a YAML string.  If encoded binary or escaped textual
content is required, the `Encoding` property identifies that encoding:


```yaml
Content:
  MediaType: "application/json"
  Body: |
    { "patient": { 
        "id": "P-12345",
        "ward": "cardiology"
      }
    }
```

```yaml
Content:
  MediaType: "application/xml"
  Body: |
    <record id="P-12345"><ward>cardiology</ward></record>
```

```yaml
Content:
  MediaType: "application/xml"
  Encoding: base64
  Body: "PHJlY29yZCBpZD0iUC0xMjM0NSI+PHdhcmQ+Y2FyZGlvbG9neTwvd2FyZD48L3JlY29yZD4="
```

Processors MAY reject unsupported media types, unsupported encodings, or
profile-specific content forms they do not claim to implement.

### 5.4.12 AttributeType Mapping

`AttributeType` is the reusable ACAL form for an identified attribute
with one or more values.  In YACAL, it is represented as a YAML mapping:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `AttributeId` | Yes | — | `IdentifierType` | 1 |
| `Issuer` | No | — | Name | 0..1 |
| `DataType` | No | string | `IdentifierType` | 0..1 |
| `Value` | Yes | — | `ValueType` | 1..* |

The `Value` property is represented as a YAML sequence, each item being
the direct representation of a `ValueType`.

If the enclosing `AttributeType` mapping specifies `DataType`, each
nested `Value` SHOULD omit its own `DataType`; if a nested value does
specify one, it MUST agree with the enclosing `DataType`.

Example:

```yaml
Attribute:
  - AttributeId: "urn:example:yacal:resource:classification"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
    Value:
      - confidential
      - restricted
```

Subtypes of `AttributeType`, such as `RequestAttributeType` and
`AttributeAssignmentType`, inherit this mapping and add their own
properties in the same YAML mapping.

### 5.4.13 EntityType Mapping

`EntityType` is the reusable ACAL form for entity-valued content, such
as `PolicyIssuer`.

In YACAL, it is represented as a YAML mapping with the following
properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Content` | No | `ContentType` | 0..1 |
| `Attribute` | No | `AttributeType` | * |

At least one of `Content` or `Attribute` MUST be present.

Example:

```yaml
PolicyIssuer:
  Attribute:
    - AttributeId: "urn:example:yacal:issuer:id"
      Value:
        - "urn:example:authority:cardiology-board"
```

`EntityType` uses `ContentType` according to
[Section 5.4.11](#5411-contenttype-mapping) and `AttributeType`
according to [Section 5.4.12](#5412-attributetype-mapping).

### 5.4.14 Common Scalar Property Conventions

Some ACAL properties recur across many YACAL objects and do not require
their own wrapper or container syntax.

The following conventions apply wherever those properties appear:

- `Category` is represented as an `IdentifierType` YAML scalar
- `Description` is represented as a YAML string scalar
- both properties follow the general simple-type and quoting rules in
  [Section 5.3](#53-simple-type-mapping)

The remaining subsections of Section 5 are organized by the
corresponding ACAL Core Section 7 structures.  Where a subsection
includes a property table, that table is a YACAL mapping summary for the
core-defined structure; it does not replace the authoritative ACAL Core
definition of the type, its properties, or its multiplicities.

------------------------------------------------------------------------

## 5.5 Expression Representation

### 5.5.1 ExpressionType

ACAL `ExpressionType` is an abstract polymorphic type.  In YACAL, it is
represented as a YAML mapping with exactly one key that identifies the
expression subtype, following the generic wrapper-key rules in
[Section 5.4.6](#546-polymorphism-and-wrapper-key-discrimination):

Intermediate abstract supertypes such as `NonLiteralExpressionType`,
`NamedAttributeDesignatorType`, and `QuantifiedExpressionType` do not
introduce additional wrapper levels.  The wrapper key identifies the
usable concrete subtype in the expression position.

| Wrapper Key | ACAL Type |
|---|---|
| `Apply` | `ApplyType` |
| `AttributeDesignator` | `AttributeDesignatorType` |
| `EntityAttributeDesignator` | `EntityAttributeDesignatorType` |
| `AttributeSelector` | `AttributeSelectorType` (optional) |
| `EntityAttributeSelector` | `EntityAttributeSelectorType` (optional) |
| `VariableReference` | `VariableReferenceType` |
| `SharedVariableReference` | `SharedVariableReferenceType` |
| `Function` | `FunctionType` |
| `Value` | `ValueType` |
| `ForAny` | `ForAnyType` (optional) |
| `ForAll` | `ForAllType` (optional) |
| `Select` | `SelectType` (optional) |
| `Map` | `MapType` (optional) |

### 5.5.2 ApplyType

`ApplyType` represents a function application with arguments:

```yaml
Apply:
  FunctionId: string-is-in
  Argument:
    - Value: view
    - AttributeDesignator:
        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
        MustBePresent: true
```

Properties:

| Property | Required | Type | Notes |
|---|---|---|---|
| `FunctionId` | Yes | `IdentifierType` | Function identifier |
| `Description` | No | String | Free-form description |
| `Argument` | No | Sequence of `ArgumentType` | Arguments in order, or named arguments (`NamedArgumentType`) in any order if the function has *named parameters* (more info in the `ApplyType` section of [[ACAL-Core-1.0](#acal-core-10)] ); empty if function takes no arguments. When the function signature fixes an argument `DataType`, a statically typed child expression such as `Value` SHOULD omit `DataType`; if present, it MUST agree with the function signature. |

### 5.5.3 AttributeDesignatorType

`AttributeDesignatorType` retrieves attribute values from the request
context:

```yaml
AttributeDesignator:
  Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
  AttributeId: "urn:example:yacal:subject:role"
  MustBePresent: true
```

Properties:

| Property | Required | Default | Type | Notes |
|---|---|---|---|---|
| `Category` | Yes | — | `IdentifierType` | Attribute category |
| `AttributeId` | Yes | — | `IdentifierType` | Attribute identifier |
| `DataType` | No | string | `IdentifierType` | Data type of returned values; subject to inference rules |
| `Issuer` | No | — | Name | Attribute issuer |
| `MustBePresent` | No | `false` | Boolean | If `true`, missing attribute returns Indeterminate |

### 5.5.4 EntityAttributeDesignatorType

```yaml
EntityAttributeDesignator:
  AttributeId: "urn:example:yacal:entity:name"
  MustBePresent: true
  Expression:
    VariableReference:
      VariableId: current_entity
```

Properties are inherited from `NamedAttributeDesignatorType` with the
addition of `Expression` (required, `ExpressionType`) instead of
`Category`.  The inherited properties appear in the same mapping; YACAL
does not introduce a separate `NamedAttributeDesignator` wrapper layer.

### 5.5.5 VariableReferenceType

```yaml
VariableReference:
  VariableId: is_admin
```

### 5.5.6 SharedVariableReferenceType

```yaml
SharedVariableReference:
  Id: "urn:example:yacal:shared:is-local-timezone"
  Version: "1.*"
  Argument:
    - Value: "America/Los_Angeles"
```

Each item in `Argument` SHALL correspond  to a `Parameter`
definition in the referenced shared variable definition, either positionally (declared in the same order) or by name using only `NamedArgument` properties. More info in the `SharedVariableReferenceType` section of [[ACAL-Core-1.0](#acal-core-10)].
A nested `ValueType` SHOULD omit `DataType` as it is already fixed by the `Parameter` in the referenced shared variable; if present, it MUST agree.

### 5.5.7 FunctionType

`FunctionType` appears as an argument to higher-order functions:

```yaml
Function:
  Id: string-equal
```

### 5.5.8 QuantifiedExpressionTypes

`ForAny`, `ForAll`, `Select`, and `Map` share a common structure:

```yaml
ForAny:
  VariableId: role
  Domain:
    AttributeDesignator:
      Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      AttributeId: "urn:example:yacal:subject:roles"
      MustBePresent: true
  Iterant:
    Apply:
      FunctionId: string-equal
      Argument:
        - VariableReference:
            VariableId: role
        - Value: admin
```

Properties:

| Property | Required | Type | Notes |
|---|---|---|---|
| `VariableId` | Yes | `LocalIdentifierType` | Quantified variable identifier |
| `Domain` | Yes | `NonLiteralExpressionType` | Expression evaluating to a bag |
| `Iterant` | Yes | `ExpressionType` | Expression evaluated per domain value |

These are concrete subtypes of the abstract
`QuantifiedExpressionType`.  In polymorphic expression position, the
wrapper key identifies which quantified subtype is in use; the common
inherited properties then appear directly within that subtype's mapping.

### 5.5.9 BooleanExpressionType

`BooleanExpressionType` (used by `Target` and `Condition`) is
represented directly as the contained expression, not as a separate
wrapper.  The expression MUST NOT be a literal `ValueType`:

```yaml
Condition:
  Apply:
    FunctionId: string-is-in
    Argument:
      - Value: read
      - AttributeDesignator:
          Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
          AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          MustBePresent: true
```

### 5.5.10 AttributeSelectorType

`AttributeSelectorType` is an optional, profile-defined expression form.
In YACAL it uses the `AttributeSelector` wrapper key from
[Section 5.5.1](#551-expressiontype).

The direct mapping of a concrete attribute-selector subtype includes the
base-selector properties plus the `Category` property:

| Property | Required | Default | Type | Notes |
|---|---|---|---|---|
| `Path` | Yes | — | String | Profile-defined path expression syntax |
| `DataType` | No | string or inferred | `IdentifierType` | Expected data type of selected values |
| `MustBePresent` | No | `false` | Boolean | Missing or empty selection handling |
| `Category` | Yes | — | `IdentifierType` | Request entity category whose `Content` is queried |

Illustrative form:

```yaml
AttributeSelector:
  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
  Path: "PATH-EXPR"
  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
  MustBePresent: true
```

The concrete syntax and semantics of `Path`, and any additional
selector-specific properties, are defined by the relevant ACAL profile.

### 5.5.11 EntityAttributeSelectorType

`EntityAttributeSelectorType` is an optional, profile-defined expression
form.  In YACAL it uses the `EntityAttributeSelector` wrapper key from
[Section 5.5.1](#551-expressiontype).

Its direct mapping includes the base-selector properties plus the
required `Expression` property:

| Property | Required | Default | Type | Notes |
|---|---|---|---|---|
| `Path` | Yes | — | String | Profile-defined path expression syntax |
| `DataType` | No | string or inferred | `IdentifierType` | Expected data type of selected values |
| `MustBePresent` | No | `false` | Boolean | Missing or empty selection handling |
| `Expression` | Yes | — | `ExpressionType` | Evaluates to an entity value or category URI |

Illustrative form:

```yaml
EntityAttributeSelector:
  Path: "PATH-EXPR"
  MustBePresent: true
  Expression:
    VariableReference:
      VariableId: current_entity
```

The selector `Expression` MUST evaluate to either an entity value or a
category URI, as defined by ACAL and the relevant selector profile.

------------------------------------------------------------------------

## 5.6 Policy and Rule Representation

### 5.6.1 PolicyType

A complete policy example:

```yaml
Policy:
  PolicyId: "urn:example:yacal:policy:content-access"
  Version: "1.0"
  Description: Permits view access to public content.
  CombiningAlgId: deny-unless-permit
  ShortIdSetReference:
    - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  VariableDefinition:
    - VariableId: action_is_view
      Expression:
        Apply:
          FunctionId: string-is-in
          Argument:
            - Value: view
            - AttributeDesignator:
                Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                MustBePresent: true
  CombinerInput:
    - Rule:
        Id: PermitPublicView
        Effect: Permit
        Condition:
          Apply:
            FunctionId: and
            Argument:
              - VariableReference:
                  VariableId: action_is_view
              - Apply:
                  FunctionId: string-is-in
                  Argument:
                    - Value: public
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:resource:visibility"
                        MustBePresent: true
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `PolicyId` | Yes | — | URI | 1 |
| `Version` | Yes | — | `VersionType` | 1 |
| `CombiningAlgId` | Yes | — | `IdentifierType` | 1 |
| `Description` | No | — | String | 0..1 |
| `ShortIdSetReference` | No | — | URI | * |
| `MaxDelegationDepth` | No | — | NonNegativeInteger | 0..1 |
| `PolicyIssuer` | No | — | `EntityType` | 0..1 |
| `PolicyDefaults` | No | — | `PolicyDefaultsType` | * |
| `Parameter` | No | — | `ParameterType` | * |
| `VariableDefinition` | No | — | `VariableDefinitionType` | * |
| `Target` | No | *(applies to all)* | `BooleanExpressionType` | 0..1 |
| `NoticeExpression` | No | — | `NoticeExpressionType` | * |
| `CombinerInput` | No | — | `CombinerInputType` | * |

`PolicyType` is also a concrete subtype of `CombinerInputType`.  When
it appears in a direct position such as the document root or the
`Bundle.Policy` property, it uses its direct mapping.  When it appears
within the polymorphic `CombinerInput` property, it is identified by
the `Policy` wrapper key.

`PolicyDefaultsType` is an abstract extensible type.  Each item in the
`PolicyDefaults` sequence therefore uses the concrete subtype defined by
the relevant ACAL profile, following the generic rules in
[Section 5.4.8](#548-extensible-abstract-types).

### 5.6.2 RuleType

```yaml
Rule:
  Id: PermitClinicianRead
  Effect: Permit
  Description: Permits clinicians to read medical records.
  Condition:
    Apply:
      FunctionId: and
      Argument:
        - Apply:
            FunctionId: string-is-in
            Argument:
              - Value: clinician
              - AttributeDesignator:
                  Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                  AttributeId: "urn:example:yacal:subject:role"
                  MustBePresent: true
        - Apply:
            FunctionId: string-is-in
            Argument:
              - Value: medical-record
              - AttributeDesignator:
                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                  AttributeId: "urn:example:yacal:resource:type"
                  MustBePresent: true
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `Id` | Yes | — | `LocalIdentifierType` | 1 |
| `Effect` | Yes | — | `EffectType` | 1 |
| `Description` | No | — | String | 0..1 |
| `VariableDefinition` | No | — | `VariableDefinitionType` | * |
| `Condition` | No | *(always satisfied)* | `BooleanExpressionType` | 0..1 |
| `NoticeExpression` | No | — | `NoticeExpressionType` | * |

### 5.6.3 CombinerInputType

`CombinerInputType` is a polymorphic container.  Each element in the
`CombinerInput` sequence is a YAML mapping with exactly one key
identifying the input type, following the generic rules in
[Section 5.4.6](#546-polymorphism-and-wrapper-key-discrimination):

```yaml
CombinerInput:
  - Rule:
      Id: AllowRead
      Effect: Permit
  - Rule:
      Id: DenyWrite
      Effect: Deny
  - PolicyReference:
      Id: "urn:example:yacal:policy:audit-logging"
      Version: "1.*"
  - Policy:
      PolicyId: "urn:example:yacal:policy:nested-check"
      Version: "1.0"
      CombiningAlgId: first-applicable
      CombinerInput:
        - Rule:
            Id: InnerRule
            Effect: Permit
```

Valid wrapper keys: `Rule`, `Policy`, `PolicyReference`.

`RuleType`, `PolicyType`, and `PolicyReferenceType` therefore have two
different presentation contexts in YACAL:

1. direct use, where the surrounding property already fixes the type
2. polymorphic combiner use, where the wrapper key identifies the type

### 5.6.4 VariableDefinitionType

```yaml
VariableDefinition:
  - VariableId: is_admin
    Expression:
      Apply:
        FunctionId: string-is-in
        Argument:
          - Value: admin
          - AttributeDesignator:
              Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
              AttributeId: "urn:example:yacal:subject:role"
              MustBePresent: true
```

If the `Expression` is a literal `ValueType` and neither the value nor
its parent context fixes a `DataType`, it is treated as string by
default.

### 5.6.5 ParameterType

```yaml
Parameter:
  - Name: threshold
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:integer"
    IsBag: false
    Description: Approval threshold amount.
    Expression:
      Value: 10000
```

If the `Expression` is a `ValueType`, it SHOULD omit any nested
`DataType` because the surrounding `ParameterType` already fixes the
value's `DataType`.  If both are present, they MUST agree.

### 5.6.6 PolicyReferenceType

```yaml
PolicyReference:
  Id: "urn:example:yacal:policy:audit-logging"
  Version: "2.*"
  Argument:
    - Value: "high"
    - Value: 90
```

Each item in `Argument` SHALL correspond  to a `Parameter`
definition in the referenced policy, either positionally (declared in the same order) or by name using only `NamedArgument` properties. More info in the `PolicyReferenceType` section of [[ACAL-Core-1.0](#acal-core-10)].
A nested `ValueType` SHOULD omit `DataType` as it is already fixed by the `Parameter` in the referenced policy; if present, it MUST agree.

### 5.6.7 PolicyIssuer

The `PolicyIssuer` property of a `PolicyType` value uses the direct
mapping of `EntityType` from [Section 5.4.13](#5413-entitytype-mapping).

Example:

```yaml
PolicyIssuer:
  Attribute:
    - AttributeId: "urn:example:yacal:issuer:id"
      Value:
        - "urn:example:authority:medical-board"
    - AttributeId: "urn:example:yacal:issuer:name"
      Value:
        - "Regional Medical Board"
```

If `PolicyIssuer` includes structured body content, that content follows
the `ContentType` rules in [Section 5.4.11](#5411-contenttype-mapping).

### 5.6.8 PatternMatchIdReferenceType

ACAL `PatternMatchIdReferenceType` is the base type of
`PolicyReferenceType` and is not used on its own in YACAL core: policy
references, with or without `Argument` expressions, use the
`PolicyReferenceType` representation in
[Section 5.6.6](#566-policyreferencetype).

Its YAML mapping defines the following properties, which
`PolicyReferenceType` inherits:

| Property | Required | Type | Notes |
|---|---|---|---|
| `Id` | Yes | URI | Identifier of the referenced policy |
| `Version` | No | `VersionMatchType` | Matching expression for acceptable versions |

### 5.6.9 PolicyDefaultsType

`PolicyDefaultsType` is an optional abstract extension point.  ACAL core
defines no concrete `PolicyDefaultsType` subtype, so YACAL core defines
no fixed child properties for it.

In YACAL, the `PolicyDefaults` property of a `PolicyType` value is a
sequence of concrete profile-defined default objects.  Each item uses
the direct mapping of the relevant concrete subtype, following the
generic extension rules in
[Section 5.4.8](#548-extensible-abstract-types).

A profile that defines a concrete `PolicyDefaultsType` subtype MUST
define:

1. the subtype's YACAL property set
2. whether any profile-specific wrapper key is used
3. any profile-specific constraints and defaults

YACAL core itself does not assign a core wrapper key or core property
set for `PolicyDefaultsType`.

### 5.6.10 ArgumentType and NamedArgumentType

The `ArgumentType` is a generic type for `Argument` properties which represent arguments passed to function calls (`ApplyType`), to parameterized policies through policy references (`PolicyReferenceType`) or to parameterized shared variables through shared variable references (`SharedVariableReferenceType`).

Based on the corresponding definition from [[ACAL-Core-1.0](#acal-core-10)], an `Argument` in YACAL is either one of these:
1. A positional argument, represented as any one of the `ExpressionType` YAML representations defined in the [ExpressionType section](#551-expressiontype);
2. A named argument, represented as a YAML mapping with key `NamedArgument` and the following mapping as value:

| Property | Required | Default | Type | Notes |
    |---|---|---|---|---|
    | `Name` | Yes | — | `LocalIdentifierType` | Name of the referenced function / policy / shared variable's `Parameter` that this argument is associated with. |
    | `Expression` | Yes | - | `ExpressionType` | The argument's value expression; same as for a positional argument. |

------------------------------------------------------------------------

## 5.7 Bundle Representation

### 5.7.1 BundleType

```yaml
Bundle:
  ShortIdSet:
    - Id: "urn:example:yacal:ids:common"
      ShortIdSetReference:
        - "urn:oasis:names:tc:acal:1.0:core:identifiers"
      ShortId:
        - Name: subject-role
          Value: "urn:example:yacal:subject:role"
        - Name: resource-type
          Value: "urn:example:yacal:resource:type"

  SharedVariableDefinition:
    - Id: "urn:example:yacal:shared:is-business-hours"
      Version: "1.0"
      Description: Returns true during business hours.
      ShortIdSetReference:
        - "urn:example:yacal:ids:common"
      Expression:
        Apply:
          FunctionId: and
          Argument:
            - Apply:
                FunctionId: time-greater-than-or-equal
                Argument:
                  - Apply:
                      FunctionId: time-one-and-only
                      Argument:
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:environment"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:environment:current-time"
                            MustBePresent: true
                  - Value:
                      DataType: time
                      Value: "09:00:00"
            - Apply:
                FunctionId: time-less-than
                Argument:
                  - Apply:
                      FunctionId: time-one-and-only
                      Argument:
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:environment"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:environment:current-time"
                            MustBePresent: true
                  - Value:
                      DataType: time
                      Value: "17:00:00"

  Policy:
    - PolicyId: "urn:example:yacal:policy:office-access"
      Version: "1.0"
      CombiningAlgId: deny-unless-permit
      ShortIdSetReference:
        - "urn:example:yacal:ids:common"
      CombinerInput:
        - Rule:
            Id: PermitDuringBusinessHours
            Effect: Permit
            Condition:
              SharedVariableReference:
                Id: "urn:example:yacal:shared:is-business-hours"

  PolicyReference:
    Id: "urn:example:yacal:policy:office-access"
    Version: "1.0"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `ShortIdSet` | No | `ShortIdSetType` | * |
| `SharedVariableDefinition` | No | `SharedVariableDefinitionType` | * |
| `Policy` | No | `PolicyType` | * |
| `PolicyReference` | No | `PolicyReferenceType` | 0..1 |

If `PolicyReference` is present, the `Policy` sequence MUST NOT be
empty.

### 5.7.2 SharedVariableDefinitionType

```yaml
SharedVariableDefinition:
  - Id: "urn:example:yacal:shared:is-local-timezone"
    Version: "1.0"
    Description: >
      Returns true when the environment timezone matches the
      specified timezone parameter.
    ShortIdSetReference:
      - "urn:oasis:names:tc:acal:1.0:core:identifiers"
    Parameter:
      - Name: timezone
        DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
        Expression:
          Value: "America/New_York"
    Expression:
      Apply:
        FunctionId: string-is-in
        Argument:
          - VariableReference:
              VariableId: timezone
          - AttributeDesignator:
              Category: "urn:oasis:names:tc:acal:1.0:attribute-category:environment"
              AttributeId: "urn:example:yacal:environment:timezone"
              MustBePresent: true
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Id` | Yes | URI | 1 |
| `Version` | Yes | `VersionType` | 1 |
| `Description` | No | String | 0..1 |
| `ShortIdSetReference` | No | URI | * |
| `Parameter` | No | `ParameterType` | * |
| `Expression` | Yes | `ExpressionType` | 1 |

`SharedVariableDefinitionType` objects exist at bundle scope rather than
policy scope.  Their `Expression` MAY contain
`SharedVariableReferenceType` objects referring to other shared
variables, but it MUST NOT create direct or indirect recursive shared
variable dependencies.

Because the `SharedVariableDefinitionType` object is not within the
scope of any `VariableDefinitionType`, its expression SHALL NOT contain
`VariableReferenceType` objects.

------------------------------------------------------------------------

## 5.8 Request and Response Representation

### 5.8.1 RequestType

```yaml
Request:
  ReturnPolicyIdList: false
  RequestEntity:
    - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      RequestAttribute:
        - AttributeId: "urn:example:yacal:subject:role"
          Value:
            - clinician
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          Value:
            - read
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:example:yacal:resource:type"
          Value:
            - medical-record
        - AttributeId: "urn:example:yacal:resource:patient-id"
          Value:
            - "P-12345"
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `ReturnPolicyIdList` | No | `false` | Boolean | 0..1 |
| `CombinedDecision` | No | `false` | Boolean | 0..1 |
| `ShortIdSetReference` | No | — | URI | * |
| `RequestDefaults` | No | — | `RequestDefaultsType` | * |
| `RequestEntity` | Yes | — | `RequestEntityType` | 1..* |
| `MultiRequests` | No | — | `MultiRequestsType` | 0..1 |

`RequestDefaultsType` is an abstract extensible type.  Each item in the
`RequestDefaults` sequence therefore uses the concrete subtype defined
by the relevant ACAL profile, following the generic rules in
[Section 5.4.8](#548-extensible-abstract-types).

If `RequestEntity.Id` values are present, they MUST be unique within the
enclosing request.  These identifiers are the targets of
`RequestEntityReference` values when the optional multi-request feature is
used.

### 5.8.2 RequestEntityType

```yaml
Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
Id: subject-entity-1
Content:
  Body:
    name: Alice
    department: Engineering
RequestAttribute:
  - AttributeId: "urn:example:yacal:subject:role"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
    Value:
      - clinician
    IncludeInResult: false
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Category` | Yes | `IdentifierType` | 1 |
| `Id` | No | `LocalIdentifierType` | 0..1 |
| `Content` | No | `ContentType` | 0..1 |
| `RequestAttribute` | No | `RequestAttributeType` | * |

`Content`, if present, follows the generic mapping rules in
[Section 5.4.11](#5411-contenttype-mapping).

Each `RequestAttribute` item uses the mapping in
[Section 5.8.3](#583-requestattributetype).

Unless the optional multi-request feature is in use, processors SHOULD
reject multiple `RequestEntity` objects in the same request with the
same `Category` value.

### 5.8.3 RequestAttributeType

```yaml
RequestAttribute:
  - AttributeId: "urn:example:yacal:subject:role"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
    Value:
      - clinician
      - attending
    IncludeInResult: true
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `AttributeId` | Yes | — | `IdentifierType` | 1 |
| `Issuer` | No | — | Name | 0..1 |
| `DataType` | No | string | `IdentifierType` | 0..1 |
| `Value` | Yes | — | `ValueType` | 1..* |
| `IncludeInResult` | No | `false` | Boolean | 0..1 |

`RequestAttributeType` extends `AttributeType` with
`IncludeInResult`.  The inherited `Value` sequence follows
[Section 5.4.12](#5412-attributetype-mapping); if the enclosing
attribute defines `DataType`, nested values SHOULD omit their own
`DataType`.

### 5.8.4 MultiRequestsType

```yaml
MultiRequests:
  RequestReference:
    - RequestEntityReference:
        - subject-entity-1
        - action-entity-1
        - resource-entity-1
    - RequestEntityReference:
        - subject-entity-2
        - action-entity-1
        - resource-entity-1
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `RequestReference` | Yes | `RequestReferenceType` | 1..* |

Each `RequestReference` value identifies one request instance by naming
the `RequestEntity` values from the enclosing `Request`.

The set of referenced entity identifiers in each `RequestReference`
MUST be unique within the enclosing `MultiRequests` value.

If a processor does not implement this optional feature but encounters a
`MultiRequests` value, it MUST treat the request as using an unsupported
optional feature and fail in a manner consistent with ACAL response
rules.

### 5.8.5 RequestReferenceType

```yaml
RequestReference:
  - RequestEntityReference:
      - subject-entity-1
      - action-entity-1
      - resource-entity-1
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `RequestEntityReference` | Yes | `LocalIdentifierType` | 1..* |

Each `RequestEntityReference` value MUST identify a `RequestEntityType`
object in the enclosing `Request` by the value of its `Id` property, and
the values in a single `RequestReferenceType` object MUST be unique.

### 5.8.6 ResponseType

```yaml
Response:
  Result:
    - Decision: Permit
      Status:
        StatusCode:
          Value: "urn:oasis:names:tc:acal:1.0:status:ok"
      Notice:
        - Id: "urn:example:yacal:notice:log-access"
          IsObligation: true
          AttributeAssignment:
            - AttributeId: "urn:example:yacal:notice:timestamp"
              Value:
                - "2026-03-23T14:30:00Z"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `ShortIdSetReference` | No | URI | * |
| `Result` | Yes | `ResultType` | 1..* |

YACAL permits multiple `Result` values in a `Response`, which is
especially relevant when the optional multi-request feature is used.

### 5.8.7 ResultType

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Decision` | Yes | `DecisionType` | 1 |
| `Status` | No | `StatusType` | 0..1 |
| `Notice` | No | `NoticeType` | * |
| `ResultEntity` | No | `ResultEntityType` | * |
| `ApplicablePolicyReference` | No | `ExactMatchIdReferenceType` | * |

If the originating `Request.ReturnPolicyIdList` value is `true`, a
processor that supports this feature SHOULD populate
`ApplicablePolicyReference` with the identifiers of policies found to be
applicable to the request.

### 5.8.8 ResultEntityType

```yaml
ResultEntity:
  - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
    Id: subject-entity-1
    Attribute:
      - AttributeId: "urn:example:yacal:subject:role"
        Value:
          - clinician
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Category` | Yes | `IdentifierType` | 1 |
| `Id` | No | `LocalIdentifierType` | 0..1 |
| `Attribute` | Yes | `AttributeType` | 1..* |

`ResultEntityType` reflects request attributes whose
`RequestAttribute.IncludeInResult` property was `true`.

Unlike `RequestEntityType`, `ResultEntityType` has no `Content`
property, and its contained `Attribute` objects have no
`IncludeInResult` property.

### 5.8.9 ApplicablePolicyReference

`ApplicablePolicyReference` values use the direct mapping of
`ExactMatchIdReferenceType`:

```yaml
ApplicablePolicyReference:
  - Id: "urn:example:yacal:policy:content-access"
    Version: "1.0"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Id` | Yes | URI | 1 |
| `Version` | Yes | `VersionType` | 1 |

Each item identifies a specific policy version that was applicable to
the request.  The `Id` value is a policy identifier URI and `Version`
is a required `VersionType` value for that exact match.

### 5.8.10 RequestDefaultsType

`RequestDefaultsType` is an optional abstract extension point.  ACAL
core defines no concrete `RequestDefaultsType` subtype, so YACAL core
defines no fixed child properties for it.

In YACAL, the `RequestDefaults` property of a `RequestType` value is a
sequence of concrete profile-defined default objects.  Each item uses
the direct mapping of the relevant concrete subtype, following the
generic extension rules in
[Section 5.4.8](#548-extensible-abstract-types).

A profile that defines a concrete `RequestDefaultsType` subtype MUST
define:

1. the subtype's YACAL property set
2. whether any profile-specific wrapper key is used
3. any profile-specific constraints and defaults

------------------------------------------------------------------------

## 5.9 Notice Representation

### 5.9.1 NoticeExpressionType

```yaml
NoticeExpression:
  - Id: "urn:example:yacal:notice:audit-log"
    IsObligation: true
    AppliesTo: Permit
    AttributeAssignmentExpression:
      - AttributeId: "urn:example:yacal:notice:action"
        Expression:
          AttributeDesignator:
            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
            AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
            MustBePresent: true
      - AttributeId: "urn:example:yacal:notice:subject"
        Expression:
          AttributeDesignator:
            Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
            AttributeId: "urn:example:yacal:subject:user-id"
            MustBePresent: true
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `Id` | Yes | — | `IdentifierType` | 1 |
| `IsObligation` | No | `false` | Boolean | 0..1 |
| `AppliesTo` | No | Permit or Deny | `EffectType` | 0..1 |
| `Condition` | No | satisfied | `BooleanExpressionType` | 0..1 |
| `AttributeAssignmentExpression` | No | — | `AttributeAssignmentExpressionType` | * |

If `AppliesTo` is omitted, the notice expression is eligible for either
`Permit` or `Deny`.

`AttributeAssignmentExpression` items are not required to be unique by the pair
`(AttributeId, Category)`. Whether a given notice accepts repeated attribute
assignments, and how a consumer combines them, is left to the definition of the
individual obligation or advice, as defined for `NoticeExpressionType` in
[[ACAL-Core-1.0](#acal-core-10)].

### 5.9.2 AttributeAssignmentExpressionType

```yaml
AttributeAssignmentExpression:
  - AttributeId: "urn:example:yacal:notice:action"
    Category: "urn:example:yacal:notice-category:audit"
    Expression:
      AttributeDesignator:
        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
        MustBePresent: true
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `AttributeId` | Yes | `IdentifierType` | 1 |
| `Category` | No | `IdentifierType` | 0..1 |
| `Issuer` | No | Name | 0..1 |
| `Expression` | Yes | `ExpressionType` | 1 |

The `Expression` is evaluated to a constant value or bag of values to
produce the corresponding `AttributeAssignmentType` value or values in
the returned notice.

If the expression is a literal `ValueType` without a separately fixed
type, string is the default `DataType`.

### 5.9.3 NoticeType

```yaml
Notice:
  - Id: "urn:example:yacal:notice:audit-log"
    IsObligation: true
    AttributeAssignment:
      - AttributeId: "urn:example:yacal:notice:action"
        Value:
          - read
      - AttributeId: "urn:example:yacal:notice:subject"
        Value:
          - "user-42"
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `Id` | Yes | — | `IdentifierType` | 1 |
| `IsObligation` | No | `false` | Boolean | 0..1 |
| `AttributeAssignment` | No | — | `AttributeAssignmentType` | * |

`AttributeAssignment` items are not required to be unique by the pair
`(AttributeId, Category)`. A single `AttributeAssignmentExpression` evaluating to a
bag already yields one `AttributeAssignment` per bag value, all sharing the same
pair.

### 5.9.4 AttributeAssignmentType

```yaml
AttributeAssignment:
  - AttributeId: "urn:example:yacal:notice:timestamp"
    Category: "urn:example:yacal:notice-category:audit"
    DataType: "urn:oasis:names:tc:acal:1.0:data-type:dateTime"
    Value:
      - "2026-03-23T14:30:00Z"
```

Properties:

| Property | Required | Default | Type | Cardinality |
|---|---|---|---|---|
| `AttributeId` | Yes | — | `IdentifierType` | 1 |
| `Category` | No | — | `IdentifierType` | 0..1 |
| `Issuer` | No | — | Name | 0..1 |
| `DataType` | No | string | `IdentifierType` | 0..1 |
| `Value` | Yes | — | `ValueType` | 1..* |

`AttributeAssignmentType` extends `AttributeType` with the optional
`Category` property.  If the enclosing assignment defines `DataType`,
nested `Value` items SHOULD omit their own `DataType`; if present, they
MUST agree with the enclosing `DataType`.

------------------------------------------------------------------------

## 5.10 Status Representation

### 5.10.1 StatusType

```yaml
Status:
  StatusCode:
    Value: "urn:oasis:names:tc:acal:1.0:status:ok"
  StatusMessage: Request processed successfully.
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `StatusCode` | Yes | `StatusCodeType` | 1 |
| `StatusMessage` | No | String | 0..1 |
| `StatusDetail` | No | `StatusDetailType` | 0..1 |

`StatusMessage` is a free-form human-readable string.

`StatusDetail`, if present, follows the rules in
[Section 5.10.3](#5103-statusdetailtype).

### 5.10.2 StatusCodeType

```yaml
Status:
  StatusCode:
    Value: "urn:oasis:names:tc:acal:1.0:status:processing-error"
    StatusCode:
      Value: "urn:example:yacal:status:timeout"
  StatusMessage: PIP request timed out after 30 seconds.
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Value` | Yes | `IdentifierType` | 1 |
| `StatusCode` | No | `StatusCodeType` | 0..1 |

The optional nested `StatusCode` refines the parent status code and is
represented recursively using the same mapping rules.

### 5.10.3 StatusDetailType

`StatusDetailType` is optional and carries additional status
information.  In YACAL, it is represented as a YAML mapping whose keys
identify the supported detail objects.

The core YACAL detail key defined by this specification is
`MissingAttributeDetail`.

Example:

```yaml
StatusDetail:
  MissingAttributeDetail:
    - AttributeId: "urn:example:yacal:subject:clearance-level"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
      Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      Value:
        - confidential
```

If `StatusCode.Value` is:

- `urn:oasis:names:tc:acal:1.0:status:ok`, `StatusDetail` MUST NOT be
  present
- `urn:oasis:names:tc:acal:1.0:status:syntax-error`, `StatusDetail`
  MUST NOT be present
- `urn:oasis:names:tc:acal:1.0:status:processing-error`,
  `StatusDetail` MUST NOT be present
- `urn:oasis:names:tc:acal:1.0:status:missing-attribute`,
  `StatusDetail` MAY contain one or more `MissingAttributeDetail`
  values

Profiles or implementation agreements MAY define additional
representation-specific `StatusDetail` entries, but processors MUST
reject unsupported entries they do not claim to implement.

### 5.10.4 MissingAttributeDetailType

```yaml
Status:
  StatusCode:
    Value: "urn:oasis:names:tc:acal:1.0:status:missing-attribute"
  StatusDetail:
    MissingAttributeDetail:
      - AttributeId: "urn:example:yacal:subject:clearance-level"
        DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
        Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
        Value:
          - confidential
          - secret
          - top-secret
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Category` | No | `IdentifierType` | 0..1 |
| `AttributeId` | Yes | `IdentifierType` | 1 |
| `Issuer` | No | Name | 0..1 |
| `DataType` | Yes | `IdentifierType` | 1 |
| `Value` | No | `ValueType` | * |

If `Value` items are present, each nested value SHOULD omit its own
`DataType` because the enclosing `MissingAttributeDetailType` already
defines it.

------------------------------------------------------------------------

## 5.11 Short Identifier Representation

YACAL uses the ACAL core identifier sets defined by
[[ACAL-Core-1.0](#acal-core-10)] directly.  It defines no separate
YACAL-specific core identifier inventory.  Any
`ShortIdSetReference` in a YACAL document therefore refers to the same
identifier sets and short identifier semantics defined by ACAL core or
by the relevant ACAL profile.

### 5.11.1 ShortIdSetType

A `ShortIdSetType` object is represented as a YAML mapping of its
properties.  A short identifier set provided as a standalone artifact,
such as `acal-core-yaml-v1.0-identifiers.yaml`, is a YACAL document
whose root key is `ShortIdSet`
([Section 5.2.1](#521-root-element)), with this mapping as its value.
Within a `BundleType`, short identifier sets are the items of the
`ShortIdSet` sequence.

```yaml
ShortIdSet:
  Id: "urn:example:yacal:ids:healthcare"
  ShortIdSetReference:
    - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  ShortId:
    - Name: subject-role
      Value: "urn:example:yacal:healthcare:subject:role"
    - Name: resource-type
      Value: "urn:example:yacal:healthcare:resource:type"
    - Name: record-type
      Value: "urn:example:yacal:healthcare:resource:record-type"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Id` | Yes | URI | 1 |
| `ShortIdSetReference` | No | URI | * |
| `ShortId` | No | `ShortIdType` | * |

The referenced short-id sets are applied recursively.  A conformant
processor MUST reject direct or indirect cycles in
`ShortIdSetReference`.

### 5.11.2 ShortIdType

```yaml
ShortId:
  - Name: subject-role
    Value: "urn:example:yacal:healthcare:subject:role"
```

Properties:

| Property | Required | Type | Cardinality |
|---|---|---|---|
| `Name` | Yes | `LocalIdentifierType` | 1 |
| `Value` | Yes | URI | 1 |

Within a single `ShortIdSetType`, `Name` values MUST be unique.

### 5.11.3 ShortIdSetReference

`ShortIdSetReference` is represented as a YAML sequence of URI values:

```yaml
ShortIdSetReference:
  - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  - "urn:example:yacal:ids:healthcare"
```

Each URI references a `ShortIdSetType` object.  The referenced sets and
their transitive references define the short identifiers available in
the containing object.

### 5.11.4 Usage in Policies

Short identifiers, once declared, may be used anywhere an
`IdentifierType` is expected:

```yaml
Policy:
  PolicyId: "urn:example:yacal:policy:healthcare"
  Version: "1.0"
  CombiningAlgId: deny-unless-permit
  ShortIdSetReference:
    - "urn:example:yacal:ids:healthcare"
  CombinerInput:
    - Rule:
        Id: PermitClinicianRead
        Effect: Permit
        Condition:
          Apply:
            FunctionId: string-is-in
            Argument:
              - Value: clinician
              - AttributeDesignator:
                  Category: access-subject
                  AttributeId: subject-role
                  MustBePresent: true
```

------------------------------------------------------------------------

## 5.12 Constraint Handling

### 5.12.1 Constraint Categories

YACAL conformance depends on more than well-formed YAML syntax.  A
conformant YACAL document MUST satisfy:

1. **YAML-level constraints**, such as valid YAML 1.2 syntax and use of
   the Core Schema
2. **YACAL structural constraints**, such as root-key rules,
   wrapper-key rules, multiplicity rules, omission rules, and typing
   rules defined in this specification
3. **ACAL semantic constraints**, including the property-level and
   object-level constraints defined by the ACAL model

Some constraints can be checked directly from the YAML structure.
Others require interpretation of ACAL types, inheritance, identifier
scope, or profile-specific semantics.  A document MAY therefore be valid
YAML yet still be non-conformant YACAL.

### 5.12.2 Property-Level Constraints

Unless a more specific rule applies, the following property-level
constraints apply:

1. Lower and upper multiplicity constraints from ACAL MUST be enforced.
2. If an ACAL property is declared ordered, the order of items in the
   YAML sequence is semantically significant and MUST be preserved.
3. If an ACAL property is declared unordered, the YAML sequence MAY still
   preserve presentation order, but processors MUST NOT assign semantic
   meaning to that order unless ACAL does so separately.
4. If an ACAL property is constrained to have unique primitive values,
   duplicate values in the corresponding YAML sequence are invalid.
5. If an ACAL property is constrained to have uniqueness based on one or
   more nested properties, processors MUST enforce that uniqueness using
   the ACAL-defined key semantics, even though YAML itself does not
   provide such a constraint mechanism.
6. If an ACAL property requires uniqueness by concrete subtype, then no
   two values of that property may denote the same effective subtype.

Examples of ACAL-defined uniqueness constraints that YACAL processors
MUST enforce where those properties are supported include:

- `VariableDefinition` uniqueness by `VariableId`
- `Parameter` uniqueness by `Name`
- `ShortId` uniqueness by `Name`
- `RequestAttribute` uniqueness by the combination of `AttributeId`,
  `DataType` and `Issuer` within a `RequestEntityType`, compared per ACAL
  Core Section 7.33's identifier-equality/effective-`DataType`/absent-`Issuer`
  rules
- `PolicyDefaults` and `RequestDefaults` uniqueness by concrete subtype

Where a uniqueness constraint's key properties include a value of the
`IdentifierType` simple type — as `AttributeId` and `DataType` are, in the
`RequestAttribute`/`Attribute` constraint above — full enforcement additionally
requires resolving any short identifier name to its full URI per ACAL Core
Section 8.3 before comparison. This is a processing-time step that no
structural check over the YAML document alone can perform, so a YACAL
processor implementing "MUST enforce" above needs to apply that resolution
itself; two values differing only in short-identifier-name-vs-URI spelling
are not distinguishable as non-duplicates by structural inspection. Likewise,
where a key property has an ACAL-defined default (as `DataType` does, per
ACAL Core Section 7.27), the comparison is over the property's *effective*
value after applying that default, not its literal YAML presence or absence;
YAML itself has no defaulting mechanism, so a processor MUST apply the
default explicitly before comparing. The
`acal-core-yaml-v1.0-constraints.yaml` catalog's `uniqueByProperty` rules for
this constraint state both requirements in their `Requirement` field, next
to the concrete `KeyProperties` list they apply to.

### 5.12.3 Object-Level Constraints and Cross-Property Invariants

Some ACAL constraints involve the relationship between multiple
properties or the interpreted meaning of the object as a whole.  Such
constraints remain normative for YACAL even when they are not directly
expressible in YAML syntax.

Examples include:

- an object requiring one of multiple properties or property groups to
  be present
- cross-property agreement requirements, such as parent and child
  `DataType` consistency
- identifier-scope constraints, such as uniqueness of variable
  references within their effective scope
- type-correctness constraints for expressions and function arguments

YACAL processors MUST evaluate these constraints according to ACAL and
this specification for all supported object types.

### 5.12.4 Enforcement Expectations

Conformant YACAL processors:

1. MUST reject violations of YACAL structural constraints.
2. MUST reject violations of ACAL constraints for supported object
   types and features.
3. MAY use additional validation artifacts or intermediate
   representations as implementation techniques.
4. MUST NOT treat the absence of such artifacts as making a document
   valid if the document violates YACAL or ACAL constraints.
5. SHOULD report whether a failure is primarily:
   1. a YAML parsing error
   2. a YACAL structural error
   3. an ACAL semantic or constraint error

------------------------------------------------------------------------

# 6 Safety, Security and Privacy Considerations (non-normative)

## 6.1 YAML Parser and Processor Safety

YACAL processors should use YAML parsers configured for YAML 1.2 Core
Schema behavior and should reject features prohibited by this
specification, including tags, anchors, aliases, merge keys, and
multi-document streams.  These restrictions reduce ambiguity and avoid
processor behaviors that have no corresponding ACAL semantics.

Implementations should apply ordinary defensive parsing measures,
including limits on document size, nesting depth, alias expansion
behavior, and resource consumption.  Error diagnostics should be
reported against the original YACAL source where possible.

## 6.2 Interoperability and Content Handling

YAML scalar resolution can create interoperability hazards when values
resemble booleans, numbers, or nulls.  The quoting rules in
[Section 5.1.3](#513-string-quoting) help prevent such ambiguity and
should be followed carefully by producers and processors.

Where ACAL profiles permit embedded or referenced content, processors
should treat such content according to its media type and associated
security expectations.  Conversion between YACAL and other concrete
representations, if performed by an implementation, does not preserve
all YAML presentation details and should not be treated as a security
boundary.

------------------------------------------------------------------------

# 7 Conformance

## 7.1 Introduction

The YACAL specification addresses conformance in the following areas:

1. conformance of YACAL documents
2. conformance of YACAL processors
3. support for mandatory and optional ACAL object types and features
   when represented in YACAL

Some ACAL objects and features are optional to implement, either because
they are optional in the ACAL core or because they are only required when
supporting specific ACAL profiles or deployment scenarios.  If an
implementation claims support for such an optional feature, it MUST
implement the corresponding YACAL syntax, typing, and constraint rules
consistently.

This specification is accompanied by normative machine-readable
artifacts for core YACAL structure, core constraints and core short
identifiers.  These artifacts support
consistent implementation and validation of YACAL, but they do not
change the peer relationship between YACAL and the XML and JSON ACAL
representations.

## 7.2 Conformance Categories

For the purposes of this specification:

- **M** means mandatory-to-implement for a processor claiming core YACAL
  conformance
- **O** means optional-to-implement

For ACAL object types, these categories are inherited unchanged from
[[ACAL-Core-1.0](#acal-core-10)] Section 11.2.1.  YACAL uses the same notation
again in [Section 7.3.2](#732-machine-readable-artifact-support) for
YACAL-specific artifacts.

An implementation MUST follow [Section 5](#5-syntax-normative) where it
applies to the ACAL object types and machine-readable artifacts that the
implementation supports.

## 7.3 Conformance Tables

### 7.3.1 ACAL Object-Type Conformance

YACAL inherits ACAL object-type conformance from
[[ACAL-Core-1.0](#acal-core-10)] Section 11.2.1.

A processor claiming core YACAL conformance MUST support the YACAL
representation of every ACAL object type marked `M` in that table.  It
MAY omit support for ACAL object types marked `O` unless it claims the
corresponding optional ACAL feature.

This specification therefore does not repeat the ACAL core object-type
conformance table.  [Section 5](#5-syntax-normative) defines the YAML
representation of those same ACAL object types, while
[[ACAL-Core-1.0](#acal-core-10)] remains authoritative for their
mandatory/optional classification.

Some ACAL object types, such as `DecisionType`, `DescriptionType`,
`ParameterType`, `NamedAttributeDesignatorType`,
`BaseAttributeSelectorType`, and `QuantifiedExpressionType`, do not
correspond to standalone YACAL root keys.  Their conformance status
still comes from ACAL core and applies wherever this specification maps
them into YAML.

For readability, this specification often refers to a YACAL surface form
without the `Type` suffix when such a surface form exists, for example
`PolicyType` as `Policy` and `ValueType` as `Value`.

### 7.3.2 Machine-Readable Artifact Support

The following machine-readable artifacts accompany this specification:

| Artifact | Status | Notes |
|:---|:---:|:---|
| `acal-core-yaml-v1.0-structure.schema.yaml` | M | Core structural validation artifact |
| `acal-core-yaml-v1.0-constraints.yaml` | M | Core constraint catalog |
| `acal-core-yaml-v1.0-identifiers.yaml` | M | Core short identifier set represented in YAML |

The structural validation artifacts and short identifier sets for XPath Profile and JSONPath Profile support are artifacts of those Profiles' own Work Products, not of this Core specification.

The composition schemas listed in [Annex C](#annex-c-yacal-identifiers-and-machine-readable-artifacts)
are informative examples showing how core and profile artifacts may be
combined in a particular deployment.

## 7.4 Conformant YACAL Document

A conformant YACAL document:

1.  MUST be a valid YAML 1.2 document [[YAML1.2](#yaml12)].
2.  MUST use the YAML 1.2 Core Schema for scalar type resolution.
3.  MUST conform to all structural requirements defined in this
    specification for representing the applicable ACAL Section 7
    structures in YAML.
4.  MUST correspond to a semantically valid ACAL instance when
    interpreted according to this specification and [[ACAL-Core-1.0](#acal-core-10)].
5.  MUST satisfy the applicable constraint rules in
    [Section 5.12](#512-constraint-handling).
6.  MUST NOT use YAML tags (e.g., `!!str`, `!custom`).
7.  MUST NOT use YAML anchors (`&name`) or aliases (`*name`).
8.  MUST NOT use YAML merge keys or multi-document streams.
9.  MUST NOT use YAML null values (`null`, `Null`, `NULL`, `~`, or a key present with an empty value); omitting an optional property is not a null value ([Section 5.1.4](#514-prohibited-yaml-features)).
10. MUST NOT use the YAML octal notation for integers (any value matching the regular expression `0o[0-7]+`).
11. SHOULD use YAML block style for mappings and sequences.  Flow style
    MAY be used where it improves readability (e.g., for short inline
    values).
12. If it uses only core YACAL features, it MUST be structurally
    compatible with `acal-core-yaml-v1.0-structure.schema.yaml`.
13. If it uses XPath or JSONPath profile features, it MUST be
    structurally compatible with a composition schema that enables the
    corresponding profile artifacts.

## 7.5 Conformant YACAL Processor

A conformant YACAL processor:

1.  MUST parse YAML 1.2 documents using the Core Schema.
2.  MUST reject documents that use prohibited YAML features.
3.  MUST interpret conformant YACAL documents according to this
    specification and ACAL evaluation semantics as defined in
    [[ACAL-Core-1.0](#acal-core-10)].
4.  MUST enforce the applicable structural and semantic constraints
    defined in this specification and in ACAL for all supported
    objects and features.
5.  If it claims support for an optional ACAL object type or feature
    covered by [Section 7.3.1](#731-acal-object-type-conformance), it
    MUST implement the corresponding YACAL syntax, typing, inheritance,
    and constraint rules consistently.
6.  A processor claiming core YACAL conformance MUST support the core
    machine-readable artifacts listed as mandatory in
    [Section 7.3.2](#732-machine-readable-artifact-support), or provide
    equivalent enforcement of the same structural, identifier, and
    constraint rules.
7.  A processor claiming support for the XPath Profile or JSONPath
    Profile MUST support the corresponding profile artifacts, or provide
    equivalent enforcement of the same profile-specific rules.

## 7.6 Validation Support and Error Reporting

Validation of a YACAL document may be performed in multiple layers:

1.  **YAML parsing**: the document is parsed as YAML 1.2 with Core
    Schema.
2.  **YACAL structural validation**: the parsed content is checked
    against the structural and typing rules defined in this
    specification, typically with `acal-core-yaml-v1.0-structure.schema.yaml`
    or an applicable composition schema.
3.  **Constraint validation**: property-level and object-level
    constraints are checked according to [Section 5.12](#512-constraint-handling),
    ACAL, and, where used, `acal-core-yaml-v1.0-constraints.yaml`.
4.  **ACAL semantic validation**: the resulting representation is
    checked against applicable ACAL model constraints and semantics.

Conformant processors SHOULD report validation errors with reference to
the original YACAL source location (line and column), not solely to any
derived intermediate representation.

------------------------------------------------------------------------

# Annex A License, Document Status and Notices


(This annex forms an integral part of this Specification.)


## A.1 Document Status


This document was last revised or approved by the OASIS ACAL \[XACML\] TC on the above date. The level of approval is also listed above. Check the "Latest version" location noted above for possible later revisions of this document. Any other numbered Versions and other technical work produced by the Technical Committee (TC) are listed at https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=67afe552-0921-49b7-9a85-018dc7d3ef1d#technical.


TC members should send comments on this document to the TC's email list. Others should send comments to the TC's public comment list, after subscribing to it by following the instructions at the "Send A Comment" button on the TC's web page at https://www.oasis-open.org/committees/acal/.


NOTE: any machine-readable content (Computer Language Definitions) declared Normative for this Work Product is provided in separate plain text files. In the event of a discrepancy between any such plain text file and display content in the Work Product's prose narrative document(s), the content in the separate plain text file prevails.


## A.2 License and Notices


Copyright © OASIS Open 2026. All Rights Reserved.


All capitalized terms in the following text have the meanings assigned to them in the OASIS Intellectual Property Rights Policy (the "OASIS IPR Policy"). The full Policy, which governs the licensure of this document, may be found at the OASIS website: [[https://www.oasis-open.org/policies-guidelines/ipr/](https://www.oasis-open.org/policies-guidelines/ipr/)]


This document and translations of it may be copied and furnished to others, and derivative works that comment on or otherwise explain it or assist in its implementation may be prepared, copied, published, and distributed, in whole or in part, without restriction of any kind, provided that the above copyright notice and this section are included on all such copies and derivative works. However, this document itself may not be modified in any way, including by removing the copyright notice or references to OASIS, except as needed for the purpose of developing any document or deliverable produced by an OASIS Technical Committee (in which case the rules applicable to copyrights, as set forth in the OASIS IPR Policy, must be followed) or as required to translate it into languages other than English.


The limited permissions granted above are perpetual and will not be revoked by OASIS or its successors or assigns, as provided in the OASIS IPR Policy.


This document is provided under the [RF on Limited Terms](https://www.oasis-open.org/policies-guidelines/ipr/#RF-on-Limited-Mode) IPR mode that was chosen when the project was established, as defined in the IPR Policy. For information on whether any patents have been disclosed that may be essential to implementing this document, and any offers of patent licensing terms, please refer to the Intellectual Property Rights section of the project’s web page ([OASIS ACAL \[XACML\] TC IPR page](https://www.oasis-open.org/committees/acal/ipr.php)).


This document and the information contained herein is provided on an "AS IS" basis and OASIS DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION HEREIN WILL NOT INFRINGE ANY OWNERSHIP RIGHTS OR ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. OASIS AND ITS MEMBERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THIS DOCUMENT OR ANY PART THEREOF.


As stated in the OASIS IPR Policy, the following three paragraphs in brackets apply to OASIS Standards Final Deliverable documents (Committee Specifications, OASIS Standards, or Approved Errata).


OASIS requests that any OASIS Party or any other party that believes it has patent claims that would necessarily be infringed by implementations of this OASIS Standards Final Deliverable, to notify OASIS TC Administrator and provide an indication of its willingness to grant patent licenses to such patent claims in a manner consistent with the IPR Mode of the OASIS Technical Committee that produced this deliverable.


OASIS invites any party to contact the OASIS TC Administrator if it is aware of a claim of ownership of any patent claims that would necessarily be infringed by implementations of this OASIS Standards Final Deliverable by a patent holder that is not willing to provide a license to such patent claims in a manner consistent with the IPR Mode of the OASIS Technical Committee that produced this OASIS Standards Final Deliverable. OASIS may include such claims on its website, but disclaims any obligation to do so.


OASIS takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this OASIS Standards Final Deliverable or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any effort to identify any such rights. Information on OASIS' procedures with respect to rights in any document or deliverable produced by an OASIS Technical Committee can be found on the OASIS website. Copies of claims of rights made available for publication and any assurances of licenses to be made available, or the result of an attempt made to obtain a general license or permission for the use of such proprietary rights by implementers or users of this OASIS Standards Final Deliverable, can be obtained from the OASIS TC Administrator. OASIS makes no representation that any information or list of intellectual property rights will at any time be complete, or that any claims in such list are, in fact, Essential Claims.


The name "OASIS" is a trademark of OASIS, the owner and developer of this document, and should be used only to refer to the organization and its official outputs. OASIS welcomes reference to, and implementation and use of, its documents, while reserving the right to enforce its marks against misleading uses. Please see [OASIS Trademark Policy](https://www.oasis-open.org/policies-guidelines/trademark/) for guidance.


---


# Annex B References

(This annex forms an integral part of this Specification.)

This section contains the normative references used in this document.

Normative references are those whose content constitutes requirements of
this specification.

## B.1 Normative References

###### [ACAL-Core-1.0]

_Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html

###### [YAML1.2]

*YAML Ain't Markup Language (YAML) Version 1.2*, Revision 1.2.2, 1 October 2021. https://yaml.org/spec/1.2.2/

###### [RFC2119]

Bradner, S., "Key words for use in RFCs to Indicate Requirement Levels", BCP 14, RFC 2119, March 1997. https://www.rfc-editor.org/rfc/rfc2119

###### [RFC3986]

Berners-Lee, T., Fielding, R., and L. Masinter, "Uniform Resource Identifier (URI): Generic Syntax", STD 66, RFC 3986, DOI 10.17487/RFC3986, January 2005, <https://www.rfc-editor.org/info/rfc3986>.

###### [RFC4648]

RFC 4648, *The Base16, Base32, and Base64 Data Encodings.* October 2006. IETF RFC 4648. https://www.rfc-editor.org/info/rfc4648

###### [RFC8174]

Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP 14, RFC 8174, May 2017. https://www.rfc-editor.org/rfc/rfc8174

------------------------------------------------------------------------

# Annex C YACAL Identifiers and Machine-Readable Artifacts

(This annex forms an integral part of this Specification.)

## C.1 Core Short-Identifier Set

This work product provides the standard YACAL serialization of the ACAL
core short-identifier set in the file
`acal-core-yaml-v1.0-identifiers.yaml`.

The `ShortIdSet.Id` value of this artifact is:

`urn:oasis:names:tc:acal:1.0:core:identifiers`

**CAUTION:** This short identifier set SHALL NOT be modified except by the OASIS ACAL \[XACML\] TC. Since its `ShortIdSet.Id` is using one of the prefixes reserved for OASIS ACAL \[XACML\] TC use (`urn:oasis:names:tc:acal:`), users outside the TC SHALL NOT create a new short identifier set of their own with the same `Id`. 

YACAL uses the ACAL core identifier inventory directly.  The YACAL
artifact is therefore the YAML serialization of the same underlying ACAL
identifier set used by peer concrete representations.

For readability, `acal-core-yaml-v1.0-identifiers.yaml` preserves the
same function identifier ordering used by the peer XML and JSON
identifier artifacts.  Because YAML permits comments, the YACAL
serialization may annotate runs of function identifiers with comment
labels that reference the ACAL Core Annex `C.3.x` subsection where
those functions are defined.  These comments are non-normative
presentation aids only and do not alter the underlying identifier set
or its semantics.

## C.2 Core YACAL Artifacts

The following normative core YACAL artifacts accompany this
specification:

1. `acal-core-yaml-v1.0-structure.schema.yaml`
2. `acal-core-yaml-v1.0-constraints.yaml`
3. `acal-core-yaml-v1.0-identifiers.yaml`

The structural schema defines the core YACAL root forms, object shapes,
property names, primitive patterns, wrapper-key structures, and
extension hooks.

The constraint catalog defines the higher-order YACAL and ACAL
constraints that are not fully captured by the structural schema alone.

The XPath and JSONPath Profiles' own structural validation artifacts and
short identifier sets are catalogued in those Profiles' own
specifications, not here.

## C.3 Informative Composition Schemas

The following informative composition schemas are provided as examples
for implementations combining the core and profile artifacts:

1. `yacal-root-structure-example-core-only.schema.yaml`
2. `yacal-root-structure-example-using-jsonpath-profile-only.schema.yaml`
3. `yacal-root-structure-example-using-xpath-and-jsonpath-profiles.schema.yaml`
4. `yacal-root-structure-example-custom-plus-profile.schema.yaml`

These example schemas do not form part of the normative YACAL syntax.
They are provided as implementer guidance for composing extension hooks
and profile support in deployment-specific root schemas.

------------------------------------------------------------------------

# Annex D Complete Example: Website Content Access Policy

(This annex does not form an integral part of this Specification and is
informational.)

This example shows a policy controlling access to website content based
on content tier and account type.

```yaml
Policy:
  PolicyId: "urn:example:yacal:policy:website-content-access"
  Version: "1.0"
  Description: >-
    Permit view access to website pages according to the page content
    tier and, where required, the subject account type.
  CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit"
  CombinerInput:
    - Rule:
        Id: PermitPublicContentView
        Description: Permit any request to view public content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
            Argument:
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: view
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: public
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:resource:content-tier"
                        MustBePresent: true
    - Rule:
        Id: PermitRegisteredContentView
        Description: Permit registered and premium users to view registered content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
            Argument:
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: view
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: registered
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:resource:content-tier"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:or"
                  Argument:
                    - Apply:
                        FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                        Argument:
                          - Value: registered
                          - AttributeDesignator:
                              Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                              AttributeId: "urn:example:yacal:subject:account-type"
                              MustBePresent: true
                    - Apply:
                        FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                        Argument:
                          - Value: premium
                          - AttributeDesignator:
                              Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                              AttributeId: "urn:example:yacal:subject:account-type"
                              MustBePresent: true
    - Rule:
        Id: PermitPremiumContentView
        Description: Permit only premium users to view premium content.
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
            Argument:
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: view
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: premium
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:resource:content-tier"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: premium
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                        AttributeId: "urn:example:yacal:subject:account-type"
                        MustBePresent: true
```

------------------------------------------------------------------------

# Annex E Complete Example: Healthcare Chart Access Policy

(This annex does not form an integral part of this Specification and is
informational.)

This example demonstrates a deny-unless-permit policy with role-based
and resource-type conditions.

```yaml
Policy:
  PolicyId: "urn:example:yacal:healthcare:access-patient-record"
  Version: "1.0"
  CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit"
  CombinerInput:
    - Rule:
        Id: PermitClinicianRead
        Effect: Permit
        Condition:
          Apply:
            FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
            Argument:
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: clinician
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                        AttributeId: "urn:example:yacal:healthcare:subject:role"
                        MustBePresent: true
              - Apply:
                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                  Argument:
                    - Value: medical-record
                    - AttributeDesignator:
                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                        AttributeId: "urn:example:yacal:healthcare:resource:record-type"
                        MustBePresent: true
```

------------------------------------------------------------------------

# Annex F How to generate HTML and PDF versions

(This annex does not form an integral part of this Specification and is informational.)

## Online generation

HTML/PDF versions are generated automatically online via Github Actions after each update pushed to the main branch of [OASIS ACAL \[XACML\] TC Github repository](https://github.com/oasis-tcs/acal-spec/). Go to Github Actions on the github repository, then go to the latest workflow run, and, if the run succeeded, the summary should display the links to the generated HTML/PDF documents.

## Offline generation

### Prerequisites

The following tools are required:
- [Pandoc](https://pandoc.org/) **v3.2.1 or later** ( [latest release](https://github.com/jgm/pandoc/releases/latest) );
- [Pandoc-include filter](https://github.com/DCsunset/pandoc-include).

Install them on your system.

Git clone or get a local copy of [OASIS ACAL \[XACML\] TC Github repository](https://github.com/oasis-tcs/acal-spec/), open a terminal and **change your working directory to the root directory of your local copy of the repository**.

### CSS stylesheet

The generation command uses the CSS stylesheet file `pandoc/styles/markdown-styles-v1.7.3b.css` (with `-c` argument) based on the [v1.7.3a](https://docs.oasis-open.org/templates/css/markdown-styles-v1.7.3a.css) provided by OASIS.

### HTML generation

Run the following command line to generate the HTML from this markdown file (input file specified as last argument):

```console
$ pandoc/mkdocs.sh --output /tmp acal-core-yaml-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

The publication date is automatically set to the current date by default (using Lua filter `pandoc/meta_vars.lua`). However, you may set a specific date of your choice instead, by adding the argument `--metadata date="My date in the form DD Month YYYY"` at the end of the command. 

### PDF generation

For PDF output, add the `--pdf` option as follows:

```console
$ pandoc/mkdocs.sh --pdf --output /tmp acal-core-yaml-v%version%.md
```

The HTML file is generated like the previous command and, in addition, a PDF file is generated with the same name as the input file except the `.md` extension is replaced with `.pdf` in this case.

Beware that **the result PDF - the embedded fonts in particular - may differ depending on the system/machine** where you run this command. Mainly, it depends on which fonts are actually installed on the system, as the HTML-to-PDF converter (Chrome / Chromium in this case) selects available fonts according to the prioritized lists defined by `font-family` properties in the CSS.

**For official TC publications**, add the `--official` argument to avoid this issue and produce a system-independent output:

```console
$ pandoc/mkdocs.sh --pdf --official --output /tmp acal-core-yaml-v%version%.md
```

In this case, the generation will use a public Linux container image (`ghcr.io/oasis-tcs/chrome-headless`) with a fixed installed set of fonts to generate the PDF.

------------------------------------------------------------------------

# Appendix 1 Acknowledgments

(This appendix does not form an integral part of this Specification and is informational.)


## Leadership


The following individuals have had significant leadership positions during the development of this document, not just this version of the document, and they are gratefully acknowledged:


- Chairs
  - Bill Parducci, Individual
- Secretaries
  - Bill Parducci, Individual
- Editors
  - Steven Legg, ViewDS Identity Solutions
  - Cyril Dangerville, THALES
  - William Parducci, Individual


## Participants


The following individuals were members of this committee during the creation of this document, not just this version of the document, and their contributions are gratefully acknowledged:

**OASIS ACAL \[XACML\] TC Members:**

- Bill Parducci, Individual
- Steven Legg, ViewDS Identity Solutions
- Cyril Dangerville, THALES

-------

# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)


None. This is the first version of the document.

## Revision History

Latest revision history can be obtained from [OASIS ACAL \[XACML\] TC's github repository](https://github.com/oasis-tcs/acal-spec/blob/v%version%-%stage_revision%/acal-core-yaml-v%version%-%stage_revision%.md).


<!-- The following centered line represents the end of the document -->  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
