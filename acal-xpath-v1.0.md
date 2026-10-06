---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: ACAL v1.0 XPath Profile Version 1.0
subtitle: Committee Specification Draft 02
version: "1.0"
stage_revision: csd02 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access", "authorization", "ABAC", "policylanguage", "XML", "XPath", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version

- https://docs.oasis-open.org/acal/acal/profiles/xpath/v%version%/%stage_revision%/acal-xpath-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/xpath/v%version%/%stage_revision%/acal-xpath-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/acal/acal/profiles/xpath/v%version%/%stage_revision%/acal-xpath-v%version%-%stage_revision%.md


### Previous version

- https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/csd01/acal-xpath-v1.0-csd01.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/csd01/acal-xpath-v1.0-csd01.pdf
- https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/csd01/acal-xpath-v1.0-csd01.md

### Latest version


- https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/acal-xpath-v1.0.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/acal-xpath-v1.0.pdf
- https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/acal-xpath-v1.0.md


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


This document is one component of a Work Product that also includes:

* [XML schema](acal-xpath-xml-v4.0-schema.xsd) (XACML representation);
* [JSON schema](acal-xpath-json-v%version%-schema.json) (JACAL representation);
* [YAML structural schema](acal-xpath-yaml-v%version%-structure.schema.yaml) (YACAL representation);
* Short identifier sets in [XML](acal-xpath-xml-v4.0-identifiers.xml), [JSON](acal-xpath-json-v%version%-identifiers.json) and [YAML](acal-xpath-yaml-v%version%-identifiers.yaml).


### Abstract


This specification is a profile of ACAL that provides ACAL extensions based on the XPath standard, such as XPath expression data-type, XPath-based functions and AttributeSelector. 


### Citation Format


When referencing this document, the following citation format should be used:

**[ACAL-XPath-1.0]**
_%title%_.
Edited by Steven Legg, Cyril Dangerville and William Parducci. %date%. OASIS %subtitle%. https://docs.oasis-open.org/acal/acal/profiles/xpath/v%version%/%stage_revision%/acal-xpath-v%version%-%stage_revision%.html . Latest version: https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/acal-xpath-v1.0.html .


### Related Work

This document is related to:

- _Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html


## License, Document Status, and Notices


Copyright © OASIS Open 2026. All Rights Reserved.  For license and copyright information, and complete status, please see Annex A which contains the License, Document Status and Notices.

---


## Table of Contents


<!-- Generated ToC -->
- [1 Scope](#1-scope)
- [2 Definitions and Acronyms](#2-definitions-and-acronyms)
  - [2.1 Definitions](#21-definitions)
    - [2.1.1 Terms Defined Elsewhere](#211-terms-defined-elsewhere)
    - [2.1.2 Terms Defined in this Document](#212-terms-defined-in-this-document)
    - [2.1.3 Related terms](#213-related-terms)
  - [2.2 Abbreviations and Acronyms](#22-abbreviations-and-acronyms)
- [3 Document Conventions](#3-document-conventions)
  - [3.1 Key Words](#31-key-words)
  - [3.2 Typographical Conventions](#32-typographical-conventions)
- [4 Introduction (non-normative)](#4-introduction-non-normative)
  - [4.1 Requirements](#41-requirements)
  - [4.2 Policies Based on Subject and Resource Attributes](#42-policies-based-on-subject-and-resource-attributes)
  - [4.3 Operators](#43-operators)
  - [4.4 Example](#44-example)
    - [4.4.1 Example medical record instance](#441-example-medical-record-instance)
    - [4.4.2 Example request context](#442-example-request-context)
    - [4.4.3 Example plain-language rules](#443-example-plain-language-rules)
    - [4.4.4 Example ACAL rule instances](#444-example-acal-rule-instances)
      - [4.4.4.1 Rule 1](#4441-rule-1)
      - [4.4.4.2 Rule 2](#4442-rule-2)
      - [4.4.4.3 Rule 3](#4443-rule-3)
  - [4.5 Changes From the Previous Version](#45-changes-from-the-previous-version)
- [5 Structures](#5-structures)
  - [5.1 ContentType restrictions](#51-contenttype-restrictions)
  - [5.2 NamespaceDeclarationsType (optional)](#52-namespacedeclarationstype-optional)
  - [5.3 ACAL extension types](#53-acal-extension-types)
    - [5.3.1 PolicyDefaultsType extension - XPathPolicyDefaultsType](#531-policydefaultstype-extension---xpathpolicydefaultstype)
    - [5.3.2 RequestDefaultsType extension - XPathRequestDefaultsType](#532-requestdefaultstype-extension---xpathrequestdefaultstype)
    - [5.3.3 AttributeSelectorType extension - XPathAttributeSelectorType](#533-attributeselectortype-extension---xpathattributeselectortype)
    - [5.3.4 EntityAttributeSelectorType extension - XPathEntityAttributeSelectorType](#534-entityattributeselectortype-extension---xpathentityattributeselectortype)
    - [5.3.5 DataType extension - XPathExpressionValueType](#535-datatype-extension---xpathexpressionvaluetype)
- [6 XPath Definitions](#6-xpath-definitions)
  - [Supported XPath versions](#supported-xpath-versions)
  - [XPath 2.0 Implementation-Defined Items](#xpath-20-implementation-defined-items)
  - [XPath 3.0 additional implementation-defined items](#xpath-30-additional-implementation-defined-items)
  - [XPath 3.1 additional implementation-defined items](#xpath-31-additional-implementation-defined-items)
- [7 Attribute Selector Evaluation](#7-attribute-selector-evaluation)
- [8 Safety, Security, and Data Protection Considerations](#8-safety-security-and-data-protection-considerations)
- [9 Conformance](#9-conformance)
  - [9.1 Introduction](#91-introduction)
  - [9.2 Conformance Tables](#92-conformance-tables)
    - [9.2.1 Object Types](#921-object-types)
    - [9.2.2 Data Types](#922-data-types)
    - [9.2.3 Functions](#923-functions)
    - [9.2.4 Attributes](#924-attributes)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
  - [B.2 Informative References](#b2-informative-references)
- [Annex C Data Types and Functions](#annex-c-data-types-and-functions)
  - [C.1 Introduction](#c1-introduction)
  - [C.2 Data Types](#c2-data-types)
    - [C.2.1 XPath Expression](#c21-xpath-expression)
  - [C.3 Functions](#c3-functions)
    - [C.3.1 XPath-based Functions](#c31-xpath-based-functions)
- [Annex D ACAL Identifiers](#annex-d-acal-identifiers)
  - [D.1 ACAL Namespaces](#d1-acal-namespaces)
  - [D.2 Data Types](#d2-data-types)
  - [D.3 Attributes](#d3-attributes)
- [Annex E How to generate HTML and PDF versions](#annex-e-how-to-generate-html-and-pdf-versions)
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


---


# 1 Scope


This ACAL profile defines an ACAL data-type for XPath expressions, ACAL functions based on XPath, concrete types of `AttributeSelector` and `EntityAttributeSelector` using XPath expressions to extract attributes from ACAL Request's `Content`, as well as a default XPath version for those expressions, i.e. concrete types of `PolicyDefaults` and `RequestDefaults`.

The XML, JSON and YAML representations of ACAL are defined by separate specifications (XACML [[XACML-Core-4.0](#xacml-core-40)], JACAL [[JACAL-Core-1.0](#jacal-core-10)] and YACAL [[YACAL-Core-1.0](#yacal-core-10)]); this profile defines its extensions to those representations and provides the corresponding schemas and short identifier sets.


---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

See Section 2 of [[ACAL-Core-1.0](#acal-core-10)].

### 2.1.2 Terms Defined in this Document

None.

### 2.1.3 Related terms

None.


## 2.2 Abbreviations and Acronyms

None.

---


# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [[RFC2119](#rfc2119)] [[RFC8174](#rfc8174)] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions


None.

---


# 4 Introduction (non-normative)


## 4.1 Requirements

XML is a common format to represent complex structured documents that may be supplied by the PEP as subject attribute or resource attribute's Content inside the Request to the PDP, typically a SAML token in the case of subject attribute, or any XML document as resource data. For such cases, supporting XPath expressions in ACAL is the standard way and therefore a must-have to extract the necessary values from the XML content for policy evaluation. For instance, a common rule of a privacy policy is that a person should be allowed to read records (in XML) for which he or she is the subject. The corresponding policy must contain a reference - XPath expression - to the subject identified in the information resource - XML record - itself.

## 4.2 Policies Based on Subject and Resource Attributes

Attribute selectors (`AttributeSelectorType` objects) defined by this profile use an XPath expression over the `ContentType` object of the subject (resp. resource) to identify a particular subject (resp. resource) attribute value by its location in the context (see Section 5.2 of [[ACAL-Core-1.0](#acal-core-10)] for an explanation of context).

## 4.3 Operators

The ACAL method of representing XPath-based functions borrows from the XPath and XQuery Functions and Operators 3.1 specification [[XF](#xf)].

## 4.4 Example

This section contains an example XML document, an example request *context* and example ACAL *rules* illustrating the use of XPathAttributeSelectors and xpathExpression data-type defined in this Profile. The XML document is a medical record. Three separate *rules* are defined.

### 4.4.1 Example medical record instance

The following is an instance of a medical record to which the example ACAL *rules* can be applied.  The `<record>` schema is defined in the registered namespace administered by Medi Corp.

```xml {.numberLines}
!include examples/acal-xpath/medical_record.xml
```

### 4.4.2 Example request context

The following example illustrates a request *context*, using XACML representation (XML representation of ACAL), to which the example *rules* may be applicable. It represents a request by the physician Julius Hibbert to read the patient date of birth in the record of Bartholomew Simpson.

```xml {.numberLines}
!include examples/acal-xpath/Request.xml
```

Lines 24-37: Resource content. The XML resource instance, access to all or part of which may be requested, is placed here. The xpathExpression value(s) in the Request and in the Rules, as well as XPathAttributeSelectors in the Rules will apply to that content.

Lines 38-43: The `urn:oasis:names:tc:acal:1.0:content-selector` attribute ([Annex D.3](#d3-attributes)), whose value is an XPath expression into the `<Content>` element selecting the node to be accessed. The rules below name this attribute in the `ContextSelectorId` property of their `<XPathAttributeSelector>` elements.

Here is the equivalent example using JACAL representation (JSON representation of ACAL):

```json {.numberLines}
!include examples/acal-xpath/Request.json
```



### 4.4.3 Example plain-language rules

The following plain-language rules are to be enforced:

- Rule 1: A person, identified by his or her patient number, may read any record for which he or she is the designated patient.

- Rule 2: A person may read any record for which he or she is the designated parent or guardian, and for which the patient is under 16 years of age.

- Rule 3: A physician may write to any medical element for which he or she is the designated primary care physician, provided an email is sent to the patient.

These rules may be written by different PAPs operating independently, or by a single PAP.

### 4.4.4 Example ACAL rule instances

#### 4.4.4.1 Rule 1

The following ACAL `<Rule>` instance expresses *Rule* 1:

```xml {.numberLines}
!include examples/acal-xpath/Rule1.xml
```

Line 8: XPath expressions in the policy are to be interpreted according to the 2.0 version of the XPath specification.

Line 17: The `<XPathAttributeSelector>` element selects a bag of values from the resource content using a free-form XPath expression. In this case, it selects the value of the patient-number in the resource.  Note that the namespace prefixes in the XPath expression are resolved with the standard XML namespace declarations.

Lines 41-49: This Apply expression compares the results of two XPath expressions applied to the `<Content>` element of the resource category in the Request earlier. The first XPath expression is the location path to the requested XML element and the second XPath expression is the literal value `md:record`. The `xpath-node-match` function evaluates to `true` if the requested XML element is below the `md:record` element.

Here is the equivalent example in JACAL syntax (JSON representation of ACAL):

```json {.numberLines}
!include examples/acal-xpath/Rule1.json
```


#### 4.4.4.2 Rule 2

The following ACAL `<Rule>` instance expresses *Rule* 2:

```xml {.numberLines}
!include examples/acal-xpath/Rule2.xml
```

Line 18: The `<XPathAttributeSelector>` element selects the patient's date of birth by taking the XPath expression over the resource content.

Line 61: The second argument selects the value of the `<md:parentGuardianId>` element from the resource content using the `<XPathAttributeSelector>` element. This element contains a free-form XPath expression, pointing into the `<Content>` element of the resource category. Note that all namespace prefixes in the XPath expression are resolved with standard namespace declarations. The AttributeSelector evaluates to the bag of values of type `urn:oasis:names:tc:acal:1.0:data-type:string`.

Here is the equivalent example in JACAL syntax (JSON representation of ACAL):

```json {.numberLines}
!include examples/acal-xpath/Rule2.json
```


#### 4.4.4.3 Rule 3

The following ACAL `<Rule>` instance expresses *Rule* 3:

```xml {.numberLines}
!include examples/acal-xpath/Rule3.xml
```

Lines 28-36: The `<Apply>` element targets resources that match the XPath expression `md:record/md:medical`.

Lines 60-65: The first parameter of the obligation indicates where the PEP will find the email address in the resource. The PDP will evaluate the `<XPathAttributeSelector>` and return the result to the PEP inside the resulting obligation.

Here is the equivalent example in JACAL syntax (JSON representation of ACAL):

```json {.numberLines}
!include examples/acal-xpath/Rule3.json
```


## 4.5 Changes From the Previous Version


The list of changes from the previous version and any revision history can be found in [Appendix 2](#appendix-2-changes-from-previous-version).

---

# 5 Structures

## 5.1 ContentType restrictions

This profile applies to a `Content` object (defined in [[ACAL-Core-1.0](#acal-core-10)]) in the Request if and only if:
- The `MediaType` property is set to `application/xml`.
- The `Body` property value is an XML document.

## 5.2 NamespaceDeclarationsType (optional)

A `NamespaceDeclarationsType` object carries the set of XML namespace declarations [[NAMESPACES](#namespaces)] — each a binding of a namespace prefix to a namespace name (URI) — needed to resolve the prefixed names in the XPath expression carried by an `XPathAttributeSelectorType` object, an `XPathEntityAttributeSelectorType` object, or an `xpathExpression` value. It maps each namespace prefix to exactly one namespace name; a given prefix appears at most once.

This object is not used in the XML representation of ACAL (XACML), which has native support for XML namespaces: there, the prefixes an XPath expression relies on are resolved from the ordinary XML [in-scope namespaces] [[INFOSET](#infoset)] of the element carrying that expression — which may be established by declarations on ancestor elements — exactly as in [[XACML 3.0](#xacml)]. In any non-XML representation of ACAL that does not support namespaces in a standard native way (e.g. JSON, YAML), a `NamespaceDeclarationsType` object is how those bindings are carried instead.

In a non-XML representation, the bindings a given expression needs are carried by a single `NamespaceDeclarationsType` object local to that expression — on the `xpathExpression` value itself, or on the `XPathAttributeSelectorType`/`XPathEntityAttributeSelectorType` object (see [Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype), [Section 5.3.4](#534-entityattributeselectortype-extension---xpathentityattributeselectortype) and [Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)); there is no document-wide or request-wide/policy-wide table of namespace bindings that an expression's own bindings are merged with. (In an XML representation this concern does not arise: prefixes resolve from ordinary XML in-scope namespaces, whose nested scoping already lets the same prefix bind different namespace names in different parts of one document.) Confining each non-XML expression to its own local bindings is a deliberate design choice, not an oversight: because XML nested-scope declarations permit the same prefix to be bound to different namespace names in different parts of one document, a single global table cannot always represent every combination of XML-sourced expressions faithfully, and a value that depended on an external, container-supplied table would stop being self-describing the moment it was copied somewhere else — into a response, a cache, or another policy.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class NonReservedNamespacePrefix <<primitive>>
class NamespaceDeclarationsType <<dataType>>
NamespaceDeclarationsType "[Prefix: NonReservedNamespacePrefix]" --> "1" URI
@enduml
```

A `NamespaceDeclarationsType` object maps namespace *prefixes* — identified by the `Prefix` qualifier — to namespace *names* of `URI` type, defined in [[ACAL-Core-1.0](#acal-core-10)]. Each `Prefix` SHALL be associated with exactly one namespace name. An object with no entries denotes an expression that needs no namespace-prefix bindings.

`Prefix` [Qualifier]

: The namespace prefix, a value of the `NonReservedNamespacePrefix` type (below). For the default-namespace declaration the value SHALL be the empty string; otherwise it SHALL be a non-empty, non-reserved `NCName`.

`Name` [Required]

: The namespace name (URI) to which the prefix is mapped. The `URI` datatype is defined in [[ACAL-Core-1.0](#acal-core-10)].

The `NonReservedNamespacePrefix` primitive type is the value space of a namespace prefix usable in a `NamespaceDeclarationsType` object. A value SHALL be exactly one of:

- the empty string (the default-namespace declaration); or
- a valid `NCName` as defined by [[NAMESPACES](#namespaces)] that is neither `xmlns` nor `xml`. [[NAMESPACES](#namespaces)] never permits `xmlns` as a prefix, and permits `xml` only when it is bound to its own fixed namespace name `http://www.w3.org/XML/1998/namespace` — a binding this profile already treats as implicitly available in every representation (see below) — so neither is a useful entry here and both are excluded.

The permitted lexical space is the full `NCName` production — any `NCName`, including one using non-ASCII name characters, is a conformant prefix. This is a different lexical space from ACAL's general-purpose `IdentifierType` (which supports `{ShortId}` macro substitution, a concept with no meaning for an XML namespace prefix); a representation-specific schema constraining the prefix — the keys of the non-XML mapping form described below — MUST constrain it toward `NCName` rather than merely reuse `IdentifierType`, but such a schema MAY approximate the production where it cannot express it in full: the JACAL and YACAL `propertyNames` schemas use an ASCII pattern, recorded in their `$comment`, which is a validation floor and does not narrow the permitted lexical space above.

In a non-XML representation, a `NamespaceDeclarationsType` object is represented as a single mapping (a JSON object in JACAL, a YAML mapping in YACAL) from each prefix directly to its namespace name, rather than as an array of `{Prefix, Name}` pair-objects — the empty-string key denotes the default-namespace declaration. This mapping form makes prefix uniqueness structural (a mapping cannot carry the same key twice) rather than only a separately-stated constraint, and reads naturally in both JSON and YAML — unlike a repeated array-of-objects shape would, now that namespace bindings are declared once per expression rather than once per document, the way an earlier draft of this profile declared them (see [Appendix 2](#appendix-2-changes-from-previous-version)). A producer SHALL NOT emit a `Namespaces` mapping containing the same key twice; a consumer SHALL reject a `Namespaces` mapping that does. This requirement cannot be expressed as a JSON Schema constraint, since a JSON Schema validator only ever sees an already-parsed instance, and how a parser resolves a duplicate key before that point is implementation-defined ([[RFC8259](#rfc8259)] recommends but does not require uniqueness); it is stated here as a requirement on the parsing/deserialization step itself.

The namespace context a `Namespaces` property carries (see [Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype), [Section 5.3.4](#534-entityattributeselectortype-extension---xpathentityattributeselectortype), [Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)) does not include bindings XPath and XML define implicitly, such as the reserved `xml` prefix (always bound to `http://www.w3.org/XML/1998/namespace`); implementations MUST treat that binding as available without it appearing in `Namespaces`, in every representation, and — per the `NonReservedNamespacePrefix` type above — neither `xml` nor `xmlns` may appear as a key of the mapping.

## 5.3 ACAL extension types

The structures in this section are extensions to [[ACAL-Core-1.0](#acal-core-10)] model and described here in abstract terms. Their concrete representations extend the XACML, JACAL and YACAL representations; the corresponding schemas and short identifier sets are published with this profile (see Additional artifacts).

The types `IdentifierType`, `ValueType`, `StructuredValueType`, `PolicyDefaultsType`, `RequestDefaultsType`, `AttributeSelectorType` and `EntityAttributeSelectorType` used in the next UML models are defined in [[ACAL-Core-1.0](#acal-core-10)].

### 5.3.1 PolicyDefaultsType extension - XPathPolicyDefaultsType

A `XPathPolicyDefaultsType` object extends `PolicyDefaultsType` from [[ACAL-Core-1.0](#acal-core-10)] to specify the default XPath version for XPath expressions occurring in the enclosing `PolicyType` object, or in a policy nested within it that carries no `XPathPolicyDefaultsType` of its own: the `Path` expression of every `XPathAttributeSelectorType`/`XPathEntityAttributeSelectorType` object, and any `xpathExpression` value in scope — including those passed as XPath-based function arguments ([Annex C.3.1](#c31-xpath-based-functions)) — that does not carry its own `XPathVersion` ([Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)). It does not carry namespace bindings (see [Section 5.2](#52-namespacedeclarationstype-optional)).

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class PolicyDefaultsType <<dataType>>
class XPathPolicyDefaultsType <<dataType>> extends PolicyDefaultsType {
  {field} +XPathVersion: IdentifierType[1]
}
@enduml
```

A `XPathPolicyDefaultsType` object contains the following property:

`XPathVersion` [Required]

: An `IdentifierType` value specifying the XPath version (see the supported XPath versions in [Section 6](#6-xpath-definitions)). It governs, in the enclosing policy and any policy nested within it that carries no `XPathPolicyDefaultsType` of its own: (a) every attribute selector's `Path` expression — a `Path` is policy syntax that never leaves the policy it is written in, so it has no local version property and a single policy-scoped version serves every selector; and (b) every `xpathExpression` value with no local `XPathVersion` of its own. A value that *does* carry a local `XPathVersion` uses that instead, everywhere the value goes ([Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)). The request-side counterpart of this object, for `xpathExpression` values in a `Request` rather than a `Policy`, is `XPathRequestDefaultsType` ([Section 5.3.2](#532-requestdefaultstype-extension---xpathrequestdefaultstype)).

: A `PolicyDefaults` object's scope is the enclosing `Policy` and any policy nested within it ([[ACAL-Core-1.0](#acal-core-10)] Section 7.4); a nested policy's own `XPathPolicyDefaultsType` applies within that policy in place of an ancestor's. An `XPathAttributeSelectorType`/`XPathEntityAttributeSelectorType` object's `Path`, or an `xpathExpression` value with no local `XPathVersion`, therefore takes its version from the **nearest enclosing** `Policy` that carries an `XPathPolicyDefaultsType`. If no enclosing policy carries one — and, for a value, there is no local `XPathVersion` either — the expression is invalid: its evaluation MUST return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`. There is no fixed profile-wide default. A policy included by a `PolicyReference` is not nested within the referencing policy for this purpose ([[ACAL-Core-1.0](#acal-core-10)] Section 7.4): a referenced policy that contains such a selector or value takes its version from an `XPathPolicyDefaultsType` carried by itself or by a policy that encloses it where it is defined, never from the policy that references it, and otherwise the expression is invalid as above.

### 5.3.2 RequestDefaultsType extension - XPathRequestDefaultsType

A `XPathRequestDefaultsType` object extends `RequestDefaultsType` from [[ACAL-Core-1.0](#acal-core-10)] to specify the default XPath version for `xpathExpression` values occurring in the enclosing `RequestType` object — for example, the value of a `urn:oasis:names:tc:acal:1.0:content-selector` attribute — that do not carry their own `XPathVersion` ([Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)). Attribute selectors are policy syntax and never appear in a `Request`, so, unlike `XPathPolicyDefaultsType`, this object governs `xpathExpression` values only. It carries no namespace bindings (see [Section 5.2](#52-namespacedeclarationstype-optional)).

UML definition (class diagram):
```plantuml
@startuml
hide empty members
hide circle
abstract class RequestDefaultsType <<dataType>>
class XPathRequestDefaultsType <<dataType>> extends RequestDefaultsType {
  {field} +XPathVersion: IdentifierType[1]
}
@enduml
```

A `XPathRequestDefaultsType` object contains the following property:

`XPathVersion` [Required]

: An `IdentifierType` value specifying the XPath version, with the same meaning as `XPathPolicyDefaultsType`'s `XPathVersion` ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype)) but scoped to the enclosing `Request`. A request-side `xpathExpression` value with no local `XPathVersion` takes this version; a value that carries its own uses that instead.

### 5.3.3 AttributeSelectorType extension - XPathAttributeSelectorType

An `XPathAttributeSelectorType` object is a concrete type of `AttributeSelectorType` from [[ACAL-Core-1.0](#acal-core-10)] that uses [[XPath](#xpath)] for `Path` expressions and expects an XML [[XML](#xml)] document in the `Body` property of the `Content` object of the `RequestEntityType` object matching the `Category` property. More precisely, the returned values SHALL be constructed from the items of the sequence obtained by applying the XPath expression given by the attribute selector's `Path` property to the XML document in the `Body` property of the `Content` object of the `RequestEntityType` object matching the attribute selector's `Category` property, as specified in [Section 7](#7-attribute-selector-evaluation). 

See the [section 7](#7-attribute-selector-evaluation) for details of attribute selector evaluation.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class AttributeSelectorType <<datatype>>
class XPathAttributeSelectorType <<dataType>> extends AttributeSelectorType {
  + ContextSelectorId: IdentifierType [0..1]
  + Namespaces: NamespaceDeclarationsType [0..1]
}
@enduml
```

The `XPathAttributeSelectorType` object type extends the `AttributeSelectorType` object type with the following properties:

`ContextSelectorId` [Optional]

: An `IdentifierType` value specifying an ACAL attribute (by its `AttributeId`) in the attribute category (`RequestEntityType` object with `Category` matching this attribute selector's `Category`) containing the XML content. The referenced attribute MUST have a single value of data type `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` (see Annex C) and the XPath expression represented by that value MUST select a single node in the XML content. The `XPathCategory` property of the referenced ACAL attribute value SHALL be ignored. This profile defines the standard attribute identifier `urn:oasis:names:tc:acal:1.0:content-selector` for this purpose (see [Annex D.3](#d3-attributes)); any other attribute satisfying the conditions above MAY be named instead.

`Namespaces` [Optional]

: The `NamespaceDeclarationsType` object (see [Section 5.2](#52-namespacedeclarationstype-optional)) holding the namespace-prefix bindings needed to resolve the prefixed names used within the `Path` expression. It applies only to a non-XML representation; in an XML representation the prefixes resolve from ordinary XML in-scope namespaces instead (see the bolded note below).

: When present, `Namespaces` SHALL supply the complete effective in-scope namespace context of the `Path` expression: for a selector translated from an XML source, the in-scope namespaces of the source element; for one authored directly in a non-XML representation, every binding the expression is meant to resolve against. A producer that can determine exactly which of those bindings the expression actually uses MAY supply only those; this profile defines no normative minimization algorithm over the lexical content of an XPath string, so a producer that cannot make that determination SHALL supply the complete context rather than guess.

: `Namespaces` MAY be absent (equivalently, empty), which states that the `Path` expression needs no supplied namespace-prefix bindings — for example all its names resolve without one (no namespace-prefixed names, and no reliance on a default-namespace declaration), or it addresses namespaces through `namespace-uri()`, a wildcard such as `*:record`, or a URIQualifiedName such as `Q{urn:example:med}record`. There is no policy-wide or document-wide namespace table for `Namespaces` to be merged with or resolved against; an absent `Namespaces` is not a deferral to a default, because none exists.

More importantly, in the context of this profile, the value of the `Path` property inherited from supertype `AttributeSelectorType` SHALL be an XPath expression [[XPath](#xpath)]. In addition, this XPath expression may reference one or more XPath variables, in which case each XPath variable's value is taken from the corresponding so-called *ACAL variable*, i.e. the variable defined by a `<VariableDefinition>` with a `VariableId` matching the XPath variable name, in the scope of this element.

The value of an XPath variable is obtained from the value(s) of the ACAL variable as follows. The value(s) of the ACAL variable MUST be of one of the twelve data types defined by reference to XML Schema [[XS](#xs)] in [[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6. A single value of data type `urn:oasis:names:tc:acal:1.0:data-type:T` becomes the atomic value of type `xs:T` that is the same member of the value space ([[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6). A bag becomes the sequence of the atomic values obtained in that way from each value of the bag, in ascending order of the Unicode code points of the canonical representation of each value as defined by the XML Schema datatype ([[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6; for a value of the `string` or `anyURI` data type, the characters of the value itself); duplicate values are retained, and an empty bag becomes the empty sequence. That order is specified so that an XPath expression that depends on the position of an item in the sequence has the same result in every implementation, although a bag itself is unordered. XPath sequences, not XPath 3.1 arrays, are used, so that the same rule applies to every supported XPath version. If a value is not a member of the value space of the type `xs:T` as supported by the XPath processor in use, then the attribute selector SHALL return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.

For example, in the following `XPathAttributeSelectorType` object in XML representation format:

   ```xml
   <XPathAttributeSelector 
    Path="if ($classif_name = 'SECRET') then 3 else if ($classif_name = 'CONFIDENTIAL') then 2 else if ($classif_name = 'RESTRICTED') then 1 else 0" 
    Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource" 
    DataType="urn:oasis:names:tc:acal:1.0:data-type:integer" 
    MustBePresent="true" />
   ```
   The XPath expression references the XPath variable `classif_name`, which requires a `<VariableDefinition VariableId="classif_name">some_expression</VariableDefinition>` to be defined in the enclosing `Policy`, where `some_expression` is any expression that returns a value of data type `urn:oasis:names:tc:acal:1.0:data-type:string`.

If no such variable is found (in the current scope) or its value(s) are of a data type that cannot be converted as specified above, the XPath expression and therefore this `Path` attribute SHALL be considered invalid and a syntax error SHALL be returned (status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`). See [Section 7](#7-attribute-selector-evaluation) for more details. 


**In an XML representation, the namespace context for the value of the `Path` attribute is given by the [in-scope namespaces] [[INFOSET](#infoset)] of the `<XPathAttributeSelector>` element** — this ordinary XML ancestor-based lookup remains valid here because a selector's `Path` expression never leaves the policy document it is written in, so the same in-scope-namespaces mechanism this profile has always used continues to apply unchanged. **In a non-XML representation, the namespace context is given entirely by the selector's own `Namespaces` property** (see above), or is empty when that property is absent; there is no ancestor or document-wide table it is resolved against.

### 5.3.4 EntityAttributeSelectorType extension - XPathEntityAttributeSelectorType

An `XPathEntityAttributeSelectorType` object is a concrete type of `EntityAttributeSelectorType` [[ACAL-Core-1.0](#acal-core-10)] that uses [[XPath](#xpath)] for `Path` expressions and expects XML content in the value returned by the attribute selector's `Expression` property. In other words, the values SHALL be constructed from the items of the sequence obtained by applying the XPath expression given by the entity attribute selector's `Path` property to the XML document in the `Body` property of the `Content` property in either an attribute category in the request context (`RequestEntity`) or the value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type returned by its `Expression` evaluation. 

See the [section 7](#7-attribute-selector-evaluation)  for details of entity attribute selector evaluation.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class EntityAttributeSelectorType <<datatype>>
class XPathEntityAttributeSelectorType <<dataType>> extends EntityAttributeSelectorType {
   + ContextSelectorId: IdentifierType [0..1]
   + Namespaces: NamespaceDeclarationsType [0..1]
}
@enduml
```

The `XPathEntityAttributeSelectorType` object type extends the `EntityAttributeSelectorType` object type with the same `ContextSelectorId` and `Namespaces` properties as `XPathAttributeSelectorType` ([Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype)).
The `Path` property is also defined the same as in `XPathAttributeSelectorType`.

### 5.3.5 DataType extension - XPathExpressionValueType

The `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` values (Annex C) can be modeled as a subtype of `StructuredValueType` [[ACAL-Core-1.0](#acal-core-10)] called `XPathExpressionValueType`.

A `XPathExpressionValueType` object is a first-class *value*: unlike a selector's `Path`, it can be produced in one context (a request, a policy) and consumed or copied in another (a response `Notice` or `AttributeAssignment`, another policy's evaluation). Both the XPath version it is evaluated against and its namespace context therefore belong to the value once it is constructed. On the wire each may be *abbreviated*: the version, for a value in a `Request` or `Policy`, by an `XPathRequestDefaultsType`/`XPathPolicyDefaultsType` object in that container or an enclosing policy; the namespace context, in an XML representation, by ordinary XML in-scope namespaces. But a constructed value always has exactly one resolved effective XPath version and one resolved namespace context, and neither is re-resolved against a new container if the value is later moved or copied.

UML model (class diagram):
```plantuml
@startuml
hide empty members
hide circle

abstract class ValueType
abstract class StructuredValueType extends ValueType
class XPathExpressionValueType <<fixedDatatype>> extends StructuredValueType {
    <<fixedDatatype>>
    DataType='urn:oasis:names:tc:acal:1.0:data-type:xpathExpression'
    __
    + XPathVersion: IdentifierType [0..1]
    + Namespaces: NamespaceDeclarationsType [0..1]
    + XPathCategory: IdentifierType [1]
    + XPath: AttributeSelectorPathType [1]
}
@enduml 
```

A `XPathExpressionValueType` object has the following properties:

`XPathVersion` [Optional]

: An `IdentifierType` value specifying the XPath version this expression is evaluated against (see the Supported XPath versions in [Section 6](#6-xpath-definitions)).

: This property is OPTIONAL for a value that appears in a `Request` or a `Policy`. When it is absent, the value's *effective* XPath version is that of the applicable Defaults object: `XPathRequestDefaultsType` ([Section 5.3.2](#532-requestdefaultstype-extension---xpathrequestdefaultstype)) for a value in a `Request`; `XPathPolicyDefaultsType` ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype)) for a value in a `Policy` — including one used as an XPath-based function argument or defined in a `VariableDefinition` — namely the one in the nearest enclosing `Policy` that carries an `XPathPolicyDefaultsType`, per the `PolicyDefaults`/`RequestDefaults` scope rules of [[ACAL-Core-1.0](#acal-core-10)] Sections 7.4 and 7.32 (`PolicyDefaults` extends into nested policies; a nested policy's own object of the same concrete type overrides an ancestor's). A value with no local `XPathVersion` and no applicable Defaults object — in particular any value in a decision response — is invalid; a PDP that encounters such a value while evaluating a request MUST return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`, and other processing (policy load, response validation) rejects it under its own applicable rules. There is no implicit "latest supported version" fallback — that would make the value's meaning depend on the implementation and the profile revision it was built against.

: The effective version is fixed when the value is constructed — whether decoded from a serialization (resolved as above against that occurrence's own container) or produced by an implementation some other way (the producer then supplies it, or resolves it against a specific `Request`/`Policy` context at that point). It does not change afterwards: a request-side value keeps its request-resolved version even when it is later retrieved (for example by an `AttributeDesignator`) and evaluated inside a policy; it is **not** re-resolved against that policy's `XPathPolicyDefaultsType`.

: When an implementation serializes such a value into a `Request` or `Policy`, it MAY omit the local `XPathVersion` only if that container carries an applicable Defaults object whose `XPathVersion` **denotes the same XPath version** as the value's effective version — the comparison is between the two `IdentifierType` values after any `{ShortId}` expansion, and they match only when they are the same identifier — [Section 6](#6-xpath-definitions) defines each XPath version by a single identifier and no aliases (and XACML 3.0's XPath 2.0 identifier is not a valid ACAL value at all). Otherwise it MUST emit the local `XPathVersion`. A producer MUST emit a local `XPathVersion` for a value it serializes in a decision response (`Notice`, `AttributeAssignment`), which carries no Defaults object and may be logged, forwarded, or processed apart from the request that produced it. How an implementation holds the value internally (a parsed object, a compiled expression, a cache entry) is not constrained, provided it preserves the value's effective version and namespace context; the rules here apply when it emits an ACAL document or interchange value.

`Namespaces` [Optional]

: The `NamespaceDeclarationsType` object (see [Section 5.2](#52-namespacedeclarationstype-optional)) holding the namespace-prefix bindings needed to resolve the prefixed names used within the `XPath` expression, realized by representation exactly as for the selector types' `Namespaces` property ([Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype)).

: In a non-XML representation the value carries its own `Namespaces` mapping, or omits it when the `XPath` expression needs no supplied namespace-prefix bindings — for example all its names resolve without one (no namespace-prefixed names, and no reliance on a default-namespace declaration), or it addresses namespaces through `namespace-uri()`, a wildcard such as `*:record`, or a URIQualifiedName such as `Q{urn:example:med}record`. Unlike `XPathVersion`, `Namespaces` has no Defaults-object fallback: a single shared namespace table cannot faithfully represent every combination of XML-sourced expressions (the defect this profile's namespace-per-value model corrects), so an absent `Namespaces` means "no bindings", never "inherit from elsewhere". When present, `Namespaces` SHALL supply the complete effective in-scope namespace context of the expression — for a value translated from an XML source, the in-scope namespaces of the source element; for one authored directly in a non-XML representation, every binding the expression is meant to resolve against. A producer that can determine exactly which of those bindings the expression actually uses MAY supply only those; this profile defines no normative minimization algorithm over the lexical content of an XPath string, so a producer that cannot make that determination SHALL supply the complete context rather than guess.

: In an XML representation the prefixes resolve from the ordinary XML [in-scope namespaces] [[INFOSET](#infoset)] of the element carrying the value, which may be established by a declaration on an ancestor element — the same mechanism [[XACML 3.0](#xacml)] has always used, and the same one this profile applies to a selector's `Path`; this profile does not require the `xmlns:*` declarations to sit on the carrying element itself.

: Because a `xpathExpression` value — unlike a selector's `Path` — can be produced in one document and emitted into another (a response `Notice` or `AttributeAssignment`, another policy), an implementation emitting it into an ACAL document or interchange value MUST carry the namespace context the expression relies on from the source and re-express it so the expression stays resolvable at the destination: as the `Namespaces` mapping when the destination is a non-XML representation, or as in-scope `xmlns:*` declarations (on the carrying element or an ancestor of it in the new document) when the destination is XML. This is the ordinary obligation that accompanies moving any namespace-qualified XML content between documents; it is called out here because a prefix used only inside the `XPath` string is character data, not markup, so XML well-formedness alone does not enforce it.

`XPath` [Required]

: The XPath expression (the `AttributeSelectorPathType` is defined in [[ACAL-Core-1.0](#acal-core-10)])

`XPathCategory` [Required]

: The `Category` of the `RequestEntityType` object containing the XML `Content` to which the XPath expression applies.

---


# 6 XPath Definitions

## Supported XPath versions

ACAL supports XPath 2.0, XPath 3.0, and XPath 3.1. An `XPathVersion` value MUST evaluate to one of the three identifiers given below (after any `{ShortId}` expansion); no other XPath version is available.

The `XPathVersion` property contains an `IdentifierType` value that specifies an XPath version. It appears on a `XPathPolicyDefaultsType` object ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype)), a `XPathRequestDefaultsType` object ([Section 5.3.2](#532-requestdefaultstype-extension---xpathrequestdefaultstype)), and — optionally — a `XPathExpressionValueType` object ([Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)); [Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype) gives the rule for resolving the effective version of an `xpathExpression` value from a local `XPathVersion` or, absent one, the applicable Defaults object.

To specify XPath 2.0 the `IdentifierType` value MUST evaluate to `https://www.w3.org/TR/xpath20/`. The former XPath 2.0 identifier from [[XACML 3.0](#xacml)], `http://www.w3.org/TR/2007/REC-xpath20-20070123`, is not a valid ACAL XPath-version identifier: it is not recognized as an alias for the identifier above, and this profile states no equivalence between the two. Translating an XACML 3.0 policy or request to ACAL substitutes `https://www.w3.org/TR/xpath20/` for it.

To specify XPath 3.0, the `IdentifierType` value MUST evaluate to `https://www.w3.org/TR/xpath-30/`. 

To specify XPath 3.1, the `IdentifierType` value MUST evaluate to `https://www.w3.org/TR/xpath-31/`.

XPath 1.0 is not a supported XPath version for ACAL. The implementation-defined-behavior rules in the sections below, and the XPath-based functions ([Annex C.3.1](#c31-xpath-based-functions)), are defined only for the supported versions listed above, whose result data model — a sequence of items — is not the one XPath 1.0 uses (a node-set, a boolean, a number, or a string). The XPath 1.0 identifier `https://www.w3.org/TR/1999/REC-xpath-19991116/` is correspondingly not a valid ACAL `XPathVersion` value.

The XPath specification leaves a number of aspects of behavior implementation-defined. The following sections define how the supported XPath versions SHALL behave in an ACAL implementation.

## XPath 2.0 Implementation-Defined Items

[XPath 2.0 - Appendix D](https://www.w3.org/TR/xpath20/#id-impl-defined-items) defines the following items:

1. The version of Unicode that is used to construct expressions.

    : ACAL leaves this implementation defined. It is RECOMMENDED that the latest version is used.

2. The statically-known collations.

    : ACAL leaves this implementation defined.

3. The implicit timezone.

    : ACAL defines the implicit time zone as UTC.

4. The circumstances in which warnings are raised, and the ways in which warnings are handled.

    : ACAL leaves this implementation defined.

5. The method by which errors are reported to the external processing environment.

    : An XPath error in the evaluation of an attribute selector causes the result to be `Indeterminate`. The status code SHALL be `urn:oasis:names:tc:acal:1.0:status:processing-error`. Implementations MAY provide additional details about the error in the response or by some other means.

6. Whether the implementation is based on the rules of XML 1.0 or 1.1.

    : ACAL is based on XML 1.0.

7. Whether the implementation supports the namespace axis.

: ACAL leaves this implementation defined. It is RECOMMENDED that users of ACAL do not make use of the namespace axis.

8. Any static typing extensions supported by the implementation, if the Static Typing Feature is supported.

    : ACAL leaves this implementation defined.

[XPath 2.0 Data Model - Appendix F](https://www.w3.org/TR/2007/REC-xpath-datamodel-20070123/#implementation-defined) defines the following items:

1. Support for additional user-defined or implementation-defined types is implementation-defined.

: It is RECOMMENDED that implementations of ACAL do not define any additional types, and it is RECOMMENDED that users of ACAL do not make use of any additional types.

2. Some typed values in the data model are undefined. Attempting to access an undefined property is always an error. Behavior in these cases is implementation-defined and the host language is responsible for determining the result.

    : An XPath error in the evaluation of an attribute selector causes the result to be `Indeterminate`. The status code SHALL be `urn:oasis:names:tc:acal:1.0:status:processing-error`. Implementations MAY provide additional details about the error in the response or by some other means.

[XPath Functions](https://www.w3.org/TR/xpath-functions/#impl-def) defines the following items:

1. The destination of the trace output is implementation-defined.

    : ACAL leaves this implementation defined.

2. For `xs:integer` operations, XPath Functions permits an implementation that supports only limited-precision integer operations to either raise an error [err:FOAR0002] or provide an implementation-defined mechanism that allows users to choose between raising an error and returning a result that is modulo the largest representable integer value; ACAL overrides this.

    : An implementation SHALL NOT provide a mechanism that returns a result modulo a representable bound. The supported integer interval of [[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6 applies to each `xs:integer` operand and result of each operator and function that is evaluated as part of an XPath expression, and an implementation SHALL NOT document a supported integer interval that contains an `xs:integer` value that its XPath evaluator cannot represent and use as an operand or result, once the value is available to the evaluator, for any reason other than exhaustion of an execution resource. This requirement concerns the capacity of the evaluator; an input acceptance limit ([[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6) that prevents a value, or the text of an XPath expression, from being obtained is not such a reason. An arithmetic operation whose `xs:integer` result is outside the supported integer interval SHALL raise the dynamic error [err:FOAR0002]; a cast to `xs:integer`, including a call of the `xs:integer` constructor function, whose result is outside the supported integer interval SHALL raise the dynamic error [err:FOCA0003]. If every `xs:integer` operand of an operator or function and the result that its definition prescribes are within the supported integer interval, then the implementation SHALL return that result unless an execution resource is exhausted, and the implementation SHALL NOT raise an error solely because of state that it uses internally while evaluating that operator or function; this applies to a function with a sequence argument, such as `fn:sum`, as a whole. A dynamic error [err:FOAR0002] or [err:FOCA0003] required by this item, and any other dynamic error in an `xs:integer` operation, SHALL cause the containing ACAL expression to return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`. If any other operator or function prescribes an `xs:integer` result outside the supported integer interval, then the containing ACAL expression SHALL return `Indeterminate` with that status code. Implementations MAY provide additional details about the error in the response or by some other means.

    : Note: [[XPath](#xpath)] permits an implementation to rewrite an expression, provided that the result conforms to the semantics of the original expression other than in the raising or not raising of errors. An implementation may therefore return a value for an expression such as `($max + 1) - 1`, where `$max` is the largest integer in its supported integer interval, where another implementation raises [err:FOAR0002]. The result is either the value that the expression prescribes or an error, never a different value.

3. For `xs:decimal` values the number of digits of precision returned by the numeric operators is implementation-defined.

    : ACAL leaves this implementation defined.

4. If the number of digits in the result of a numeric operation exceeds the number of digits that the implementation supports, the result is truncated or rounded in an implementation-defined manner.

    : ACAL leaves this implementation defined, except that this item does not apply to an operation whose result is of type `xs:integer`, which item 2 governs.

5. It is implementation-defined which version of Unicode is supported.

    : ACAL leaves this implementation defined. It is RECOMMENDED that the latest version is used.

6. For `fn:normalize-unicode`, conforming implementations must support normalization form "NFC" and may support normalization forms "NFD", "NFKC", "NFKD", "FULLY-NORMALIZED". They may also support other normalization forms with implementation-defined semantics.

    : ACAL leaves this implementation defined.

7. The ability to decompose strings into collation units suitable for substring matching is an implementation-defined property of a collation.

    : ACAL leaves this implementation defined.

8. All minimally conforming processors must support year values with a minimum of 4 digits (i.e., YYYY) and a minimum fractional second precision of 1 millisecond or three digits (i.e., s.sss). However, conforming processors may set larger implementation-defined limits on the maximum number of digits they support in these two situations.

: ACAL leaves this implementation defined, and it is RECOMMENDED that users of ACAL do not expect greater limits and precision.

9. The result of casting a string to `xs:decimal`, when the resulting value is not too large or too small but nevertheless has too many decimal digits to be accurately represented, is implementation-defined.

    : ACAL leaves this implementation defined.

10. Various aspects of the processing provided by `fn:doc` are implementation-defined. Implementations may provide external configuration options that allow any aspect of the processing to be controlled by the user.

    : ACAL leaves this implementation defined.

11. The manner in which implementations provide options to weaken the stable characteristic of `fn:collection` and `fn:doc` are implementation-defined.

    : ACAL leaves this implementation defined.

## XPath 3.0 additional implementation-defined items

[XPath 3.0](https://www.w3.org/TR/xpath-30/#id-impl-defined-items) Appendix D defines the following additional items to XPath 2.0 items:

1. How XDM instances are created from sources other than an Infoset or PSVI.

: ACAL implementations should not have to create XDM instances from sources other than an Infoset or PSVI.

1. The signatures of functions provided by the implementation or via an implementation-defined API. 

: It is RECOMMENDED that implementations of ACAL do not define any additional XPath functions, and it is RECOMMENDED that users of ACAL do not make use of any additional XPath functions.

1. Any environment variables provided by the implementation.

: It is RECOMMENDED that users of ACAL use ACAL-defined VariableDefinitions (based on AttributeDesignator and appropriate PIP to obtain the values) in order to capture environment variables, then use the ACAL-defined Variables as XPath variables in XPath expressions, as specified by ACAL. If this is hardly feasible, as an alternative, ACAL users may use implementation-defined environment variables in their XPath expressions only if they are standard, e.g. POSIX environment variables. 

[XQuery and XPath Data Model (XDM) 3.0](https://www.w3.org/TR/xpath-datamodel-30/#implementation-defined) - Appendix F.1 defines the following additional item(s):

1. When converting from an xs:string to an xs:float or xs:double, it is implementation-defined whether the lexical value `-0` (and similar forms such as `-0.0`) convert to negative zero or to positive zero in the value space.

   : ACAL leaves this implementation-defined.

[XQuery and XPath Functions and Operators 3.0](https://www.w3.org/TR/xpath-functions-30/#impl-def) (Appendix D) defines the following additional items:

1. Item #39: implementations SHALL apply schema validation to ACAL documents instead of DTD validation.
2. Item #44: implementations SHALL invoke schema validation instead of DTD validation, and use an XML 1.0 parser.
3. Item #45: implementations SHALL use an XML 1.0 parser.
4. Item #50: implementations SHALL support (at least) version [2025b](https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/) of the *tz* timezone database. <!-- 2025b is the latest version supported by JAVA as of writing: https://www.oracle.com/java/technologies/tzdata-versions.html -->
1. ACAL leaves other features of Appendix D implementation-defined, unless otherwise specified by the previous section (XPath 2.0 implementation-defined items).

## XPath 3.1 additional implementation-defined items

For addressing Implementation-Defined Items sections of [XPath 3.1 standard, Appendix D](https://www.w3.org/TR/xpath-31/#id-impl-defined-items) and [XQuery and XPath Data Model 3.1](https://www.w3.org/TR/xpath-datamodel-31/#implementation-defined), refer to the previous sections for XPath 2.0 and 3.0.

[XQuery and XPath Functions and Operators 3.1](https://www.w3.org/TR/xpath-functions-31/#impl-def) (Appendix E) defines the following additional item(s):

1. Item #45: schema validation SHALL be applied to the source document.
2. Items #52, #53: schema validation SHALL be invoked and an XML 1.0 parser SHALL be used.
3. Item #66: implementations SHALL support (at least) version [2025b](https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/) of the *tz* timezone database. <!-- 2025b is the latest version supported by JAVA as of writing: https://www.oracle.com/java/technologies/tzdata-versions.html -->
1. ACAL leaves other features of Appendix E implementation-defined, unless otherwise specified by the previous section (XPath 2.0 and 3.0 implementation-defined items).

---


# 7 Attribute Selector Evaluation


An `XPathAttributeSelectorType` or `XPathEntityAttributeSelectorType` object SHALL be evaluated according to the following processing model.

: Note: It is not necessary for an implementation to exactly follow this model. It is only necessary to produce results identical to those that would be produced by following this model.

The first steps are already described in [[ACAL-Core-1.0](#acal-core-10)] Section 8.4.7 (Selector Evaluation) and provided here as a reminder:

- If the attribute category given by the `Category` property is not found or does not have a `Content` property, then the return value is either `Indeterminate` or an empty bag as determined by the `MustBePresent` property.

- If the `Expression` property of an `XPathEntityAttributeSelectorType` object evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type and that value does not have a `Content` property, then the return value is either `Indeterminate` or an empty bag as determined by the `MustBePresent` property.

- If the `Expression` property of an `XPathEntityAttributeSelectorType` object evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:anyURI` data type and an attribute category with that value as its `Category` is not found or does not have a `Content` property, then the return value is either `Indeterminate` or an empty bag as determined by the `MustBePresent` property.

If the designated attribute category or entity value has a `Content` property, then follow the steps below:

1. Construct an XML data structure suitable for XPath processing from the value of the `Body` property of the `Content` object. The data structure SHALL be constructed so that the document node of this structure contains a single document element which corresponds to the single child element of the `Body` property. The constructed data structure SHALL be equivalent to one that would result from parsing a stand-alone XML document consisting of the contents of the `Body` property (including any comment and processing-instruction markup). **In an XML representation, namespace declarations from the `<Body>` element and its ancestor elements for namespace prefixes that are "visibly utilized", as defined by [[exc-c14n](#exc-c14n)], within the contents MUST be present.** Namespace declarations from the single child element or its ancestor elements for namespace prefixes that are not "visibly utilized" MAY be present. The data structure MUST meet the requirements of the applicable XPath version.

2. If there is a `ContextSelectorId` property, the context node SHALL be the node selected by applying the XPath expression given in the attribute value of the designated ACAL attribute, evaluated according to that `XPathExpressionValueType` object's effective `XPathVersion` and its namespace context ([Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)). It SHALL be an error if this evaluation returns no node or more than one node, in which case the return value MUST be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`. If there is no `ContextSelectorId` property, then the document node of the data structure SHALL be the context node.

3. Evaluate the XPath expression given in the `Path` property against the context node selected in the previous step, according to the [[XPath](#xpath)] standard in the version given by the nearest enclosing policy's `XPathPolicyDefaultsType` object ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype) — some enclosing policy SHALL carry one), resolving any namespace prefixes in `Path` from the `XPathAttributeSelectorType`/`XPathEntityAttributeSelectorType` object's own `Namespaces` property, if present ([Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype)), in a non-XML representation, or from the object's own in-scope namespaces ([Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype)) in an XML representation. This XPath expression may reference one or more XPath variables, in which case each XPath variable's value is taken from the corresponding *ACAL variable* and converted as specified in [Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype). If no such variable is found (in the current scope) or its value(s) are of a data type that cannot be converted as specified there, the XPath expression and therefore this `Path` attribute SHALL be considered invalid and a syntax error SHALL be returned (status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`).

4. The result of step 3 is a sequence of items, and is converted to a bag of values of the data type specified by the `DataType` property as follows. The sequence MAY contain any mixture of nodes and atomic values.

&nbsp;
: If the sequence is empty, then the result of the attribute selector is as specified for an empty result in [[ACAL-Core-1.0](#acal-core-10)] section 8.4.7, and none of the cases below applies.

&nbsp;
: If the specified data type is one of the twelve data types defined by reference to XML Schema in [[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6 — that is, `urn:oasis:names:tc:acal:1.0:data-type:` `string`, `boolean`, `integer`, `double`, `dateTime`, `date`, `time`, `hexBinary`, `base64Binary`, `anyURI`, `yearMonthDuration` or `dayTimeDuration` — then each item of the sequence is converted to one value of that data type, as specified by the next five cases, and the bag contains one converted value for each item: the order of the sequence is discarded and duplicate values are retained. In those cases `xs:T` is the XML Schema built-in datatype of the same name as the specified data type.

&nbsp;
: An item that is a node is converted by applying the `xs:T()` constructor function of [[XF](#xf)] (Section 18.1 of Functions and Operators 3.1) to the `xs:string` value equal to the string value of the node (the result of `fn:string` applied to the node). The constructor function SHALL NOT be applied to the node itself, because it would then atomize the node to its typed value.

&nbsp;
: An item that is an atomic value of type `xs:untypedAtomic` is converted by applying the `xs:T()` constructor function to that value.

&nbsp;
: An item that is an atomic value whose type is `xs:T`, or a type derived from `xs:T`, is converted to that same value.

&nbsp;
: If the specified data type is `urn:oasis:names:tc:acal:1.0:data-type:double`, an item that is an atomic value whose type is `xs:float` or `xs:decimal`, or a type derived from either of them (which includes `xs:integer`), is converted by applying the `xs:double()` constructor function to that value.

&nbsp;
: An item that is an atomic value not covered by the preceding four cases satisfies none of the cases of this step.

&nbsp;
: If the specified data type is one of `urn:oasis:names:tc:acal:1.0:data-type:x500Name`, `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`, `urn:oasis:names:tc:acal:1.0:data-type:ipAddress` or `urn:oasis:names:tc:acal:1.0:data-type:dnsName`, then each item of the sequence is converted to one value of that data type as follows. An item that is a node, or an atomic value of type `xs:string` or `xs:untypedAtomic`, is converted from the ACAL `string` value equal, respectively, to the string value of the node (the result of `fn:string` applied to the node) or to the item's own value cast to `xs:string`. In each case the conversion applies `urn:oasis:names:tc:acal:1.0:function:x500Name-from-string`, `urn:oasis:names:tc:acal:1.0:function:rfc822Name-from-string`, `urn:oasis:names:tc:acal:1.0:function:ipAddress-from-string` or `urn:oasis:names:tc:acal:1.0:function:dnsName-from-string` respectively ([[ACAL-Core-1.0](#acal-core-10)] Annex C.3.9) to that `string` value, using the same rule those functions use elsewhere in a policy for which strings are valid lexical representations of the target data type; if the applicable function evaluates to `Indeterminate`, that is a conversion error for the purpose of the following paragraph, not the `syntax-error` result the function itself would give elsewhere in a policy. An item that is an atomic value of any other type satisfies none of the cases of this step.

&nbsp;
: If an item is neither a node nor an atomic value (for example a map, an array or a function), or if a constructor function raises an error for an item, or if one of the `*-from-string` functions named above evaluates to `Indeterminate` for an item, then an error has occurred when converting the values returned by the expression, and the result of the attribute selector MUST be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`, as specified in [[ACAL-Core-1.0](#acal-core-10)] section 8.4.7. That result takes precedence over the result specified for an item that satisfies none of the cases of this step.

&nbsp;
: If the specified data type is `urn:oasis:names:tc:acal:1.0:data-type:entity`, and every item of the sequence is an element node, then convert each node to an `EntityType` object. Each object SHALL have a `Content` property and SHALL NOT have an `Attribute` property. The child element of the `Content`'s `Body` property SHALL be a copy of the element corresponding to the node, along with its entire content, plus whatever namespace declarations from ancestor elements as are required to define namespace prefixes used in the content. Namespace declarations from ancestor elements that are not visibly used in the content MAY be added. If some item of the sequence is not an element node, the result satisfies none of the cases of this step.

&nbsp;
: For any other data type, the rules of [[ACAL-Core-1.0](#acal-core-10)] section 8.4.7 for a data type for which the profile defines no conversion apply. The same section also specifies the result of the attribute selector when the result satisfies none of the cases of this step.

---


# 8 Safety, Security, and Data Protection Considerations


Refer to [[ACAL-Core-1.0](#acal-core-10)] Section 10.

---


# 9 Conformance


## 9.1 Introduction

The specification addresses the following aspect of conformance:

The specification defines a number of functions, etc. that have somewhat special applications, therefore they are not required to be implemented in an implementation that claims to conform to this specification.

## 9.2 Conformance Tables

This section lists those portions of the specification that MUST be included in an implementation of a PDP that claims to conform to this profile.

: Note: "M" means mandatory-to-implement. "O" means optional.

The implementation MUST follow [Section 5](#5-structures), [Section 6](#6-xpath-definitions), [Section 7](#7-attribute-selector-evaluation), [Annex C](#annex-c-data-types-and-functions), [Annex D](#annex-d-acal-identifiers) where they apply to implemented items in the following tables.

Many of these items are associated with versions of XACML preceding ACAL but have been assigned new identifiers with the `urn:oasis:names:tc:acal:1.0:` prefix. The older XACML identifiers have been listed in the tables as deprecated identifiers. Implementations MUST support a new identifier defined in this specification but MAY recognize the corresponding deprecated identifier as equivalent. It is RECOMMENDED that these deprecated identifiers not be used in new policies and requests; they are planned to be removed in a subsequent version of ACAL. Note that some items appear to be carried over from a preceding version of XACML but do not list the XACML identifier. This is because ACAL has redefined the item in some way that means it is no longer identical to the original definition in XACML, and so the identifiers can no longer be considered equivalent. Items new to ACAL 1.0 will also not list an XACML identifier.

### 9.2.1 Object Types

The implementation MUST support the object types that are marked `M`.

| Object Type | M/O |
| :--- | :--- |
| NamespaceDeclarationsType | O |
| XPathAttributeSelectorType | M |
| XPathEntityAttributeSelectorType | O |
| XPathExpressionValueType | O |
| XPathPolicyDefaultsType | M |
| XPathRequestDefaultsType | O |

`XPathPolicyDefaultsType` is mandatory because `XPathAttributeSelectorType` is: a selector `Path` has no local version and resolves it from the nearest enclosing policy's `XPathPolicyDefaultsType` ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype)). `XPathRequestDefaultsType` is optional in step with `XPathExpressionValueType`, its only consumer; an implementation that supports `xpathExpression` values in a `Request` supports it too.

### 9.2.2 Data Types

The implementation MUST support the data types associated with the following identifiers marked `M`.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:data-type:xpathExpression | O | urn:oasis:names:tc:xacml:3.0:data-type:xpathExpression |

### 9.2.3 Functions

The implementation MUST properly process those functions associated with the identifiers marked with an `M`.

| Function | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:function:xpath-node-count | O | urn:oasis:names:tc:xacml:3.0:function:xpath-node-count |
| urn:oasis:names:tc:acal:1.0:function:xpath-node-equal | O | urn:oasis:names:tc:xacml:3.0:function:xpath-node-equal |
| urn:oasis:names:tc:acal:1.0:function:xpath-node-match | O | |

### 9.2.4 Attributes

The implementation MUST use the attributes associated with the following identifiers in the way this profile has defined (see [Annex D.3](#d3-attributes)). This requirement pertains primarily to implementations of a PAP or PEP that uses ACAL, since the semantics of the attribute are transparent to the PDP.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:content-selector | O | urn:oasis:names:tc:xacml:3.0:content-selector |

This attribute is OPTIONAL because its value is of the OPTIONAL data type `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` (see [Section 9.2.2](#922-data-types)). An implementation that supports that data type and the `ContextSelectorId` property of `XPathAttributeSelectorType` SHOULD recognize this identifier.

---


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


This document is provided under the [RF on Limited Terms](https://www.oasis-open.org/policies-guidelines/ipr/#RF-on-Limited-Mode) IPR mode that was chosen when the project was established, as defined in the IPR Policy. For information on whether any patents have been disclosed that may be essential to implementing this document, and any offers of patent licensing terms, please refer to the Intellectual Property Rights section of the project's web page ([OASIS ACAL \[XACML\] TC IPR page](https://www.oasis-open.org/committees/acal/ipr.php)).


This document and the information contained herein is provided on an "AS IS" basis and OASIS DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION HEREIN WILL NOT INFRINGE ANY OWNERSHIP RIGHTS OR ANY IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. OASIS AND ITS MEMBERS WILL NOT BE LIABLE FOR ANY DIRECT, INDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF ANY USE OF THIS DOCUMENT OR ANY PART THEREOF.


As stated in the OASIS IPR Policy, the following three paragraphs in brackets apply to OASIS Standards Final Deliverable documents (Committee Specifications, OASIS Standards, or Approved Errata).


OASIS requests that any OASIS Party or any other party that believes it has patent claims that would necessarily be infringed by implementations of this OASIS Standards Final Deliverable, to notify OASIS TC Administrator and provide an indication of its willingness to grant patent licenses to such patent claims in a manner consistent with the IPR Mode of the OASIS Technical Committee that produced this deliverable.


OASIS invites any party to contact the OASIS TC Administrator if it is aware of a claim of ownership of any patent claims that would necessarily be infringed by implementations of this OASIS Standards Final Deliverable by a patent holder that is not willing to provide a license to such patent claims in a manner consistent with the IPR Mode of the OASIS Technical Committee that produced this OASIS Standards Final Deliverable. OASIS may include such claims on its website, but disclaims any obligation to do so.


OASIS takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this OASIS Standards Final Deliverable or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any effort to identify any such rights. Information on OASIS' procedures with respect to rights in any document or deliverable produced by an OASIS Technical Committee can be found on the OASIS website. Copies of claims of rights made available for publication and any assurances of licenses to be made available, or the result of an attempt made to obtain a general license or permission for the use of such proprietary rights by implementers or users of this OASIS Standards Final Deliverable, can be obtained from the OASIS TC Administrator. OASIS makes no representation that any information or list of intellectual property rights will at any time be complete, or that any claims in such list are, in fact, Essential Claims.


The name "OASIS" is a trademark of OASIS, the owner and developer of this document, and should be used only to refer to the organization and its official outputs. OASIS welcomes reference to, and implementation and use of, its documents, while reserving the right to enforce its marks against misleading uses. Please see [OASIS Trademark Policy](https://www.oasis-open.org/policies-guidelines/trademark/) for guidance.


---


# Annex B References


(This annex forms an integral part of this Specification.)


This section contains the normative and informative references that are used in this document. 


Normative references are specific (identified by date of publication and/or edition number or version number) and Informative references are either specific or non-specific. For specific references, only the cited version applies. For non-specific references, the latest version of the reference document (including any amendments) applies. While any hyperlinks included in this section were valid at the time of publication, OASIS cannot guarantee their long term validity.


## B.1 Normative References


The following documents are referenced in such a way that some or all of their content constitutes requirements of this document.

###### [ACAL-Core-1.0]

_Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html

###### [JACAL-Core-1.0]

_JACAL, Version 1.0 (JSON Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/jacal/core/v1.0/acal-core-json-v1.0.html

###### [exc-c14n]

J. Boyer et al, eds., Exclusive XML Canonicalization, Version 1.0, W3C Recommendation 18 July 2002, https://www.w3.org/TR/2002/REC-xml-exc-c14n-20020718/

###### [INFOSET]

XML Information Set (Second Edition), W3C Recommendation, 4 February 2004, https://www.w3.org/TR/xml-infoset/

###### [NAMESPACES]

Bray, Tim, et.al. eds, Namespaces in XML 1.0 (Third Edition), W3C Recommendation 8 December 2009, available at https://www.w3.org/TR/2009/REC-xml-names-20091208/

###### [RFC2119]

RFC 2119, *Key Words for Use in RFCs to Indicate Requirement Levels*, BCP 14, RFC 2119, March 1997. [Online]. Available: https://www.rfc-editor.org/info/rfc2119

###### [RFC8174]

RFC 8174, *Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words*, BCP 14, RFC 8174, May 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8174

###### [XF]

XPath and XQuery Functions and Operators 3.1, 21 March 2017, https://www.w3.org/TR/2017/REC-xpath-functions-31-20170321/

###### [XML]

Bray, Tim, et.al. eds, Extensible Markup Language (XML) 1.0 (Fifth Edition), W3C Recommendation 26 November 2008, https://www.w3.org/TR/2008/REC-xml-20081126/

###### [XS]

XML Schema 1.1, parts 1 and 2. Available at: https://www.w3.org/TR/xmlschema11-1/ and https://www.w3.org/TR/xmlschema11-2/

###### [XPath]

XML Path Language (XPath) 3.1, W3C Recommendation 21 March 2017, https://www.w3.org/TR/xpath-31/

###### [XACML-Core-4.0]

_XACML, Version 4.0 (eXtensible Access Control Markup Language)_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html

###### [YACAL-Core-1.0]

_YACAL, Version 1.0 (YAML Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.html

## B.2 Informative References


The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [RFC8259]

Bray, T., Ed., "The JavaScript Object Notation (JSON) Data Interchange Format", STD 90, RFC 8259, DOI 10.17487/RFC8259, December 2017, <https://www.rfc-editor.org/info/rfc8259>.

###### [Hier]

XACML v3.0 Hierarchical Resource Profile Version 1.0. 18 May 2014. Committee Specification 02. https://docs.oasis-open.org/xacml/3.0/hierarchical/v1.0/xacml-3.0-hierarchical-v1.0.html

###### [XACML]

_eXtensible Access Control Markup Language (XACML) Version 3.0 Plus Errata 01_. Edited by Erik Rissanen. OASIS Standard incorporating Approved Errata. https://docs.oasis-open.org/xacml/3.0/xacml-3.0-core-spec-en.html.

# Annex C Data Types and Functions


(This annex forms an integral part of this Specification.)


## C.1 Introduction

This section specifies the data types and functions used in ACAL to create predicates for conditions and targets.
This specification combines the various standards set forth by IEEE and ANSI for string representation of numeric values, as well as the evaluation of arithmetic functions. The standard functions are named and their operational semantics are described.


## C.2 Data Types

Although a syntactic representation of ACAL objects may represent most data types as strings, an ACAL PDP MUST operate on types of data that, while they have string representations, are not just strings. Types such as `Boolean`, `Integer`, and `Double` MUST be converted from their string representations to values that can be compared with values in their domain of discourse, such as numbers. The following data types are specified for use with ACAL and have explicit data representations:

* `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression`.


### C.2.1 XPath Expression

_**Support for this data-type is OPTIONAL.**_

The `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` data type represents an XPath expression over the XML in a `ContentType` object. The syntax is defined by the XPath W3C recommendation. The content of this data-type also includes the XPath version the expression is evaluated against and the context in which its namespace prefixes are resolved, which distinguishes it from a plain string, plus the ACAL attribute category of the `ContentType` object to which it applies. Once a value is constructed it has one resolved effective XPath version and one resolved namespace context, and neither is re-resolved if the value is later moved or copied. On the wire, in a `Request` or a `Policy`, the version may be abbreviated: a value with no local `XPathVersion` takes it from the applicable `XPathRequestDefaultsType`/`XPathPolicyDefaultsType` object ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype), [Section 5.3.2](#532-requestdefaultstype-extension---xpathrequestdefaultstype)); a value in a decision response, or with no applicable Defaults object, carries its `XPathVersion` locally (see [Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype) for the full rule). The namespace context is the value's own `Namespaces` property in a non-XML representation and the value element's ordinary [in-scope namespaces] [[INFOSET](#infoset)] in XML, with the implementation that materializes a value into a new document responsible for carrying that context across (see [Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)). An XML attribute called `XPathCategory` gives the category of the `ContentType` object where the expression applies.

The XPath expression MUST be evaluated in a context which is equivalent of a stand alone XML document with the only child of the `ContentType` object's `Body` property value as the document element. The context node of the XPath expression is the document node of this standalone document. Namespace declarations from the `ContentType` object and its ancestor elements for namespace prefixes that are "visibly utilized", as defined by [[exc-c14n](#exc-c14n)], within the contents MUST be present. **In an XML representation, namespace declarations from the `<Body>` element or its ancestor elements for namespace prefixes that are not "visibly utilized" MAY be present.**

## C.3 Functions

Unless otherwise specified, if an argument of one of these functions were to evaluate to `Indeterminate`, then the function SHALL evaluate to `Indeterminate`.

Note that in each case an implementation is conformant as long as it produces the same result as is specified here, regardless of how and in what order the implementation behaves internally.


### C.3.1 XPath-based Functions

_**Supporting these functions is optional.**_

This section specifies functions that take XPath expressions for arguments. Each such expression is evaluated using the effective XPath version and the namespace context carried by the `xpathExpression` value ([Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)); its context node is the document node defined in [Annex C.2.1](#c21-xpath-expression) for the `ContentType` object of the value's `XPathCategory`.

An argument expression is expected to evaluate to a sequence of nodes. Each function below operates on the **set of distinct nodes** in that sequence: two occurrences of the same node — the same node identity, the `is` relationship of [[XPath](#xpath)] — count once, and the order of the sequence is immaterial. Nodes and sets of nodes are not part of ACAL's formal data type system; they exist only within the evaluation of these functions, and every comparison or other operation on them is local to the evaluation of the particular function.

The following apply to every function in this section, in the order given:

1. An argument expression whose category's `ContentType` object is not present in the request contributes no nodes; steps 2 and 3 consider only the remaining ("present") argument expressions.
2. If evaluating a present argument expression raises an XPath error, the function SHALL evaluate to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error` — the same rule [Section 6](#6-xpath-definitions) states for an XPath error in an attribute selector.
3. If a present argument expression evaluates to a sequence that contains an item which is not a node, the function SHALL evaluate to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.
4. Otherwise the function is computed over the set of nodes each argument selects. An argument that selects no nodes — whether by step 1, or because its expression matched nothing — contributes the empty set: `xpath-node-count` then returns zero, and `xpath-node-equal` and `xpath-node-match` return `false` whenever *either* argument's set is empty. (For the cases that reach this step, this generalizes [[XACML 3.0](#xacml)]'s rule that an absent `ContentType` makes `xpath-node-count` return zero and the comparison functions return `false`.)

The following functions are defined:

`urn:oasis:names:tc:acal:1.0:function:xpath-node-count`

: This function SHALL take an `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` as an argument and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:integer`. The value returned from the function SHALL be the number of distinct nodes selected by the given XPath expression (see step 4 of the preamble for the case where the expression selects no nodes).

`urn:oasis:names:tc:acal:1.0:function:xpath-node-equal`

: This function SHALL take two `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` arguments and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL return `true` if some node selected by the first argument is the same node as some node selected by the second argument — that is, if the two nodes have the same identity (the `is` relationship of [[XPath](#xpath)]) — and `false` otherwise (including whenever either argument selects no nodes; see step 4 of the preamble).

`urn:oasis:names:tc:acal:1.0:function:xpath-node-match`

: This function SHALL take two `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` arguments and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL return `true` if either of the following holds: (1) some node selected by the first argument is the same node as some node selected by the second argument; (2) some node selected by the **first** argument is a descendant of some node selected by the **second** argument. Node sameness is node identity (the `is` relationship of [[XPath](#xpath)]). The function SHALL return `false` if neither condition holds, including whenever either argument selects no nodes (see step 4 of the preamble). Note: condition (1) is equivalent to `xpath-node-equal`, so `xpath-node-equal` is a special case of `xpath-node-match`. The first argument is the candidate node(s) being tested; the second is the node(s) it is tested against — the same candidate-first, pattern-second order [[ACAL-Core-1.0](#acal-core-10)] uses for `x500Name-match` and `rfc822Name-match` (see that document's Appendix 2, "the arguments to each of the following functions have been swapped"), and the reverse of the ancestor-first order [[XACML 3.0](#xacml)]'s `xpath-node-match` used.


# Annex D ACAL Identifiers


(This annex forms an integral part of this Specification.)

This section defines standard identifiers for commonly used definitions.

## D.1 ACAL Namespaces

This ACAL Profile is defined using this identifier.

`urn:oasis:names:tc:acal:1.0:xpath:schema`

## D.2 Data Types

The following identifiers indicate data types that are defined in [Annex C.2](#c2-data-types):

* `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression`.

## D.3 Attributes

This profile defines the following standard attribute identifier.

This attribute identifies a node of the XML document in the `Body` property of the `Content` object of the `RequestEntityType` object in which the attribute appears:

`urn:oasis:names:tc:acal:1.0:content-selector`

: The corresponding ACAL attribute SHALL have a single value of data type `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` (see [Annex C.2.1](#c21-xpath-expression)), and the XPath expression represented by that value SHALL select a single node of that XML document. As with any value of that data type, the `XPathCategory` property of the value gives the `Category` of the `RequestEntityType` object holding the `Content` object to which the expression applies.

: This is the standard attribute identifier for use as the value of the `ContextSelectorId` property of an `XPathAttributeSelectorType` or `XPathEntityAttributeSelectorType` object (see [Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype)). Use of this identifier is RECOMMENDED where no more specific attribute applies; `ContextSelectorId` MAY name any other attribute satisfying the conditions stated in [Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype).

In [[XACML 3.0](#xacml)] the corresponding identifier `urn:oasis:names:tc:xacml:3.0:content-selector` is defined by the XACML v3.0 Hierarchical Resource Profile [[Hier](#hier)], although it is consumed by the `ContextSelectorId` mechanism of XACML core. ACAL reverses that arrangement and defines the identifier here, alongside the mechanism that consumes it, because the identifier is not specific to hierarchical resources. An ACAL Profile for Hierarchical Resources is expected to reference this definition rather than restate it.

---

# Annex E How to generate HTML and PDF versions

(This annex does not form an integral part of this Specification and is informational.)

## Online generation

HTML/PDF versions are generated automatically online via Github Actions after each update pushed to the main branch of [OASIS ACAL \[XACML\] TC Github repository](https://github.com/oasis-tcs/acal-spec/). Go to  Github Actions on the github repository, then go to the latest workflow run, and, if the run succeeded, the summary should display the links to the generated HTML/PDF documents.

## Offline generation

### Prerequisites

The following tools are required:
- [Pandoc](https://pandoc.org/) **v3.2.1 or later** ( [latest release](https://github.com/jgm/pandoc/releases/latest) );
- [Pandoc-include filter](https://github.com/DCsunset/pandoc-include);
- [PlantUML](https://plantuml.com/starting) and [Graphviz](https://graphviz.org/), for the UML diagrams.

Install them on your system.

Git clone or get a local copy of [OASIS ACAL \[XACML\] TC Github repository](https://github.com/oasis-tcs/acal-spec/), open a terminal and **change your working directory to the root directory of your local copy of the repository**.

### CSS stylesheet

The generation command uses the CSS stylesheet file `pandoc/styles/markdown-styles-v1.7.3b.css` (with `-c` argument) based on the [v1.7.3a](https://docs.oasis-open.org/templates/css/markdown-styles-v1.7.3a.css) provided by OASIS.

### HTML generation

Run the following command line to generate the HTML from this markdown file (input file specified as last argument):

```console
$ pandoc/mkdocs.sh --number-lines --output /tmp acal-xpath-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

The publication date is automatically set to the current date by default (using Lua filter `pandoc/meta_vars.lua`). However, you may set a specific date of your choice instead, by adding the argument `--metadata date="My date in the form DD Month YYYY"` at the end of the command. 

### PDF generation

For PDF output, add the `--pdf` option as follows:

```console
$ pandoc/mkdocs.sh --number-lines --pdf --output /tmp acal-xpath-v%version%.md
```

The HTML file is generated like the previous command and, in addition, a PDF file is generated with the same name as the input file except the `.md` extension is replaced with `.pdf` in this case.

Beware that **the result PDF - the embedded fonts in particular - may differ depending on the system/machine** where you run this command. Mainly, it depends on which fonts are actually installed on the system, as the HTML-to-PDF converter (Chrome / Chromium in this case) selects available fonts according to the prioritized lists defined by `font-family` properties in the CSS.

**For official TC publications**, add the `--official` argument to avoid this issue and produce a system-independent output:

```console
$ pandoc/mkdocs.sh --number-lines --pdf --official --output /tmp acal-xpath-v%version%.md
```

In this case, the generation will use a public Linux container image (`ghcr.io/oasis-tcs/chrome-headless`) with a fixed installed set of fonts to generate the PDF.


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


---


# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)


The changes made since the previous version (Committee Specification Draft 01) are the following. Section numbers refer to this version; most of these changes are described further in the list of differences from XACML 3.0 below.

- XPath 1.0 is no longer a supported XPath version, and the `xpath10` short identifier is removed from this profile's short identifier sets (the JSON set also names its entries with the `ShortId` property, as JACAL defines, instead of `ShortIdentifier`); [Section 6](#6-xpath-definitions) now states explicitly that XACML 3.0's XPath 2.0 identifier is not a valid `XPathVersion` value; and the XPath 3.0 and 3.1 identifiers use `https://` ([Section 6](#6-xpath-definitions)).
- The namespace context of an XPath expression is carried by the `xpathExpression` value or the selector itself (`NamespaceDeclarationsType`, [Section 5.2](#52-namespacedeclarationstype-optional)), represented in JACAL and YACAL as a single mapping from prefix to namespace name; `XPathPolicyDefaultsType` and `XPathRequestDefaultsType` no longer have a `Namespace` property.
- A conformance table for the attributes this profile defines is added ([Section 9.2.4](#924-attributes)), and `NamespaceDeclarationsType` is listed as an optional object type ([Section 9.2.1](#921-object-types)).
- `XPathExpressionValueType` is now a subtype of `StructuredValueType` (csd01: `SimpleValueType`), and an `xpathExpression` value may carry its own `XPathVersion` ([Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)). `XPathPolicyDefaultsType` also applies to nested policies ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype)); `XPathRequestDefaultsType` applies only to the `xpathExpression` values in the request and is now optional to implement ([Section 5.3.2](#532-requestdefaultstype-extension---xpathrequestdefaultstype), [Section 9.2.1](#921-object-types)). The `XPathDefaultsType` alternative is removed.
- The conversion of an attribute selector's XPath result to ACAL values moves from [[ACAL-Core-1.0](#acal-core-10)] to this profile ([Section 7](#7-attribute-selector-evaluation)), and the conversion of an ACAL variable's value to an XPath variable is specified ([Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype)).
- `xs:integer` operations no longer have a modulo mode; an implementation's integer limit is the supported integer interval of [[ACAL-Core-1.0](#acal-core-10)] ([Section 6](#6-xpath-definitions)).
- The `content-selector` attribute identifier is defined by this profile ([Annex D.3](#d3-attributes)).
- The Scope no longer says that concrete representations are out of scope of this document: this profile now defines its extensions to the XML, JSON and YAML representations and provides the corresponding schemas and short identifier sets ([Section 1](#1-scope), Additional artifacts).
- In the worked examples of [Section 4.4](#44-example), Rules 2 and 3 pass the `xpath-node-match` arguments in the order [Annex C.3.1](#c31-xpath-based-functions) defines (candidate node first); they had been missed when the arguments were swapped. In the same examples, each `content-selector` attribute designator declares the `xpathExpression` data type (without it the designator defaulted to `string`), and Rule 2 uses `date-less-than` in place of the undefined `date-less-or-equal` and tests the subject's `parent-guardian-id` attribute (it tested `physician-id`, which a parent or guardian does not have) against the record's `<md:parentGuardianId>`, as in [[XACML 3.0](#xacml)].
- The XPath-based functions are restated for the sequence-of-items data model, and the arguments of `xpath-node-match` are swapped ([Annex C.3.1](#c31-xpath-based-functions)), so its XACML 3.0 identifier is no longer listed as an equivalent deprecated identifier ([Section 9.2.3](#923-functions)).
- Requirement keywords previously written in lowercase are written in uppercase, with the wording otherwise unchanged ([Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype), [Section 7](#7-attribute-selector-evaluation), [Annex C.2](#c2-data-types)), and [Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype) states the syntax-error outcome for a missing XPath version as a MUST with its status code.
- [Annex E](#annex-e-how-to-generate-html-and-pdf-versions) describes online generation by the repository's GitHub Actions workflow and offline generation with `pandoc/mkdocs.sh`, lists the tools that script requires, and no longer describes a Docker alternative.
- Editorial: the Technical Committee is renamed, and document and repository URLs are updated accordingly; and the references, citations and cross-references are corrected.

The remainder of this appendix describes how this profile differs from XACML 3.0.

This ACAL Profile is a successor to the set of XPath-based features of [[XACML 3.0](#xacml)]. This profile differs from XACML 3.0's original XPath features in the following ways:

- Like [[ACAL-Core-1.0](#acal-core-10)] core model, this profile's constructs can be represented in JSON, YAML or XML at the implementor's discretion.

- `AttributeSelector` has become abstract to support other kinds of AttributeSelector (e.g. JSONPath-based) and the former XPath-based AttributeSelectorType becomes the subtype `XPathAttributeSelectorType`
- Compared to XACML 3.0 AttributeSelectorType, `XPathAttributeSelectorType` supports a new feature:

   * `Path` expression (XPath) can use *ACAL* variables from `VariableDefinition`s as XPath variables.

- XPath versions: 
  - Dropped XPath 1.0: it is not a supported XPath version for ACAL (it was an option in [[XACML 3.0](#xacml)]), and its identifier `https://www.w3.org/TR/1999/REC-xpath-19991116/` is not a valid ACAL `XPathVersion` value. XPath 1.0's result data model is incompatible with the sequence-of-items model the rest of this profile assumes (see [Section 6](#6-xpath-definitions)).
  - Replaced XACML 3.0's XPath 2.0 identifier `http://www.w3.org/TR/2007/REC-xpath20-20070123` with `https://www.w3.org/TR/xpath20/`; the old identifier is not a valid ACAL value and is not a recognized alias (see [Section 6](#6-xpath-definitions)), so an XACML 3.0 → ACAL translation substitutes it.
  - Added support for XPath 3.0 and 3.1.

- Deprecated prefixes `urn:oasis:names:tc:xacml:` and `https://www.w3.org/2001/XMLSchema#` in favor of `urn:oasis:names:tc:acal:` for all standard identifiers (algorithms, status codes, data-types, functions, attributes and categories)

- Namespace prefix bindings for an `xpathExpression` value, and for an `XPathAttributeSelectorType`/`XPathEntityAttributeSelectorType` object, are no longer resolved from a single Request- or Policy-wide table (see [Section 5.2](#52-namespacedeclarationstype-optional)): in a non-XML representation the expression carries its own `Namespaces` mapping — optional, and absent when the expression needs no prefix bindings — and in XML the prefixes resolve from the ordinary XML in-scope namespaces of its element (ancestor declarations included), as in [[XACML 3.0](#xacml)]. Because XML nested-scope declarations permit the same prefix to be bound to different namespace names in different parts of one document, a single global table cannot always represent that faithfully. This matches the JSON Profile of XACML 3.0, which likewise attached namespace bindings to each `xpathExpression` value rather than to a document-wide table; an earlier draft of *this* profile diverged from that by adding a Request-wide `XPathRequestDefaultsType` namespace table, now removed. `XPathRequestDefaultsType` and `XPathPolicyDefaultsType` survive as `XPathVersion`-only ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype), [Section 5.3.2](#532-requestdefaultstype-extension---xpathrequestdefaultstype)).

- An `xpathExpression` value MAY now carry its own `XPathVersion` ([Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)). In a `Request` or `Policy` the property is optional and defaults from the applicable `XPathRequestDefaultsType`/`XPathPolicyDefaultsType` object (for a policy, the nearest enclosing one — see the next bullet), as in [[XACML 3.0](#xacml)]; a value in a decision response (`Notice`, `AttributeAssignment`), or one with no applicable Defaults object, carries it locally. The version is resolved once, when the value is constructed, and does not change if the value is later moved or copied. [[XACML 3.0](#xacml)] could already carry an `xpathExpression` in an obligation or advice `AttributeAssignment`, but it had no per-value XPath version and defined no XPath-version default on a response — so a response-side value had no specified version. This closes that gap without forcing every request-side value to restate a version its `Request` already establishes. A response-side value does **not** inherit the version of the request that produced it: a response can be logged, forwarded, or evaluated apart from its request, so the version travels in the value itself.

- `XPathPolicyDefaultsType` applies to nested policies: an attribute selector's `Path`, or a version-less `xpathExpression` value, in a policy that carries no `XPathPolicyDefaultsType` of its own takes its version from the nearest enclosing policy that has one ([Section 5.3.1](#531-policydefaultstype-extension---xpathpolicydefaultstype), [Section 5.3.5](#535-datatype-extension---xpathexpressionvaluetype)). This follows [[ACAL-Core-1.0](#acal-core-10)] Section 7.4, whose `PolicyDefaults` scope was clarified to extend into nested policies, matching the `VariableDefinition` scope rule already stated there. XACML 3.0 has no nested `<Policy>` (only nested `<PolicySet>`), so this case did not arise; there remains no fixed profile-wide default — an expression with no `XPathPolicyDefaultsType` anywhere up its chain and no local `XPathVersion` is a syntax error. A policy included by a `PolicyReference` is not nested within the referencing policy, so a referenced policy does not use the referencing policy's `XPathPolicyDefaultsType`.

- The `content-selector` attribute identifier is defined by this profile ([Annex D.3](#d3-attributes)), whereas its XACML 3.0 counterpart `urn:oasis:names:tc:xacml:3.0:content-selector` is defined by the XACML v3.0 Hierarchical Resource Profile [[Hier](#hier)] even though it is consumed by the `ContextSelectorId` mechanism of XACML core. The identifier is not specific to hierarchical resources, so ACAL defines it alongside the mechanism that consumes it.

- The conversion of an attribute selector's XPath result to ACAL values, previously specified in [[ACAL-Core-1.0](#acal-core-10)] section 8.4.7, is now specified by this profile ([Section 7](#7-attribute-selector-evaluation) step 4), for the sequence-of-items result of the supported [[XPath](#xpath)] versions. Relative to the former Core table: (1) a sequence of several items now converts, each item to one value, including a mix of nodes and atomic values, and the bag keeps duplicates; (2) a node still converts through its string value, as before; (3) an atomic value converts only if its type is the requested XML Schema type or a type derived from it, or is `xs:untypedAtomic`, or — for `double` — is an `xs:float` or `xs:decimal` (including `xs:integer`), which the former Core table's Boolean-to-`boolean`, string-to-`string` and number-to-`integer`-or-`double` cases correspond to, except that a number that is not already of the requested type (for example a decimal or a double requested as `integer`) no longer converts and returns `syntax-error`, where the former table applied the `xs:integer()` constructor function to it and so truncated it; (4) a map, array or function item returns `processing-error`; (5) an empty sequence is governed by the empty-result rule of [[ACAL-Core-1.0](#acal-core-10)] section 8.4.7 before any conversion case is considered.

- `xs:integer` operations no longer have a modulo mode ([Section 6](#6-xpath-definitions)). An implementation's integer limit is the supported integer interval of [[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6, which includes at least −2<sup>63</sup> to 2<sup>63</sup>−1 and applies to every `xs:integer` operand and result within an XPath expression. An out-of-range arithmetic result raises [err:FOAR0002] and an out-of-range cast raises [err:FOCA0003], and either error returns `processing-error`.

- The ACAL-to-XPath conversion of the value(s) of an ACAL variable referenced by an XPath expression is now specified ([Section 5.3.3](#533-attributeselectortype-extension---xpathattributeselectortype)): a value of one of the twelve XML-Schema-defined data types becomes the atomic value of the same-named `xs` type, and a bag becomes a sequence in a specified order. The text it replaces pointed to [[ACAL-Core-1.0](#acal-core-10)] section 8.4.7, which contains no such conversion, and described a bag as an XPath array, which XPath 2.0 does not have.

- The XPath-based functions `xpath-node-count`, `xpath-node-equal` and `xpath-node-match` ([Annex C.3.1](#c31-xpath-based-functions)) are restated in terms of the data model of the supported [[XPath](#xpath)] versions — an argument expression yields a **sequence of nodes**, which each function treats as a set (repeated occurrences of the same node are ignored, order is immaterial), and node sameness is the `is` relationship — rather than the XPath 1.0 "node-set" vocabulary [[XACML 3.0](#xacml)] inherited, XPath 1.0 no longer being a supported version ([Section 6](#6-xpath-definitions)). Two cases [[XACML 3.0](#xacml)] left unstated are now defined: an argument expression that raises an XPath error, and one that evaluates to a sequence containing a non-node item, each makes the function return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`. The absent-`ContentType` case is generalized to "an argument that selects no nodes" (the previous zero / `false` results still follow when no present argument raises an XPath error or yields a non-node item). The functions' results are otherwise unchanged for any expression that evaluates to nodes.

- `xpath-node-match`'s arguments are swapped relative to [[XACML 3.0](#xacml)]'s `xpath-node-match`: the first argument is now the candidate node(s), the second the node(s) it is tested against (ancestor-or-self), matching the candidate-first, pattern-second order [[ACAL-Core-1.0](#acal-core-10)] already uses for `x500Name-match` and `rfc822Name-match`. `xpath-node-count` and `xpath-node-equal` are unaffected — the latter's "any node equal to any node" test is symmetric in its arguments.

## Revision History

Latest revision history can be obtained from [OASIS ACAL \[XACML\] TC's code repository](https://github.com/oasis-tcs/acal-spec/blob/v%version%-%stage_revision%/acal-xpath-v%version%-%stage_revision%.md).


<!-- The following centered line represents the end of the document -->  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
