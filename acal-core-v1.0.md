---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: Attribute-Centric Authorization Language (ACAL) Version 1.0
subtitle: Committee Specification Draft 02
version: "1.0"
stage_revision: csd02 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access", "authorization", "ABAC", "policylanguage", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version

- https://docs.oasis-open.org/acal/acal/core/v%version%/%stage_revision%/acal-core-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/core/v%version%/%stage_revision%/acal-core-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/acal/acal/core/v%version%/%stage_revision%/acal-core-v%version%-%stage_revision%.md

### Previous version

- https://docs.oasis-open.org/acal/acal/core/v1.0/csd01/acal-core-v1.0-csd01.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/core/v1.0/csd01/acal-core-v1.0-csd01.pdf
- https://docs.oasis-open.org/acal/acal/core/v1.0/csd01/acal-core-v1.0-csd01.md

### Latest version

- https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.pdf
- https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.md


### Technical Committee

[OASIS Attribute-Centric Authorization Language (ACAL) \[supersedes XACML\]](https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=67afe552-0921-49b7-9a85-018dc7d3ef1d)


### Chairs

- Bill Parducci (bill@parducci.net), Individual


### Secretaries

- Bill Parducci (bill@parducci.net), Individual 


### Editors

- Steven Legg (steven.legg@viewds.com), ViewDS Identity Solutions
- Cyril Dangerville (cyril.dangerville@thalesgroup.com), THALES
- Bill Parducci (bill@parducci.net), Individual


### Abstract

This specification defines Version %version% of the Attribute-Centric Authorization Language's core model. This model is essentially an XML-agnostic evolution of [XACML v3.0](#xacml) that provides a common foundation for other concrete representation formats to come (e.g. JSON).


### Citation Format

When referencing this document, the following citation format should be used:

**[ACAL-Core-1.0]**
_%title%_.
Edited by Steven Legg, Cyril Dangerville and Bill Parducci. %date%. OASIS %subtitle%. https://docs.oasis-open.org/acal/acal/core/v%version%/%stage_revision%/acal-core-v%version%-%stage_revision%.html . Latest version: https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html


### Related Work

This document replaces or supersedes:

- _eXtensible Access Control Markup Language (XACML) Version 3.0 Plus Errata 01_. Edited by Erik Rissanen. OASIS Standard incorporating Approved Errata. https://docs.oasis-open.org/xacml/3.0/xacml-3.0-core-spec-en.html.


This document is related to:

- _JACAL Version 1.0 (JSON Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/jacal/core/v1.0/acal-core-json-v1.0.html
- _XACML Version 4.0 (eXtensible Access Control Markup Language)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html
- _YACAL Version 1.0 (YAML Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.html


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
  - [4.2 Rule and Policy Combining](#42-rule-and-policy-combining)
  - [4.3 Combining Algorithms](#43-combining-algorithms)
  - [4.4 Multiple Subjects](#44-multiple-subjects)
  - [4.5 Policies Based on Subject and Resource Attributes](#45-policies-based-on-subject-and-resource-attributes)
  - [4.6 Multi-Valued Attributes](#46-multi-valued-attributes)
  - [4.7 Policies Based on Subject and Resource Contents](#47-policies-based-on-subject-and-resource-contents)
  - [4.8 Operators](#48-operators)
  - [4.9 Policy Distribution](#49-policy-distribution)
  - [4.10 Policy Indexing](#410-policy-indexing)
  - [4.11 Abstraction Layer](#411-abstraction-layer)
  - [4.12 Actions Performed in Conjunction with Enforcement](#412-actions-performed-in-conjunction-with-enforcement)
  - [4.13 Supplemental Information About a Decision](#413-supplemental-information-about-a-decision)
  - [4.14 Changes From the Previous Version](#414-changes-from-the-previous-version)
- [5 Models (non-normative)](#5-models-non-normative)
  - [5.1 Data-Flow Model](#51-data-flow-model)
  - [5.2 ACAL Context](#52-acal-context)
  - [5.3 Policy Language Model](#53-policy-language-model)
    - [5.3.1 Rule](#531-rule)
      - [5.3.1.1 Condition](#5311-condition)
      - [5.3.1.2 Effect](#5312-effect)
      - [5.3.1.3 Notice Expressions](#5313-notice-expressions)
    - [5.3.2 Policy](#532-policy)
      - [5.3.2.1 Policy Target](#5321-policy-target)
      - [5.3.2.2 Combining Algorithm](#5322-combining-algorithm)
      - [5.3.2.3 Notice Expressions](#5323-notice-expressions)
- [6 Examples (non-normative)](#6-examples-non-normative)
  - [6.1 Example One](#61-example-one)
    - [6.1.1 Example Policy](#611-example-policy)
    - [6.1.2 Example Decision Request](#612-example-decision-request)
    - [6.1.3 Example Response](#613-example-response)
  - [6.2 Example Two](#62-example-two)
    - [6.2.1 Example Plain-Language Rules](#621-example-plain-language-rules)
    - [6.2.2 Example Short Identifier Set](#622-example-short-identifier-set)
    - [6.2.3 Example Decision Request](#623-example-decision-request)
    - [6.2.4 Example ACAL Rule Instances](#624-example-acal-rule-instances)
      - [6.2.4.1 Rule 1](#6241-rule-1)
      - [6.2.4.2 Rule 2](#6242-rule-2)
      - [6.2.4.3 Rule 3](#6243-rule-3)
      - [6.2.4.4 Rule 4](#6244-rule-4)
      - [6.2.4.5 Example Policy with Nested Policies](#6245-example-policy-with-nested-policies)
- [7 Structures](#7-structures)
  - [7.1 Introduction](#71-introduction)
    - [7.1.1 Object Type](#711-object-type)
      - [7.1.1.1 Object constraints](#7111-object-constraints)
        - [7.1.1.1.1 Property-level constraints](#71111-property-level-constraints)
          - [7.1.1.1.1.1 UML native constraints](#711111-uml-native-constraints)
          - [7.1.1.1.1.2 OCL constraints](#711112-ocl-constraints)
        - [7.1.1.1.2 Object-level constraints](#71112-object-level-constraints)
    - [7.1.2 Simple Types](#712-simple-types)
      - [7.1.2.1 Standard UML primitive types (String, Boolean, Integer, Real)](#7121-standard-uml-primitive-types-string-boolean-integer-real)
      - [7.1.2.2 ACAL-defined UML stereotype(s) used in new primitive types](#7122-acal-defined-uml-stereotypes-used-in-new-primitive-types)
      - [7.1.2.3 ACAL-defined simple types](#7123-acal-defined-simple-types)
        - [7.1.2.3.1 URI](#71231-uri)
        - [7.1.2.3.2 NonNegativeInteger](#71232-nonnegativeinteger)
        - [7.1.2.3.3 Double](#71233-double)
        - [7.1.2.3.4 VersionType](#71234-versiontype)
        - [7.1.2.3.5 VersionMatchType](#71235-versionmatchtype)
        - [7.1.2.3.6 ShortIdNameType](#71236-shortidnametype)
        - [7.1.2.3.7 ShortIdValueType](#71237-shortidvaluetype)
        - [7.1.2.3.8 IdentifierType](#71238-identifiertype)
        - [7.1.2.3.9 LocalIdentifierType](#71239-localidentifiertype)
        - [7.1.2.3.10 AttributeSelectorPathType](#712310-attributeselectorpathtype)
        - [7.1.2.3.11 Name](#712311-name)
        - [7.1.2.3.12 EffectType](#712312-effecttype)
        - [7.1.2.3.13 DecisionType](#712313-decisiontype)
        - [7.1.2.3.14 MediaType (optional)](#712314-mediatype-optional)
        - [7.1.2.3.15 ContentEncodingType (optional)](#712315-contentencodingtype-optional) 
    - [7.1.3 Relationship to Concrete Representations](#713-relationship-to-concrete-representations)
  - [7.2 ShortIdSetType](#72-shortidsettype)
  - [7.3 ShortIdType](#73-shortidtype)
  - [7.4 PolicyType](#74-policytype)
  - [7.5 PolicyDefaultsType (optional)](#75-policydefaultstype-optional)
  - [7.6 ParameterType](#76-parametertype)
  - [7.7 BooleanExpressionType](#77-booleanexpressiontype)
  - [7.8 IdReferenceType](#78-idreferencetype)
  - [7.9 ExactMatchIdReferenceType (optional)](#79-exactmatchidreferencetype-optional)
  - [7.10 PatternMatchIdReferenceType](#710-patternmatchidreferencetype)
  - [7.11 PolicyReferenceType](#711-policyreferencetype)
  - [7.12 RuleType](#712-ruletype)
  - [7.13 VariableDefinitionType](#713-variabledefinitiontype)
  - [7.13b SharedVariableDefinitionType](#713b-sharedvariabledefinitiontype)
  - [7.14 ExpressionType](#714-expressiontype)
  - [7.15 ApplyType](#715-applytype)
  - [7.16 FunctionType](#716-functiontype)
  - [7.17 NamedAttributeDesignatorType](#717-namedattributedesignatortype)
  - [7.18 AttributeDesignatorType](#718-attributedesignatortype)
  - [7.19 EntityAttributeDesignatorType](#719-entityattributedesignatortype)
  - [7.20 BaseAttributeSelectorType (optional)](#720-baseattributeselectortype-optional)
  - [7.21 AttributeSelectorType (optional)](#721-attributeselectortype-optional)
  - [7.22 EntityAttributeSelectorType (optional)](#722-entityattributeselectortype-optional)
  - [7.23 ValueType](#723-valuetype)
  - [7.24 VariableReferenceType](#724-variablereferencetype)
  - [7.24b SharedVariableReferenceType](#724b-sharedvariablereferencetype)
  - [7.25 QuantifiedExpressionType (optional)](#725-quantifiedexpressiontype-optional)
    - [7.25.1 ForAny Expression](#7251-forany-expression)
    - [7.25.2 ForAll Expression](#7252-forall-expression)
    - [7.25.3 Map Expression](#7253-map-expression)
    - [7.25.4 Select Expression](#7254-select-expression)
  - [7.26 NoticeType](#726-noticetype)
  - [7.27 AttributeType](#727-attributetype)
  - [7.28 AttributeAssignmentType](#728-attributeassignmenttype)
  - [7.29 NoticeExpressionType](#729-noticeexpressiontype)
  - [7.30 AttributeAssignmentExpressionType](#730-attributeassignmentexpressiontype)
  - [7.31 RequestType](#731-requesttype)
  - [7.32 RequestDefaultsType (optional)](#732-requestdefaultstype-optional)
  - [7.33 RequestEntityType](#733-requestentitytype)
    - [7.33.1 Uniqueness Example (non-normative)](#7331-uniqueness-example-non-normative)
  - [7.34 ContentType (optional)](#734-contenttype-optional)
  - [7.35 RequestAttributeType](#735-requestattributetype)
  - [7.36 ResponseType](#736-responsetype)
  - [7.37 ResultType](#737-resulttype)
  - [7.38 MultiRequestsType (optional)](#738-multirequeststype-optional)
  - [7.39 RequestReferenceType (optional)](#739-requestreferencetype-optional)
  - [7.40 StatusType](#740-statustype)
  - [7.41 StatusCodeType](#741-statuscodetype)
  - [7.42 StatusDetailType (optional)](#742-statusdetailtype-optional)
  - [7.43 MissingAttributeDetailType](#743-missingattributedetailtype)
  - [7.44 ResultEntityType](#744-resultentitytype)
  - [7.45 EntityType](#745-entitytype)
  - [7.46 BundleType](#746-bundletype)
  - [7.47 ArgumentType and NamedArgumentType](#747-argumenttype-and-namedargumenttype)
- [8 Functional Requirements](#8-functional-requirements)
  - [8.1 Unicode Issues](#81-unicode-issues)
    - [8.1.1 Normalization](#811-normalization)
    - [8.1.2 Version of Unicode](#812-version-of-unicode)
  - [8.2 Policy Enforcement Point](#82-policy-enforcement-point)
    - [8.2.1 Base PEP](#821-base-pep)
    - [8.2.2 Deny-Biased PEP](#822-deny-biased-pep)
    - [8.2.3 Permit-Biased PEP](#823-permit-biased-pep)
  - [8.3 Identifier Evaluation](#83-identifier-evaluation)
    - [8.3.1 Identifier Examples (non-normative)](#831-identifier-examples-non-normative)
    - [8.3.2 Short Identifier Set Usage (non-normative)](#832-short-identifier-set-usage-non-normative)
  - [8.4 Attribute Evaluation](#84-attribute-evaluation)
    - [8.4.1 Structured Attributes](#841-structured-attributes)
    - [8.4.2 Attribute Bags](#842-attribute-bags)
    - [8.4.3 Multivalued Attributes](#843-multivalued-attributes)
    - [8.4.4 Attribute Matching](#844-attribute-matching)
    - [8.4.5 Attribute Retrieval](#845-attribute-retrieval)
    - [8.4.6 Environment Attributes](#846-environment-attributes)
    - [8.4.7 Selector Evaluation](#847-selector-evaluation)
  - [8.5 Expression Evaluation](#85-expression-evaluation)
  - [8.6 Arithmetic Evaluation](#86-arithmetic-evaluation)
  - [8.7 Target Evaluation](#87-target-evaluation)
  - [8.8 VariableReference Evaluation](#88-variablereference-evaluation)
  - [8.9 Condition Evaluation](#89-condition-evaluation)
  - [8.10 Extended Indeterminate](#810-extended-indeterminate)
  - [8.11 Rule Evaluation](#811-rule-evaluation)
  - [8.12 Policy Evaluation](#812-policy-evaluation)
  - [8.13 PolicyReference Evaluation](#813-policyreference-evaluation)
  - [8.14 Hierarchical Resources](#814-hierarchical-resources)
  - [8.15 Authorization Decision](#815-authorization-decision)
  - [8.16 Notices](#816-notices)
  - [8.17 Exception Handling](#817-exception-handling)
    - [8.17.1 Unsupported Functionality](#8171-unsupported-functionality)
    - [8.17.2 Syntax and Type Errors](#8172-syntax-and-type-errors)
    - [8.17.3 Missing Attributes](#8173-missing-attributes)
  - [8.18 Identifier Equality](#818-identifier-equality)
  - [8.19 Short Identifiers in Responses](#819-short-identifiers-in-responses)
- [9 ACAL Extensibility Points (non-normative)](#9-acal-extensibility-points-non-normative)
  - [9.1 Extensible Properties](#91-extensible-properties)
  - [9.2 Structured Attributes](#92-structured-attributes)
- [10 Safety, Security, and Data Protection Considerations](#10-safety-security-and-data-protection-considerations)
  - [10.1 Threat Model](#101-threat-model)
    - [10.1.1 Unauthorized Disclosure](#1011-unauthorized-disclosure)
    - [10.1.2 Message Replay](#1012-message-replay)
    - [10.1.3 Message Insertion](#1013-message-insertion)
    - [10.1.4 Message Deletion](#1014-message-deletion)
    - [10.1.5 Message Modification](#1015-message-modification)
    - [10.1.6 NotApplicable Results](#1016-notapplicable-results)
    - [10.1.7 Negative Rules](#1017-negative-rules)
    - [10.1.8 Denial of Service](#1018-denial-of-service)
    - [10.1.9 Implementation-Defined Integer Limits](#1019-implementation-defined-integer-limits)
  - [10.2 Safeguards](#102-safeguards)
    - [10.2.1 Authentication](#1021-authentication)
    - [10.2.2 Policy Administration](#1022-policy-administration)
    - [10.2.3 Confidentiality](#1023-confidentiality)
      - [10.2.3.1 Communication Confidentiality](#10231-communication-confidentiality)
      - [10.2.3.2 Statement Level Confidentiality](#10232-statement-level-confidentiality)
    - [10.2.4 Policy Integrity](#1024-policy-integrity)
    - [10.2.5 Policy Identifiers](#1025-policy-identifiers)
    - [10.2.6 Trust Model](#1026-trust-model)
    - [10.2.7 Privacy](#1027-privacy)
  - [10.3 Unicode Security Issues](#103-unicode-security-issues)
  - [10.4 Identifier Equality](#104-identifier-equality)
- [11 Conformance](#11-conformance)
  - [11.1 Introduction](#111-introduction)
  - [11.2 Conformance Tables](#112-conformance-tables)
    - [11.2.1 Object Types](#1121-object-types)
    - [11.2.2 Identifier Prefixes](#1122-identifier-prefixes)
    - [11.2.3 Algorithms](#1123-algorithms)
    - [11.2.4 Status Codes](#1124-status-codes)
    - [11.2.5 Environment Attributes](#1125-environment-attributes)
    - [11.2.6 Attributes and Categories](#1126-attributes-and-categories)
    - [11.2.7 Data Types](#1127-data-types)
    - [11.2.8 Functions](#1128-functions)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
  - [B.2 Informative References](#b2-informative-references)
- [Annex C Data Types and Functions](#annex-c-data-types-and-functions)
  - [C.1 Introduction](#c1-introduction)
  - [C.2 Data Types](#c2-data-types)
    - [C.2.1 X.500 Directory Name](#c21-x500-directory-name)
    - [C.2.2 RFC 822 Name](#c22-rfc-822-name)
    - [C.2.3 IP Address](#c23-ip-address)
    - [C.2.4 DNS Name](#c24-dns-name)
    - [C.2.5 Entity](#c25-entity)
    - [C.2.6 Data Types Defined by Reference to XML Schema](#c26-data-types-defined-by-reference-to-xml-schema)
  - [C.3 Functions](#c3-functions)
    - [C.3.1 Equality Predicates](#c31-equality-predicates)
    - [C.3.2 Arithmetic Functions](#c32-arithmetic-functions)
    - [C.3.3 String Conversion Functions](#c33-string-conversion-functions)
    - [C.3.4 Numeric Data Type Conversion Functions](#c34-numeric-data-type-conversion-functions)
    - [C.3.5 Logical Functions](#c35-logical-functions)
    - [C.3.6 Numeric Comparison Functions](#c36-numeric-comparison-functions)
    - [C.3.7 Date and Time Arithmetic Functions](#c37-date-and-time-arithmetic-functions)
    - [C.3.8 Non-numeric Comparison Functions](#c38-non-numeric-comparison-functions)
    - [C.3.9 String Functions](#c39-string-functions)
    - [C.3.10 Bag Functions](#c310-bag-functions)
    - [C.3.11 Set Functions](#c311-set-functions)
    - [C.3.12 Higher-order Bag Functions](#c312-higher-order-bag-functions)
    - [C.3.13 Regular-Expression-Based Functions](#c313-regular-expression-based-functions)
    - [C.3.14 Aggregate Functions](#c314-aggregate-functions)
    - [C.3.15 Special Match Functions](#c315-special-match-functions)
    - [C.3.16 Other Functions](#c316-other-functions)
    - [C.3.17 Extension Functions and Data Types](#c317-extension-functions-and-data-types)
- [Annex D ACAL Identifiers](#annex-d-acal-identifiers)
  - [D.1 ACAL Namespaces](#d1-acal-namespaces)
  - [D.2 Attribute Categories](#d2-attribute-categories)
  - [D.3 Data Types](#d3-data-types)
  - [D.4 Subject Attributes](#d4-subject-attributes)
  - [D.5 Resource Attributes](#d5-resource-attributes)
  - [D.6 Action Attributes](#d6-action-attributes)
  - [D.7 Environment Attributes](#d7-environment-attributes)
  - [D.8 Status Codes](#d8-status-codes)
  - [D.9 Combining Algorithms](#d9-combining-algorithms)
  - [D.10 Content Types](#d10-content-types)
  - [D.11 Content Encodings](#d11-content-encodings) 
- [Annex E Combining Algorithms](#annex-e-combining-algorithms)
  - [E.1 Extended Indeterminate Values](#e1-extended-indeterminate-values)
  - [E.2 Deny Overrides](#e2-deny-overrides)
  - [E.3 Ordered Deny Overrides](#e3-ordered-deny-overrides)
  - [E.4 Permit Overrides](#e4-permit-overrides)
  - [E.5 Ordered Permit Overrides](#e5-ordered-permit-overrides)
  - [E.6 Deny Unless Permit](#e6-deny-unless-permit)
  - [E.7 Permit Unless Deny](#e7-permit-unless-deny)
  - [E.8 First Applicable](#e8-first-applicable)
- [Annex F How to generate HTML and PDF Versions](#annex-f-how-to-generate-html-and-pdf-versions)
  - [Online generation](#online-generation)
  - [Offline generation](#offline-generation)
    - [Prerequisites](#prerequisites)
    - [CSS stylesheet](#css-stylesheet)
    - [HTML generation](#html-generation)
    - [PDF generation](#pdf-generation)
- [Annex G UML Model](#annex-g-uml-model)
- [Appendix 1 Acknowledgments](#appendix-1-acknowledgments)
  - [Leadership](#leadership)
  - [Participants](#participants)
- [Appendix 2 Changes From Previous Version](#appendix-2-changes-from-previous-version)
  - [Revision History](#revision-history)

---


# 1 Scope


This specification defines a common language and processing model for:
1. Attribute-Based Access Control policies;
2. Access Control Decision Request and Response information exchanged between an Access Control Enforcement entity and an Access Control Decision entity. 

This common language intends to be technology-agnostic enough to address enterprise-wide access control requirements, i.e. for any kind of enterprise resource that requires protection against unauthorized access. 

Concrete representations (data formats) are to be provided as separate specifications and therefore out of scope of this document.

---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

<!-- For some reason, if the line below is only 'Bag', the line break is missing from the PDF output -->
**Bag (a.k.a. _multiset_)**

: [[NISTIR8318](#nistir8318)] An unordered collection of values, in which there may be duplicate values.

**Lexical mapping**

: [[XS](#xs)] Part 2, Section 2.3. The prescribed relation that maps each string of a datatype's **_lexical space_** to the value it denotes in that datatype's **_value space_**.

**Lexical space**

: [[XS](#xs)] Part 2, Section 2.3. The prescribed set of character strings that a datatype's **_lexical mapping_** maps to values of that datatype.

**Type Unification**

: [[Hancock](#hancock)] The method by which two type expressions are "unified". The type expressions are matched along their structure. Where a type variable appears in one expression it is then "unified" to represent the corresponding structure element of the other expression, be it another variable or subexpression. All variable assignments must remain consistent in both structures. Unification fails if the two expressions cannot be aligned, either by having dissimilar structure, or by having instance conflicts, such as a variable needs to represent both `xs:string` and `xs:integer`. For a full explanation of **_type unification_**, please see [[Hancock](#hancock)].

**Value space**

: [[XS](#xs)] Part 2, Section 2.2. The set of values of a datatype.

### 2.1.2 Terms Defined in this Document

This document defines the following terms:

**Access**

: Performing an **_action_**.

**Access control**

: Controlling **_access_** in accordance with a **_policy_**.

**Action**

: An operation on a **_resource_**.

**Advice**

: A **_notice_** providing supplementary information to the **_PEP_** about a **_decision_** from the **_PDP_**.

**Applicable policy**

: The set of **_policies_** that governs **_access_** for a specific **_decision request_**.

**Attribute**

: Characteristic of a **_subject_**, **_resource_**, **_action_** or **_environment_** that may be referenced in a **_predicate_** (see also – **_named attribute_**).

**Attribute issuer**

: Source of a **_named attribute_**, e.g. a particular PIP or the PEP itself.

**Authorization decision**

: The result of evaluating **_applicable policy_**, returned by the **_PDP_** to the **_PEP_**. A function that evaluates to `Permit`, `Deny`, `Indeterminate` or `NotApplicable`, and (optionally) a list of **_notices_**.

**Combining algorithm**

: The procedure for combining the **_decision_** and **_notices_** from multiple **_policies_** and **_rules_**.

**Condition**

: An expression of **_predicates_**. A function that evaluates to `true`, `false` or `Indeterminate`.

**Conjunctive sequence**

: A sequence of **_predicates_** combined using the logical `AND` operation.

**Context**

: The canonical representation of a **_decision request_** and an **_authorization decision_**.

**Context handler**

: The system entity that converts **_decision requests_** in the native request format to the ACAL **_context_**, coordinates with Policy Information Points to add attribute values to the request **_context_**, and converts **_authorization decisions_** in the ACAL **_context_** form to the native response format.

**Decision**

: The result of evaluating a **_rule_** or **_policy_**.

**Decision request**

: The request by a **_PEP_** to a **_PDP_** to render an **_authorization decision_**.

**Disjunctive sequence**

: A sequence of **_predicates_** combined using the logical `OR` operation.

**Effect**

: The intended consequence of a satisfied **_rule_** (either `Permit` or `Deny`).

**Environment**

: The set of **_attributes_** that are relevant to an **_authorization decision_** and are independent of a particular **_subject_**, **_resource_** or **_action_**.

**Identifier equality**

: The identifier equality operation which is defined in [Section 8.18](#818-identifier-equality).

**Input acceptance limit**

: A bound that an ACAL implementation applies to data where the data enters ACAL processing, for example when a request or a policy is parsed or when an attribute value is retrieved, such as a limit on the size of a request or on the length of the lexical representation of a number. An input acceptance limit does not determine the **_supported integer interval_** ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)).

**Named attribute**

: A specific instance of an **_attribute_**, determined by the **_attribute_** name and type, the identity of the **_attribute_** holder (which may be of type: **_subject_**, **_resource_**, **_action_** or **_environment_**) and (optionally) the identity of the issuing authority.

**Notice**

: An additional information item provided to the **_PEP_** alongside a **_decision_** from the **_PDP_**. A **_notice_** is either an **_obligation_** or **_advice_**. **_Notices_** are potentially generated by **_rules_** and **_policies_** during their evaluation by the **_PDP_**.

**Obligation**

: A **_notice_** specifying an operation that should be performed by the **_PEP_** in conjunction with the enforcement of an **_authorization decision_**.

**Policy**

: A set of **_rules_**, other **_policies_**, an identifier for the **_combining algorithm_** and (optionally) a list of **_notice_** expressions. May be a component of another **_policy_**.

**Policy issuer**

: A set of **_attributes_** describing the source of a **_policy_**.

**Predicate**

: A statement about **_attributes_** whose truth can be evaluated.

**Resource**

: Data, service or system component that a subject requests access to.

**Rule**

: An **_effect_**, a **_condition_** and (optionally) a list of **_notice_** expressions. A component of a **_policy_**.

**Short identifier**

: A binding of a simple alias name to a URI or a part thereof.

**Subject**

: An actor that requests access to a resource and whose **_attributes_** may be referenced by a **_predicate_**.

**Supported integer interval**

: The set of `integer` values that an ACAL implementation can evaluate, as specified in [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema).

**Target**

: An element of an XACML **_policy_** which matches specified values of **_resource_**, **_subject_**, **_environment_**, **_action_**, or other custom **_attributes_** against those provided in the request **_context_** as a part of the process of determining whether the **_policy_** is applicable to the current decision.


### 2.1.3 Related terms

In the field of **_access control_** and authorization there are several closely related terms in common use. For purposes of precision and clarity, certain of these terms are not used in this specification.

For instance, the term **_attribute_** is used in place of the terms: group and role.

In place of the terms: privilege, permission, authorization, entitlement and right, we use the term **_rule_**.

The term object is also in common use, but we use the term **_resource_** in this specification.

Access requestors and initiators are covered by the term **_subject_**.


## 2.2 Abbreviations and Acronyms

This document uses the following abbreviations and acronyms:

**Iff**
Term used in logic and mathematic fields, that means *if and only if*.

**OCL (Object Constraint Language)**

: [[OCL](#ocl)] is an international OMG and ISO standard specifying a formal language to describe expressions on UML
models, UML constraints in particular. These expressions typically specify invariant conditions that must hold for the system being modeled or queries
over objects described in a model. 

**PAP (Policy Administration Point)**

: The system entity that creates a **_policy_**.

**PDP (Policy Decision Point)**

: The system entity that evaluates **_applicable policy_** and renders an **_authorization decision_**. This term is defined in a joint effort by the IETF Policy Framework Working Group and the Distributed Management Task Force (DMTF)/Common Information Model (CIM) in [[RFC3198](#rfc3198)]. This term corresponds to "Access Decision Function" (ADF) in [[ISO10181-3](#iso10181-3)].

**PEP (Policy Enforcement Point)**

: The system entity that performs **_access control_**, by making **_decision requests_** and enforcing **_authorization decisions_**. This term is defined in a joint effort by the IETF Policy Framework Working Group and the Distributed Management Task Force (DMTF)/Common Information Model (CIM) in [[RFC3198](#rfc3198)]. This term corresponds to "Access Enforcement Function" (AEF) in [[ISO10181-3](#iso10181-3)].

**PIP (Policy Information Point)**

: The system entity that acts as a source of **_attribute_** values.

**UML (Unified Modeling Language)**

: [[UML](#uml)] is an international OMG (Object Management Group) and ISO standard defining a graphical language for visualizing, specifying, constructing, and documenting the artifacts of distributed software systems.

---


# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [[RFC2119](#rfc2119)] [[RFC8174](#rfc8174)] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions


None.

---


# 4 Introduction (non-normative)

<!-- From XACML 3.0 Section 2 Background -->
The "economics of scale" have driven computing platform vendors to develop products with very generalized functionality, so that they can be used in the widest possible range of situations. "Out of the box", these products have the maximum possible privilege for accessing data and executing software, so that they can be used in as many application environments as possible, including those with the most permissive security policies. In the more common case of a relatively restrictive security policy, the platform's inherent privileges must be constrained by configuration.

The security policy of a large enterprise has many elements and many points of enforcement. Elements of policy may be managed by the Information Systems department, by Human Resources, by the Legal department and by the Finance department. And the policy may be enforced by the extranet, mail, WAN, and remote-access systems; platforms which inherently implement a permissive security policy. The current practice is to manage the configuration of each point of enforcement independently in order to implement the security policy as accurately as possible. Consequently, it is an expensive and unreliable proposition to modify the security policy. Moreover, it is virtually impossible to obtain a consolidated view of the safeguards in effect throughout the enterprise to enforce the policy. At the same time, there is increasing pressure on corporate and government executives from consumers, shareholders, and regulators to demonstrate "best practice" in the protection of the information assets of the enterprise and its customers.

For these reasons, there is a pressing need for a common language for expressing security policy. If implemented throughout an enterprise, a common policy language allows the enterprise to manage the enforcement of all the elements of its security policy in all the components of its information systems. Managing security policy may include some or all of the following steps: writing, reviewing, testing, approving, issuing, combining, analyzing, modifying, withdrawing, retrieving, and enforcing policy.

This specification defines the concepts and processing models for such a common language but leaves the concrete syntactic representation to separate specifications. ACAL offers a choice of syntaxes and implementations are free to choose any one or more of these syntaxes to support. 


## 4.1 Requirements

The basic requirements of a policy language for expressing information system security policy are:

* To provide a method for combining individual rules and policies into a single policy that applies to a particular decision request.

* To provide a method for flexible definition of the procedure by which rules and policies are combined.

* To provide a method for dealing with multiple subjects acting in different capacities.

* To provide a method for basing an authorization decision on attributes of the subject and resource.

* To provide a method for dealing with multi-valued attributes.

* To provide a method for basing an authorization decision on the contents of an information resource.

* To provide a set of logical and mathematical operators on attributes of the subject, resource and environment.

* To provide a method for handling a distributed set of policy components, while abstracting the method for locating, retrieving and authenticating the policy components.

* To provide a method for rapidly identifying the policy that applies to a given action, based upon the values of attributes of the subjects, resource and action.

* To provide an abstraction-layer that insulates the policy-writer from the details of the application environment.

* To provide a method for specifying a set of actions that must be performed in conjunction with policy enforcement.

The motivation behind ACAL is to express these well-established ideas in the field of access control policy. The ACAL solutions for each of these requirements are discussed in the following sections.

## 4.2 Rule and Policy Combining


The complete policy applicable to a particular decision request may be composed of a number of individual rules or policies. For instance, in a personal privacy application, the owner of the personal information may define certain aspects of disclosure policy, whereas the enterprise that is the custodian of the information may define certain other aspects. In order to render an authorization decision, it must be possible to combine the two separate policies to form the single policy applicable to the request.

A rule contains a Boolean expression that can be evaluated in isolation, but that is not intended to be accessed in isolation by a PDP. So, it is not intended to form the basis of an authorization decision by itself. It is intended to exist in isolation only within an ACAL PAP, where it may form the basic unit of management.

A policy contains a set of rules and/or other policies and a specified procedure for combining the results of their evaluation. It is the basic unit of policy used by the PDP, and so it is intended to form the basis of an authorization decision. It is also the standard means for combining separate policies into a single combined policy.

Hinton et al [[Hinton94](#hinton94)] discuss the question of the compatibility of separate policies applicable to the same decision request.

## 4.3 Combining Algorithms


ACAL defines a number of combining algorithms that each define a procedure for arriving at an authorization decision given the individual results of evaluation of a set of rules and/or policies. Some examples of standard combining algorithms are (see [Annex E](#annex-e-combining-algorithms) for a full list of standard combining algorithms):

* `deny-overrides` (ordered and unordered),

* `permit-overrides` (ordered and unordered) and

* `first-applicable`.

In the case of the `deny-overrides` algorithm, if a single rule or policy is encountered that evaluates to `Deny`, then, regardless of the evaluation result of the other rules or policies in the applicable policy, the combined result is `Deny`. (See also the similar `permit-unless-deny` algorithm in [Annex E](#annex-e-combining-algorithms).)

Likewise, in the case of the `permit-overrides` algorithm, if a single `Permit` result is encountered, then the combined result is `Permit`. (See also the similar `deny-unless-permit` algorithm in [Annex E](#annex-e-combining-algorithms).)

In the case of the `first-applicable` combining algorithm, the combined result is the same as the result of the first rule or policy in the list of rules and policies that is applicable to the decision request.

<!-- Change to XACML 3.0: combining algorithm parameters removed from the spec. -->
Users of this specification may, if necessary, define their own combining algorithms.


## 4.4 Multiple Subjects

Access control policies often place requirements on the actions of more than one subject. For instance, the policy governing the execution of a high-value financial transaction may require the approval of more than one individual, acting in different capacities. Therefore, ACAL recognizes that there may be more than one subject relevant to a decision request. Different attribute categories are used to differentiate between subjects acting in different capacities. Some standard values for these attribute categories are specified, and users may define additional ones.

## 4.5 Policies Based on Subject and Resource Attributes

Another common requirement is to base an authorization decision on some characteristic of the subject other than its identity.
Perhaps, the most common application of this idea is the subject's role [[RBAC](#rbac)]. ACAL provides facilities to support this approach.
Attributes of subjects contained in the request context may be obtained by an attribute designator.

ACAL provides a standard way to reference the attributes defined in the LDAP series of specifications [[LDAP-1](#ldap-1)], [[LDAP-2](#ldap-2)]. This is intended to encourage implementers to use standard attribute identifiers for some common subject attributes.

Another common requirement is to base an authorization decision on some characteristic of the resource other than its identifier.
ACAL provides facilities to support this approach.
Attributes of the resource may also be obtained by an attribute designator.

## 4.6 Multi-Valued Attributes

The most common techniques for communicating attributes (LDAP, XPath, JSONPath, SAML, etc.) support multiple values per attribute. Therefore, when an ACAL PDP retrieves the value of a named attribute, the result may contain multiple values. A collection of such values is called a bag. A bag differs from a set in that it may contain duplicate values, whereas a set may not. Sometimes this situation represents an error. Sometimes the ACAL rule is satisfied if any one of the attribute values meets the criteria expressed in the rule.

ACAL provides a set of functions that allow a policy writer to be absolutely clear about how the PDP should handle the case of multiple attribute values. These are the "higher-order" functions (see [Annex C.3](#c3-functions)).

## 4.7 Policies Based on Subject and Resource Contents

In many applications, it is required to base an authorization decision on data contained in the information resource to which access is requested.
For instance, a common component of privacy policy is that a person should be allowed to read records for which he or she is the subject.
The corresponding policy must be able to determine the subject identified in the information resource itself.
Similarly, an authorization decision may need to be based on data contained in a user record representing the subject requesting access.

ACAL provides facilities for doing this when the user record or information resource can be represented as a structured document formatted as XML or JSON.
The `AttributeSelectorType` object may contain a content-specific path expression (e.g., XPath or JSONPath) over the `ContentType` object of the subject or resource in the request context
(see [Section 4.11](#411-abstraction-layer) for an explanation of context)
to obtain attribute values to be used in the policy evaluation.

The use of a `ContentType` object in a subject or resource in the request context does not preclude additional or redundant attributes also being present and referenced, as described in [Section 4.5](#45-policies-based-on-subject-and-resource-attributes).

## 4.8 Operators

Information security policies operate upon attributes of subjects, the resource, the action and the environment in order to arrive at an authorization decision. In the process of arriving at the authorization decision, attributes of many different types may have to be compared or computed. For instance, in a financial application, a person's available credit may have to be calculated by adding their credit limit to their account balance. The result may then have to be compared with the transaction value. This sort of situation gives rise to the need for arithmetic operations on attributes of the subject (account balance and credit limit) and the resource (transaction value).

Even more commonly, a policy may identify the set of roles that are permitted to perform a particular action. The corresponding operation involves checking whether there is a non-empty intersection between the set of roles occupied by the subject and the set of roles identified in the policy; hence the need for set operations.

ACAL includes a number of built-in functions and a method of adding non-standard functions. These functions may be nested to build arbitrarily complex expressions. This is achieved with `ApplyType` objects. An `ApplyType` object has a property called `FunctionId` that identifies the function to be applied to the contents of the object, i.e., the arguments of the function. Each standard function is defined for specific argument data type combinations, and its return data type is also specified. Therefore, data type consistency of the policy can be checked at the time the policy is written or parsed. And, the types of the data values presented in the request context can be checked against the values expected by the policy to ensure a predictable outcome.

In addition to operators on numerical and set arguments, operators are defined for date, time and duration arguments.

Relationship operators (equality and comparison) are also defined for a number of data types, including the RFC822 and X.500 name-forms, strings, URIs, etc.

Also noteworthy are the operators over Boolean data types, which permit the logical combination of predicates in a rule. For example, a rule may contain the statement that access may be permitted during business hours AND from a terminal on business premises.

The ACAL method of representing functions borrows from MathML [[MathML](#mathml)]. (For XPath functions, see the XPath Profile of ACAL.)

## 4.9 Policy Distribution

In a distributed system, individual policy statements may be written by several policy writers and enforced at several enforcement points. In addition to facilitating the collection and combination of independent policy components, this approach allows policies to be updated as required. ACAL policy statements may be distributed in any one of a number of ways. But, ACAL does not describe any normative way to do this. Regardless of the means of distribution, PDPs are expected to confirm, by examining the policy's target that the policy is applicable to the decision request that it is processing.

Policies may be attached to the information resources to which they apply, as described by Perritt [[Perritt93](#perritt93)]. Alternatively, policies may be maintained in one or more locations from which they are retrieved for evaluation. In such cases, the applicable policy may be referenced by an identifier or locator closely associated with the information resource.

## 4.10 Policy Indexing

For efficiency of evaluation and ease of management, the overall security policy in force across an enterprise may be expressed as multiple independent policy components. In this case, it is necessary to identify and retrieve the applicable policy statement and verify that it is the correct one for the requested action before evaluating it. This is the purpose of the policy target in ACAL.

Two approaches are supported:

1. Policy statements may be stored in a database. In this case, the PDP should form a database query to retrieve just those policies that are applicable to the set of decision requests to which it expects to respond. Additionally, the PDP should evaluate the target of the retrieved policy statements as defined by the ACAL specification.

2. Alternatively, the PDP may be loaded with all available policies and evaluate their targets in the context of a particular decision request, in order to identify the policies that are applicable to that request.

The use of constraints limiting the applicability of a policy was described by Sloman [[Sloman94](#sloman94)].

## 4.11 Abstraction Layer

PEPs come in many forms. For instance, a PEP may be part of a remote-access gateway, part of a Web server or part of an email user-agent, etc. It is unrealistic to expect that all PEPs in an enterprise do currently, or will in the future, issue decision requests to a PDP in a common format. Nevertheless, a particular policy may have to be enforced by multiple PEPs. It would be inefficient to force a policy writer to write the same policy several different ways in order to accommodate the format requirements of each PEP. Similarly attributes may be contained in various envelope types (e.g. X.509 attribute certificates, SAML attribute assertions, etc.). Therefore, there is a need for a canonical form of the request and response handled by an ACAL PDP. This canonical form is called the ACAL context. Its abstract syntax is defined here in UML and concrete syntaxes and representation formats in separate profiles of ACAL (XML, JSON, etc.).

Naturally, ACAL-conformant PEPs may issue requests and receive responses in the form of an ACAL context. But, where this situation does not exist, an intermediate step is required to convert between the request/response format understood by the PEP and the ACAL context format understood by the PDP.

The benefit of this approach is that policies may be written and analyzed independently of the specific environment in which they are to be enforced.

## 4.12 Actions Performed in Conjunction with Enforcement

In many applications, policies specify actions that MUST be performed, either instead of, or in addition to, actions that MAY be performed. This idea was described by Sloman [[Sloman94](#sloman94)]. ACAL provides facilities to specify actions that MUST be performed in conjunction with policy evaluation through obligation notices. This idea was described as a provisional action by Kudo [[Kudo00](#kudo00)]. There are no standard definitions for these actions in version 1.0 of ACAL. Therefore, bilateral agreement between a PAP and the PEP that will enforce its policies is required for correct interpretation. PEPs that conform to v1.0 of ACAL are required to deny access unless they understand and can discharge all of the obligation notices associated with the applicable policy. Obligation notices are returned to the PEP for enforcement.

## 4.13 Supplemental Information About a Decision

In some applications it is helpful to specify supplemental information about a decision. ACAL provides facilities to specify supplemental information about a decision through advice notices. Such advice may be safely ignored by the PEP.


## 4.14 Changes From the Previous Version


As illustrated in the **Figure 4-1** below, compared to [XACML v3](#xacml), this ACAL specification is a generalization of XACML model (syntax and processing model), aiming to be XML-agnostic, therefore laying the ground for other (non-XML) concrete representations to be added. In addition, ACAL benefits from extra enhancements including model simplifications and optimizations as well as new features. For purposes of simplifying this specification, all XPath features - originally from XACML - are kept in a separate ACAL Profile. 

![ACAL](images/acal_big.svg)

**Figure 4-1.** Evolution from XACML v3 to ACAL 


The detailed list of changes from the previous version and any revision history can be found in [Appendix 2](#appendix-2-changes-from-previous-version).


---


# 5 Models (non-normative)

<!-- From XACML 3.0 Section 3 Models -->

The data-flow model and language model of ACAL are described in the following sub-sections.

## 5.1 Data-Flow Model

The major actors in the ACAL domain are shown in the data-flow diagram of **Figure 5-1**.

<!-- ![data-flow diagram](images/DataFlowDiagram.png) -->

```dot
// do not use strict keyword to allow multiple edges between PDP and context handler
digraph Fig1 {
    compound=true // Allow links to/from/between PEP/PDP/PIP boxes)
    splines=false // Straight links (avoid curves whenever possible)
    fontname=Arial
    newrank=true // Allows to enforce rank constraints (horizontal alignment) across clusters (PEP/PDP/PIP boxes)
    ranksep=0.02
    //nodesep=1 // more space between nodes on the same rank (horizontally aligned)
    // Default parameters for nodes
    node [shape=box, style=rounded, width=2, height=0.5, fontname=Arial, fontsize=14.0]
    // Default parameters for links (smaller font than nodes)
    edge [fontname=Arial, fontsize=10.0]
    
    
    // BEGIN LEFT PART 
    // Define the Access requester, PDP and PAP boxes, then link them together in order to be aligned vertically by Graphviz dot engine.
    
    // Access requester box
    AR [label="access\nrequester"/*, group=left*/]
    
    // PDP box
    subgraph pdp {
        /*
        The PDP box is a cluster of 3 nodes in descending vertical order:
        - 1 top node (invisible), used only as connection point for the links of "flows 4-5" from/to the context handler
        - 1 node in-between for the box label "PDP"
        - 1 bottom node (invisible), used only as connection point for the links of "flows 10-11" from/to the context handler
        Having two separate connector nodes (top and bottom) is a way to space out the two pairs of links, i.e. prevent flows 10-11 to overlap flows 4-5.
        An alternative would be to use node ports (https://graphviz.org/docs/attr-types/portPos/), e.g. north-east / south-east, but it does not look nice, esp. with rounded corners. The link heads/tails don't reach the box corners.   
        */
        cluster=true
        style=rounded
        // Increase the margin if the bottom link (flow 11) is too low
        //margin="40"
        
        // Top connector node that will connect to the top-left part of the context handler (ch_top_left node). Make it invisible and small (empty label, zero height).
        // (width ajusted to make the PDP box as wide as access requester / PAP boxes)
        pdp_top [label="", shape=plaintext, height=0, width=1.8, /*style=invis*/]
        
        // between label and top node
        pdp_middle_up [label="", shape=plaintext, height=0, width=1.8, /*style=invis*/]
        
        // Center node for a label "PDP" centered in the box (width ajusted to make the PDP box as wide as access requester / PAP boxes)
        pdp_label [label="PDP", shape=plaintext, height=0, width=1.8]
        
        // between label and bottom node
        pdp_middle_down [label="", shape=plaintext, height=0, width=1.8, /*style=invis*/]
        
        // Bottom connector node that will connect to the bottom-left part of the context handler (ch_bottom_left node). Make it invisible and small (empty label, zero height).
        pdp_bottom [label="",shape=plaintext,  height=0, width=1.8, /*style=invis*/]
        
        // Link the nodes to force vertical alignment from top to bottom and make the links invisible
        // NB: changing minlen to 0 to reduce edge length screws up everything, don't do it.
        pdp_top -> pdp_middle_up -> pdp_label -> pdp_middle_down -> pdp_bottom [style=invis]
    }
    
    // Link AR and PAP boxes with PDP box to align them vertically from top to bottom
    AR -> pdp_top [style="invis"] // link not visible, just for alignment
    
    // PDP - PAP link (PAP box is created implicitly when creating this link)
    pdp_bottom -> PAP [dir=back, label="  1. policy",ltail=pdp]
    // END LEFT PART
	
	// BEGIN MIDDLE PART
	// Define the PEP, context handler, PIP and subjects boxes, then link them together in order to be aligned vertically by Graphviz dot engine.
	
	// PEP box
	subgraph pep {
	    /*
        The PEP box is a cluster of 3 nodes aligned hotizontally:
        - 1 left node (invisible), used primarily as connection point for the link of "flow 3" to the context handler
        - 1 node in-between for the box label "PEP"
        - 1 right node (invisible), used primarily as connection point for the link of "flow 12" from the context handler
        Having two separate connector nodes (left and right) is a way to space out the two links, i.e. prevent flow 3 to be too close to flow 12.
        An alternative would be to use node ports (https://graphviz.org/docs/attr-types/portPos/), e.g. north-east / south-east, but it does not look nice, esp. with rounded corners. The link heads/tails don't reach the box corners.
        */
	    cluster=true
        style=rounded
        // Assign pep_left to same group as ch_top_left to make sure they are aligned vertically
        pep_left [label="",  shape=plaintext, height=0, width=0.5, group=middle_left, style=invis]
        pep_label [label="PEP",shape=plaintext, height=0, width=0, style=""]
        pep_right [label="",  shape=plaintext, height=0, width=0.5, style=invis]
    }

    // Context handler box
    subgraph ch {
        /*
        This box is defined very similary to the PDP box but with two extra connector nodes on the right for the flows 8 and 12 respectively
        */
        cluster=true
        style=rounded
        //margin=10
        
        // Top connector node that will connect to the top-left part of the context handler (ch_top_left node). Make it invisible and small (empty label, zero height).
        ch_top_left [label="",  shape=plaintext, height=0, width=0.5, group=middle_left, /*style=invis*/]
        // This node adds enough space between ch_top_left and ch_top_right to make sure they are aligned with pep_left and pep_right nodes to have straight vertical links (width must be the same as pep_label node)
        ch_top_middle[label="", shape=plaintext,  height=0, width=0.6, /*style=invis*/]
        ch_top_right [label="", shape=plaintext,  height=0, width=0.5, /*style=invis*/]
        // between ch_top_left and ch_label
        ch_middle_up [label="",  shape=plaintext, height=0, width=2.1, /*style=invis*/]
        
        // Set same width as pdp_label to make PDP and context handler boxes the same size
        ch_label [label="context\nhandler", shape=plaintext, height=0, width=2.1, style=""]
        
        // between label and bottom nodes
        ch_middle_down [label="",  shape=plaintext, height=0, width=2.1, /*style=invis*/]
        ch_bottom_left [label="", shape=plaintext, height=0, width=0.5, group=middle_left, /*style=invis*/]
        // This node adds enough space between ch_bottom_left and ch_bottom_right to make sure they are aligned with pip_top_left and pip_top_right nodes to have straight vertical links (width must be the same as pip_label node)
        ch_bottom_middle[label="", shape=plaintext, height=0, width=0.6, /*style=invis*/]
        ch_bottom_right [label="", shape=plaintext, height=0, width=0.5, /*style=invis*/]
        
        // Link the nodes to force vertical alignment from top to bottom and make the links invisible
        // NB: changing minlen to 0 to reduce edge length screws up everything, don't do it.
        ch_top_left -> ch_middle_up [style=invis]
        ch_top_middle -> ch_middle_up -> ch_label -> ch_middle_down -> ch_bottom_middle [style=invis]
        ch_top_right -> ch_middle_up [style=invis]
        ch_middle_down -> ch_bottom_left [style=invis]
        ch_middle_down -> ch_bottom_right [style=invis]
    }
    
    // PEP - Context-handler links
    pep_left -> ch_top_left [label="  3. request\n\n ", ltail=pep, lhead=ch]
    // try xlabel instead of label
    pep_right -> ch_top_right [xlabel="12. response ", dir=back, ltail=pep, lhead=ch]
    
    // PIP box
    subgraph pip {
        cluster=true
        style=rounded
        // Assign pip_top_left to same group as ch_bottom_left for vertical alignment
        pip_top_left [label="", shape=plaintext, height=0, width=0.5, group=middle_left, style=invis]
        // This node adds enough space between pip_top_left and pip_top_right to make sure they are aligned with ch_bottom_left and ch_bottom_right nodes to have straight vertical links (width must be the same as ch_label node)
        pip_top_middle [label="",  shape=plaintext, height=0, width=0.6, style=invis]
        pip_top_right [label="",  shape=plaintext, height=0, width=0.5, style=invis]
        // Set same width as ch_label to make PIP, context handler and subjects boxes the same size
        pip_label [label="PIP", shape=plaintext, height=0, width=2.1, style=""]
        pip_bottom [label="",  shape=plaintext, height=0, width=2.1, style=invis]
        
        // Link the nodes to force vertical alignment from top to bottom and make the links invisible
        // NB: changing minlen to 0 to reduce edge length screws up everything, don't do it.
        pip_top_left -> pip_label [style=invis]
        pip_top_middle -> pip_label -> pip_bottom [style=invis]
        pip_top_right -> pip_label [style=invis]
    }
    
    // Context-handler - PIP links
    ch_bottom_left -> pip_top_left [label="  6. attribute\nquery", ltail=ch,lhead=pip]
    ch_bottom_right -> pip_top_right [xlabel="8. attribute  ", dir=back, ltail=ch, lhead=pip]
    
    // PIP - subjects link (subjects box is created implicitly when creating this link)
    pip_bottom -> subjects [dir=back, label="   7a. subject\nattributes", ltail=pip]
    // END MIDDLE PART
    
    // Horizontal links between left and middle parts
    AR -> pep_left [label="2. access request  ", lhead=pep, constraint=false]
    pdp_top -> ch_top_left [label="4. request notification", dir=back, constraint=false, ltail=pdp, lhead=ch]
    pdp_middle_up -> ch_middle_up [label="5. attribute queries",constraint=false, ltail=pdp, lhead=ch]
    pdp_middle_down -> ch_middle_down [label=" 10. attributes ", dir=back, constraint=false, ltail=pdp, lhead=ch]
    pdp_bottom -> ch_bottom_left [label="11. response context",constraint=false, ltail=pdp, lhead=ch]
    
    // BEGIN RIGHT PART
    // Assign the same group to all boxes to make sure they are aligned vertically
    // Obligations service box
    OS [label="obligations\nservice", group=right]
    resource [group=right]
    // Node for labeling flows 7b./7c and work as the link angle
    label7c [label="7c. resource\nattributes", shape=plaintext,fontsize=10.0, height=0, width=1, group=right]
    label7b [label="7b. environment\nattributes", shape=plaintext,fontsize=10.0, height=0, width=1, group=right]
    
    // Link OS, resource, label7b label7c and environment boxes in order to align them vertically from top to bottom
    // (Resource box created with the link)
    OS -> resource [style="invis"] // link not visible, just for alignment
    resource -> label7c [arrowhead=none]
    label7c -> label7b [style=invis]
    label7b -> environment [arrowhead=none]
    // END RIGHT PART
    
    // Horizontal links between middle and right parts
    pep_right -> OS [label=" 13. obligations", ltail=pep, constraint=false]
    ch_label -> resource [label="9. resource\ncontent", dir=back, ltail=ch]
    pip_top_right -> label7c [dir=back,ltail=pip]
    pip_bottom -> label7b [dir=back,ltail=pip]
    
    // Align certain boxes horizontally
	{rank=same; AR; pep_left; pep_right; OS;}
	{rank=same; pdp_top; ch_top_left;ch_top_right;}
	{rank=same; pdp_label; ch_label;resource;}
	{rank=same; pdp_bottom; ch_bottom_left;ch_bottom_right;}
	{rank=same; pip_top_right; label7c;}
	{rank=same; pip_bottom; label7b;}
	{rank=same; PAP; subjects; environment;}
    
}
```

**Figure 5-1.** Data-Flow Diagram

<span> </span>
: Note: some of the data-flows shown in the diagram may be facilitated by a repository. For instance, the communications between the context handler and the PIP or the communications between the PDP and the PAP may be facilitated by a repository. The ACAL specification is not intended to place restrictions on the location of any such repository, or indeed to prescribe a particular communication protocol for any of the data-flows.

The model operates by the following steps.

1. PAPs write policies and make them available to the PDP. These policies represent the complete policy for a specified target.
2. The access requester sends a request for access to the PEP.
3. The PEP sends the request for access to the context handler in its native request format, optionally including attributes of the subjects, resource, action, environment and other categories.
4. The context handler constructs an ACAL request context, optionally adds attributes, and sends it to the PDP.
5. The PDP requests any additional subject, resource, action, environment and other categories (not shown) attributes from the context handler.
6. The context handler requests the attributes from a PIP.
7. The PIP obtains the requested attributes.
8. The PIP returns the requested attributes to the context handler.
9. Optionally, the context handler includes the resource in the context.
10. The context handler sends the requested attributes and (optionally) the resource to the PDP. The PDP evaluates the policy.
11. The PDP returns the response context (including the authorization decision) to the context handler.
12. The context handler translates the response context to the native response format of the PEP. The context handler returns the response to the PEP.
13. The PEP fulfills the obligation notices.
14. (Not shown) If access is permitted, then the PEP permits access to the resource; otherwise, it denies access.

## 5.2 ACAL Context

ACAL is intended to be suitable for a variety of application environments. The core language is insulated from the application environment by the ACAL context, as shown in **Figure 5-2**, in which the scope of the ACAL specification is indicated by the shaded area. In the Figure 5-2, the ACAL context represents the inputs and outputs of the PDP decision. An ACAL Policy references attributes in the ACAL context via content-specific path expressions (e.g. XPath for XML content, JSONPath for JSON content) over the `ContentType` objects of the context, or *named* attribute designators that identify the attribute by its category, identifier, data type and (optionally) its issuer. Implementations convert between the attribute representations in the application environment (e.g., SAML, J2SE, CORBA, and so on) and the attribute representations in the ACAL context ([Section 8.4](#84-attribute-evaluation)). How this is achieved is outside the scope of the ACAL specification. In some cases, such as SAML, this conversion may be accomplished in an automated way through the use of an XSLT transformation [[XSLT](#xslt)].


```dot
// do not use strict keyword to allow multiple edges between PDP and context handler
digraph Fig1 {
    compound=true // Allow links to/from/between PEP/PDP/PIP boxes)
    splines=false // Straight links (avoid curves whenever possible)
    fontname=Arial
    newrank=true // Allows to enforce rank constraints (horizontal alignment) across clusters (PEP/PDP/PIP boxes)
    ranksep=0.5
    nodesep=0.1 // space between nodes on the same rank (horizontally aligned)
    // Default parameters for nodes
    node [shape=box, style=rounded, width=1, height=0.5, fontname=Arial, fontsize=10.0, fillcolor=white]
    // Default parameters for links (smaller font than nodes)
    edge [fontname=Arial, arrowhead=onormal]

    // domain-specific inputs box
    inputs [label="domain-specific\ninputs"]
    
    inputs_to_request [shape=rarrow, label="", width=0.5]
    
    // ACAL scope (grey) box
    subgraph xacml_scope {
        cluster=true
        style=rounded
        bgcolor=lightgrey
        // Increase the margin if the bottom link (flow 11) is too low
        //margin="40"
        policy [label="ACAL \nPolicy", shape=box, style="filled,rounded"]
        request [label="ACAL Context/\nDecision Request", style="filled,rounded"]
        request_to_pdp [shape=rarrow, label="", style="filled", width=0.5]
        pdp [label="PDP", style="filled"]
        pdp_to_response [shape=rarrow, label="", style=filled, width=0.5]
        response [label="ACAL Context/\nDecision Response", style="filled,rounded"]
        
        // Link the nodes to force vertical alignment from top to bottom and make the links invisible
        // NB: changing minlen to 0 to reduce edge length screws up everything, don't do it.
        policy -> pdp
        request -> request_to_pdp -> pdp -> pdp_to_response -> response [style=invis]
    }
    
    inputs -> inputs_to_request -> request [style=invis]
    
    response_to_outputs [shape=rarrow, label="", width=0.5]
    // domain-specific outputs box
    outputs [label="domain-specific\noutputs"]
    
    response -> response_to_outputs -> outputs [style=invis]
    
    {rank=same; inputs; inputs_to_request; request; request_to_pdp; pdp; pdp_to_response; response; response_to_outputs; outputs}
}
```
**Figure 5-2.** ACAL Context

<span> </span>
: Note: The PDP is not required to operate directly on the ACAL representation of a policy. It may operate directly on an alternative representation.

Typical categories of attributes in the context are the subject, resource, action and environment, but users may define their own categories as needed. See [Annex D.2](#d2-attribute-categories) for suggested attribute categories.

See [Section 8.4.5](#845-attribute-retrieval) for a more detailed discussion of the request context.

## 5.3 Policy Language Model

The policy language model is shown in **Figure 5-3**. The main components of the model are:

* Rule; and

* Policy.

These are described in the following sub-sections.


<div style="text-align: left;">

```plantuml
@startuml
skinparam monochrome true
skinparam classFontName Arial
skinparam classFontSize 18
hide circle
'skinparam linetype ortho

' Policy "0..1" *-- "1" Description
' Policy "0..1" *-- "1" PolicyIssuer
' Policy "0..1" *-- "1" PolicyDefaults
' Policy "*" *-- "1" Parameter

Policy "*" *-- "*" Policy
Policy "1" *-left- "1" CombiningAlgorithm: \t
Policy "0..1" *-- "1" Target
Policy "*" *-- "1" Rule
' Policy "*" *-- "1" VariableDefinition
Policy "*" *-- "1" NoticeExpression
' Policy "1" *-- "1" PolicyId
' Policy "1" *-- "1" Version
' Policy "1" *-- "1" MaxDelegationDepth

' Rule "0..1" *-- "1" Description
Rule "0..1" *-left- "1" Condition: \t
Rule "*" *-right- "1" NoticeExpression: \t
' Rule "1"*--"1" Id
Rule "1" *-- "1" Effect 
@enduml
```
**Figure 5-3.** Policy Language Model
</div>

### 5.3.1 Rule

A rule is the most elementary unit of policy. It may exist in isolation only within one of the major actors of the ACAL domain. In order to exchange rules between major actors, they must be encapsulated in a policy. A rule can be evaluated on the basis of its contents. The main components of a rule are:

* an effect,

* a condition, and

* notice expressions.

These are discussed in the following sub-sections.

#### 5.3.1.1 Condition

The condition defines the set of requests to which the rule applies, expressed as a logical expression on attributes in the request. If a rule is intended to apply to all requests to which its parent policy is applicable, the condition may be omitted.

**Hierarchical Logic**
When evaluating conditions against structured name-forms (such as directory names, file paths, or nested object keys), the matching logic needs to distinguish between a discrete node and a subtree (see [Section 8.14](#814-hierarchical-resources) and [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)]). 

* **Subjects:** Non-leaf subject names generally identify the set of subjects subordinate to that node.
* **Resources:** A resource node may represent either a discrete entity or a container for a subtree of entities. 

The interpretation of these structures is influenced by the match function selected and the hierarchy's specific delimiter (e.g., `/`, `\`, or `.`). The **Hierarchical Resource Profile** provides the specific functions and logic required to handle these variations across different data representations.

**Evaluation**
The PDP verifies that the matches defined by the condition are satisfied by the attributes in the request context. For the formal processing model, see [Section 8.9](#89-condition-evaluation).

#### 5.3.1.2 Effect

The effect of the rule indicates the rule-writer's intended consequence of a `true` evaluation for the condition. Two values are allowed: `Permit` and `Deny`.

#### 5.3.1.3 Notice Expressions

Notice expressions may be added by the writer of the rule.

When a PDP evaluates a rule containing notice expressions, it evaluates the notice expressions into notices and returns certain of those notices to the PEP in the response context. [Section 8.16](#816-notices) explains which notices are to be returned.

In contrast to obligation notices, advice notices may be safely ignored by the PEP.

### 5.3.2 Policy

From the data-flow model one can see that rules are not exchanged amongst system entities. Therefore, a PAP combines rules in a policy. A policy comprises four main components:

* a target;

* a combining algorithm identifier;

* a set of rules and policies and

* notice expressions.

Rules are described above. The remaining components are described in the following sub-sections.

#### 5.3.2.1 Policy Target

An ACAL policy contains a target that specifies the set of decision requests to which it applies.
A policy applies to a particular decision request if the target evaluates to `true` for that decision request.
If the target evaluates to `false` for a particular decision request, then the policy immediately evaluates to `NotApplicable` and the policy's combining algorithm and component policies and rules are not considered.

A component policy will also have a target.
The component policy is applicable to decision requests that satisfy both the target of the component policy and the target of the outer policy.
Therefore, the target of a component policy may omit any test performed by the target of the outer policy.

A component rule will have a condition. The component rule is applicable to decision requests that satisfy both the condition of the component rule and the target of the outer policy.
Therefore, the condition of a component rule may omit any test performed by the target of the outer policy.

#### 5.3.2.2 Combining Algorithm

The combining algorithm specifies the procedure by which the results of evaluating the component rules and policies are combined when evaluating the policy, i.e. the `Decision` value placed in the response context by the PDP is the result of evaluating the policy, as defined by the combining algorithm. 

See [Annex E](#annex-e-combining-algorithms) for definitions of the standard combining algorithms.

#### 5.3.2.3 Notice Expressions

The writer of a policy may add notice expressions to the policy, in addition to those contained in the component rules and policies.

When a PDP evaluates a policy containing notice expressions, it evaluates the notice expressions into notices and returns certain of those notices to the PEP in the response context. [Section 8.16](#816-notices) explains which notices are to be returned. In contrast to obligation notices, advice notices may be safely ignored by the PEP.


---


# 6 Examples (non-normative)

This section contains two examples of the use of ACAL for illustrative purposes. The first example is a relatively simple one to illustrate the use of rules, conditions, matching functions and subject attributes. The second example additionally illustrates the use of the combining algorithm and notices.

## 6.1 Example One

### 6.1.1 Example Policy

Assume that a corporation named Medi Corp (identified by its domain name: med.example.com) has an access control policy that states, in English:

: _Any user with an e-mail name in the `med.example.com` domain is allowed to perform any action on any resource._

The following ACAL policy, respectively in XML, YAML and JSON, contains a rule instance expressing this access control policy (the numbers in square brackets on the left-hand side are for referencing purposes and are not part of the policy in any representation):

```
[01] <?xml version="1.0" encoding="UTF-8"?>
[02] <Policy
[03]   xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
[04]   PolicyId="urn:oasis:names:tc:acal:1.0:example:SimplePolicy1"
[05]   Version="1.0"
[06]   CombiningAlgId="deny-overrides">
[07]   <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:core:identifiers</ShortIdSetReference>
[09]   <Description>Medi Corp access control policy.</Description>
[11]   <Rule
[12]     Id="Rule1"
[13]     Effect="Permit">
[14]     <Description>Any subject with an e-mail name in the med.example.com domain can perform any action on any resource.</Description>
[15]     <Condition>
[16]       <Apply
[17]         FunctionId="any-of">
[19]         <Function Id="rfc822Name-match"/>
[23]         <AttributeDesignator
[24]           Category="access-subject"
[25]           AttributeId="subject-id"
[26]           DataType="rfc822Name"/>
[29]         <Value DataType="string">med.example.com</Value>
[34]       </Apply>
[35]     </Condition>
[36]   </Rule>
[38] </Policy>
```

```
[02] Policy:
[04]   PolicyId: "urn:oasis:names:tc:acal:1.0:example:SimplePolicy1"
[05]   Version: "1.0"
[06]   CombiningAlgId: deny-overrides
[07]   ShortIdSetReference:
[08]     - "urn:oasis:names:tc:acal:1.0:core:identifiers"
[09]   Description: Medi Corp access control policy.
[10]   CombinerInput:
[11]     - Rule:
[12]         Id: Rule1
[13]         Effect: Permit
[14]         Description: Any subject with an e-mail name in the med.example.com domain can perform any action on any resource.
[15]         Condition:
[16]           Apply:
[17]             FunctionId: any-of
[18]             Argument:
[19]               - Function:
[20]                   Id: rfc822Name-match
[23]               - AttributeDesignator:
[24]                   Category: access-subject
[25]                   AttributeId: subject-id
[26]                   DataType: rfc822Name
[29]               - Value:
[30]                   DataType: string
[31]                   Value: med.example.com
```

```
[02] {"Policy":{
[04]   "PolicyId":"urn:oasis:names:tc:acal:1.0:example:SimplePolicy1",
[05]   "Version":"1.0",
[06]   "CombiningAlgId":"deny-overrides",
[07]   "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:core:identifiers"],
[09]   "Description":"Medi Corp access control policy.",
[10]   "CombinerInput":[{
[11]     "Rule":{
[12]       "Id":"Rule1",
[13]       "Effect":"Permit",
[14]       "Description":"Any subject with an e-mail name in the med.example.com domain can perform any action on any resource.",
[15]       "Condition":{
[16]         "Apply":{
[17]           "FunctionId":"any-of",
[18]           "Argument":[{
[19]             "Function":{
[20]               "Id":"rfc822Name-match"
[21]             }
[22]           },{
[23]             "AttributeDesignator":{
[24]               "Category":"access-subject",
[25]               "AttributeId":"subject-id",
[26]               "DataType":"rfc822Name"
[27]             }
[28]           },{
[29]             "Value":{
[30]               "DataType":"string",
[31]               "Value":"med.example.com"
[32]             }
[33]           }]
[34]         }
[35]       }
[36]     }
[37]   }]
[38] }}
```

[01] A standard XML document tag indicating which version of XML is being used and what the character encoding is.

[02] The beginning of the ACAL Policy.

[03] An XML namespace declaration.

[04] An identifier for this policy. Different policy instances with the same identifier must have different version numbers.

[05] The version of this instance of the policy. The combination of identifier and version has to be unique for a given policy instance so that there is no ambiguity if one policy is referenced from another policy.

[07] - [08] A reference to a short identifier set imported into the policy. The names of the short identifiers in the set are available to use in this policy.

[06] The algorithm that will be used to combine the results of the various rules and policies that may be contained in the policy. In this case the algorithm is nominated with the short identifier name `deny-overrides` which evaluates to `urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-overrides` using the imported short identifier set. This combining algorithm specifies that, if any rule evaluates to `Deny`, then the policy must return `Deny`; otherwise, if any rule evaluates to `Permit`, then the policy must return `Permit`. The combining algorithm, which is fully described in [Annex E](#annex-e-combining-algorithms), also says what to do if an error were to occur when evaluating any rule, and what to do with rules that do not apply to a particular decision request.

[09] An optional text description of the policy.

This policy does not specify a target so the policy is applicable to any decision request.

[11] The beginning of the one and only rule in this simple policy.

[12] An identifier for the rule. Each rule in a policy must have a distinct identifier.

[13] The result the rule will produce if its condition is satisfied. Rules can have an effect of either `Permit` or `Deny`. In this case, if the rule is satisfied, it will evaluate to `Permit`, meaning that, as far as this one rule is concerned, the requested access should be permitted. If the rule's condition is not satisfied, then the rule returns a result of `NotApplicable`. If an error occurs when evaluating the condition, then the rule returns a result of `Indeterminate`. As mentioned above, the combining algorithm for the policy specifies how various rule results are combined into a single policy result.

[14] An optional text description of the rule.

[15] - [35] The condition of the rule. The condition determines the decision requests to which this rule applies.

[16] - [34] The expression that defines the condition to be satisfied, in this case a function is applied.

[17]  The `FunctionId` property specifies the function to be applied. In this case, the function is nominated with the short identifier name `any-of`, which evaluates to `urn:oasis:names:tc:acal:1.0:function:any-of` using the imported short identifier set. This function compares an attribute value to each of the attribute values in a bag according to a matching function that is specified in the first argument. The bag of values can be either the second or third argument. In this case it is the second argument. The function evaluates to `true` if any value in the bag matches the third argument according to the matching function.

[19] - [21] The first argument: the matching function. The `Id` property specifies that the matching function is `urn:oasis:names:tc:acal:1.0:function:rfc822Name-match` using the short identifier name `rfc822Name-match`. This function returns `true` if an email address as its first argument belongs to a domain nominated by its second argument.

[23] - [27] The second argument: the bag of values. It is an attribute designator that selects a bag of `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name` values from the `urn:oasis:names:tc:acal:1.0:subject:subject-id` attribute (short identifier name `subject-id`) in the `urn:oasis:names:tc:acal:1.0:subject-category:access-subject` category.

[29] - [32] The third argument: an attribute value. It is the email address domain to be matched, specifically, the character string `med.example.com`. The `DataType` property indicates that the data type of the value is `urn:oasis:names:tc:acal:1.0:data-type:string` using the short identifier name `string`.

[36] The end of the rule.

[38] The end of the policy. As mentioned above, this policy has only one rule, but more complex policies may have any number of rules.

### 6.1.2 Example Decision Request

Let's examine a hypothetical decision request that might be submitted to a PDP that executes the policy above. In English, the access request that generates the decision request may be stated as follows:

: Bart Simpson, with e-mail name "bs@simpsons.com", wants to read his medical record at Medi Corp.

The following request, respectively in XML, YAML and JSON, expresses this decision request (the numbers in square brackets on the left-hand side are for referencing purposes and are not part of the request in any representation):

```
[01] <?xml version="1.0" encoding="UTF-8"?>
[02] <Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
[03]   <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:core:identifiers</ShortIdSetReference>
[05]   <RequestEntity
[06]     Category="access-subject">
[07]     <RequestAttribute
[08]       AttributeId="subject-id" DataType="rfc822Name">
[09]       <Value>bs@simpsons.com</Value>
[13]     </RequestAttribute>
[14]   </RequestEntity>
[15]   <RequestEntity
[16]     Category="resource">
[17]     <RequestAttribute
[18]       AttributeId="resource-id" DataType="anyURI">
[19]       <Value>file://example/med/record/patient/BartSimpson</Value>
[23]     </RequestAttribute>
[24]   </RequestEntity>
[25]   <RequestEntity
[26]     Category="action">
[27]     <RequestAttribute
[28]       AttributeId="action-id" DataType="string">
[29]       <Value>read</Value>
[33]     </RequestAttribute>
[34]   </RequestEntity>
[35] </Request>
```

```
[02] Request:
[03]   ShortIdSetReference:
[04]     - "urn:oasis:names:tc:acal:1.0:core:identifiers"
[05]   RequestEntity:
[06]     - Category: access-subject
[07]       RequestAttribute:
[08]         - AttributeId: subject-id
[09]           DataType: rfc822Name
[10]           Value:
[11]             - bs@simpsons.com
[16]     - Category: resource
[17]       RequestAttribute:
[18]         - AttributeId: resource-id
[19]           DataType: anyURI
[20]           Value:
[21]             - "file://example/med/record/patient/BartSimpson"
[26]     - Category: action
[27]       RequestAttribute:
[28]         - AttributeId: action-id
[29]           DataType: string
[30]           Value:
[31]             - read
```

```
[02] {"Request":{
[03]   "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:core:identifiers"],
[05]   "RequestEntity":[{
[06]     "Category":"access-subject",
[07]     "RequestAttribute":[{
[08]       "AttributeId":"subject-id",
[09]       "DataType":"rfc822Name",
[10]       "Value":[
[11]         "bs@simpsons.com"
[12]       ]
[13]     }]
[14]   },{
[16]     "Category":"resource",
[17]     "RequestAttribute":[{
[18]       "AttributeId":"resource-id",
[19]       "DataType":"anyURI",
[20]       "Value":[
[21]         "file://example/med/record/patient/BartSimpson"
[22]       ]
[23]     }]
[24]   },{
[26]     "Category":"action",
[27]     "RequestAttribute":[{
[28]       "AttributeId":"action-id",
[29]       "DataType":"string",
[30]       "Value":[
[31]         "read"
[32]       ]
[33]     }]
[34]   }]
[35] }}
```

[01] A standard XML document tag.

[03] - [04] A reference to a short identifier set imported into the request. The names of the short identifiers in the set are available to use in this request. This short identifier set is defined by ACAL.

[05] - [34] The attributes describing the request separated into three categories.

[05] - [14] The first category of attributes.

[06] The `Category` property nominates the category using the short identifier name `access-subject`, which evaluates to `urn:oasis:names:tc:acal:1.0:subject-category:access-subject` using the imported short identifier set. The access subject category contains attributes of the entity making the access request. This category has only one attribute: the subject's identity, expressed as an e-mail name, is `bs@simpsons.com`.

[15] - [24] The second category of attributes is identified as `urn:oasis:names:tc:acal:1.0:attribute-category:resource` using the short identifier name `resource`. The resource category contains attributes of the resource to which access is being requested. This category has only one attribute: Bart Simpson's medical record, identified by its file URI, which is `file://medico/record/patient/BartSimpson`.

[25] - [34] The third category of attributes is identified as `urn:oasis:names:tc:acal:1.0:attribute-category:action` using the short identifier name `action`. The action category contains attributes that describe the action that the subject wishes to take on the resource. In this case the action is `read`.

[35] The end of the request.

A more complex decision request may have contained some attributes not associated with the subject, the resource or the action. Environment would be an example of such an attribute category. These would have been placed in additional `RequestEntity` objects. Examples of such attributes are attributes describing the environment or some application-specific category of attributes.

The PDP processing this decision request locates the policy in its policy repository. It compares the attributes in the request with the policy target. Since the example policy's target is empty, the policy is applicable to this request.

The PDP now compares the attributes in the request with the condition of the one rule in this policy. The requesting `subject-id` attribute does not match `med.example.com`.

### 6.1.3 Example Response

As a result of evaluating the policy, there is no rule in this policy that returns a "Permit" result for this request. The combining algorithm for the policy specifies that, in this case, a result of "NotApplicable" should be returned. The response looks as follows, respectively in XML, YAML and JSON:

```
[01] <?xml version="1.0" encoding="UTF-8"?>
[02] <Response xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
[03]   <Result Decision="NotApplicable"/>
[06] </Response>
```

```
[02] Response:
[03]   Result:
[04]     - Decision: NotApplicable
```

```
[02] {"Response":{
[03]   "Result":[{
[04]     "Decision":"NotApplicable"
[05]   }]
[06] }}
```

[01] A standard XML document tag.

[02] The beginning of the response.

[03] - [05] The `Result` property contains the result of evaluating the decision request against the policy. In this case, the decision is `NotApplicable`. Therefore, a deny-biased PEP will deny access. A policy can return `Permit`, `Deny`, `NotApplicable` or `Indeterminate`.

[06] The end of the response.

## 6.2 Example Two

### 6.2.1 Example Plain-Language Rules

The following plain-language rules are to be enforced.

Rule 1:

: A person, identified by his or her patient number, may read any record for which he or she is the designated patient.

Rule 2:

: A person may read any record for which he or she is the designated parent or guardian, and for which the patient is under 16 years of age.

Rule 3:

: A physician may write to any medical element for which he or she is the designated primary care physician, provided an email is sent to the patient.

Rule 4:

: An administrator shall not be permitted to read or write to medical elements of a patient record.

These rules may be written by different PAPs operating independently, or by a single PAP.

### 6.2.2 Example Short Identifier Set

Policy writers are able to define sets of short identifiers to provide simple alias names to use in place of URIs. A set with the identifier `urn:oasis:names:tc:acal:1.0:core:identifiers` is defined by ACAL for the various identifiers assigned by this specification. However, a deployment will usually have need for additional identifiers, especially for locally-defined attributes, so it is usually desirable to define a set of additional short identifiers to use in the deployment, that may import the first set.

The following short-identifier set, respectively in XML, YAML and JSON, defines short identifiers for the additional attributes and the notice in this example and also imports the standardized set.

```xml
<ShortIdSet xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
  Id="urn:oasis:names:tc:acal:1.0:example:identifiers">

  <!-- Include the short identifiers for standard URIs. -->
  <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:core:identifiers</ShortIdSetReference>

  <!-- These are the short identifiers specific to the deployment. -->
  <!-- Attributes -->
  <ShortId Name="patient-number" Value="urn:oasis:names:tc:acal:1.0:example:attribute:patient-number"/>
  <ShortId Name="collection" Value="urn:oasis:names:tc:acal:1.0:example:attribute:collection"/>
  <ShortId Name="patient-date-of-birth" Value="urn:oasis:names:tc:acal:1.0:example:attribute:patient-date-of-birth"/>
  <ShortId Name="parent-guardian-id" Value="urn:oasis:names:tc:acal:1.0:example:attribute:parent-guardian-id"/>
  <ShortId Name="physician-id" Value="urn:oasis:names:tc:acal:1.0:example:attribute:physician-id"/>
  <ShortId Name="role" Value="urn:oasis:names:tc:acal:1.0:example:attribute:role"/>
  <ShortId Name="patient-contact" Value="urn:oasis:names:tc:acal:1.0:example:attribute:patient-contact"/>
  <ShortId Name="primary-care-physician" Value="urn:oasis:names:tc:acal:1.0:example:attribute:primary-care-physician"/>
  <ShortId Name="mailto" Value="urn:oasis:names:tc:acal:1.0:example:attribute:mailto"/>
  <ShortId Name="text" Value="urn:oasis:names:tc:acal:1.0:example:attribute:text"/>
  <!-- Notices -->
  <ShortId Name="email" Value="urn:oasis:names:tc:acal:1.0:example:notice:email"/>

</ShortIdSet>
```

```yaml
ShortIdSet:
  Id: "urn:oasis:names:tc:acal:1.0:example:identifiers"
  ShortIdSetReference:
    - "urn:oasis:names:tc:acal:1.0:core:identifiers"
  ShortId:
    - Name: patient-number
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:patient-number"
    - Name: collection
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:collection"
    - Name: patient-date-of-birth
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:patient-date-of-birth"
    - Name: parent-guardian-id
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:parent-guardian-id"
    - Name: physician-id
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:physician-id"
    - Name: role
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:role"
    - Name: patient-contact
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:patient-contact"
    - Name: primary-care-physician
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:primary-care-physician"
    - Name: mailto
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:mailto"
    - Name: text
      Value: "urn:oasis:names:tc:acal:1.0:example:attribute:text"
    - Name: email
      Value: "urn:oasis:names:tc:acal:1.0:example:notice:email"
```

```json
{
  "ShortIdSet": {
    "Id":"urn:oasis:names:tc:acal:1.0:example:identifiers",
    "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:core:identifiers"],
    "ShortId":[
      { "Name":"patient-number", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:patient-number" },
      { "Name":"collection", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:collection" },
      { "Name":"patient-date-of-birth", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:patient-date-of-birth" },
      { "Name":"parent-guardian-id", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:parent-guardian-id" },
      { "Name":"physician-id", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:physician-id" },
      { "Name":"role", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:role" },
      { "Name":"patient-contact", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:patient-contact" },
      { "Name":"primary-care-physician", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:primary-care-physician" },
      { "Name":"mailto", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:mailto" },
      { "Name":"text", "Value":"urn:oasis:names:tc:acal:1.0:example:attribute:text" },
      { "Name":"email", "Value":"urn:oasis:names:tc:acal:1.0:example:notice:email" }
    ]
  }
}
```

### 6.2.3 Example Decision Request

The following example illustrates a decision request to which the example rules may be applicable. It represents a request by the physician Julius Hibbert, respectively in XML, YAML and JSON, to read the patient record of Bartholomew Simpson:

```
[01] <?xml version="1.0" encoding="UTF-8"?>
[02] <Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
[03]   <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:example:identifiers</ShortIdSetReference>
[05]   <RequestEntity
[06]     Category="access-subject">
[07]     <RequestAttribute
[08]       AttributeId="subject-id"
[09]       Issuer="med.example.com" DataType="rfc822Name">
[10]       <Value>Julius.Hibbert@med.example.com</Value>
[14]     </RequestAttribute>
[15]     <RequestAttribute
[16]       AttributeId="role"
[17]       Issuer="med.example.com" DataType="string">
[18]       <Value>physician</Value>
[22]     </RequestAttribute>
[23]     <RequestAttribute
[24]       AttributeId="physician-id"
[25]       Issuer="med.example.com" DataType="string">
[26]       <Value>jh1234</Value>
[30]     </RequestAttribute>
[31]   </RequestEntity>
[32]   <RequestEntity
[33]     Category="resource">
[34]     <RequestAttribute
[35]       AttributeId="patient-date-of-birth"
[36]       Issuer="med.example.com" DataType="date">
[37]       <Value>1992-03-21</Value>
[41]     </RequestAttribute>
[42]     <RequestAttribute
[43]       AttributeId="patient-number"
[44]       Issuer="med.example.com" DataType="string">
[45]       <Value>555555</Value>
[49]     </RequestAttribute>
[50]     <RequestAttribute
[51]       AttributeId="patient-contact"
[52]       Issuer="med.example.com" DataType="rfc822Name">
[53]       <Value>b.simpson@example.com</Value>
[57]     </RequestAttribute>
[58]   </RequestEntity>
[59]   <RequestEntity
[60]     Category="action">
[61]     <RequestAttribute
[62]       AttributeId="action-id" DataType="string">
[63]       <Value>read</Value>
[67]     </RequestAttribute>
[68]   </RequestEntity>
[69]   <RequestEntity
[70]     Category="environment">
[71]     <RequestAttribute
[72]       AttributeId="current-date" DataType="date">
[73]       <Value>2010-01-11</Value>
[77]     </RequestAttribute>
[78]   </RequestEntity>
[79] </Request>
```

```
[02] Request:
[03]   ShortIdSetReference:
[04]     - "urn:oasis:names:tc:acal:1.0:example:identifiers"
[05]   RequestEntity:
[06]     - Category: access-subject
[07]       RequestAttribute:
[08]         - AttributeId: subject-id
[09]           Issuer: med.example.com
[10]           DataType: rfc822Name
[11]           Value:
[12]             - Julius.Hibbert@med.example.com
[16]         - AttributeId: role
[17]           Issuer: med.example.com
[18]           DataType: string
[19]           Value:
[20]             - physician
[24]         - AttributeId: physician-id
[25]           Issuer: med.example.com
[26]           DataType: string
[27]           Value:
[28]             - jh1234
[33]     - Category: resource
[34]       RequestAttribute:
[35]         - AttributeId: patient-date-of-birth
[36]           Issuer: med.example.com
[37]           DataType: date
[38]           Value:
[39]             - 1992-03-21
[43]         - AttributeId: patient-number
[44]           Issuer: med.example.com
[45]           DataType: string
[46]           Value:
[47]             - "555555"
[51]         - AttributeId: patient-contact
[52]           Issuer: med.example.com
[53]           DataType: rfc822Name
[54]           Value:
[55]             - b.simpson@example.com
[69]     - Category: action
[61]       RequestAttribute:
[62]         - AttributeId: action-id
[63]           DataType: string
[64]           Value:
[65]             - read
[70]     - Category: environment
[71]       RequestAttribute:
[72]         - AttributeId: current-date
[73]           DataType: date
[74]           Value:
[75]             - 2010-01-11
```

```
[02] {"Request":{
[03]   "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:example:identifiers"],
[05]   "RequestEntity":[{
[06]     "Category":"access-subject",
[07]     "RequestAttribute":[{
[08]       "AttributeId":"subject-id",
[09]       "Issuer":"med.example.com",
[10]       "DataType":"rfc822Name",
[11]       "Value":[
[12]         "Julius.Hibbert@med.example.com"
[13]       ]
[14]     },{
[16]       "AttributeId":"role",
[17]       "Issuer":"med.example.com",
[18]       "DataType":"string",
[19]       "Value":[
[20]         "physician"
[21]       ]
[22]     },{
[24]       "AttributeId":"physician-id",
[25]       "Issuer":"med.example.com",
[26]       "DataType":"string",
[27]       "Value":[
[28]         "jh1234"
[29]       ]
[30]     }]
[31]   },{
[33]     "Category":"resource",
[34]     "RequestAttribute":[{
[35]       "AttributeId":"patient-date-of-birth",
[36]       "Issuer":"med.example.com",
[37]       "DataType":"date",
[38]       "Value":[
[39]         "1992-03-21"
[40]       ]
[41]     },{
[43]       "AttributeId":"patient-number",
[44]       "Issuer":"med.example.com",
[45]       "DataType":"string",
[46]       "Value":[
[47]         "555555"
[48]       ]
[49]     },{
[51]       "AttributeId":"patient-contact",
[52]       "Issuer":"med.example.com",
[53]       "DataType":"rfc822Name",
[54]       "Value":[
[55]         "b.simpson@example.com"
[56]       ]
[57]     }]
[58]   },{
[60]     "Category":"action",
[61]     "RequestAttribute":[{
[62]       "AttributeId":"action-id",
[63]      "DataType":"string",
[64]       "Value":[
[65]         "read"
[66]       ]
[67]     }]
[68]   },{
[70]     "Category":"environment",
[71]     "RequestAttribute":[{
[72]       "AttributeId":"current-date",
[73]       "DataType":"date",
[74]       "Value":[
[75]         "2010-01-11"
[76]       ]
[77]     }]
[78]   }]
[79] }}
```

[01] A standard XML document tag.

[03] - [04] A reference to a short identifier set imported into the request. The names of the short identifiers in the set are available to use in this request. The referenced short identifier set is customized for this example.

[05] - [31] Access subject attributes are placed in the `urn:oasis:names:tc:acal:1.0:subject-category:access-subject` attribute category of the decision request. Each attribute consists of the attribute meta-data and the attribute value.

[07] - [14] The subject's `urn:oasis:names:tc:acal:1.0:subject:subject-id` attribute denoting the identity for which the request was issued.

[15] - [22] The subject's `urn:oasis:names:tc:acal:1.0:example:attribute:role` attribute.

[23] - [30] The subject's `urn:oasis:names:tc:acal:1.0:example:attribute:physician-id` attribute.

[32] - [58] Resource attributes representing the patient's medical record are placed in the `urn:oasis:names:tc:acal:1.0:attribute-category:resource` attribute category of the decision request. Each attribute consists of attribute meta-data and an attribute value.

[34] - [41] The patient's `urn:oasis:names:tc:acal:1.0:example:attribute:patient-date-of-birth` attribute.

[42] - [49] The patient's `urn:oasis:names:tc:acal:1.0:example:attribute:patient-number` attribute.

[50] - [58] The patient's `urn:oasis:names:tc:acal:1.0:example:attribute:patient-contact` attribute.

[59] - [68] Action attributes are placed in the `urn:oasis:names:tc:acal:1.0:attribute-category:action` attribute category of the decision request.

[61] - [67] The `urn:oasis:names:tc:acal:1.0:action:action-id` attribute indicates that the requested action is `read`.

### 6.2.4 Example ACAL Rule Instances

#### 6.2.4.1 Rule 1

Rule 1 illustrates a policy with a simple rule containing a condition. It also illustrates the use of a variable definition to define an expression that may be used throughout the policy. The following ACAL policy, represented in XML, YAML and JSON, contains a rule instance expressing Rule 1 (the numbers in square brackets on the left-hand side are for referencing purposes and are not part of the policy in any representation):

```
[01] <?xml version="1.0" encoding="UTF-8"?>
[02] <Policy
[03]   xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
[04]   PolicyId="urn:oasis:names:tc:acal:1.0:example:policyid:1"
[05]   Version="1.0"
[06]   CombiningAlgId="deny-overrides">
[07]   <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:example:identifiers</ShortIdSetReference>
[09]   <VariableDefinition VariableId="patient_number_match">
[12]     <Apply FunctionId="string-equal">
[15]       <Apply FunctionId="string-one-and-only">
[18]         <AttributeDesignator
[19]           Category="access-subject"
[20]           AttributeId="patient-number"
[21]           DataType="string"/>
[24]       </Apply>
[26]       <Apply FunctionId="string-one-and-only">
[29]         <AttributeDesignator
[30]           Category="resource"
[31]           AttributeId="patient-number"
[32]           DataType="string"/>
[35]       </Apply>
[37]     </Apply>
[39]   </VariableDefinition>
[40]   <Target>
[41]     <Apply FunctionId="anyURI-is-in">
[44]       <Value DataType="anyURI">http://www.med.example.com/springfield-hospital</Value>
[49]       <AttributeDesignator
[50]         Category="resource"
[51]         AttributeId="collection"
[52]         DataType="anyURI"/>
[55]     </Apply>
[56]   </Target>
[58]   <Rule Id="Rule1" Effect="Permit">
[61]     <Description>A person may read any medical record for which he or she is the designated patient.</Description>
[62]     <Condition>
[63]       <Apply FunctionId="and">
[66]         <Apply FunctionId="any-of">
[69]           <Function Id="string-equal"/>
[73]           <Value>read</Value>
[78]           <AttributeDesignator
[79]             Category="action"
[80]             AttributeId="action-id"
[81]             DataType="string"/>
[84]         </Apply>
[86]         <VariableReference VariableId="patient_number_match"/>
[90]       </Apply>
[91]     </Condition>
[92]   </Rule>
[94] </Policy>
```

```
[02] Policy:
[04]   PolicyId: "urn:oasis:names:tc:acal:1.0:example:policyid:1"
[05]   Version: "1.0"
[06]   CombiningAlgId: deny-overrides
[07]   ShortIdSetReference:
[08]     - "urn:oasis:names:tc:acal:1.0:example:identifiers"
[09]   VariableDefinition:
[10]     - VariableId: patient_number_match
[11]       Expression:
[12]         Apply:
[13]           FunctionId: string-equal
[14]           Argument:
[15]             - Apply:
[16]                 FunctionId: string-one-and-only
[17]                 Argument:
[18]                   - AttributeDesignator:
[19]                       Category: access-subject
[20]                       AttributeId: patient-number
[21]                       DataType: string
[26]             - Apply:
[27]                 FunctionId: string-one-and-only
[28]                 Argument:
[29]                   - AttributeDesignator:
[30]                       Category: resource
[31]                       AttributeId: patient-number
[32]                       DataType: string
[40]   Target:
[41]     Apply:
[42]       FunctionId: anyURI-is-in
[43]       Argument:
[44]         - Value:
[45]             DataType: anyURI
[46]             Value: "http://www.med.example.com/springfield-hospital"
[49]         - AttributeDesignator:
[50]             Category: resource
[51]             AttributeId: collection
[52]             DataType: anyURI
[57]   CombinerInput:
[58]     - Rule:
[59]         Id: Rule1
[60]         Effect: Permit
[61]         Description: A person may read any medical record for which he or she is the designated patient.
[62]         Condition:
[63]           Apply:
[64]             FunctionId: and
[65]             Argument:
[66]               - Apply:
[67]                   FunctionId: any-of
[68]                   Argument:
[69]                     - Function:
[70]                         Id: string-equal
[73]                     - Value:
[74]                         DataType: string
[75]                         Value: read
[78]                     - AttributeDesignator:
[79]                         Category: action
[80]                         AttributeId: action-id
[81]                         DataType: string
[86]               - VariableReference:
[87]                   VariableId: patient_number_match
```

```
[02] {"Policy":{
[04]   "PolicyId":"urn:oasis:names:tc:acal:1.0:example:policyid:1",
[05]   "Version":"1.0",
[06]   "CombiningAlgId":"deny-overrides",
[07]   "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:example:identifiers"],
[09]   "VariableDefinition":[{
[10]     "VariableId":"patient_number_match",
[11]     "Expression":{
[12]       "Apply":{
[13]         "FunctionId":"string-equal",
[14]         "Argument":[{
[15]           "Apply":{
[16]             "FunctionId":"string-one-and-only",
[17]             "Argument":[{
[18]               "AttributeDesignator":{
[19]                 "Category":"access-subject",
[20]                 "AttributeId":"patient-number",
[21]                 "DataType":"string"
[22]               }
[23]             }]
[24]           }
[25]         },{
[26]           "Apply":{
[27]             "FunctionId":"string-one-and-only",
[28]             "Argument":[{
[29]               "AttributeDesignator":{
[30]                 "Category":"resource",
[31]                 "AttributeId":"patient-number",
[32]                 "DataType":"string"
[33]               }
[34]             }]
[35]           }
[36]         }]
[37]       }
[38]     }
[39]   }],
[40]   "Target":{
[41]     "Apply":{
[42]       "FunctionId":"anyURI-is-in",
[43]       "Argument":[{
[44]         "Value":{
[45]           "DataType":"anyURI",
[46]           "Value":"http://www.med.example.com/springfield-hospital"
[47]         }
[48]       },{
[49]         "AttributeDesignator":{
[50]           "Category":"resource",
[51]           "AttributeId":"collection",
[52]           "DataType":"anyURI"
[53]         }
[54]       }]
[55]     }
[56]   },
[57]   "CombinerInput":[{
[58]     "Rule":{
[59]       "Id":"Rule1",
[60]       "Effect":"Permit",
[61]       "Description":"A person may read any medical record for which he or she is the designated patient.",
[62]       "Condition":{
[63]         "Apply":{
[64]           "FunctionId":"and",
[65]           "Argument":[{
[66]             "Apply":{
[67]               "FunctionId":"any-of",
[68]               "Argument":[{
[69]                 "Function":{
[70]                   "Id":"string-equal"
[71]                 }
[72]               },{
[73]                 "Value":{
[74]                   "DataType":"string",
[75]                   "Value":"read"
[76]                 }
[77]               },{
[78]                 "AttributeDesignator":{
[79]                   "Category":"action",
[80]                   "AttributeId":"action-id",
[81]                   "DataType":"string"
[82]                 }
[83]               }]
[84]             }
[85]           },{
[86]             "VariableReference":{
[87]               "VariableId":"patient_number_match"
[88]             }
[89]           }]
[90]         }
[91]       }
[92]     }
[93]   }]
[94] }}
```

[07] - [08] A reference to a short identifier set imported into the policy. The names of the short identifiers in the set are available to use in this policy.

[09] - [39] A variable definition. It defines an expression that evaluates the truth of the statement: the patient-number subject attribute is equal to the patient-number attribute in the resource.

[12] - [13] The `FunctionId` property names the function to be used for comparison. In this case, the function is nominated with the short identifier name `string-equal`, which evaluates to `urn:oasis:names:tc:acal:1.0:function:string-equal` using the imported short identifier set. This function takes two arguments of type `urn:oasis:names:tc:acal:1.0:data-type:string`.

[18] - [22] An attribute designator that selects a bag of values for the patient-number subject attribute in the request context.

[19] The `Category` property names the category from which the desired attribute will be obtained. In this case, the category is nominated with the short identifier name `access-subject`, which evaluates to `urn:oasis:names:tc:acal:1.0:subject-category:access-subject` using the imported short identifier set.

[20] The `AttributeId` property nominates the patient-number attribute with the short identifier name `patient-number`, which evaluates to `urn:oasis:names:tc:acal:1.0:example:attribute:patient-number` using the imported short identifier set.

[21] The `DataType` property specifies the data type of the attribute. In this case, the data type is nominated with the short identifier name `string`, which evaluates to `urn:oasis:names:tc:acal:1.0:data-type:string` using the imported short identifier set.

[15] - [16] The attribute designator returns a bag of attribute values but the `urn:oasis:names:tc:acal:1.0:function:string-equal` function takes arguments that are single attribute values. The `FunctionId` property here names a function to convert the bag of values to a single value. The function is nominated with the short identifier name `string-one-and-only`, which evaluates to `urn:oasis:names:tc:acal:1.0:function:string-one-and-only` using the imported short identifier set. This function generates an `Indeterminate` result if its argument is not a bag with exactly one value.

[29] - [33] An attribute designator that selects a bag of values for the patient-number resource attribute in the request context. This attribute designator differs from the previous one in that it selects the attribute from the resource category, `urn:oasis:names:tc:acal:1.0:attribute-category:resource`, nominated with the short identifier name `resource`.

[26] - [27] The result of the second attribute designator must also be converted to a single value for comparison.

[40] - [56] A target, which must evaluate to `true` for the policy to be applicable. This target restricts the applicability of the policy to decision requests for access to medical records belonging to Springfield Hospital.

[41] - [55] The expression for the target, which applies a function.

[42] The `FunctionId` property specifies the `urn:oasis:names:tc:acal:1.0:function:anyURI-is-in` function using the short identifier name `anyURI-is-in`. This function takes an attribute value as its first argument and a bag of values as its second argument. The function evaluates to `true` if the first argument is equal to any value in the bag.

[44] - [47] The first argument: an attribute value. It is a literal URI to be matched, specifically `http://www.med.example.com/springfield-hospital`. The `DataType` property indicates that the data type of the value is `urn:oasis:names:tc:acal:1.0:data-type:anyURI` using the short identifier name `anyURI`.

[49] - [53] The second argument: the bag of values. It is an attribute designator that selects a bag of `urn:oasis:names:tc:acal:1.0:data-type:anyURI` values from the `urn:oasis:names:tc:acal:1.0:example:attribute:collection` attribute (short identifier name `collection`) in the `urn:oasis:names:tc:acal:1.0:attribute-category:resource` category.

[58] - [60] The beginning of a rule definition. The `Id` property assigns a string identifier for the rule. The `Effect` property specifies the value the rule emits when it evaluates to `true`.

[61] A free-form description of the rule.

[62] - [91] A condition, which must evaluate to `true` for the rule to be applicable.

[63] - [90] The expression for the condition.

[63] - [64] The expression for the condition is a conjunction of two terms. The `FunctionId` property specifies a conjunction using the `urn:oasis:names:tc:acal:1.0:function:and` function nominated with the short identifier name `and`.

[66] - [84] The first term is a function.

[66] - [67] The `FunctionId` property specifies the `urn:oasis:names:tc:acal:1.0:function:any-of` function using the short identifier name `any-of`. This function compares an attribute value to each of the attribute values in a bag according to a matching function that is specified in the first argument. The bag of values can be either the second or third argument. In this case it is the third argument. The function evaluates to `true` if any value in the bag matches the second argument according to the matching function.

[69] - [71] The first argument: the matching function. The `Id` property specifies that the matching function is `urn:oasis:names:tc:acal:1.0:function:string-equal` using the short identifier name `string-equal`.

[73] - [76] The second argument: an attribute value. It is a literal string to be matched, specifically `read`. The `DataType` property indicates that the data type of the value is `urn:oasis:names:tc:acal:1.0:data-type:string` using the short identifier name `string`.

[78] - [82] The third argument: the bag of values. It is an attribute designator that selects a bag of `urn:oasis:names:tc:acal:1.0:data-type:string` values from the `urn:oasis:names:tc:acal:1.0:action:action-id` attribute (short identifier name `action-id`) in the `urn:oasis:names:tc:acal:1.0:attribute-category:action` category.

[86] - [88] The second term is a reference to a variable definition defined elsewhere in the policy.

#### 6.2.4.2 Rule 2

Rule 2 illustrates the use of a mathematical function, i.e., `urn:oasis:names:tc:acal:1.0:function:date-add-yearMonthDuration`, to calculate the date of the patient’s sixteenth birthday. The following ACAL policy, represented in XML, YAML and JSON, contains a rule instance expressing Rule 2 (the numbers in square brackets on the left-hand side are for referencing purposes and are not part of the policy in any representation):

```
[001] <?xml version="1.0" encoding="UTF-8"?>
[002] <Policy
[003]   xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
[004]   PolicyId="urn:oasis:names:tc:acal:1.0:example:policyid:2"
[005]   Version="1.0"
[006]   CombiningAlgId="deny-overrides">
[007]   <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:example:identifiers</ShortIdSetReference>
[009]   <VariableDefinition VariableId="patient-under-16">
[012]     <Apply FunctionId="date-less-than">
[015]       <Apply FunctionId="date-one-and-only">
[018]         <AttributeDesignator
[019]           Category="environment"
[020]           AttributeId="current-date"
[021]           DataType="date"/>
[024]       </Apply>
[026]       <Apply FunctionId="date-add-yearMonthDuration">
[029]         <Apply FunctionId="date-one-and-only">
[032]           <AttributeDesignator
[033]             Category="resource"
[034]             AttributeId="patient-date-of-birth"
[035]             DataType="date"/>
[038]         </Apply>
[040]         <Value DataType="yearMonthDuration">P16Y</Value>
[045]       </Apply>
[047]     </Apply>
[049]   </VariableDefinition>
[050]   <Target>
[051]     <Apply FunctionId="anyURI-is-in">
[054]       <Value DataType="anyURI">http://www.med.example.com/springfield-hospital</Value>
[059]       <AttributeDesignator
[060]         Category="resource"
[061]         AttributeId="collection"
[062]         DataType="anyURI"/>
[065]     </Apply>
[066]   </Target>
[068]   <Rule Id="Rule2" Effect="Permit">
[071]     <Description>A person may read any medical record in the http://www.med.example.com/records.xsd namespace for which he or she is the designated parent or guardian, and for which the patient is under 16 years of age.</Description>
[072]     <Condition>
[073]       <Apply FunctionId="and">
[076]         <Apply FunctionId="string-is-in">
[079]           <Value DataType="string">read</Value>
[083]           <AttributeDesignator
[084]             Category="action"
[085]             AttributeId="action-id"
[086]             DataType="string"/>
[089]         </Apply>
[091]         <Apply FunctionId="rfc822Name-equal">
[094]           <Apply FunctionId="rfc822Name-one-and-only">
[097]             <AttributeDesignator
[098]               Category="access-subject"
[099]               AttributeId="subject-id"
[100]               DataType="rfc822Name"/>
[103]           </Apply>
[105]           <Apply FunctionId="rfc822Name-one-and-only">
[108]             <AttributeDesignator
[109]               Category="resource"
[110]               AttributeId="parent-guardian-id"
[111]               DataType="rfc822Name"/>
[114]           </Apply>
[116]         </Apply>
[118]         <VariableReference VariableId="patient-under-16"/>
[122]       </Apply>
[123]     </Condition>
[124]   </Rule>
[126] </Policy>
```

```
[002] Policy:
[004]   PolicyId: "urn:oasis:names:tc:acal:1.0:example:policyid:2"
[005]   Version: "1.0"
[006]   CombiningAlgId: deny-overrides
[007]   ShortIdSetReference:
[008]     - "urn:oasis:names:tc:acal:1.0:example:identifiers"
[009]   VariableDefinition:
[010]     - VariableId: patient-under-16
[011]       Expression:
[012]         Apply:
[013]           FunctionId: date-less-than
[014]           Argument:
[015]             - Apply:
[016]                 FunctionId: date-one-and-only
[017]                 Argument:
[018]                   - AttributeDesignator:
[019]                       Category: environment
[020]                       AttributeId: current-date
[021]                       DataType: date
[026]             - Apply:
[027]                 FunctionId: date-add-yearMonthDuration
[028]                 Argument:
[029]                   - Apply:
[030]                       FunctionId: date-one-and-only
[031]                       Argument:
[032]                         - AttributeDesignator:
[033]                             Category: resource
[034]                             AttributeId: patient-date-of-birth
[035]                             DataType: date
[040]                   - Value:
[041]                       DataType: yearMonthDuration
[042]                       Value: P16Y
[050]   Target:
[051]     Apply:
[052]       FunctionId: anyURI-is-in
[053]       Argument:
[054]         - Value:
[055]             DataType: anyURI
[056]             Value: "http://www.med.example.com/springfield-hospital"
[059]         - AttributeDesignator:
[060]             Category: resource
[061]             AttributeId: collection
[062]             DataType: anyURI
[067]   CombinerInput:
[068]     - Rule:
[069]         Id: Rule2
[070]         Effect: Permit
[071]         Description: "A person may read any medical record in the http://www.med.example.com/records.xsd namespace for which he or she is the designated parent or guardian, and for which the patient is under 16 years of age."
[072]         Condition:
[073]           Apply:
[074]             FunctionId: and
[075]             Argument:
[076]               - Apply:
[077]                   FunctionId: string-is-in
[078]                   Argument:
[079]                     - Value:
[080]                         DataType: string
[081]                         Value: read
[083]                     - AttributeDesignator:
[084]                         Category: action
[085]                         AttributeId: action-id
[086]                         DataType: string
[091]               - Apply:
[092]                   FunctionId: rfc822Name-equal
[093]                   Argument:
[094]                     - Apply:
[095]                         FunctionId: rfc822Name-one-and-only
[096]                         Argument:
[097]                           - AttributeDesignator:
[098]                               Category: access-subject
[099]                               AttributeId: subject-id
[100]                               DataType: rfc822Name
[105]                     - Apply:
[106]                         FunctionId: rfc822Name-one-and-only
[107]                         Argument:
[108]                           - AttributeDesignator:
[109]                               Category: resource
[110]                               AttributeId: parent-guardian-id
[111]                               DataType: rfc822Name
[118]               - VariableReference:
[119]                   VariableId: patient-under-16
```

```
[002] {"Policy":{
[004]   "PolicyId":"urn:oasis:names:tc:acal:1.0:example:policyid:2",
[005]   "Version":"1.0",
[006]   "CombiningAlgId":"deny-overrides",
[007]   "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:example:identifiers"],
[009]   "VariableDefinition":[{
[010]     "VariableId":"patient-under-16",
[011]     "Expression":{
[012]       "Apply":{
[013]         "FunctionId":"date-less-than",
[014]         "Argument":[{
[015]           "Apply":{
[016]             "FunctionId":"date-one-and-only",
[017]             "Argument":[{
[018]               "AttributeDesignator":{
[019]                 "Category":"environment",
[020]                 "AttributeId":"current-date",
[021]                 "DataType":"date"
[022]               }
[023]             }]
[024]           }
[025]         },{
[026]           "Apply":{
[027]             "FunctionId":"date-add-yearMonthDuration",
[028]             "Argument":[{
[029]               "Apply":{
[030]                 "FunctionId":"date-one-and-only",
[031]                 "Argument":[{
[032]                   "AttributeDesignator":{
[033]                     "Category":"resource",
[034]                     "AttributeId":"patient-date-of-birth",
[035]                     "DataType":"date"
[036]                   }
[037]                 }]
[038]               }
[039]             },{
[040]               "Value":{
[041]                 "DataType":"yearMonthDuration",
[042]                 "Value":"P16Y"
[043]               }
[044]             }]
[045]           }
[046]         }]
[047]       }
[048]     }
[049]   }],
[050]   "Target":{
[051]     "Apply":{
[052]       "FunctionId":"anyURI-is-in",
[053]       "Argument":[{
[054]         "Value":{
[055]           "DataType":"anyURI",
[056]           "Value":"http://www.med.example.com/springfield-hospital"
[057]         }
[058]       },{
[059]         "AttributeDesignator":{
[060]           "Category":"resource",
[061]           "AttributeId":"collection",
[062]           "DataType":"anyURI"
[063]         }
[064]       }]
[065]     }
[066]   },
[067]   "CombinerInput":[{
[068]     "Rule":{
[069]       "Id":"Rule2",
[070]       "Effect":"Permit",
[071]       "Description":"A person may read any medical record in the http://www.med.example.com/records.xsd namespace for which he or she is the designated parent or guardian, and for which the patient is under 16 years of age.",
[072]       "Condition":{
[073]         "Apply":{
[074]           "FunctionId":"and",
[075]           "Argument":[{
[076]             "Apply":{
[077]               "FunctionId":"string-is-in",
[078]               "Argument":[{
[079]                 "Value":"read"
[082]               },{
[083]                   "AttributeDesignator":{
[084]                     "Category":"action",
[085]                     "AttributeId":"action-id",
[086]                     "DataType":"string"
[087]                   }
[088]               }]
[089]             }
[090]           },{
[091]             "Apply":{
[092]               "FunctionId":"rfc822Name-equal",
[093]               "Argument":[{
[094]                 "Apply":{
[095]                   "FunctionId":"rfc822Name-one-and-only",
[096]                   "Argument":[{
[097]                     "AttributeDesignator":{
[098]                       "Category":"access-subject",
[099]                       "AttributeId":"subject-id",
[100]                       "DataType":"rfc822Name"
[101]                     }
[102]                   }]
[103]                 }
[104]               },{
[105]                 "Apply":{
[106]                   "FunctionId":"rfc822Name-one-and-only",
[107]                   "Argument":[{
[108]                     "AttributeDesignator":{
[109]                       "Category":"resource",
[110]                       "AttributeId":"parent-guardian-id",
[111]                       "DataType":"rfc822Name"
[112]                     }
[113]                   }]
[114]                 }
[115]               }]
[116]             }
[117]           },{
[118]             "VariableReference":{
[119]               "VariableId":"patient-under-16"
[120]             }
[121]           }]
[122]         }
[123]       }
[124]     }
[125]   }]
[126] }}
```

[009] - [049] A variable definition containing part of the condition (i.e. is the patient under 16 years of age?).  The patient is under 16 years of age if the current date is less than the date computed by adding 16 years to the patient’s date of birth.

[012] - [013] The `urn:oasis:names:tc:acal:1.0:function:date-less-than` function (short identifier name `date-less-than`) is used to compare the two date arguments.

[015] - [024] The first date argument uses the `urn:oasis:names:tc:acal:1.0:function:date-one-and-only` function (short identifier name `date-one-and-only`) to ensure that the bag of values selected by its argument contains exactly one value of type `urn:oasis:names:tc:acal:1.0:data-type:date` (short identifier name `date`).

[018] - [22] The current date is evaluated with an attribute designator selecting the `urn:oasis:names:tc:acal:1.0:environment:current-date` environment attribute (short identifier name `current-date`).

[026] - [045] The second date argument uses the `urn:oasis:names:tc:acal:1.0:function:date-add-yearMonthDuration` function (short identifier name `date-add-yearMonthDuration`) to compute the date of the patient’s sixteenth birthday by adding 16 years to the patient’s date of birth. The first of its arguments is of type `urn:oasis:names:tc:acal:1.0:data-type:date` and the second is of type `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration` (short identifier name `yearMonthDuration`).

[032] - [036] An attribute designator that selects a bag of `urn:oasis:names:tc:acal:1.0:data-type:date` values from the `urn:oasis:names:tc:acal:1.0:example:attribute:patient-date-of-birth` attribute (short identifier name `patient-date-of-birth`) in the `urn:oasis:names:tc:acal:1.0:attribute-category:resource` category.

[040] - [043] A literal `urn:oasis:names:tc:acal:1.0:function:date-add-yearMonthDuration` value that specifies a duration of 16 years.

[050] - [066] The target restricts the applicability of the policy to decision requests for access to medical records belonging to Springfield Hospital.

[068] - [124] The rule that assesses the decision request.

[072] - [123] The rule's condition, which must evaluate to `true` for the rule to be applicable. This condition evaluates, in part, the truth of the statement: the requestor is the designated parent or guardian and the patient is under 16 years of age.

[073] - [122] The expression for the condition is the conjunction of three terms using the `urn:oasis:names:tc:acal:1.0:function:and` function.

[076] - [089] The first term is satisfied if the requested access is `read`.

[091] - [116] The second term tests whether the subject is the designated parent or guardian of the patient according to the resource. The function is `urn:oasis:names:tc:acal:1.0:function:rfc822Name-equal` and it takes two arguments of type `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`.

[094] - [103] Since `urn:oasis:names:tc:acal:1.0:function:rfc822Name-equal` takes arguments of type `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`, the `urn:oasis:names:tc:acal:1.0:function:rfc822Name-one-and-only` function is used to ensure that the subject attribute `urn:oasis:names:tc:acal:1.0:subject:subject-id` in the decision request contains exactly one value.

[097] - [101] The value of the subject attribute `urn:oasis:names:tc:acal:1.0:subject:subject-id` is selected from the decision request using an attribute designator.

[105] - [114] As above, the `urn:oasis:names:tc:acal:1.0:function:rfc822Name-one-and-only` function is used to ensure that the bag of values selected by its argument contains exactly one value of type `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`.

[108] - [112] The value of the resource attribute `urn:oasis:names:tc:acal:1.0:example:attribute:parent-guardian-id` (short identifier name `parent-guardian-id`) is selected from the decision request using an attribute designator.

[118] - [120] The third term is a reference to the variable definition that tests whether the patient is under 16 years of age.

#### 6.2.4.3 Rule 3

Rule 3 illustrates the use of a notice expression.

```
[001] <?xml version="1.0" encoding="UTF-8"?>
[002] <Policy
[003]   xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
[004]   PolicyId="urn:oasis:names:tc:acal:1.0:example:policyid:3"
[005]   Version="1.0"
[006]   CombiningAlgId="deny-overrides">
[007]   <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:example:identifiers</ShortIdSetReference>
[009]   <Description>Policy for any medical record in the Springfield Hospital collection.</Description>
[010]   <Target>
[011]     <Apply FunctionId="anyURI-is-in">
[014]       <Value DataType="anyURI">http://www.med.example.com/springfield-hospital</Value>
[019]       <AttributeDesignator
[020]         Category="resource"
[021]         AttributeId="collection"
[022]         DataType="anyURI"/>
[025]     </Apply>
[026]   </Target>
[028]   <Rule Id="Rule3" Effect="Permit">
[031]     <Description>A physician may write any medical element in a record for which he or she is the designated primary care physician, provided an email is sent to the patient.</Description>
[032]     <Condition>
[033]       <Apply FunctionId="and">
[036]         <Apply FunctionId="string-is-in">
[039]           <Value DataType="string">physician</Value>
[044]           <AttributeDesignator
[045]             Category="access-subject"
[046]             AttributeId="role"
[047]             DataType="string"/>
[050]         </Apply>
[052]         <Apply FunctionId="string-is-in">
[055]           <Value DataType="string">write</Value>
[060]           <AttributeDesignator
[061]             Category="action"
[062]             AttributeId="action-id"
[063]             DataType="string"/>
[066]         </Apply>
[068]         <Apply FunctionId="string-equal">
[071]           <Apply FunctionId="string-one-and-only">
[074]             <AttributeDesignator
[075]               Category="access-subject"
[076]               AttributeId="physician-id"
[077]               DataType="string"/>
[080]           </Apply>
[082]           <Apply FunctionId="string-one-and-only">
[085]             <AttributeDesignator
[086]               Category="resource"
[087]               AttributeId="primary-care-physician"
[088]               DataType="string"/>
[091]           </Apply>
[093]         </Apply>
[095]       </Apply>
[096]     </Condition>
[097]   </Rule>
[099]   <NoticeExpression
[100]     IsObligation="true"
[101]     Id="email"
[102]     AppliesTo="Permit">
[103]     <AttributeAssignmentExpression
[104]       AttributeId="mailto">
[106]       <AttributeDesignator
[107]         Category="resource"
[108]         AttributeId="patient-contact"
[109]         DataType="rfc822Name"/>
[112]     </AttributeAssignmentExpression>
[113]     <AttributeAssignmentExpression
[114]       AttributeId="text">
[116]       <Apply FunctionId="string-concatenate">
[119]         <Value DataType="string">Your medical record has been accessed by: </Value>
[124]         <Apply FunctionId="string-one-and-only">
[127]           <AttributeDesignator
[128]             Category="access-subject"
[129]             AttributeId="physician-id"
[130]             DataType="string"/>
[133]         </Apply>
[135]       </Apply>
[137]     </AttributeAssignmentExpression>
[138]   </NoticeExpression>
[139] </Policy>
```

```
[002] Policy:
[004]   PolicyId: "urn:oasis:names:tc:acal:1.0:example:policyid:3"
[005]   Version: "1.0"
[006]   CombiningAlgId: deny-overrides
[007]   ShortIdSetReference:
[008]     - "urn:oasis:names:tc:acal:1.0:example:identifiers"
[009]   Description: Policy for any medical record in the Springfield Hospital collection.
[010]   Target:
[011]     Apply:
[012]       FunctionId: anyURI-is-in
[013]       Argument:
[014]         - Value:
[015]             DataType: anyURI
[016]             Value: "http://www.med.example.com/springfield-hospital"
[019]         - AttributeDesignator:
[020]             Category: resource
[021]             AttributeId: collection
[022]             DataType: anyURI
[027]   CombinerInput:
[028]     - Rule:
[029]         Id: Rule3
[030]         Effect: Permit
[031]         Description: A physician may write any medical element in a record for which he or she is the designated primary care physician, provided an email is sent to the patient.
[032]         Condition:
[033]           Apply:
[034]             FunctionId: and
[035]             Argument:
[036]               - Apply:
[037]                   FunctionId: string-is-in
[038]                   Argument:
[039]                     - Value:
[040]                         DataType: string
[041]                         Value: physician
[044]                     - AttributeDesignator:
[045]                         Category: access-subject
[046]                         AttributeId: role
[047]                         DataType: string
[052]               - Apply:
[053]                   FunctionId: string-is-in
[054]                   Argument:
[055]                     - Value:
[056]                         DataType: string
[057]                         Value: write
[060]                     - AttributeDesignator:
[061]                         Category: action
[062]                         AttributeId: action-id
[063]                         DataType: string
[068]               - Apply:
[069]                   FunctionId: string-equal
[070]                   Argument:
[071]                     - Apply:
[072]                         FunctionId: string-one-and-only
[073]                         Argument:
[074]                           - AttributeDesignator:
[075]                               Category: access-subject
[076]                               AttributeId: physician-id
[077]                               DataType: string
[082]                     - Apply:
[083]                         FunctionId: string-one-and-only
[084]                         Argument:
[085]                           - AttributeDesignator:
[086]                               Category: resource
[087]                               AttributeId: primary-care-physician
[088]                               DataType: string
[099]   NoticeExpression:
[100]     - IsObligation: true
[101]       Id: email
[102]       AppliesTo: Permit
[103]       AttributeAssignmentExpression:
[104]         - AttributeId: mailto
[105]           Expression:
[106]             AttributeDesignator:
[107]               Category: resource
[108]               AttributeId: patient-contact
[109]               DataType: rfc822Name
[114]         - AttributeId: text
[115]           Expression:
[116]             Apply:
[117]               FunctionId: string-concatenate
[118]               Argument:
[119]                 - Value:
[120]                     DataType: string
[121]                     Value: "Your medical record has been accessed by: "
[124]                 - Apply:
[125]                     FunctionId: string-one-and-only
[126]                     Argument:
[127]                       - AttributeDesignator:
[128]                           Category: access-subject
[129]                           AttributeId: physician-id
[130]                           DataType: string
```

```
[002] {"Policy":{
[004]   "PolicyId":"urn:oasis:names:tc:acal:1.0:example:policyid:3",
[005]   "Version":"1.0",
[006]   "CombiningAlgId":"deny-overrides",
[007]   "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:example:identifiers"],
[009]   "Description":"Policy for any medical record in the Springfield Hospital collection.",
[010]   "Target":{
[011]     "Apply":{
[012]       "FunctionId":"anyURI-is-in",
[013]       "Argument":[{
[014]         "Value":{
[015]           "DataType":"anyURI",
[016]           "Value":"http://www.med.example.com/springfield-hospital"
[017]         }
[018]       },{
[019]         "AttributeDesignator":{
[020]           "Category":"resource",
[021]           "AttributeId":"collection",
[022]           "DataType":"anyURI"
[023]         }
[024]       }]
[025]     }
[026]   },
[027]   "CombinerInput":[{
[028]     "Rule":{
[029]       "Id":"Rule3",
[030]       "Effect":"Permit",
[031]       "Description":"A physician may write any medical element in a record for which he or she is the designated primary care physician, provided an email is sent to the patient.",
[032]       "Condition":{
[033]         "Apply":{
[034]           "FunctionId":"and",
[035]           "Argument":[{
[036]             "Apply":{
[037]               "FunctionId":"string-is-in",
[038]               "Argument":[{
[039]                 "Value":{
[040]                   "DataType":"string",
[041]                   "Value":"physician"
[042]                 }
[043]               },{
[044]                 "AttributeDesignator":{
[045]                   "Category":"access-subject",
[046]                   "AttributeId":"role",
[047]                   "DataType":"string"
[048]                 }
[049]               }]
[050]             }
[051]           },{
[052]             "Apply":{
[053]               "FunctionId":"string-is-in",
[054]               "Argument":[{
[055]                 "Value":{
[056]                   "DataType":"string",
[057]                   "Value":"write"
[058]                 }
[059]               },{
[060]                 "AttributeDesignator":{
[061]                   "Category":"action",
[062]                   "AttributeId":"action-id",
[063]                   "DataType":"string"
[064]                 }
[065]               }]
[066]             }
[067]           },{
[068]             "Apply":{
[069]               "FunctionId":"string-equal",
[070]               "Argument":[{
[071]                 "Apply":{
[072]                   "FunctionId":"string-one-and-only",
[073]                   "Argument":[{
[074]                     "AttributeDesignator":{
[075]                       "Category":"access-subject",
[076]                       "AttributeId":"physician-id",
[077]                       "DataType":"string"
[078]                     }
[079]                   }]
[080]                 }
[081]               },{
[082]                 "Apply":{
[083]                   "FunctionId":"string-one-and-only",
[084]                   "Argument":[{
[085]                     "AttributeDesignator":{
[086]                       "Category":"resource",
[087]                       "AttributeId":"primary-care-physician",
[088]                       "DataType":"string"
[089]                     }
[090]                   }]
[091]                 }
[092]               }]
[093]             }
[094]           }]
[095]         }
[096]       }
[097]     }
[098]   }],
[099]   "NoticeExpression":[{
[100]      "IsObligation":true,
[101]      "Id":"email",
[102]      "AppliesTo":"Permit",
[103]      "AttributeAssignmentExpression":[{
[104]        "AttributeId":"mailto",
[105]        "Expression":{
[106]          "AttributeDesignator":{
[107]            "Category":"resource",
[108]            "AttributeId":"patient-contact",
[109]            "DataType":"rfc822Name"
[110]          }
[111]        }
[112]      },{
[114]        "AttributeId":"text",
[115]        "Expression":{
[116]          "Apply":{
[117]            "FunctionId":"string-concatenate",
[118]            "Argument":[{
[119]              "Value":{
[120]                "DataType":"string",
[121]                "Value":"Your medical record has been accessed by: "
[122]              }
[123]            },{
[124]              "Apply":{
[125]                "FunctionId":"string-one-and-only",
[126]                "Argument":[{
[127]                  "AttributeDesignator":{
[128]                    "Category":"access-subject",
[129]                    "AttributeId":"physician-id",
[130]                    "DataType":"string"
[131]                  }
[132]                }]
[133]              }
[134]            }]
[135]          }
[136]        }
[137]      }]
[138]   }]
[139] }}
```

[010] - [026] The target restricts the applicability of the policy to decision requests for access to medical records belonging to Springfield Hospital.

[028] - [097] The rule that assesses the decision request.

[032] - [096] The rule's condition, which must evaluate to `true` for the rule to be applicable.

[033] - [095] The expression for the condition is the conjunction of three terms using the `urn:oasis:names:tc:acal:1.0:function:and` function.

[036] - [050] The first term is satisfied if the subject's `urn:oasis:names:tc:acal:1.0:example:attribute:role` attribute contains the string value `physician`.

[052] - [066] The second term is satisfied if the requested access is `write`.

[068] - [093] The third term is satisfied if the accessing physician is the patient's primary physician, i.e., if the `urn:oasis:names:tc:acal:1.0:example:attribute:physician-id` attribute of the access subject is equal to the `urn:oasis:names:tc:acal:1.0:example:attribute:primary-care-physician` attribute of the resource.

[099] - [138] A notice expression.

[100] The `IsObligation` property indicates that this notice is an obligation rather than advice. Obligations are a set of operations that must be performed by the PEP in conjunction with an authorization decision. An obligation may be associated with a `Permit` or `Deny` authorization decision. The policy contains a single notice expression, which will be evaluated into an obligation notice when the policy is evaluated.

[101] The `Id` property indicates the kind of obligation. The PEP associates the identifier with particular processing requirements. In this case, the obligation requires the PEP to send an email.

[102] The `AppliesTo` property specifies the authorization decision value for which the obligation notice derived from the notice expression must be fulfilled. In this case, the obligation must be fulfilled when access is permitted.

[103] - [137] Additional information may be provided in a notice by evaluating attribute assignment expressions.

[103] - [112] The first attribute assignment indicates the recipient email address, which is obtained from the `urn:oasis:names:tc:acal:1.0:example:attribute:patient-contact` resource attribute using an attribute designator.

[113] - [137] The second attribute assignment provides the email body text. The literal prefix and the identity of the physician (obtained from the `urn:oasis:names:tc:acal:1.0:example:attribute:physician-id` subject attribute using an attribute designator) are combined into a single value with the `urn:oasis:names:tc:acal:1.0:function:string-concatenate` function. The attribute designator returns a bag of attribute values but `string-concatenate` takes arguments that are single string values, so the designator is wrapped in the `string-one-and-only` function to reduce the bag to a single value.

A notice expression is not required to keep its attribute assignments unique by the `(AttributeId, Category)` pair, so the body text could instead have been supplied as two separate assignments sharing the `text` `AttributeId`. Constructing the complete value in a single assignment, as shown here, is nevertheless the recommended practice: neither the order of attribute assignments within a notice nor the order of values within a bag is guaranteed to be preserved, so composing the value in the policy leaves no ambiguity for the PEP to resolve. Where a notice does accept repeated assignments, it is the definition of that individual obligation or advice — not this specification — that states how they are to be interpreted.

#### 6.2.4.4 Rule 4

Rule 4 illustrates the use of the `Deny` effect value.

```
[01] <?xml version="1.0" encoding="UTF-8"?>
[02] <Policy
[03]   xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
[04]   PolicyId="urn:oasis:names:tc:acal:1.0:example:policyid:4"
[05]   Version="1.0"
[06]   CombiningAlgId="deny-overrides">
[07]   <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:example:identifiers</ShortIdSetReference>
[10]   <Rule
[11]     Id="Rule4"
[12]     Effect="Deny">
[13]     <Description>An Administrator shall not be permitted to read or write medical elements of a patient record in the Springfield Hospital collection.</Description>
[14]     <Condition>
[15]       <Apply FunctionId="and">
[18]         <Apply FunctionId="string-is-in">
[21]           <Value DataType="string">administrator</Value>
[26]           <AttributeDesignator
[27]             Category="access-subject"
[28]             AttributeId="role"
[29]             DataType="string"/>
[32]         </Apply>
[34]         <Apply FunctionId="anyURI-is-in">
[37]           <Value DataType="anyURI">http://www.med.example.com/springfield-hospital</Value>
[42]           <AttributeDesignator
[43]             Category="resource"
[44]             AttributeId="collection"
[45]             DataType="anyURI"/>
[48]         </Apply>
[50]         <Apply FunctionId="or">
[53]           <Apply FunctionId="string-is-in">
[56]             <Value DataType="string">read</Value>
[61]             <AttributeDesignator
[62]                 Category="action"
[63]                 AttributeId="action-id"
[64]                 DataType="string"/>
[67]           </Apply>
[69]           <Apply FunctionId="string-is-in">
[72]             <Value DataType="string">write</Value>
[77]             <AttributeDesignator
[78]               Category="action"
[79]               AttributeId="action-id"
[80]               DataType="string"/>
[83]           </Apply>
[85]         </Apply>
[87]       </Apply>
[88]     </Condition>
[89]   </Rule>
[91] </Policy>
```

```
[02] Policy:
[04]   PolicyId: "urn:oasis:names:tc:acal:1.0:example:policyid:4"
[05]   Version: "1.0"
[06]   CombiningAlgId: deny-overrides
[07]   ShortIdSetReference:
[08]     - "urn:oasis:names:tc:acal:1.0:example:identifiers"
[09]   CombinerInput:
[10]     - Rule:
[11]         Id: Rule4
[12]         Effect: Deny
[13]         Description: An Administrator shall not be permitted to read or write medical elements of a patient record in the Springfield Hospital collection.
[14]         Condition:
[15]           Apply:
[16]             FunctionId: and
[17]             Argument:
[18]               - Apply:
[19]                   FunctionId: string-is-in
[20]                   Argument:
[21]                     - Value:
[22]                         DataType: string
[23]                         Value: administrator
[26]                     - AttributeDesignator:
[27]                         Category: access-subject
[28]                         AttributeId: role
[29]                         DataType: string
[34]               - Apply:
[35]                   FunctionId: anyURI-is-in
[36]                   Argument:
[37]                     - Value:
[38]                         DataType: anyURI
[39]                         Value: "http://www.med.example.com/springfield-hospital"
[42]                     - AttributeDesignator:
[43]                         Category: resource
[44]                         AttributeId: collection
[45]                         DataType: anyURI
[50]               - Apply:
[51]                   FunctionId: or
[52]                   Argument:
[53]                     - Apply:
[54]                         FunctionId: string-is-in
[55]                         Argument:
[56]                           - Value:
[57]                               DataType: string
[58]                               Value: read
[61]                           - AttributeDesignator:
[62]                               Category: action
[63]                               AttributeId: action-id
[64]                               DataType: string
[69]                     - Apply:
[70]                         FunctionId: string-is-in
[71]                         Argument:
[72]                           - Value:
[73]                               DataType: string
[74]                               Value: write
[77]                           - AttributeDesignator:
[78]                               Category: action
[79]                               AttributeId: action-id
[80]                               DataType: string
```

```
[02] {"Policy":{
[04]   "PolicyId":"urn:oasis:names:tc:acal:1.0:example:policyid:4",
[05]   "Version":"1.0",
[06]   "CombiningAlgId":"deny-overrides",
[07]   "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:example:identifiers"],
[09]   "CombinerInput":[{
[10]     "Rule":{
[11]       "Id":"Rule4",
[12]       "Effect":"Deny",
[13]       "Description":"An Administrator shall not be permitted to read or write medical elements of a patient record in the Springfield Hospital collection.",
[14]       "Condition":{
[15]         "Apply":{
[16]           "FunctionId":"and",
[17]           "Argument":[{
[18]             "Apply":{
[19]               "FunctionId":"string-is-in",
[20]               "Argument":[{
[21]                 "Value":{
[22]                   "DataType":"string",
[23]                   "Value":"administrator"
[24]                 }
[25]               },{
[26]                 "AttributeDesignator":{
[27]                   "Category":"access-subject",
[28]                   "AttributeId":"role",
[29]                   "DataType":"string"
[30]                 }
[31]               }]
[32]             }
[33]           },{
[34]             "Apply":{
[35]               "FunctionId":"anyURI-is-in",
[36]               "Argument":[{
[37]                 "Value":{
[38]                   "DataType":"anyURI",
[39]                   "Value":"http://www.med.example.com/springfield-hospital"
[40]                 }
[41]               },{
[42]                 "AttributeDesignator":{
[43]                   "Category":"resource",
[44]                   "AttributeId":"collection",
[45]                   "DataType":"anyURI"
[46]                 }
[47]               }]
[48]             }
[49]           },{
[50]             "Apply":{
[51]               "FunctionId":"or",
[52]               "Argument":[{
[53]                 "Apply":{
[54]                   "FunctionId":"string-is-in",
[55]                   "Argument":[{
[56]                     "Value":{
[57]                       "DataType":"string",
[58]                       "Value":"read"
[59]                     }
[60]                   },{
[61]                     "AttributeDesignator":{
[62]                       "Category":"action",
[63]                       "AttributeId":"action-id",
[64]                       "DataType":"string"
[65]                     }
[66]                   }]
[67]                 }
[68]               },{
[69]                 "Apply":{
[70]                   "FunctionId":"string-is-in",
[71]                   "Argument":[{
[72]                     "Value":{
[73]                       "DataType":"string",
[74]                       "Value":"write"
[75]                     }
[76]                   },{
[77]                     "AttributeDesignator":{
[78]                       "Category":"action",
[79]                       "AttributeId":"action-id",
[80]                       "DataType":"string"
[81]                     }
[82]                   }]
[83]                 }
[84]               }]
[85]             }
[86]           }]
[87]         }
[88]       }
[89]     }
[90]   }]
[91] }}
```

[10] - [73] The rule that assesses the decision request.

[12] The rule effect is `Deny`. If the rule's condition is `true` then the rule evaluates to `Deny`.

[14] - [72] The rule's condition, which must evaluate to `true` for the rule to be applicable.

[15] - [71] The expression for the condition is the conjunction of three terms using the `urn:oasis:names:tc:acal:1.0:function:and` function.

[18] - [32] The first term is satisfied if the subject's `urn:oasis:names:tc:acal:1.0:example:attribute:role` attribute contains the string value `administrator`.

[34] - [48] The second term checks that the request is to access a medical record belonging to Springfield Hospital.

[50] - [85] The third term is a disjunction of two terms using the `urn:oasis:names:tc:acal:1.0:function:or` function (short identifier name `or`).

[53] - [67] The first term of the disjunction is satisfied if the requested access is `read`.

[69] - [83] The second term of the disjunction is satisfied if the requested access is `write`.

If an administrator attempts to read or write a patient record, then the condition is satisfied and the rule evaluates to `Deny`. According to the policy's `urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-overrides` combining algorithm, if any of the policy's rules (there is only one here) evaluates to `Deny` then the policy evaluates to `Deny` and the administrator is prevented from accessing the patient record.

#### 6.2.4.5 Example Policy with Nested Policies

This section uses the examples of the previous sections to illustrate the process of combining policies.  The policy governing access to medical elements of a record is formed from each of the four rules described in Section 6.2.4. In plain language, the combined rule is:

- Either the requestor is the patient (Rule 1); or

- the requestor is the parent or guardian and the patient is under 16 (Rule 2); or

- the requestor is the primary care physician and a notification is sent to the patient (Rule 3); and

- the requestor is not an administrator (Rule 4).

The following policy illustrates the combined policies. Rule 1, Rule 2 and Rule 3 are duplicated in a new nested policy. The policy containing Rule 4 is included by reference.

```
[01] <?xml version="1.0" encoding="UTF-8"?>
[02] <Policy
[03]   xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
[04]   PolicyId="urn:oasis:names:tc:acal:1.0:example:policyid:5"
[05]   Version="1.0"
[06]   CombiningAlgId="deny-overrides">
[07]   <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:example:identifiers</ShortIdSetReference>
[09]   <Description>Collected policies.</Description>
[11]   <Policy
[12]     PolicyId="urn:oasis:names:tc:acal:1.0:example:policyid:6"
[13]     Version="1.0"
[14]     CombiningAlgId="deny-overrides">
[15]     <Target>
[16]       <Apply FunctionId="anyURI-is-in">
[19]         <Value DataType="anyURI">http://www.med.example.com/springfield-hospital</Value>
[24]         <AttributeDesignator
[25]           Category="resource"
[26]           AttributeId="collection"
[27]           DataType="anyURI"/>
[30]       </Apply>
[31]     </Target>
[33]     <Rule
[34]       Id="Rule1"
[35]       Effect="Permit">
[36]       ...
[37]     </Rule>
[39]     <Rule
[40]       Id="Rule2"
[41]       Effect="Permit">
[42]       ...
[43]     </Rule>
[45]     <Rule
[46]       Id="Rule3"
[47]       Effect="Permit">
[48]       ...
[49]     </Rule>
[51]   </Policy>
[53]   <PolicyReference Id="urn:oasis:names:tc:acal:1.0:example:policyid:4"/>
[57] </Policy>
```

```
[02] Policy:
[04]   PolicyId: "urn:oasis:names:tc:acal:1.0:example:policyid:5"
[05]   Version: "1.0"
[06]   CombiningAlgId: deny-overrides
[07]   ShortIdSetReference:
[08]     - "urn:oasis:names:tc:acal:1.0:example:identifiers"
[09]   Description: Collected policies.
[10]   CombinerInput:
[11]     - Policy:
[12]         PolicyId: "urn:oasis:names:tc:acal:1.0:example:policyid:6"
[13]         Version: "1.0"
[14]         CombiningAlgId: deny-overrides
[15]         Target:
[16]           Apply:
[17]             FunctionId: anyURI-is-in
[18]             Argument:
[19]               - Value:
[20]                   DataType: anyURI
[21]                   Value: "http://www.med.example.com/springfield-hospital"
[24]               - AttributeDesignator:
[25]                   Category: resource
[26]                   AttributeId: collection
[27]                   DataType: anyURI
[32]         CombinerInput:
[33]           - Rule:
[34]               Id: Rule1
[35]               Effect: Permit
[36]               ...
[39]           - Rule:
[40]               Id: Rule2
[41]               Effect: Permit
[42]               ...
[45]           - Rule:
[46]               Id: Rule3
[47]               Effect: Permit
[48]               ...
[53]     - PolicyReference:
[54]         Id: "urn:oasis:names:tc:acal:1.0:example:policyid:4"
```

```
[02] {"Policy":{
[04]   "PolicyId":"urn:oasis:names:tc:acal:1.0:example:policyid:5",
[05]   "Version":"1.0",
[06]   "CombiningAlgId":"deny-overrides",
[07]   "ShortIdSetReference":["urn:oasis:names:tc:acal:1.0:example:identifiers"],
[09]   "Description":"Collected policies.",
[10]   "CombinerInput":[{
[11]     "Policy":{
[12]       "PolicyId":"urn:oasis:names:tc:acal:1.0:example:policyid:6",
[13]       "Version":"1.0",
[14]       "CombiningAlgId":"deny-overrides",
[15]       "Target":{
[16]         "Apply":{
[17]           "FunctionId":"anyURI-is-in",
[18]           "Argument":[{
[19]             "Value":{
[20]               "DataType":"anyURI",
[21]               "Value":"http://www.med.example.com/springfield-hospital"
[22]             }
[23]           },{
[24]             "AttributeDesignator":{
[25]               "Category":"resource",
[26]               "AttributeId":"collection",
[27]               "DataType":"anyURI"
[28]             }
[29]           }]
[30]         }
[31]       },
[32]       "CombinerInput":[{
[33]         "Rule":{
[34]           "Id":"Rule1",
[35]           "Effect":"Permit",
[36]           ...
[37]         }
[38]       },{
[39]         "Rule":{
[40]           "Id":"Rule2",
[41]           "Effect":"Permit",
[42]           ...
[43]         }
[44]       },{
[45]         "Rule":{
[46]           "Id":"Rule3",
[47]           "Effect":"Permit",
[48]           ...
[49]         }
[50]       }]
[51]     }
[52]   },{
[53]     "PolicyReference":{
[54]       "Id":"urn:oasis:names:tc:acal:1.0:example:policyid:4"
[55]     }
[56]   }]
[57] }}
```

[06] The nested policies are combined according to the `urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-overrides` combining algorithm. This combining algorithm specifies that, if any nested policy evaluates to `Deny`, then the outer policy must return `Deny`; otherwise, if any policy evaluates to `Permit`, then the outer policy must return `Permit`.

[11] - [51] A nested policy that combines Rule 1, Rule 2 and Rule 3. Most of the content of the rules is omitted for clarity.

[14] The rules in the nested policy are also combined according to the `urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-overrides` combining algorithm.

[15] - [31] The target restricts the applicability of the nested policy to decision requests for access to medical records belonging to Springfield Hospital.

[33] - [37] A copy of Rule 1.

[39] - [43] A copy of Rule 2.

[45] - [49] A copy of Rule 3.

[51] The end of the nested policy.

[53] - [55] The policy containing Rule 4 is included by reference.


---


# 7 Structures

## 7.1 Introduction

The structures in ACAL are described here in abstract terms, both in textual form and [[UML](#uml)] class diagrams. The concrete representations of these structures are defined for a variety of syntaxes each in a separate profile.

The full consolidated UML diagram is provided in [Annex G](#annex-g-uml-model).

### 7.1.1 Object Type

The ACAL structures are objects that each conform to a specific object type. Objects of the same kind conform to a specific, named object type, which describes a set of properties that an object of the type is permitted to have and for each property whether it is required or optional.

A property has a unique name (unique among the object's properties) and a value, where the value conforms to a specific type, either a simple type, an object type, or a sequence of such values.

#### 7.1.1.1 Object constraints

ACAL object types may have extra object constraints expressed in form of UML constraints (Section 7.6 of [[UML](#uml)]) in the UML models of each ACAL type. These constraints may apply either to a single property of the object - so-called *property-level constraints* - or more globally on multiple properties of the object at once, i.e. *object-level constraints*.

As a reminder, a property is said *multi-valued* (or *multivalued*) if the upper bound of its multiplicity (UML) is (strictly) greater than one, else it is said *single-valued*.

##### 7.1.1.1.1 Property-level constraints

Property-level constraints are defined at the level of a specific property as an annotation between curly braces that is part of the UML property's description in the class diagram. In ACAL model, we use the following kinds of property-level constraints:

###### 7.1.1.1.1.1 UML native constraints

**Order constraint:**

: For multi-valued properties only, the UML standard `ordered` (opposite `unordered`) annotation is used to express that the order of values should be preserved in the created collection.

**Simple uniqueness constraint:** 

: For multi-valued properties of primitive type only, the UML standard `unique` (opposite `nonunique`) annotation is used to express that each value of the property MUST be unique. Combined with the previous order constraint, this determines the type of collection to be used (cf. Table 7.1 of [[UML](#uml)]). For example, the following constraint (`{unordered, unique}`) indicates that the order does not matter and each string value SHALL be unique, therefore a Set may be used as collection for the property *P*'s values:
   ```text
   + P: String [*] {unordered, unique}
   ```
   For uniqueness constraints on object-typed properties, see the next section.

###### 7.1.1.1.1.2 OCL constraints

More advanced constraints are expressed in [[OCL](#ocl)] in the form `{{OCL} expression}` as specified by Section 8.3.4.2 (and 8.3.5.2 for the example) of [[UML](#uml)].
Let refer to *prop* as the property to which the constraint is applied. In each OCL expression below, *prop* is used as the OCL context. Therefore, the `self` keyword in particular refers to *prop* itself.

**Mandatory-property-based uniqueness constraint:**

: For multi-valued properties of complex (object) type, the previous simple `uniqueness` constraint is not enough to define what SHALL be unique about each value object. In that case, assuming each value of *prop* has a mandatory property *itemProp* of primitive type, we use the following OCL expression to specify that the property *itemProp* of each item SHALL be unique (in other words, *itemProp* is used as the unique key): 
  ```text
  self->isUnique(itemProp)
  ```

**Optional-property-based uniqueness constraint:**

: This is a variant of the previous constraint where the property used as unique key is optional, and therefore the OCL expression only checks that the non-null values of *itemProp* are unique and ignore the rest where *itemProp* is null/undefined:
  ```text
  self->select(itemProp <> null)->isUnique(itemProp)
  ```

**Multi-property-based uniqueness constraint:**

: This is a variant of the first constraint in this section where the unique key consists of multiple properties (*itemProp1, itemProp2, ...itemPropN*) of each value of *prop*, all those properties have primitive type and at least *itemProp1* is a mandatory property. In this case, we use the following OCL expression to check that each value (i.e. each key based on those properties, i.e. it is a *compound key*) is unique:
  ```text
  self->isUnique(Sequence{itemProp1, itemProp2, ..., itemPropN})
  ```  

**Multivalued-property-based uniqueness constraint:**

: This is a variant where the unique key is based on a property *itemProp* which is itself multi-valued, and has its own unique key based on a single property *itemPropKey*. In this case, the key for each *item* in *prop*'s values that is checked for uniqueness is the sequence (if ordered) or set (if unordered) of all *itemPropKey* values, i.e. the following OCL expression:
  ```text
  self->isUnique(itemProp->collect(itemPropKey))
  ```

**Value type uniqueness constraint:**

: This is a variant where the constraint only checks that the type of each value of *prop* is unique:
  ```text
  self->isUnique(oclType())
  ```


##### 7.1.1.1.2 Object-level constraints

ACAL object-level constraints are expressed in UML as a note attached by a dashed line to the UML class, as specified in [[UML](#uml)] Constraints section, and in OCL language. For such constraint, ACAL only uses OCL expressions of the form `X or Y` where X and Y are each one of the following kinds of simple expressions:

1. `prop <> null`: true *iff* the single-valued property *prop* of the object is not null (defined).
2. `prop = null`: true *iff* the single-valued property *prop* of the object is null (undefined).
3. `prop->NotEmpty()`: true *iff* the multivalued property *prop* has at least one value (the collection of values is not empty).


### 7.1.2 Simple Types

In UML, the simple types may be *primitive types* or *enumerations* (aka *enum types*). ACAL uses both UML standard primitive types and newly defined primitive and enumeration types, described in the next subsections.

#### 7.1.2.1 Standard UML primitive types (String, Boolean, Integer, Real)

Here are the simple types based on UML standard primitive types.

* `String`: A sequence of characters that may be constrained to a particular pattern. Defined in UML by UML standard primitive type `String`:
   ```plantuml
   @startuml
   hide empty members
   hide circle
   class String <<primitive>>
   @enduml
   ```

* `Boolean`: Either `true` or `false`. Defined in UML by UML standard primitive type `Boolean`
   ```plantuml
   @startuml
   hide empty members
   hide circle
   class Boolean <<primitive>>
   @enduml
   ```

* `Integer`: An integer number that may be constrained to a particular range.
   Defined in UML by UML standard primitive type `Integer`:
   ```plantuml
   @startuml
   hide empty members
   hide circle
   class Integer <<primitive>>
   @enduml
   ```

* `Real`: real number in UML, typically represented using a floating point standard such as ISO/IEC/IEEE 60559:2011, the joint ISO/IEC/IEEE edition harmonized with [[IEEE754](#ieee754)].
   ```plantuml
   @startuml
   hide empty members
   hide circle
   class Real <<primitive>>
   @enduml
   ```
This primitive type is not directly used in the current ACAL model and provided for information purposes only. The subtype `Double` is used instead.

#### 7.1.2.2 ACAL-defined UML stereotype(s) used in new primitive types

`RestrictedString` is defined as a UML stereotype for String-derived primitive types defined in the next subsection and restricted by a pattern (regular expression) and an optional minimum length (positive integer), both specified as the stereotype's properties `pattern` and `minLength` respectively:

```plantuml
@startuml
hide empty members
hide circle
class PrimitiveType <<Metaclass>>
class RestrictedString <<stereotype>> extends PrimitiveType {
   + pattern: String [1]
   + minLength: Integer [0..1]
}
@enduml
```

#### 7.1.2.3 ACAL-defined simple types

##### 7.1.2.3.1 URI

A `URI` is a sequence of characters representing a Uniform Resource Identifier according to [[RFC3986](#rfc3986)]. Defined in UML as follows:
```plantuml
@startuml
hide empty members
hide circle
class URI <<primitive>>
@enduml
```

ACAL representation formats (in ACAL profiles) usually have a native equivalent for this type, in which case they SHOULD use that, e.g. XML schema `xs:anyURI`, JSON schema `{ "type": "string", "format": "uri" }`.

###### Reserved prefix for URIs

Whenever a property of this type (`URI`) is used in ACAL data model, the values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

##### 7.1.2.3.2 NonNegativeInteger

A `NonNegativeInteger` is an `Integer`, equal to or greater than zero. Defined in UML as follows:
```plantuml
@startuml
hide empty members
hide circle
class NonNegativeInteger <<primitive>>
@enduml
```

ACAL representation formats (in ACAL profiles) may have a native equivalent for this type, in which case they SHOULD use that, e.g. XML schema `xs:nonNegativeInteger`, JSON schema `{ "type": "integer", "minimum": 0 }`.

##### 7.1.2.3.3 Double

A `Double` is a double-precision 64-bit IEEE 754 floating point represented in UML as follows:
```plantuml
@startuml
hide empty members
hide circle
class Double <<primitive>>
@enduml
```

In UML, it may be defined as a subtype of UML standard primitive type `Real`, restricted to 64-bit length. However, each ACAL representation format SHOULD map this to their closest native equivalent if there is any, e.g. `xs:double` in XML.

<a name="versiontype"></a>

##### 7.1.2.3.4 VersionType

A `VersionType` value specifies the version number of a policy or shared variable, and is defined in UML as follows:

```plantuml
@startuml
hide empty members
hide circle
class VersionType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^(0|[1-9]\d*)(\.(0|[1-9]\d*)){0,3}$'
   --
}
@enduml
```

The version number is expressed as a sequence of decimal numbers, each separated by a period (.), which is compatible with [Semantic Versioning](https://semver.org/).

<a name="versionmatchtype"></a>

##### 7.1.2.3.5 VersionMatchType

Properties of this type SHALL contain a restricted regular expression matching a version number (see [Section 7.1.2.3.4](#71234-versiontype)). The expression SHALL match versions of a referenced policy that are acceptable for inclusion in the referencing policy.

UML definition:
```plantuml
@startuml
hide empty members
hide circle
class VersionMatchType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^(0|[1-9]\d*|\*)(\.(0|[1-9]\d*|\*|\+)){0,3}$'
   --
}
@enduml
```

A version match is `.`-separated, like a version string. A number represents a direct numeric match. A `*` means that any single number is valid. A `+` means that any number, and any subsequent numbers, are valid. In this manner, the following four patterns would all match the version string `1.2.3`: `1.2.3`, `1.*.3`, `1.2.*` and `1.+`.

##### 7.1.2.3.6 ShortIdNameType

`ShortIdNameType` is the primitive type for Short Identifier names (see [Section 7.3](#73-shortidtype) ).

UML definition:
```plantuml
@startuml
hide empty members
hide circle
class ShortIdNameType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^[A-Za-z][0-9A-Za-z]*(-[0-9A-Za-z]+)*$'
   --
}
@enduml
```

##### 7.1.2.3.7 ShortIdValueType

`ShortIdValueType` is the primitive type for Short Identifier values (see [Section 7.3](#73-shortidtype) ). Such value is an alternating sequence of URI characters and *{ShortId}*s (short identifier names enclosed in curly braces). Reminder: the curly brace is not a valid URI character. 

UML definition:
```plantuml
@startuml
hide empty members
hide circle
class ShortIdValueType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^[!#-;=?-\[\]_a-z~]*(\{[A-Za-z][0-9A-Za-z]*(-[0-9A-Za-z]+)*\}[!#-;=?-\[\]_a-z~]*)*$'
   minLength=1
   --
}
@enduml
```

The pattern is: `^uc*(\{s\}uc*)*$` where:
- `s` is the pattern for a ShortId name, copied from the `ShortIdNameType` definition (which excludes curly braces).
- `uc` is the pattern for a valid URI character based on [[RFC3986](#rfc3986)] (cf. the ABNF definition of 'URI' in Appendix A), which excludes curly braces: `[!#-;=?-\[\]_a-z~]`
The `minLength=1` restriction prevents the empty string, i.e. there is at least one `uc` or `{s}`.

##### 7.1.2.3.8 IdentifierType

A value of the `IdentifierType` simple type refers to a specific attribute category, attribute, data type, function, notice, status code, combining algorithm.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class IdentifierType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^[^{}]*(\{[A-Za-z][0-9A-Za-z]*(-[0-9A-Za-z]+)*\}[^{}]*)*$'
   minLength=1
   --
}
@enduml
```

A value of this simple type is either:
* an absolute URI [[RFC3986](#rfc3986)],
* the name of a short identifier or
* a character string with one or more short identifier names enclosed by curly brackets (i.e., `{` and `}`; U+007B and U+007D) optionally preceded, followed and/or separated by other characters allowed in a URI.

A short identifier name appearing in the second and third cases MUST be the name of a member of a short identifier set referenced by the containing policy, request or response.

Note that the three cases can be distinguished from each other syntactically in a valid, correctly-formatted value. If the value contains curly brackets, then the third case must apply since the curly bracket characters are not legal characters for an absolute URI or a short identifier name; otherwise, if the value matches the pattern for a short identifier name, then the second case applies since an absolute URI begins with a scheme name and a colon character (i.e., `:`; U+003A) and the colon character is not a legal character for a short identifier name; otherwise, the value is an absolute URI.

The conversion of a value of the `IdentifierType` simple type into an absolute URI is detailed in [Section 8.3](#83-identifier-evaluation).

###### Reserved prefix for identifiers

Whenever a property of this type (`IdentifierType`) is used in ACAL data model, the values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

##### 7.1.2.3.9 LocalIdentifierType

`LocalIdentifierType` values are local identifiers, i.e. identifiers that are unique only within a limited scope. Examples of local identifiers are Request-local identifiers (e.g. the `Id` property of `RequestEntity`, and the value of `RequestEntityReference` itself, which is typed directly as `LocalIdentifierType` rather than having its own `Id` property), Policy-local identifiers (e.g. the `VariableId` of a policy's variable or the `Name` of a policy parameter or the `Id` of a policy's rule), Rule-local identifiers (e.g. the `VariableId` of a rule's variable), etc.

<!-- WARNING: for ALFA compatibility, the pattern should not be more restrictive than ALFA identifiers. 
   Pattern agreed with ALFA working group, except the hypen is allowed as separator in addition to the dot: 
			<name>.<name>.<name>... or <name>-<name>-<name>... where <name> is at least a letter possibly preceded by underscore(s) and/or followed by letter(s)/digit(s)/underscore(s).

Also the pattern should allow the identifiers used in the Examples section, e.g. 'patient-under-16' (or 'patient_under_16'). -->


UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class LocalIdentifierType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^_*[A-Za-z][A-Za-z_0-9]*([-.]_*[A-Za-z_0-9]*)*$'
   --
}
@enduml
```

##### 7.1.2.3.10 AttributeSelectorPathType

The `AttributeSelectorPathType` defines valid values for the `Path` property of `BaseAttributeSelectorType` objects (non-empty strings without leading/trailing whitespace).

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class AttributeSelectorPathType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^\S(.*\S)?$'
   --
}
@enduml
```

##### 7.1.2.3.11 Name

The `Name` type is the same as [XSD standard](#xs) `Name` datatype.

UML definition:
```plantuml
@startuml
hide empty members
hide circle
class Name <<primitive>>
@enduml
```

Although an XML representation may use the standard XSD `Name` datatype as is for this type, other ACAL representation formats need an alternative representation. One suggestion is to use the string type restricted by a pattern (regular expression) matching the XSD `Name`'s definition, i.e. matching XSD pattern `\i\c*`. Non-XML representation formats do not usually use the XSD regex (regular expression) flavor but other flavors such as ECMA 262 (JavaScript) flavor in the case of JSON, therefore the pattern - the character classes `\i` and `\c` in particular - must be translated to the corresponding regex flavor. The following equivalence table may be used as a convenience to build the full pattern in non-XML ACAL representation formats:

| XSD character class    | Javascript regex for full Unicode support | Javascript regex for plain ASCII support only|
| -------- | ------- | -----------|
| \i  | `[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\u{10000}-\u{EFFFF}]`   | `[_:A-Za-z]` |
| \c | `[-.0-9:A-Z_a-z\u00B7\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u037D\u037F-\u1FFF\u200C-\u200D\u203F\u2040\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\u{10000}-\u{EFFFF}]`     | `[-._:A-Za-z0-9]` |


##### 7.1.2.3.12 EffectType

The `EffectType` simple type defines the values allowed for the `Effect` property of a `RuleType` object and for the `AppliesTo` property of the `NoticeExpressionType` objects; either `Permit` or `Deny`.

UML definition:
```plantuml
@startuml
hide empty members
hide circle
class EffectType <<enumeration>> {
   Permit
   Deny
}
@enduml
```

##### 7.1.2.3.13 DecisionType

A `DecisionType` value indicates the result of policy evaluation.

UML definition:
```plantuml
@startuml
hide empty members
hide circle
class DecisionType <<enumeration>> {
   Permit
   Deny
   Indeterminate
   NotApplicable
}
@enduml
```

The values of `DecisionType` have the following meanings:

: `Permit`: the requested access is permitted.

: `Deny`: the requested access is denied.

: `Indeterminate`: the PDP is unable to evaluate the requested access. Reasons for such inability include: missing attributes, network errors while retrieving policies, division by zero during policy evaluation, syntax errors in the decision request or in the policy, etc.

: `NotApplicable`: the PDP does not have any policy that applies to this decision request.

##### 7.1.2.3.14 MediaType (optional)

_**Support for this type is optional, unless `ContentType` objects are supported.**_

`MediaType` is the primitive type for `ContentType` objects' `MediaType` property (see [Section 7.34](#734-contenttype-optional) ).

The regular expression below follows the ABNF syntax from Section 4.2 of [[RFC6838](#rfc6838)] (with the recommendation that `<type-name>` and `<subtype-name>` SHOULD be limited to 64 characters).

UML definition:
```plantuml
@startuml
hide empty members
hide circle
class MediaType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^[A-Za-z0-9][A-Za-z0-9!#$&\-\^_.+]{0,63}/[A-Za-z0-9][A-Za-z0-9!#$&\-\^_.+]{0,63}$'
   --
}
@enduml
```

This is the generic type definition. However, the exact possible values SHALL be defined explicitly by the `AttributeSelector` Profile(s) of ACAL, e.g. the XPath and/or JSONPath Profiles, depending on the Content Type(s) they support. In any case, the standard identifiers specified in [Annex D.10](#d10-content-types) SHOULD be used whenever applicable, or else a [media type registered at IANA](https://www.iana.org/assignments/media-types/media-types.xhtml) according to [[RFC6838](#rfc6838)].


##### 7.1.2.3.15 ContentEncodingType (optional)

_**Support for this type is optional, unless `ContentType` objects are supported.**_

`ContentEncodingType` is the primitive type for `ContentType` objects' `Encoding` property (see [Section 7.34](#734-contenttype-optional) ).

UML definition:
```plantuml
@startuml
hide empty members
hide circle
class ContentEncodingType <<primitive>> <<restrictedString>> {
   <<restrictedString>>
   pattern='^[a-z0-9]+(-[a-z0-9]+)*$'
   --
}
@enduml
```

This is the generic type definition. However, the exact possible values SHALL be defined explicitly by the Representation Profile(s) of ACAL (XACML, JACAL, etc.) for each supported Content type. In any case, the standard identifiers specified in [Annex D.11](#d11-content-encodings) SHOULD be used whenever applicable, or else one of the standard [*Transfer Encodings* names registered at IANA](https://www.iana.org/assignments/transfer-encodings/transfer-encodings.xhtml) according to [[RFC4289](#rfc4289)]. Or else, if a custom content encoding is really needed, as suggested by [[RFC2045](#rfc2045)] Section 6.3, define a new one prefixed with `x-`, e.g. `x-my-new-encoding` (and matching the pattern above).


### 7.1.3 Relationship to Concrete Representations

ACAL model mappings to a concrete representation are defined in the relevant ACAL Profile for that representation format, e.g. in the XML Profile of ACAL (XACML) for the XML representation.

Examples of such mappings:
- In the JSON representation, an object maps to a JSON object and a property of that object maps to a JSON member (a name/value pair). An object type is formally defined by a JSON subschema.
- In the XML representation, a property corresponds to an XML element or XML attribute, an object corresponds to element content and an object type is formally defined by an XML Schema complex type.

## 7.2 ShortIdSetType

A `ShortIdSetType` object defines a set of short identifiers. It contains its own short identifiers as well as references to other short identifier sets, which are imported (recursively) into this set.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
/' 
OCL v2.4, Section 11.2.3: "by virtue of the implicit conversion to a collection literal, an expression evaluating to null can be used as source of collection operations [...]. If the source is the null literal, it is implicitly converted to an empty Set by invoking oclAsSet()." Therefore no need for null check on multi-valued properties before calling notEmpty, isUnique, etc.
'/
class ShortIdSetType <<dataType>> {
  {field} + Id: URI [1]
  {field} + ShortIdSetReference: URI [*] {unordered, unique}
  {field} + ShortId: ShortIdType [*] {ordered, unique} {{OCL} self->isUnique(Name)}
}
@enduml
```

A `ShortIdSetType` object contains the following properties:

`Id` [Required]

: The identifier for this short identifier set. It is the responsibility of the PAP to ensure that no two short identifier sets visible to the PDP have the same identifier. This MAY be achieved by following a predefined URN or URI scheme. If the identifier is in the form of a URL, then it MAY be resolvable.
`Id` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`ShortIdSetReference` [Any Number]

: A sequence of `URI` values referencing other short identifier sets. The short identifiers of the referenced sets are included in this set. This applies recursively to the sets referenced by a referenced set. This set SHALL NOT reference itself and SHALL NOT reference a set that directly or indirectly references this set. This set SHALL NOT directly or indirectly reference any other set more than once.
URIs starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`ShortId` [Any Number]

: A sequence of `ShortIdType` objects, each defining a short identifier in this set.

A predefined set of short identifiers for the URIs defined in this specification is provided as a convenience, in XML (`acal-core-xml-v4.0-identifiers.xml`), JSON (`acal-core-json-v1.0-identifiers.json`) and YAML (`acal-core-yaml-v1.0-identifiers.yaml`) representations. Use of this set is OPTIONAL.

<a name="shortidtype"></a>

## 7.3 ShortIdType

A `ShortIdType` object defines a single short identifier. Attribute categories, attributes, data types, functions, combining algorithms and other artifacts in ACAL are ultimately identified by URIs. A short identifier provides a simple alias name to use when composing and displaying policies and protocol messages instead of using the full URI.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class ShortIdType <<dataType>> {
   + Name: ShortIdNameType [1]
   + Value: ShortIdValueType [1]
}
@enduml
```

A `ShortIdType` object contains the following properties:

`Name` [Required]

: A simple alias name that stands for a URI or a part thereof.

`Value` [Required]

: The character string used to replace the simple alias name when a value of `IdentifierType` is evaluated to produce a complete URI; see [Section 8.3](#83-identifier-evaluation).

The value of the `Value` property SHALL be either one of the following:
* a character string with only characters allowed in a URI [[RFC3986](#rfc3986)] (curly brackets are not allowed) or

* a character string with one or more references to other short identifiers in the form of the short identifier name enclosed in curly brackets (i.e., `{` and `}`; U+007B and U+007D) optionally preceded, followed and/or separated by other characters allowed in a URI (this excludes curly brackets, which means that the curly bracket characters are not permitted in the value other than to enclose a short identifier name). In addition, the following restrictions apply:

  * the value SHALL NOT reference this short identifier (i.e., SHALL NOT contain any `{s}` where `s` matches the value of the `Name` property),

  * the value SHALL NOT reference a short identifier that directly or indirectly references this short identifier and

  * the referenced short identifiers MUST each either precede this short identifier in the same short identifier set or be defined in one of the short identifier sets referenced by the containing short identifier set.

The name of the short identifier MUST NOT be the same as the name of any other short identifier in the same short identifier set or the same as the name of any other short identifier defined in one of the short identifier sets referenced by the containing short identifier set.

## 7.4 PolicyType

A `PolicyType` object describes a policy: an aggregation of rules and other policies. Policies MAY be included in an enclosing `PolicyType` object either directly using the `Policy` property or indirectly using the `PolicyReference` property.

A `PolicyType` object may be evaluated, in which case the evaluation procedure defined in [Section 8.12](#812-policy-evaluation) SHALL be used.

The main components of this object type are the `CombiningAlgId`, `Target`, `Policy`, `Rule`, `VariableDefinition` and `NoticeExpression` properties.

If a `PolicyType` object contains references to other policies in the form of URLs, then these references MAY be resolvable.

The results of evaluating the policies and rules included in a `PolicyType` object MUST be combined using the algorithm identified by the `CombiningAlgId` property.

A `PolicyType` object MAY contain a `PolicyIssuer` property. The interpretation of the `PolicyIssuer` property is explained in the separate administrative policy profile [[XACMLAdmin](#xacmladmin)].

The `Target` property defines the applicability of the `PolicyType` object to a set of decision requests. If the `Target` property within the `PolicyType` object matches the request context, then the `PolicyType` object may be used by the PDP in making its authorization decision. See [Section 8.12](#812-policy-evaluation).

Any `NoticeExpressionType` objects may be evaluated into notices by the PDP. Any resulting obligation notice (with `IsObligation` set to `true`) MUST be fulfilled by the PEP in conjunction with the authorization decision. If the PEP does not understand or cannot fulfill any of the obligation notices, then it MUST act according to the PEP bias. See [Section 8.2](#82-policy-enforcement-point) and [Section 8.16](#816-notices). Any resulting advice notice MAY be safely ignored by the PEP.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
/' 
OCL v2.4, Section 11.2.3: "by virtue of the implicit conversion to a collection literal, an expression evaluating to null can be used as source of collection operations [...]. If the source is the null literal, it is implicitly converted to an empty Set by invoking oclAsSet()." Therefore no need for null check on multi-valued properties before calling notEmpty, isUnique, etc.
'/
'A CombinerInput is not always unique: there may be two PolicyReferences to the same parameterized Policy but with different arguments (so the same PolicyId occurs twice).
/'
A NoticeExpression Id is not unique. The Id is a *concept* identifier: it tells the PEP what the notice means and how the PEP is to process it (as the ObligationId did in XACML 3.0), rather than identifying a particular occurrence of the notice. The same Id may therefore appear more than once, typically with different AttributeAssignmentExpressions. For example (N.B.: this is pseudo-code for brevity, not an official syntax), one policy sending the same kind of mail to two different recipients with different content:

- NoticeExpression Id="send_mail"
   - AttributeAssignmentExpression AttributeId="recipients" Value="a@example.com"
   - AttributeAssignmentExpression AttributeId="body" Value="blablabla"
   ... other args...
- NoticeExpression Id="send_mail"
   - AttributeAssignmentExpression AttributeId="recipients" Value="b@example.com"
   - AttributeAssignmentExpression AttributeId="body" Value="foobar"
   ... other args...

Likewise, two Rules of the same Policy may each emit the same notice for two different reasons.
'/
class PolicyType <<dataType>> extends CombinerInputType {
  {field} + PolicyId: URI [1]
  {field} + Version: VersionType [1]
  {field} + Description: String [0..1]
  {field} + ShortIdSetReference: URI [*] {unordered, unique}
  {field} + MaxDelegationDepth: NonNegativeInteger [0..1]
  {field} + PolicyIssuer: EntityType [0..1]
  {field} + PolicyDefaults: PolicyDefaultsType [*] {unordered, unique} {{OCL} self->isUnique(oclType())}
  {field} + Parameter: ParameterType [*] {ordered, unique} {{OCL} self->isUnique(Name)}
  {field} + VariableDefinition: VariableDefinitionType [*] {ordered, unique} {{OCL} self->isUnique(VariableId)}
  {field} + Target: BooleanExpressionType [0..1]
  {field} + CombiningAlgId: IdentifierType [1]
  {field} + CombinerInput: CombinerInputType [*] {ordered, nonunique}
  {field} + NoticeExpression: NoticeExpressionType [*] {ordered, nonunique}
}

abstract class CombinerInputType <<dataType>>
class PolicyReferenceType <<dataType>> extends CombinerInputType
class RuleType <<dataType>> extends CombinerInputType 
@enduml
```

A `PolicyType` object contains the following properties:

`PolicyId` [Required]

: A `URI` value specifying an identifier for the policy. It is the responsibility of the PAP to ensure that no two policies visible to the PDP have the same identifier. This MAY be achieved by following a predefined URN or URI scheme. If the policy identifier is in the form of a URL, then it MAY be resolvable.
`PolicyId` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Version` [Required]

: A `VersionType` value specifying the version number of the Policy.

`CombiningAlgId` [Required]

: An `IdentifierType` value identifying the combining algorithm by which the `PolicyType` and `RuleType` objects MUST be combined. Standard combining algorithms are listed in [Annex E](#annex-e-combining-algorithms). Standard combining algorithm identifiers are listed in [Annex D.9](#d9-combining-algorithms). 
`CombiningAlgId` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`MaxDelegationDepth` [Optional]

: If present, a `NonNegativeInteger` that limits the depth of delegation which is authorized by this policy. See the delegation profile [[XACMLAdmin](#xacmladmin)].

`ShortIdSetReference` [Any Number]

: A sequence of `URI` values referencing short identifier sets. Each value MUST be unique in the sequence. The short identifiers used by the policy MUST be ones defined in the referenced sets or in any further sets referenced by the referenced sets (recursively). The policy SHALL NOT directly or indirectly reference any short identifier set more than once.
URIs starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Description` [Optional]

: A free-form `String` description of the policy.

`PolicyIssuer` [Optional]

: An `EntityType` object containing attributes of the issuer of the policy. See the *EntityType* section for more details on the structure, and see the *Administration and Delegation profile* [[XACMLAdmin](#xacmladmin)] for a particular use of this object. A PDP which does not implement this profile MUST report an error or return an `Indeterminate` result if it encounters this object.

`PolicyDefaults` [Any Number]

: sequence of `PolicyDefaultsType` objects containing each a set of default values specific to a particular ACAL Profile, applicable to the policy (e.g. ACAL XPath Profile's default XPath version). In particular, each object SHALL have a different concrete type (per ACAL profile). The scope of the `PolicyDefaults` property SHALL be the enclosing policy and any policy nested within it; where a nested policy carries its own `PolicyDefaults` object of a given concrete type, that object applies within the nested policy in place of the enclosing policy's object of that type. A policy that is included in another policy by a `PolicyReference` is not nested within the referencing policy for the purposes of this scope rule; the `PolicyDefaults` objects of the referencing policy do not apply within the referenced policy. The use of `PolicyDefaults` property is specified by particular ACAL Profiles (e.g. XPath Profile).

: Note: A nested policy's `PolicyDefaults` object overriding the enclosing policy's object of the same concrete type is deliberate, and differs from `VariableDefinition`, which forbids a `VariableId` that repeats one declared by an enclosing policy ([Section 7.13](#713-variabledefinitiontype)). A Defaults object can affect how a policy's expressions are interpreted; e.g. under the XPath Profile, the default XPath version governs the `Path` of every XPath attribute selector in its scope. Therefore, a policy authored against one Defaults would change meaning if, when nested beneath a policy that declares a different Defaults, it does not declare its own.

`Parameter` [Any Number]

: A sequence of `ParameterType` objects declaring the parameters of the policy if the policy is parameterized. Each object's `Name` MUST be unique in this sequence.

`VariableDefinition` [Any Number]

: A sequence of `VariableDefinitionType` objects, each defining an expression that can be referenced from anywhere in a contained policy or rule where an expression can appear. Each object's `VariableId` MUST be unique in this sequence and in the list of `VariableDefinition`s in scope, i.e. already defined in an enclosing policy (parent or ancestor).


`Target` [Optional]

: A `BooleanExpressionType` object that determines the set of decision requests to which the parent policy is applicable. If this property is omitted from the `PolicyType` object, then the policy applies to all decision requests. Evaluation of the `Target` property is described in [Section 8.7](#87-target-evaluation). The Target expression MUST NOT be a literal boolean value (`ValueType` object).

`NoticeExpression` [Any Number]

: A sequence of `NoticeExpressionType` objects to be evaluated into notices by the PDP. Objects' `Id` values are not required to be unique in this sequence; the same `Id` MAY occur more than once, typically with different `AttributeAssignmentExpression`s. See [Section 7.29](#729-noticeexpressiontype). See [Section 8.16](#816-notices) for a description of how the notices to be returned by the PDP are determined.

`CombinerInput` [Any Number]

: An ordered sequence of `CombinerInputType` objects, which are combined according to the combining algorithm specified by the `CombiningAlgId` property.

Each `CombinerInputType` object contains exactly one of the following properties:

`Policy`

: A `PolicyType` object defining a nested policy that is included in this policy. A policy whose target matches the decision request MUST be evaluated. A policy whose target does not match the decision request SHALL be ignored.

`PolicyReference`

: A `PolicyReferenceType` object referencing a separate policy that is included in this policy. If the `Id` property of the `PolicyReferenceType` object is a URL, then it MAY be resolvable. A policy whose target matches the decision request MUST be considered. A policy whose target does not match the decision request SHALL be ignored.

`Rule`

: A `RuleType` object defining a nested rule that is included in this policy. A rule whose condition matches the decision request MUST be considered. A rule whose condition does not match the decision request SHALL be ignored.


## 7.5 PolicyDefaultsType (optional)

_**Supporting this part is optional.**_ _It is required only for supporting ACAL Profiles that define extensions (subtypes) of `PolicyDefaultsType` (e.g. XPath Profile)._

`PolicyDefaultsType` is an abstract object type for default values that apply to the parent `PolicyType` object and to any policy nested within it (that does not override those defaults), as specified for the `PolicyDefaults` property in [Section 7.4](#74-policytype). Concrete subtypes of `PolicyDefaultsType` are defined in separate ACAL Profiles, e.g. XPath Profile.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class PolicyDefaultsType <<dataType>>
@enduml
```

## 7.6 ParameterType

A `ParameterType` object declares a single parameter for a parameterized policy or shared variable. Parameters specify arguments that may be passed to either a Policy from a PolicyReference, or a Shared Variable from a SharedVariableReference. This enables other Policies (respectively Expressions) to pass dynamic (Expression-based) values to another Policy (respectively SharedVariable) during the evaluation, according to its Parameter definitions (`ParameterType` objects), in the same way as calling a function according to the function signature.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class ParameterType <<dataType>> {
   + Name: LocalIdentifierType [1]
   + DataType: IdentifierType [0..1] = 'urn:oasis:names:tc:acal:1.0:data-type:string'
   + IsBag: Boolean [0..1] = false
   + Description: String [0..1]
   + Expression: ExpressionType [0..1]
}
@enduml
```

A `ParameterType` object contains the following properties:

`Name` [Required]

: A `LocalIdentifierType` value to name the parameter. The value of the parameter MAY be referenced within an expression contained within the policy using a `VariableReferenceType` object with its `VariableId` property set to this name.

`DataType` [Optional, Default `urn:oasis:names:tc:acal:1.0:data-type:string`]

: An `IdentifierType` value specifying the data type of the parameter. If this property is omitted, then it is treated as being set to `urn:oasis:names:tc:acal:1.0:data-type:string`. 
`DataType` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`IsBag` [Optional, Default `false`]

: A `Boolean` value that specifies whether the parameter takes a single value (set to `false`) or a bag of values (set to `true`). If this property is omitted, then it is treated as being set to `false`.

`Description` [Optional]

: A free-form `String` description of the parameter.

`Expression` [Optional]

: An expression that evaluates to a default value (if `IsBag` is `false`) or bag of values (if `IsBag` is true) for the parameter. This default value is used only if no argument is provided as input for this parameter (from a `PolicyReference` or `SharedVariableReference`). If the Expression value is a `ValueType` object, i.e. a literal value, the latter SHALL NOT redefine/override the DataType identifier already defined by the above `DataType` property and SHOULD NOT have any DataType identifier property set at all, if possible.

## 7.7 BooleanExpressionType

A `BooleanExpressionType` object contains one ACAL expression, with the restriction that the expression's return data type MUST be `urn:oasis:names:tc:acal:1.0:data-type:boolean`.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class BooleanExpressionType <<dataType>> {
   + Expression: NonLiteralExpressionType [1]
}
@enduml
```

The `Target` and `Condition` properties are of this type.

Expression evaluation is described in [Section 8.5](#85-expression-evaluation).

<a name="idreferencetype"></a>

## 7.8 IdReferenceType

`IdReferenceType` is an abstract type used for referencing policies by their policy identifier (URI). This has two subtypes for matching also a specific policy version: `ExactMatchIdReferenceType`, `PatternMatchIdReferenceType`.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class IdReferenceType <<dataType>> {
   + Id: URI [1]
}

class ExactMatchIdReferenceType <<dataType>> extends IdReferenceType
class PatternMatchIdReferenceType <<dataType>> extends IdReferenceType
@enduml
```

The `IdReferenceType` object type contains the following property:

`Id` [Required]

: A URI being the `PolicyId` of the referenced policy. If the URI is a URL, then it MAY be resolvable to the policy. Resolution against the policies that define the PDP, and the optional retrieval of a policy from a URL, are specified in [Section 8.13](#813-policyreference-evaluation); any other mechanism for locating a policy that is not among them (for example an external repository or protocol) is outside the scope of this specification.
`Id` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

## 7.9 ExactMatchIdReferenceType (optional)

_**Support for this object type is optional, required only if the `ReturnPolicyIdList` property in the Request is supported.**_

An `ExactMatchIdReferenceType` object is a type of policy reference that matches both the identifier and a specific (fixed) version of a policy. In an `ApplicablePolicyReference`, it is used to identify a policy that has been applicable to a request.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class IdReferenceType <<dataType>>
class ExactMatchIdReferenceType <<dataType>> extends IdReferenceType {
   + Version: VersionType [1]
}
@enduml
```

The `ExactMatchIdReferenceType` object type extends the [`IdReferenceType` object type (Section 7.8)](#78-idreferencetype) with the following property:

`Version` [Required]

: A `VersionType` value indicating the version of a policy that was applicable to the request. See [PolicyReferenceType (Section 7.11)](#711-policyreferencetype).

## 7.10 PatternMatchIdReferenceType

A `PatternMatchIdReferenceType` object is a type of policy reference that matches both the identifier and one or more versions of a policy using version patterns.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class IdReferenceType <<dataType>>
class PatternMatchIdReferenceType <<dataType>> extends IdReferenceType {
   + Version: VersionMatchType [0..1]
}
@enduml
```

The `PatternMatchIdReferenceType` object type extends the `IdReferenceType` object type with the following properties:

`Version` [Optional]

: Specifies a matching expression for selecting an acceptable version of the referenced policy. The matching operation is defined by [VersionMatchType (Section 7.1.2.3.5)](#71235-versionmatchtype). If this property is present, then the selected version of the policy MUST match the expression. If the property is absent, then any version of the policy is acceptable. In the case that more than one version matches, then the most recent one (latest version) SHOULD be used.

<a name="policyreferencetype"></a>

## 7.11 PolicyReferenceType

A `PolicyReferenceType` object is used to reference a policy by identifier and version.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class PatternMatchIdReferenceType <<dataType>>
class PolicyReferenceType <<dataType>> extends PatternMatchIdReferenceType {
   + Argument: ArgumentType [*] {ordered, nonunique}
}
@enduml
```

The `PolicyReferenceType` object type extends the `PatternMatchIdReferenceType` object type with the following properties:

`Argument` [Any Number]

: Arguments for a parameterized policy. The sequence of arguments SHALL be exclusively either one of these:
- A sequence of *positional* arguments, i.e. `ExpressionType` objects declared in the same order as the `Parameter` values in the referenced policy; each argument number *n* MUST match the definition of the policy's `Parameter` number *n* (`DataType`, `IsBag`);
- A sequence of *named* arguments, i.e. `NamedArgumentType` objects declared in any order, where each argument has a unique name *x* that associates it with the policy's `Parameter` named *x* and therefore its Expression MUST match that Parameter's definition (`DataType`, `IsBag`).

The number of arguments *N* may be less than the number of declared `Parameter`s if and only if the `Parameter`s number *N* (starting at zero) and above have defined default values, in which case they are used as remaining arguments. 

**DataType inference rule**: if an Argument's Expression has an (optional) `DataType` property (statically-typed Expression), i.e. its type is `ValueType`, `NamedAttributeDesignatorType`, `BaseAttributeSelectorType` or any subtype thereof, then the Expression's `DataType` property SHOULD be omitted in this case as it is already defined by the corresponding `Parameter`'s definition in the referenced `PolicyType` object. Else (if present) it SHALL match that `Parameter`'s `DataType`.

## 7.12 RuleType

A `RuleType` object defines an individual rule in a policy. The main components of an object of this type are the `Condition`, `NoticeExpression` and `Effect` properties.

A `RuleType` object may be evaluated, in which case the evaluation procedure defined in [Section 8.11](#811-rule-evaluation) SHALL be used.

UML definition (class diagram):

```plantuml
@startuml
hide empty members 
hide circle
/'
NoticeExpression (Id) is not unique for the same reason as in PolicyType, and Notices may be in sequence (ordered).
'/
class RuleType <<dataType>> {
  {field} + Id: LocalIdentifierType [1]
  {field} + Description: String [0..1]
  {field} + VariableDefinition: VariableDefinitionType [*] {ordered, unique} {{OCL} self->isUnique(VariableId)}
  {field} + Condition: BooleanExpressionType [0..1]
  {field} + Effect: EffectType [1]
  {field} + NoticeExpression: NoticeExpressionType [*] {ordered, nonunique}
}
@enduml
```

A `RuleType` object contains the following properties:

`Id` [Required]

: A `LocalIdentifierType` value to identify this rule. It is the responsibility of the PAP to ensure that no two rules in the same policy have the same identifier.

`Effect` [Required]

: An `EffectType` value specifying the effect of the rule when its condition is satisfied; either `Permit` or `Deny`.

`Description` [Optional]

: A free-form `String` description of the rule.

`VariableDefinition` [Any Number]

: A sequence of `VariableDefinitionType` objects, each defining a variable - with a value expression - that can be referenced from anywhere in the rule where an Expression can appear. Each object's `VariableId` MUST be unique in this sequence and in the set of `VariableDefinition`s in scope, i.e. MUST NOT override any other defined variable in an enclosing policy (parent or ancestor).

`Condition` [Optional]

: A `BooleanExpressionType` object holding an expression that MUST be satisfied for the rule to be assigned its `Effect` value. Evaluation of the `Condition` property is described in [Section 8.9](#89-condition-evaluation). The Condition expression MUST NOT be a literal boolean value (`ValueType` object).

`NoticeExpression` [Any Number]

: A sequence of `NoticeExpressionType` objects, each defining a notice expression potentially evaluated into a notice by the PDP. See [NoticeExpressionType](#729-noticeexpressiontype). Objects' `Id` values are not required to be unique in this sequence; the same `Id` MAY occur more than once, typically with different `AttributeAssignmentExpression`s. See [Section 8.16](#816-notices) for a description of how the notices to be returned by the PDP shall be determined. See [Section 8.2](#82-policy-enforcement-point) about enforcement of obligation notices.

## 7.13 VariableDefinitionType

A `VariableDefinitionType` object is used to define a value or a bag of values that can be referenced by zero or more `VariableReferenceType` objects. `VariableDefinitionType` objects appear in the `VariableDefinition` property of a `PolicyType` or `RuleType` object. This is the parent object. The scope within which the variable definition can be referenced is any expression within the parent object, including any nested `PolicyType` or `RuleType` objects.

UML definition (class diagram):
```plantuml
@startuml
skinparam style strictuml
hide empty members 
hide circle
class VariableDefinitionType <<dataType>> {
   + VariableId: LocalIdentifierType [1]
   + Expression: ExpressionType [1]
}
@enduml
```

A `VariableDefinitionType` object has the following properties:

`VariableId` [Required]

: A `LocalIdentifierType` value to identify the variable definition. The value of the property MUST NOT be the same as the `VariableId` property of another `VariableDefinitionType` object in the same `VariableDefinition` property or in the `VariableDefinition` property of a `PolicyType` object enclosing the parent object.

`Expression` [Required]

: An `ExpressionType` object. The value of the variable definition is the result of evaluating the `ExpressionType` object. The expression MAY contain `VariableReferenceType` objects referring to other `VariableDefinitionType` objects provided those objects are in the same `VariableDefinition` property or in the `VariableDefinition` property (list) of a `PolicyType` object enclosing the parent object. The expression SHALL NOT contain `VariableReferenceType` objects that refer to this `VariableDefinitionType` object or that refer to `VariableDefinitionType` objects that directly or indirectly refer to this `VariableDefinitionType` object. 

: If the `Expression` value is a `ValueType` object (literal value), it SHALL be handled as String (with DataType identifier `urn:oasis:names:tc:acal:1.0:data-type:string`) by default. *Note that the way the DataType identifier is defined depends on the concrete type (subtype of `ValueType`) of that value. For example, `ValueType` subtypes stereotyped `<<fixedDatatype>>` have the `DataType` identifier globally defined and fixed as a Stereotype property (therefore implicitly predefined for every instance), whereas the `LiteralRestrictedStringType` have a UML attribute `DataType` that can be set to a different value (identifier) for each instance.*

## 7.13b SharedVariableDefinitionType

A `SharedVariableDefinitionType` object is used to define a value or a bag of values that can be referenced by zero or more `SharedVariableReferenceType` objects. `SharedVariableDefinitionType` objects appear in the `SharedVariableDefinition` property of a `BundleType` object, i.e., they exist independently of any policy. The scope within which the shared variable definition can be referenced is any expression nested within the `BundleType` object. This includes policies, any other `SharedVariableDefinitionType` objects and the arguments of the `BundleType` object's `PolicyReference` property.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class SharedVariableDefinitionType <<dataType>> {
  {field} + Id: URI [1]
  {field} + Version: VersionType [1]
  {field} + Description: String [0..1]
  {field} + ShortIdSetReference: URI [*] {ordered, unique}
  {field} + Parameter: ParameterType [*] {ordered, unique} {{OCL} self->isUnique(Name)}
  {field} + Expression: ExpressionType [1]
}
@enduml
```

`Id` [Required]

: A `URI` value specifying an identifier for the shared variable. It is the responsibility of the PAP to ensure that no two shared variables visible to the PDP have the same identifier. This MAY be achieved by following a predefined URN or URI scheme. If the identifier is in the form of a URL, then it MAY be resolvable.
`Id` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Version` [Required]

: A `VersionType` value specifying the version number of the shared variable.

`Description` [Optional]

: A free-form `String` description of the shared variable.

`ShortIdSetReference` [Any Number]

: A sequence of `URI` values referencing short identifier sets. The short identifiers used by the shared variable MUST be ones defined in the referenced sets or in any further sets referenced by the referenced sets (recursively). The shared variable SHALL NOT directly or indirectly reference any short identifier set more than once.
URIs starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Parameter` [Any Number]

: A sequence of `ParameterType` objects declaring the parameters of the shared variable if the variable is parameterized. Each object's `Name` MUST be unique in this sequence.

`Expression` [Required]

: An `ExpressionType` object. The value of the shared variable definition is the result of evaluating this `ExpressionType` object. The expression MAY contain `SharedVariableReferenceType` objects referring to other `SharedVariableDefinitionType` objects. The expression SHALL NOT contain `SharedVariableReferenceType` objects that refer to this `SharedVariableDefinitionType` object or that refer to `SharedVariableDefinitionType` objects that directly or indirectly refer to this `SharedVariableDefinitionType` object.

: Note that the expression cannot contain `VariableReferenceType` objects since the `SharedVariableDefinitionType` object is not in the scope of any `VariableDefinitionType` object.

: If an Expression has an (optional) `DataType` property (statically-typed Expression), i.e. its type is `ValueType`, `NamedAttributeDesignatorType`, `BaseAttributeSelectorType` or any subtype thereof, and its `DataType` property is omitted, it is set implicitly to `urn:oasis:names:tc:acal:1.0:data-type:string` by default.

*Note that the way the DataType identifier is defined on a `ValueType` depends on the concrete type (`ValueType` subtype) of that value. For example, `ValueType` subtypes stereotyped `<<fixedDatatype>>` have the `DataType` identifier globally defined and fixed as a Stereotype property (therefore implicitly predefined for every instance), whereas the `LiteralRestrictedStringType` have a UML attribute `DataType` that can be set to a different value (identifier) for each instance.*

<a name="expressiontype"></a>

## 7.14 ExpressionType

An `ExpressionType` object defines an ACAL expression. Expression evaluation is defined in [Section 8.5](#85-expression-evaluation).

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class ArgumentType <<dataType>>
abstract class ExpressionType <<dataType>> extends ArgumentType

abstract class NonLiteralExpressionType extends ExpressionType
class ApplyType <<dataType>> extends NonLiteralExpressionType

abstract class BaseAttributeSelectorType <<dataType>> extends NonLiteralExpressionType
abstract class AttributeSelectorType <<dataType>> extends BaseAttributeSelectorType
abstract class EntityAttributeSelectorType <<dataType>> extends BaseAttributeSelectorType

class FunctionType <<dataType>> extends ExpressionType

abstract class NamedAttributeDesignatorType <<dataType>> extends NonLiteralExpressionType
class AttributeDesignatorType <<dataType>> extends NamedAttributeDesignatorType
class EntityAttributeDesignatorType <<dataType>> extends NamedAttributeDesignatorType

abstract class QuantifiedExpressionType <<dataType>> extends NonLiteralExpressionType
class ForAnyType <<dataType>> extends QuantifiedExpressionType
class ForAllType <<dataType>> extends QuantifiedExpressionType
class MapType <<dataType>> extends QuantifiedExpressionType
class SelectType <<dataType>> extends QuantifiedExpressionType

class SharedVariableReferenceType <<dataType>> extends NonLiteralExpressionType
class ValueType <<dataType>> extends ExpressionType
class VariableReferenceType <<dataType>> extends NonLiteralExpressionType
@enduml
```

An `ExpressionType` object is either a `NonLiteralExpressionType` object or an object that contains exactly one of the following properties:

`Function`

: A `FunctionType` object identifying a function.


`Value`

: A `ValueType` object specifying a literal ACAL value.

An `NonLiteralExpressionType` object contains exactly one of the following properties:

`Apply`

: An `ApplyType` object specifying a function call.

`AttributeDesignator`

: An `AttributeDesignatorType` object specifying a named attribute from the request context.

`EntityAttributeDesignator`

: An `EntityAttributeDesignatorType` object specifying a named attribute from either the request context or a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type.

`AttributeSelector`

: An `AttributeSelectorType` object specifying a Path expression - depending on the content type (e.g. XPath for XML content) - to apply to the structured content in the request context to produce a bag of ACAL values.

`EntityAttributeSelector`

: An `EntityAttributeSelectorType` object specifying a Path expression - depending on the content type (e.g. XPath for XML content) - to apply to the structured content either in the request context or in a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type.

`VariableReference`

: A `VariableReferenceType` object referencing a variable.

`SharedVariableReference`

: A `SharedVariableReferenceType` object referencing a shared variable.

`ForAny`

: A `QuantifiedExpressionType` object specifying existential quantification.

`ForAll`

: A `QuantifiedExpressionType` object specifying universal quantification.

`Select`

: A `QuantifiedExpressionType` object specifying filtering of an input bag of values.

`Map`

: A `QuantifiedExpressionType` object specifying transformation of an input bag of values.

## 7.15 ApplyType

An `ApplyType` object is a kind of expression that denotes application of a function to its arguments, which are also expressions, thus encoding a function call.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class NonLiteralExpressionType <<datatype>>
class ApplyType <<dataType>> extends NonLiteralExpressionType {
   + Description: String [0..1]
   + FunctionId: IdentifierType [1]
   + Argument: ArgumentType [*] {ordered, nonunique}
}
@enduml
```

An `ApplyType` object contains the following properties:

`FunctionId` [Required]

: An `IdentifierType` value identifying the function to be applied to the arguments. ACAL-defined functions are described in [Annex C.3](#c3-functions).
`FunctionId` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Description` [Optional]

: A free-form `String` description of the `ApplyType` object.

`Argument` [Any Number]

: A sequence of `ArgumentType` objects, each defining an expression as an argument to the function. The sequence of arguments SHALL be exclusively either one of these:
- A sequence of *positional* arguments, i.e. `ExpressionType` objects declared in the same order as the parameters defined in the function's signature and matching the parameter data-types;
- If and only if the function has defined parameter names for all its parameters, it may also be a sequence of *named* arguments, i.e. `NamedArgumentType` objects declared in any order, where each argument has a unique name *x* that associates it with the function's parameter named *x* and therefore the argument's expression MUST match that parameter data-type.
  *Note: although there is not a function with such defined parameter names in the current version of ACAL, there may be some specified in future versions of ACAL or in ACAL Profiles.*

**DataType inference rule**: if an Argument's Expression has an (optional) `DataType` property (statically-typed Expression), i.e. its type is `ValueType`, `NamedAttributeDesignatorType`, `BaseAttributeSelectorType` or any subtype thereof, and if the corresponding parameter's definition in the function's signature (the function identified by `FunctionId`) has a fixed DataType, then the Expression's `DataType` property MAY be omitted, as it is already defined by the function's signature. (Else (if present) it SHALL be the same as the function parameter's DataType.)

For example, if the Argument's Expression is a `ValueType` object and the function's signature defines the data-type of the corresponding argument explicitly to be *T*, then the object does not need any `DataType` identifier, it is already defined implicitly to be *T*.

## 7.16 FunctionType

A `FunctionType` object is a kind of expression used to identify a function as an argument to a higher-order function defined by the argument's parent `ApplyType` object.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class ExpressionType <<datatype>>
class FunctionType <<dataType>> extends ExpressionType {
   + Id: IdentifierType [1]
}
@enduml
```

A `FunctionType` object contains the following property:

`Id` [Required]

: An `IdentifierType` value identifying a function.
`Id` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

<a name="namedattributedesignatortype"></a>

## 7.17 NamedAttributeDesignatorType

The `NamedAttributeDesignatorType` object type is an abstract object type that specifies a named attribute for the retrieval of a bag of attribute values from a source of attributes. The object types derived from `NamedAttributeDesignatorType` determine the source of attributes: an `AttributeDesignatorType` object (an attribute designator) specifies a named attribute in the request context and an `EntityAttributeDesignatorType` object (an entity attribute designator) specifies a named attribute in either the request context or a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type.

Evaluation of an `AttributeDesignatorType` or `EntityAttributeDesignatorType` object returns a bag containing all the ACAL attribute values that are matched by the named attribute, or an error. In the event that no matching attribute is present in the source of attributes, the `MustBePresent` property governs whether this evaluation returns an empty bag or `Indeterminate`. See [Section 8.4.5](#845-attribute-retrieval).

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class NonLiteralExpressionType <<datatype>>
abstract class NamedAttributeDesignatorType <<dataType>> extends NonLiteralExpressionType {
   + AttributeId: IdentifierType [1]
   + DataType: IdentifierType [0..1] = 'urn:oasis:names:tc:acal:1.0:data-type:string'
   + Issuer: Name [0..1]
   + MustBePresent: Boolean [0..1] = false
}
@enduml
```

A `NamedAttributeDesignatorType` object contains the following properties:

`AttributeId` [Required]

: An `IdentifierType` value specifying the `AttributeId` of the named attribute.
`AttributeId` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`DataType` [Optional]

: An `IdentifierType` value specifying the `DataType` of the named attribute. The bag returned by the designator SHALL contain values of this data type. If this property is omitted, the DataType inference rule(s) of the parent object SHALL apply first, if there is any rule defined in this specification in the parent object type's section (either [ApplyType](#715-applytype), [PolicyReferenceType](#711-policyreferencetype), [SharedVariableReferenceType](#724b-sharedvariablereferencetype), or one of the subtypes of [QuantifiedExpressionType](#725-quantifiedexpressiontype-optional) ); if there is not any, or if the DataType is still undefined after applying the rule(s), then it is treated as being set to `urn:oasis:names:tc:acal:1.0:data-type:string` by default.
`DataType` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Issuer` [Optional]

: A `Name` value which, if supplied, specifies the `Issuer` of the named attribute.

`MustBePresent` [Optional, Default `false`]

: A `Boolean` value that governs whether the designator returns `Indeterminate` or an empty bag in the event the named attribute is absent from the source of attributes. See [Section 8.4.5](#845-attribute-retrieval). Also see [Section 8.17.2](#8172-syntax-and-type-errors) and [Section 8.17.3](#8173-missing-attributes). If this property is omitted, then it is treated as being set to `false`.

A named attribute SHALL be considered present if there is at least one attribute in the source of attributes that matches the criteria set out below.

A named attribute matches an attribute in the source of attributes if the values of their respective `AttributeId`, `DataType` and `Issuer` properties match. The attribute designator's `AttributeId` property MUST match, by identifier equality, the `AttributeId` property of the attribute. The attribute designator's `DataType` property MUST match, by identifier equality, the `DataType` property of the same attribute.

If the `Issuer` property is present in the attribute designator, then it MUST match, using the `urn:oasis:names:tc:acal:1.0:function:string-equal` function, the `Issuer` property of the same attribute. If the `Issuer` property is not present in the attribute designator, then the matching of the attribute to the named attribute SHALL be governed by `AttributeId` and `DataType` properties alone.

## 7.18 AttributeDesignatorType

An `AttributeDesignatorType` object is a kind of expression that defines an attribute designator. An attribute designator retrieves a bag of values for a named attribute from the request context.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class NamedAttributeDesignatorType <<datatype>>
class AttributeDesignatorType <<dataType>> extends NamedAttributeDesignatorType {
   + Category: IdentifierType [1]
}
@enduml
```

The `AttributeDesignatorType` object type extends the `NamedAttributeDesignatorType` object type with the following property:

`Category` [Required]

: An `IdentifierType` value specifying an attribute category in the request context from which values of the named attribute are retrieved.
`Category` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

The properties inherited from `NamedAttributeDesignatorType` specify the named attribute. The attribute designator retrieves values from attributes matching the named attribute that are present in the `RequestEntityType` object having a `Category` property that matches, by identifier equality, the `Category` property of the attribute designator.

## 7.19 EntityAttributeDesignatorType

An `EntityAttributeDesignatorType` object is a kind of expression that defines an entity attribute designator. An entity attribute designator retrieves a bag of values for a named attribute from either the request context or a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class NamedAttributeDesignatorType <<datatype>>
class EntityAttributeDesignatorType <<dataType>> extends NamedAttributeDesignatorType {
   + Expression: ExpressionType [1]
}
@enduml
```

The `EntityAttributeDesignatorType` object type extends the `NamedAttributeDesignatorType` object type with the following property:

`Expression` [Required]

: An `ExpressionType` object defining an expression that MUST evaluate to either a single value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type or a single value of the `urn:oasis:names:tc:acal:1.0:data-type:anyURI` data type.

The properties inherited from `NamedAttributeDesignatorType` specify the named attribute.

If the expression evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type, then the entity attribute designator retrieves values from attributes matching the named attribute that are present in the value of the expression.

If the expression evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:anyURI` data type, then the entity attribute designator retrieves values from attributes matching the named attribute that are present in the `RequestEntityType` object having a `Category` property that matches, by identifier equality, the value of the expression. In this case the entity attribute designator emulates an attribute designator.

<a name="baseattributeselectortype"></a>

## 7.20 BaseAttributeSelectorType (optional)

_**Support for this part (attribute selectors and entity attribute selectors) is OPTIONAL.**_

The `BaseAttributeSelectorType` object type is an abstract object type that specifies a Content-specific Path expression (e.g. XPath) for the production of a bag of ACAL attribute values. The object types derived from `BaseAttributeSelectorType` determine the source of the content: an `AttributeSelectorType` object (an attribute selector) specifies the `Content` property of an attribute category in the request context and an `EntityAttributeSelectorType` object (an entity attribute selector) specifies the `Content` property in either an attribute category in the request context or a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type.

Evaluation of an `AttributeSelectorType` or `EntityAttributeSelectorType` object returns a bag of unnamed and uncategorized ACAL attribute values, or an error.

See [Section 8.4.7](#847-selector-evaluation) for details of attribute selector and entity attribute selector evaluation.

UML definition (class diagram):
```plantuml
@startuml
skinparam style strictuml
hide empty members 
hide circle
abstract class NonLiteralExpressionType <<datatype>>
abstract class BaseAttributeSelectorType <<dataType>> extends NonLiteralExpressionType {
   + Path: AttributeSelectorPathType [1]
   + DataType: IdentifierType [0..1] = 'urn:oasis:names:tc:acal:1.0:data-type:string'
   + MustBePresent: Boolean [0..1] = false
}
@enduml
```

A `BaseAttributeSelectorType` object has the following properties:

`Path` [Required]

: A restricted `String` value that contains an expression to be evaluated against the specified content. The concrete syntax and semantics of the expression is separate ACAL Profiles (e.g. XPath / JSONPath Profiles). See [Section 8.4.7](#847-selector-evaluation) for details of the expression evaluation during attribute selector and entity attribute selector processing.


`DataType` [Optional]

: An `IdentifierType` value specifying the data type of the values returned from the evaluation of the attribute selector or entity attribute selector. If this property is omitted, the DataType inference rule(s) of the parent object SHALL apply first, if there is any rule defined in this specification in the parent object type's section (either [ApplyType](#715-applytype), [PolicyReferenceType](#711-policyreferencetype), [SharedVariableReferenceType](#724b-sharedvariablereferencetype), or one of the subtypes of [QuantifiedExpressionType](#725-quantifiedexpressiontype-optional) ); if there is not any, or if the DataType is still undefined after applying the rule(s), then it is treated as being set to `urn:oasis:names:tc:acal:1.0:data-type:string` by default.
`DataType` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`MustBePresent` [Optional, Default `false`]

: A `Boolean` value that governs whether the attribute selector or entity attribute selector returns `Indeterminate` or an empty bag in the event that the specified content does not exist, or the content does exist but the Path expression selects no node. See [Section 8.4.5](#845-attribute-retrieval). Also see [Section 8.17.2](#8172-syntax-and-type-errors) and [Section 8.17.3](#8173-missing-attributes). If this property is omitted, then it is treated as being set to `false`.

## 7.21 AttributeSelectorType (optional)

_**Support for this part (attribute selectors) is OPTIONAL.**_

An `AttributeSelectorType` object is an abstract object type of expression that defines an attribute selector. An attribute selector produces a bag of unnamed and uncategorized ACAL attribute values. The values SHALL be constructed from the node(s) selected by applying the Path expression given by the attribute selector's `Path` property to the structured `Content` indicated by the attribute selector's `Category` property. Concrete types of this are defined in ACAL Profiles, e.g. XPath Profile.

See [Section 8.4.7](#847-selector-evaluation) for details of attribute selector evaluation.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class BaseAttributeSelectorType <<datatype>>
abstract class AttributeSelectorType <<dataType>> extends BaseAttributeSelectorType {
   + Category: IdentifierType [1]
}
@enduml
```

The `AttributeSelectorType` object type extends the `BaseAttributeSelectorType` object type with the following property:

`Category` [Required]

: An `IdentifierType` value specifying an attribute category in the request context. The `Content` property of that attribute category contains the structured content from which nodes will be selected.
`Category` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

## 7.22 EntityAttributeSelectorType (optional)

_**Support for this part (entity attribute selectors) is OPTIONAL.**_

An `EntityAttributeSelectorType` object is an abstract object type of expression that defines an entity attribute selector. An entity attribute selector produces a bag of unnamed and uncategorized ACAL attribute values. The values SHALL be constructed from the node(s) selected by applying the Path expression given by the entity attribute selector's `Path` property to the structured content in the `Content` property in either an attribute category in the request context or a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type. Concrete types of this are defined in ACAL Profiles, e.g. XPath Profile.

See [Section 8.4.7](#847-selector-evaluation) for details of entity attribute selector evaluation.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class BaseAttributeSelectorType <<datatype>>
abstract class EntityAttributeSelectorType <<dataType>> extends BaseAttributeSelectorType {
   + Expression: ExpressionType [1]
}
@enduml
```

The `EntityAttributeSelectorType` object type extends the `BaseAttributeSelectorType` object type with the following property:

`Expression` [Required]

: An `ExpressionType` object defining an expression that MUST evaluate to either a single value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type or a single value of the `urn:oasis:names:tc:acal:1.0:data-type:anyURI` data type.

If the expression evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type, then the entity attribute selector applies the Path expression given by the entity attribute selector's `Path` property to the structured content in the `Content` property of that value. 

If the expression evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:anyURI` data type, then the entity attribute selector applies the Path expression given by the entity attribute selector's `Path` property to the structured content in the `Content` property of the `RequestEntityType` object having a `Category` property that matches, by identifier equality, the value of the expression. In this case the entity attribute selector emulates an attribute selector.

## 7.23 ValueType

A `ValueType` object is a kind of expression that contains a literal ACAL value.

UML model (class diagram):

```plantuml
@startuml
skinparam nodesep 20
skinparam ranksep 20
hide empty members
hide circle

abstract class ExpressionType
abstract class ValueType extends ExpressionType
abstract class PrimitiveValueType extends ValueType
abstract class StructuredValueType extends ValueType
note bottom of StructuredValueType: Structured data-types, \neither user-defined or \ndefined by an ACAL Profile \n(e.g. XPath Profile's \n'xpathExpression' datatype), \nmay derive this type.

class LiteralBooleanType <<fixedDatatype>> extends PrimitiveValueType {
    <<fixedDatatype>>
    DataType='urn:oasis:names:tc:acal:1.0:data-type:boolean'
    __
    +Value: Boolean [1]
}
class LiteralIntegerType <<fixedDatatype>> extends PrimitiveValueType {
    <<fixedDatatype>>
    DataType='urn:oasis:names:tc:acal:1.0:data-type:integer'
    __
    +Value: Integer [1]
}
class LiteralDoubleType <<fixedDatatype>> extends PrimitiveValueType {
    <<fixedDatatype>>
    DataType='urn:oasis:names:tc:acal:1.0:data-type:double'
    __
    +Value: Double [1]
}
class LiteralStringType <<fixedDatatype>> extends PrimitiveValueType {
    <<fixedDatatype>>
    DataType='urn:oasis:names:tc:acal:1.0:data-type:string'
    __
    +Value: String [1]
}
class LiteralRestrictedStringType <<restrictedString>> extends PrimitiveValueType {
    +DataType: IdentifierType [0..1]
    +Value: String [1]
}

note bottom of LiteralRestrictedStringType: Other ACAL datatypes with lexical representation \ncan be derived from this type, \ne.g. standard time, date, dateTime, \nanyURI, hexBinary, base64Binary, \ndayTimeDuration, yearMonthDuration, \nx500Name, rfc822Name, ipAddress, dnsName.

PrimitiveValueType -[hidden]- LiteralBooleanType
LiteralBooleanType -[hidden]- LiteralIntegerType
LiteralIntegerType -[hidden]- LiteralDoubleType
LiteralDoubleType -[hidden]- LiteralStringType
LiteralStringType -[hidden]- LiteralRestrictedStringType

class DataType <<Metaclass>>
class FixedDatatype <<Stereotype>> extends DataType {
     DataType: URI [1]
}

@enduml
```

A `ValueType` object has the following properties:

`DataType` [Optional]

: An `IdentifierType` value specifying the data type of the attribute value. If this property is omitted, the DataType inference rule(s) of the parent object SHALL apply first, if there is any rule defined in this specification in the parent object type's section (either [ApplyType](#715-applytype), [PolicyReferenceType](#711-policyreferencetype), [SharedVariableReferenceType](#724b-sharedvariablereferencetype), or one of the subtypes of [QuantifiedExpressionType](#725-quantifiedexpressiontype-optional) ); if there is not any, or if the DataType is still undefined after applying the rule(s), then it is treated as being set to `urn:oasis:names:tc:acal:1.0:data-type:string` by default.
`DataType` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

A ValueType is abstract and subtypes may be either primitive types - i.e. subtypes of `PrimitiveValueType` in the above diagram (LiteralStringType, LiteralIntegerType, etc.) - or structured types (see [Section 8.4.1](#841-structured-attributes)) -  i.e. subtypes of `StructuredValueType` in the above diagram.

The abstract model distinguishes `LiteralBooleanType`, `LiteralIntegerType`, `LiteralDoubleType`, and `LiteralStringType` from `LiteralRestrictedStringType` by their effective ACAL `DataType` and value space, not by any required concrete syntactic wrapper. A concrete representation MAY make that distinction directly through native scalar syntax, or it MAY use a uniform literal surface form in which the concrete `ValueType` subtype is determined from the effective `DataType` obtained from the subtype's `<<fixedDatatype>>` definition, an explicit `DataType` property, or the applicable parent-context inference rules above. A concrete subtype of `StructuredValueType` is identified by its effective `DataType`, exactly as for the primitive subtypes above; the concrete syntax of its structured content is then defined by the ACAL Profile or user definition that introduces that subtype. Because the rules above resolve any otherwise-undetermined literal to the `string` data type, a structured value is never identified by inspecting its content.

## 7.24 VariableReferenceType

A `VariableReferenceType` object is a kind of expression used to reference a variable definition.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class NonLiteralExpressionType <<datatype>>
class VariableReferenceType <<dataType>> extends NonLiteralExpressionType {
   + VariableId: LocalIdentifierType [1]
}
@enduml
```

A `VariableReferenceType` object contains the following property:

`VariableId` [Required]

: A `LocalIdentifierType` value used to refer to the ACAL value or bag of values defined in a `VariableDefinitionType` object. The property value MUST match, by identifier equality, the `VariableId` property of exactly one `VariableDefinitionType` object that is in the `VariableDefinition` property of an enclosing `RuleType` or `PolicyType` object.

## 7.24b SharedVariableReferenceType

A `SharedVariableReferenceType` object is used to reference a shared variable by identifier and optional version.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class NonLiteralExpressionType <<datatype>>
class SharedVariableReferenceType <<dataType>> extends NonLiteralExpressionType {
   + Id: URI [1]
   + Version: VersionMatchType [0..1]
   + Argument: ArgumentType [*] {ordered, nonunique}
}
@enduml
```

The `SharedVariableReferenceType` object type contains the following properties:

`Id` [Required]

: A URI being the `Id` of the referenced shared variable. If the URI is a URL, then it MAY be resolvable to the shared variable. However, the mechanism for resolving a shared variable reference to the corresponding shared variable is outside the scope of this specification.
`Id` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Version` [Optional]

: Specifies a matching expression for selecting an acceptable version of the referenced shared variable. The matching operation is defined in [Section 7.1.2.3.5](#71235-versionmatchtype). If this property is present, then the selected version of the shared variable MUST match the expression. If the property is absent, then any version of the shared variable is acceptable. In the case that more than one version matches, then the most recent one SHOULD be used.

`Argument` [Any Number]

: Arguments for a parameterized shared variable (`SharedVariableDefinitionType` object). The sequence of arguments SHALL be exclusively either one of these:
- A sequence of *positional* arguments, i.e. `ExpressionType` objects declared in the same order as the `Parameter` values in the referenced shared variable definition; each argument number *n* MUST match the definition of the shared variable's `Parameter` number *n* (`DataType`, `IsBag`);
- A sequence of *named* arguments, i.e. `NamedArgumentType` objects declared in any order, where each argument has a unique name *x* that associates it with the shared variable's `Parameter` named *x* and therefore its Expression MUST match that Parameter's definition (`DataType`, `IsBag`). 

The number of arguments *N* may be less than the number of declared `Parameter`s if and only if the `Parameter`s number *N* (starting at zero) and above have defined default values, in which case they are used as remaining arguments. 

**DataType inference rule**: if an Argument's Expression has an (optional) `DataType` property (statically-typed Expression), i.e. its type is `ValueType`, `NamedAttributeDesignatorType`, `BaseAttributeSelectorType` or any subtype thereof, then the Expression's `DataType` property SHOULD be omitted in this case as it is already defined by the corresponding `Parameter`'s definition in the referenced `SharedVariableDefinitionType` object. Else (if present) it SHALL match that `Parameter`'s `DataType`.


## 7.25 QuantifiedExpressionType (optional)

A `QuantifiedExpressionType` object is a kind of expression that represents one of four kinds of quantified expression. The kind of quantified expression is determined by the name of the property that holds the object, either `ForAny`, `ForAll`, `Select` or `Map`. There are some common requirements for all four kinds of quantified expressions.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class NonLiteralExpressionType <<datatype>>
abstract class QuantifiedExpressionType <<dataType>> extends NonLiteralExpressionType {
   + VariableId: LocalIdentifierType [1]
   + Domain: NonLiteralExpressionType [1]
   + Iterant: ExpressionType [1]
}
@enduml
```

A `QuantifiedExpressionType` object contains the following properties:

`VariableId` [Required]

: A `LocalIdentifierType` value to identify the quantified variable that will be used by the quantified expression. The quantified variable does not have a corresponding variable definition. The value of the property MUST NOT be the same as the `VariableId` property of a `VariableDefinitionType` object in the `VariableDefinition` property of an enclosing `PolicyType` or `RuleType` object.

`Domain` [Required]

: A `NonLiteralExpressionType` object defining an expression. This expression is called the domain. The domain SHALL be an expression that evaluates to a bag of values of the same data type, or `Indeterminate` in the case of an error. The bag MAY be empty.

`Iterant` [Required]

: An `ExpressionType` object defining an expression. This expression is called the iterant expression. The iterant expression SHALL be an expression that evaluates to a single value (for all but one kind of quantified expression the data type of that value is `urn:oasis:names:tc:acal:1.0:data-type:boolean`).

Quantified expressions MAY be nested in either or both of the domain and the iterant expression. A nested quantified expression SHALL NOT use the same `VariableId` as an enclosing quantified expression.

The evaluation of a quantified expression begins with the evaluation of the domain expression. The iterant expression is then evaluated once for each value from the domain with the quantified variable set to that value, except that evaluation of the quantified expression may terminate before considering all the values from the domain if the final result of the quantified expression has already been determined. The conditions for early termination are specified for each kind of quantified expression. The effect of the result of the iterant expression on the overall result of the quantified expression depends on the kind of quantified expression. Bags of values are unordered so there is no constraint on the order in which an implementation chooses to consider values from the domain.

The value of the quantified variable, i.e., the particular value from the domain, MAY be referenced one or more times from within the iterant expression using a `VariableReferenceType` object. It is not an error if the quantified variable is not referenced at all. The quantified variable SHALL NOT be referenced from within the domain of the quantified expression to which it belongs. A quantified variable MAY be referenced from within the domain of another quantified expression nested within the iterant expression.

### 7.25.1 ForAny Expression

The ForAny quantified expression tests whether any value of a bag satisfies the iterant expression. It is represented by a `ForAny` property, which is of the `QuantifiedExpressionType` object type.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class QuantifiedExpressionType <<dataType>> extends NonLiteralExpressionType
class ForAnyType <<dataType>> extends QuantifiedExpressionType
@enduml
```

The iterant expression of a ForAny expression SHALL be an expression that evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:boolean` data type. 

**DataType inference rule**: if the `Iterant` Expression has an (optional) `DataType` property (statically-typed Expression), i.e. its type is `ValueType`, `NamedAttributeDesignatorType`, `BaseAttributeSelectorType` or any subtype thereof, then its `DataType` property SHALL be omitted as the DataType is already fixed to be `urn:oasis:names:tc:acal:1.0:data-type:boolean` by this definition.

The result of a ForAny expression SHALL be a value of the `urn:oasis:names:tc:acal:1.0:data-type:boolean` data type or `Indeterminate`.

The ForAny expression evaluates to `true` if the iterant expression evaluates to `true` for any value from the domain; otherwise, the expression evaluates to `Indeterminate` if the iterant expression evaluates to `Indeterminate` for any value from the domain; otherwise, the expression evaluates to `false`. Note that the ForAny expression evaluates to `false` if the domain is an empty bag. Evaluation of the expression MAY terminate whenever the iterant expression evaluates to `true`.

### 7.25.2 ForAll Expression

The ForAll quantified expression tests whether all values of a bag satisfy the iterant expression. It is represented by the `ForAll` property, which is of the `QuantifiedExpressionType` object type.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class QuantifiedExpressionType <<dataType>> extends NonLiteralExpressionType
class ForAllType <<dataType>> extends QuantifiedExpressionType
@enduml
```

The iterant expression of a ForAll expression SHALL be an expression that evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:boolean` data type. 

**DataType inference rule**: if the `Iterant` Expression has an (optional) `DataType` property (statically-typed Expression), i.e. its type is `ValueType`, `NamedAttributeDesignatorType`, `BaseAttributeSelectorType` or any subtype thereof, then its `DataType` property SHALL be omitted as the DataType is already fixed to be `urn:oasis:names:tc:acal:1.0:data-type:boolean` by this definition.

The result of a ForAll expression SHALL be a value of the `urn:oasis:names:tc:acal:1.0:data-type:boolean` data type or `Indeterminate`.

The ForAll expression evaluates to `false` if the iterant expression evaluates to `false` for any value from the domain; otherwise, the expression evaluates to `Indeterminate` if the iterant expression evaluates to `Indeterminate` for any value from the domain; otherwise, the expression evaluates to `true`. Note that the ForAll expression evaluates to `true` if the domain is an empty bag. Evaluation of the expression MAY terminate whenever the iterant expression evaluates to `false`.

### 7.25.3 Map Expression

The Map quantified expression converts a bag of values to another bag of values. It is represented by the `Map` property, which is of the `QuantifiedExpressionType` object type. If the expression is a literal value - `ValueType` object - without a defined DataType, it SHALL be handled as string (DataType identifier `urn:oasis:names:tc:acal:1.0:data-type:string`) by default.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class QuantifiedExpressionType <<dataType>> extends NonLiteralExpressionType
class MapType <<dataType>> extends QuantifiedExpressionType
@enduml
```
The iterant expression of a Map expression SHALL be an expression that evaluates to a single value (not necessarily of the same data type as the values in the domain).

The result of the Map expression SHALL be a bag of values of the same data type as the iterant expression or `Indeterminate`.

If the iterant expression evaluates to `Indeterminate` for any value from the domain, then the result of the Map expression is `Indeterminate`; otherwise, the result bag contains the values resulting from the evaluation of the iterant expression for each value from the domain. The Map expression evaluates to an empty bag if the domain is an empty bag. Evaluation of the Map expression MAY terminate whenever the iterant expression evaluates to `Indeterminate`.

### 7.25.4 Select Expression

The Select quantified expression returns a bag containing the values from the domain that satisfy the iterant expression. That is, the result is a subset of, or equal to, the domain. The Select expression is represented by the `Select` property, which is of the `QuantifiedExpressionType` object type.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class QuantifiedExpressionType <<dataType>> extends NonLiteralExpressionType
class SelectType <<dataType>> extends QuantifiedExpressionType
@enduml
```

The iterant expression of a Select expression SHALL be an expression that evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:boolean` data type. 

**DataType inference rule**: if the `Iterant` Expression has an (optional) `DataType` property (statically-typed Expression), i.e. its type is `ValueType`, `NamedAttributeDesignatorType`, `BaseAttributeSelectorType` or any subtype thereof, then its `DataType` property SHALL be omitted as the DataType is already fixed to be `urn:oasis:names:tc:acal:1.0:data-type:boolean` by this definition.

The result of a Select expression SHALL be a bag of values of the same data type as the values from the domain or `Indeterminate`.

If the iterant expression evaluates to `Indeterminate` for any value from the domain, then the result of the Select expression is `Indeterminate`; otherwise, the result bag contains each value from the domain for which the iterant expression evaluates to `true`. The Select expression evaluates to an empty bag if the domain is an empty bag. Evaluation of the Select expression MAY terminate whenever the iterant expression evaluates to `Indeterminate`.

<a name="noticetype"></a>

## 7.26 NoticeType

A `NoticeType` object contains an identifier for a notice and a list of attribute assignments that form arguments of the notice.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class NoticeType <<dataType>> {
   {field} + Id: IdentifierType [1]
   {field} + IsObligation: Boolean [0..1] = false
   {field} + AttributeAssignment: AttributeAssignmentType [*] {ordered, nonunique}
}
@enduml
```

See [Section 8.16](#816-notices) for a description of how the list of notices to be returned by the PDP is determined.

A `NoticeType` object contains the following properties:

`Id` [Required]

: An `IdentifierType` value specifying an identifier for the notice that the PEP associates with particular processing requirements or informational content. The `Id` identifies the *semantics* of the notice — what the PEP is required to do, or is being informed of — rather than a particular occurrence of it. The same `Id` MAY therefore appear on more than one notice in a result, typically with different `AttributeAssignment`s.
`Id` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`IsObligation` [Optional, Default `false`]

: A `Boolean` value which, if present and set to `true`, indicates the notice is an obligation; otherwise, the notice is advice.

`AttributeAssignment` [Any Number]

: A sequence of `AttributeAssignmentType` objects (each of them is an attribute assignment) forming the arguments of the notice.

<a name="attributetype"></a>

## 7.27 AttributeType

An `AttributeType` object contains attribute meta-data and one or more attribute values. The attribute meta-data comprises the attribute identifier, the data type and the attribute issuer. Attribute designators in a policy MAY refer to attributes by means of this meta-data.

UML definition (class diagram):
```plantuml
@startuml
skinparam style strictuml
hide empty members 
hide circle
class AttributeType <<dataType>> {
   + AttributeId: IdentifierType [1]
   + Issuer: Name [0..1]
   + DataType: IdentifierType [0..1] = 'urn:oasis:names:tc:acal:1.0:data-type:string'
   + Value: ValueType [1..*] {unordered, nonunique}
}
@enduml
```

An `AttributeType` object contains the following properties:

`AttributeId` [Required]

: An `IdentifierType` value identifying the attribute. A number of identifiers are reserved by ACAL to denote commonly used attributes. See [Annex D](#annex-d-acal-identifiers).
`AttributeId` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Issuer` [Optional]

: A `Name` value specifying the issuer of the attribute. For example, this attribute value may be an `x500Name` that binds to a public key, or it may be some other identifier exchanged out-of-band by issuing and relying parties.

`DataType` [Optional, Default `urn:oasis:names:tc:acal:1.0:data-type:string`]

: An `IdentifierType` value specifying the data type of the attribute's values. If this property is omitted, then it is treated as being set to `urn:oasis:names:tc:acal:1.0:data-type:string`.

`Value` [One to Many]

: A sequence of `ValueType` objects, each denoting an ACAL attribute value. Duplicated attribute values are permitted. A `ValueType` object in this sequence SHALL NOT redefine or override the `DataType` identifier set by the `DataType` property above and SHOULD NOT set a `DataType` identifier property of its own.

## 7.28 AttributeAssignmentType

An `AttributeAssignmentType` object is used to include an attribute in a notice. The `AttributeAssignmentType` object type extends the `AttributeType` definition by adding a `Category` property.

The attribute specified SHALL be understood by the PEP, but it is not further specified by ACAL. See [Section 8.16](#816-notices). [Section 6.2.4.3](#6243-rule-3) provides a number of examples of attribute assignments included in notices.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class AttributeType <<dataType>>
class AttributeAssignmentType <<dataType>> extends AttributeType {
   + Category: IdentifierType [0..1]
}
@enduml
```

The `AttributeAssignmentType` object type extends the `AttributeType` object type with the following property:

`Category` [Optional]

: An `IdentifierType` value specifying the category of the attribute. If this property is absent, the attribute has no category. The PEP SHALL interpret the significance and meaning of any `Category` property. Non-normative note: an expected use of the category is to disambiguate attributes that are relayed from the request.
`Category` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

None of the `Value`s may have a `DataType` property on its own since it is already defined by the `DataType` property at the `AttributeAssignmentType` object level (inherited from `AttributeType`).

<a name="noticeexpressiontype"></a>

## 7.29 NoticeExpressionType

A `NoticeExpressionType` object defines a notice expression that is potentially evaluated into a notice. A notice expression contains an identifier for the notice and a set of expressions that form arguments of the notice. The `AppliesTo` property indicates the effect for which this notice is eligible to be provided to the PEP. If the `AppliesTo` property is absent, then this notice is eligible to be provided to the PEP if the effect is either `Permit` or `Deny`. See [Section 8.16](#816-notices) for a description of how the list of notices to be returned by the PDP is determined.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class NoticeExpressionType <<dataType>> {
  {field} + Id: IdentifierType [1]
  {field} + IsObligation: Boolean [0..1] = false
  {field} + AppliesTo: EffectType [0..1]
  {field} + Condition: BooleanExpressionType [0..1]
  {field} + AttributeAssignmentExpression: AttributeAssignmentExpressionType [*] {ordered, nonunique}
}
@enduml
```

A `NoticeExpressionType` object contains the following properties:

`Id` [Required]

: An `IdentifierType` value nominating the identifier for the notice that the PEP associates with particular processing requirements or informational content. The `Id` identifies the *semantics* of the notice — what the PEP is required to do, or is being informed of — rather than a particular occurrence of it. The same `Id` MAY therefore appear on more than one `NoticeExpression` within a policy or rule, typically with different `AttributeAssignmentExpression`s.
`Id` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`IsObligation` [Optional, Default `false`]

: A `Boolean` value that determines the setting for the `IsObligation` property of the notice. If `IsObligation` is present, then the `IsObligation` property of the notice is set to the same value; otherwise, the `IsObligation` property is omitted from the notice (default value is `false`, i.e. the notice is advice).

`AppliesTo` [Optional]

: An `EffectType` value that specifies the effect for which this notice is eligible to be provided to the PEP, or if absent, either `Permit` or `Deny`.

`Condition` [Optional]

: A `BooleanExpressionType` object holding an expression that must be satisfied for this notice to be provided to the PEP. An absent condition is treated as unconditionally satisfied. Evaluation of the `Condition` property is described in [Section 8.9](#89-condition-evaluation).

`AttributeAssignmentExpression` [Any Number]

: A sequence of `AttributeAssignmentExpressionType` objects, each specifying a notice argument in the form of an expression. The expressions SHALL be evaluated by the PDP to constant `ValueType` objects or bags, which SHALL be the attribute assignments in the notice returned to the PEP. If an `AttributeAssignmentExpressionType` object evaluates to an atomic attribute value, then there MUST be one resulting `AttributeAssignmentType` object which MUST contain this single attribute value. If the `AttributeAssignmentExpressionType` object evaluates to a bag, then there MUST be a resulting `AttributeAssignmentType` object for each of the values in the bag. If the bag is empty, there SHALL be no `AttributeAssignmentType` objects from this `AttributeAssignmentExpressionType` object. The values of the notice arguments SHALL be interpreted by the PEP.

## 7.30 AttributeAssignmentExpressionType

An `AttributeAssignmentExpressionType` object is used to include an argument in a notice. It SHALL contain an `AttributeId` property and an expression which SHALL be evaluated into the corresponding attribute value. The value specified SHALL be understood by the PEP, but it is not further specified by ACAL. See [Section 8.16](#816-notices). [Section 6.2.4.3](#6243-rule-3) provides a number of examples of attribute assignment expressions included in notice expressions.

UML definition (class diagram):
```plantuml
@startuml
skinparam style strictuml
hide empty members 
hide circle
class AttributeAssignmentExpressionType <<dataType>> {
   + AttributeId: IdentifierType [1]
   + Category: IdentifierType [0..1]
   + Issuer: Name [0..1]
   + Expression: ExpressionType [1] 
}
@enduml
```

An `AttributeAssignmentExpressionType` object contains the following properties:

`Expression` [Required]

: An `ExpressionType` object defining an expression which evaluates to a constant attribute value or a bag of zero or more attribute values. See [Section 7.14](#714-expressiontype). If the `Expression` value is a `ValueType` object (literal value) without a defined `DataType` identifier, it SHALL be handled as String (with DataType identifier `urn:oasis:names:tc:acal:1.0:data-type:string`) by default. *Note that the way the DataType identifier is defined depends on the concrete type (subtype of `ValueType`) of that value. For example, `ValueType` subtypes stereotyped `<<fixedDatatype>>` have the `DataType` identifier globally defined and fixed as a Stereotype property (therefore implicitly predefined for every instance), whereas the `LiteralRestrictedStringType` have a UML attribute `DataType` that can be set to a different value (identifier) for each instance.*

`AttributeId` [Required]

: An `IdentifierType` value specifying the identifier of the attribute. The value of the `AttributeId` property in the resulting `AttributeAssignmentType` object MUST be equal to this value.
`AttributeId` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Category` [Optional]

: An `IdentifierType` value specifying the category of the attribute. If this property is missing, the attribute has no category. The value of the `Category` property in the resulting `AttributeAssignmentType` object MUST be equal to this value.
`Category` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Issuer` [Optional]

: A `Name` value specifying the issuer of the attribute. If this property is absent, the attribute has no issuer. The value of the `Issuer` property in the resulting `AttributeAssignmentType` object MUST be equal to this value.

<a name="requesttype"></a>

## 7.31 RequestType

The `RequestType` object type is an abstraction layer used by the policy language. For simplicity of expression, this document describes policy evaluation in terms of operations on the context. However a conforming PDP is not required to actually instantiate the context in any particular syntactic form. But, any system conforming to the ACAL specification MUST produce exactly the same authorization decisions as if all the inputs had been transformed into the form of a `RequestType` object.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class RequestType <<dataType>> {
  {field} + ShortIdSetReference: URI [*] {unique}
  {field} + RequestDefaults: RequestDefaultsType [*] {unordered, unique} {{OCL} self->isUnique(oclType())}
  {field} + RequestEntity: RequestEntityType [1..*] {unordered, unique} {{OCL} self->select(Id <> null)->isUnique(Id)}
  {field} + MultiRequests: MultiRequestsType [0..1] {{OCL} self.RequestReference.RequestEntityReference->forAll(entityRef | RequestEntity.allInstances->exists(entity | entityRef = entity.Id ))}
  {field} + ReturnPolicyIdList: Boolean [0..1] = false
  {field} + CombinedDecision: Boolean [0..1] = false
}
@enduml
```

A `RequestType` object contains the following properties:

`ReturnPolicyIdList` [Optional, Default `false`]

: A `Boolean` value that is used to request that the PDP return a list of all fully applicable policies which were used in the decision as a part of the decision response. If this property is omitted, then it is treated as being set to `false`.

`CombinedDecision` [Optional, Default `false`]

: A `Boolean` value that is used to request that the PDP combines multiple decisions into a single decision. The use of this property is specified in [[ACAL-Multiple-1.0](#acal-multiple-10)]. If the PDP does not implement the relevant functionality in [[ACAL-Multiple-1.0](#acal-multiple-10)], then the PDP MUST return an `Indeterminate` decision with a status code of `urn:oasis:names:tc:acal:1.0:status:processing-error` if it receives a request with this property set to `true`. If this property is omitted, then it is treated as being set to `false`.

`ShortIdSetReference` [Any Number]

: A sequence of `URI` values referencing short identifier sets. The short identifiers used by the request MUST be ones defined in the referenced sets.
URIs starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`RequestDefaults` [Any Number]

: sequence of `RequestDefaultsType` objects; each contains default values specific to an ACAL Profile, for processing the request (e.g. ACAL XPath Profile defines the default XPath version). In particular, each object SHALL have a different concrete type (per ACAL profile). See [Section 7.32](#732-requestdefaultstype-optional).


`RequestEntity` [One to Many]

: A sequence of `RequestEntityType` objects, each containing a sequence of `RequestAttributeType` objects associated with an attribute category of the request context. Different `RequestEntityType` objects with different category identifiers are used to represent information about the subject, resource, action, environment or other categories of the access request. There may be multiple `RequestEntityType` objects with the same `Category` property value if the PDP implements the ACAL Multiple Decision Profile, see [[ACAL-Multiple-1.0](#acal-multiple-10)]. Under other conditions, it is a syntax error if there are multiple `RequestEntityType` objects with the same `Category` (see [Section 8.17.2](#8172-syntax-and-type-errors) for error codes).

`MultiRequests` [Optional]

: A `MultiRequestsType` object listing multiple request contexts using references to the `RequestEntityType` objects. Implementation of this property is optional. The semantics of this property are defined in [[ACAL-Multiple-1.0](#acal-multiple-10)]. If the implementation does not implement this property, it MUST return an `Indeterminate` result if it encounters this property. See [Section 7.38](#738-multirequeststype-optional).

<a name="requestdefaultstype"></a>

## 7.32 RequestDefaultsType (optional)

_**Supporting this part is optional.**_ _It is required only for supporting the ACAL Profiles that define extensions (subtypes) of `RequestDefaultsType` (e.g. XPath Profile)._

`RequestDefaultsType` is an abstract object type for default values that apply to the parent `RequestType` object. Concrete subtypes of `RequestDefaultsType` are defined in separate ACAL Profiles, e.g. XPath Profile.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
abstract class RequestDefaultsType <<dataType>>
@enduml
```


## 7.33 RequestEntityType

A `RequestEntityType` object specifies ACAL attributes of a subject, resource, action, environment or another category using a sequence of `RequestAttributeType` objects.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class RequestEntityType <<dataType>> {
  {field} + Category: IdentifierType [1]
  {field} + Id: LocalIdentifierType [0..1]
  {field} + Content: ContentType [0..1]
  {field} + RequestAttribute: RequestAttributeType [*] {unordered, unique} {{OCL} self->isUnique(Sequence{AttributeId, DataType, Issuer})}
}
@enduml
```

A `RequestEntityType` object contains the following properties:

`Category` [Required]

: An `IdentifierType` value indicating which attribute category the contained attributes belong to, and it is used to differentiate between attributes of subject, resource, action, environment or other categories.
`Category` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Id` [Optional]

: A unique `LocalIdentifierType` identifier for this `RequestEntityType` object. It is primarily intended to be referenced in multiple requests. See [[ACAL-Multiple-1.0](#acal-multiple-10)].

`Content` [Optional]

: A `ContentType` object specifying additional sources of attributes in JSON or XML document format which can be referenced using attribute selectors and entity attribute selectors.

`RequestAttribute` [Any Number]

: A sequence of `RequestAttributeType` objects associated with the attribute category of the request. `RequestAttribute` objects MUST be unique within a `RequestEntityType` object by the combination of their `AttributeId`, `DataType` and `Issuer` properties. The `AttributeId` and `DataType` properties are compared using identifier equality (see [Section 8.18](#818-identifier-equality)), with `DataType` compared on its effective value after applying its default (see [Section 7.27](#727-attributetype)) if the property is omitted. If the `AttributeId` and `DataType` properties are equal by such comparison in two `RequestAttribute` objects, then the objects are considered equal if and only if either one of the following is true:
  1. The `Issuer` property is absent from both objects;
  2. The `Issuer` property is present in both objects and both values of the property are equal by comparing them with the `urn:oasis:names:tc:acal:1.0:function:string-equal` function. 

: See [Section 7.33.1](#7331-uniqueness-example-non-normative) for a worked example.

### 7.33.1 Uniqueness Example (non-normative)

Given the following `RequestAttribute` objects in a single `RequestEntityType` object:
```xml
<RequestAttribute AttributeId="urn:example:role"/>
<RequestAttribute AttributeId="urn:example:role" DataType="urn:oasis:names:tc:acal:1.0:data-type:integer"/>
<RequestAttribute AttributeId="urn:example:role" Issuer="urn:example:issuer-a"/>
<RequestAttribute AttributeId="urn:example:role" Issuer="urn:example:issuer-b"/>
```

None of these four objects is a duplicate of any other: the first two differ in their effective `DataType` (the first defaults to `urn:oasis:names:tc:acal:1.0:data-type:string`, per [Section 7.27](#727-attributetype)); the third and fourth differ in `Issuer`; and the first differs from the third and fourth because an absent `Issuer` is never considered a duplicate of a present one, regardless of its value.

Adding a fifth object identical to the first would violate the constraint:
```xml
<RequestAttribute AttributeId="urn:example:role"/>
```
This fifth object has the same `AttributeId` and the same effective `DataType` and `Issuer` (both absent, as in the first object) — together they are a duplicate pair, and only one of the two may appear. The same reasoning applies unchanged to the `Attribute` uniqueness constraint on `ResultEntityType` ([Section 7.44](#744-resultentitytype)) and `EntityType` ([Section 7.45](#745-entitytype)).

## 7.34 ContentType (optional)

_**Support for this object type is optional. It is required only if the implementation supports extensions of AttributeSelectors and/or DataTypes depending on this object type.**_ Such extensions are typically defined in ACAL Profiles (e.g. XPath and JSONPath Profiles).

A `ContentType` object is a notional placeholder for additional attributes, typically the content of the resource.
A `ContentType` object has a *body* property of arbitrary type.

`ContentType` objects SHOULD be used only for structured data that cannot be handled by named attributes, i.e. the *body* type SHOULD be a structured data-type.

The following UML definition (class diagram) is provided for information purposes only:
```plantuml
@startuml
hide empty members 
hide circle
abstract class AnyType <<dataType>>
class ContentType <<dataType>> {
   + MediaType: MediaType [0..1]
   + Encoding: ContentEncodingType [0..1]
   + Body: AnyType [1]
}
@enduml
```

A `ContentType` object contains the following properties:

`MediaType` [Optional]

: Content *media type* as defined by [[RFC2046](#rfc2046)]. The exact possible values for this property SHALL be defined by the `AttributeSelector` Profile(s) of ACAL, e.g. the XPath and/or JSONPath Profiles, that your implementation supports. Indeed, each of these profiles supports one or more specific Content Type(s), and for each one, defines the acceptable `MediaType` property value. In any case, the value(s) SHOULD be among the standard identifiers specified in [Annex D.10](#d10-content-types) whenever applicable. More information in the [MediaType section](#712314-mediatype-optional).

: A default value for this property SHALL be defined by each ACAL representation format supporting this object type, and this default value SHALL be one of the standard identifiers specified in [Annex D.10](#d10-content-types).

`Body` [Required]

: The content body which may be any data-type representable in the ACAL representation format in use (XML, JSON, etc.). In other words, each ACAL representation format SHALL define the correct representation for `AnyType` in their own format (e.g. `xs:anyType` [[XS](#xs)] in XML), or simply state that *the `ContentType` is not supported at all* in that representation.

`Encoding` [Optional]

: This property (similar to [JSON schema's `contentEncoding`](https://json-schema.org/draft/2020-12/json-schema-validation#name-contentencoding) property) applies when the `Body` value is a string that SHALL be interpreted as encoded binary data and decoded using the encoding named by this property. The exact possible value(s) SHALL be defined by each ACAL representation format supporting this object type (e.g. `base64` encoding for the JSON representation of complex XML content). In any case, the value(s) SHOULD be among the standard identifiers specified in [Annex D.11](#d11-content-encodings) whenever applicable (more information in the [ContentEncodingType section](#712315-contentencodingtype-optional) ). If this property is undefined, this indicates that no encoding was needed in order to represent the content in a UTF-8 string.


## 7.35 RequestAttributeType

A `RequestAttributeType` object describes an ACAL attribute in the request context.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class RequestAttributeType <<dataType>> extends AttributeType {
   + IncludeInResult: Boolean [0..1] = false
}

class AttributeType <<dataType>>
@enduml
```

The `RequestAttributeType` object type extends the `AttributeType` object type with the following property:

`IncludeInResult` [Optional, Default `false`]

: A `Boolean` value that governs whether this ACAL attribute is included in the result. This is useful to correlate requests with their responses in the case of multiple requests. If this property is omitted, then it is treated as being set to `false`. Note that ACAL attributes appear in the result as `AttributeType` objects.

## 7.36 ResponseType

The `ResponseType` object type is an abstraction layer used by the policy language. Any proprietary system using the ACAL specification MUST transform an ACAL context `ResponseType` object into the form of its authorization decision.

A `ResponseType` object encapsulates the authorization decision produced by the PDP. It includes a sequence of one or more results, with one `ResultType` object per Individual Decision Request, or a single `ResultType` object when the results are combined [[ACAL-Multiple-1.0](#acal-multiple-10)]. Multiple results MAY be returned by some implementations, in particular those that support the ACAL Multiple Decision Profile [[ACAL-Multiple-1.0](#acal-multiple-10)]. Support for multiple results is OPTIONAL.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class ResponseType <<dataType>> {
   + ShortIdSetReference: URI [*] {unordered, unique}
   + Result: ResultType [1..*] {unordered, nonunique}
}
@enduml
```

A `ResponseType` object contains the following properties:

`ShortIdSetReference` [Any Number]

: A sequence of `URI` values referencing short identifier sets. The short identifiers used by the response MUST be ones defined in the referenced sets.
URIs starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Result` [One to Many]

: A sequence of `ResultType` objects, each an authorization decision result. See [Section 7.37](#737-resulttype).

<a name="resulttype"></a>

## 7.37 ResultType

A `ResultType` object represents an authorization decision result. It MAY include a list of notices. If the PEP does not understand or cannot fulfill an obligation notice, then the action of the PEP is determined by its bias, see [Section 8.2](#82-policy-enforcement-point). Any advice notices MAY be safely ignored by the PEP.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class ResultType <<dataType>> {
  {field} + Decision: DecisionType [1]
  {field} + Status: StatusType [0..1]
  {field} + Notice: NoticeType [*] {ordered, nonunique}
  {field} + ResultEntity: ResultEntityType [*] {unordered, unique} {{OCL} self->isUnique(Category)}
  {field} + ApplicablePolicyReference: ExactMatchIdReferenceType [*] {unordered, unique} {{OCL} self->isUnique(Id)}
}
@enduml
```

A `ResultType` object contains the following properties:

`Decision` [Required]

: A `DecisionType` value indicating the authorization decision: `Permit`, `Deny`, `Indeterminate` or `NotApplicable`.

`Status` [Optional]

: A `StatusType` object indicating whether errors occurred during evaluation of the decision request, and optionally, information about those errors. If the `ResponseType` object contains `ResultType` objects whose `StatusType` objects are all identical, and the `ResponseType` object is contained in a protocol wrapper that can convey status information, then the common status information MAY be placed in the protocol wrapper and this `StatusType` object MAY be omitted from all the `ResultType` objects.

`Notice` [Any Number]

: A sequence of `NoticeType` objects, each a notice to be interpreted by the PEP. Objects' `Id` values are not required to be unique in the sequence; the same `Id` MAY occur more than once, typically with different `AttributeAssignment`s, for instance when it is drawn from more than one rule or policy. See [Section 7.26](#726-noticetype). If the PEP does not understand or cannot fulfill an obligation notice, then the action of the PEP is determined by its bias, see [Section 8.2](#82-policy-enforcement-point). If the PEP does not understand an advice notice, the PEP may safely ignore the notice. See [Section 8.16](#816-notices) for a description of how the list of notices to be returned by the PDP is determined.

`ResultEntity` [Any Number]

: A sequence of `ResultEntityType` objects, each an attribute category containing attributes that were part of the request. The choice of which attributes are included here is made with the `IncludeInResult` property of the `RequestAttributeType` objects of the request. See [Section 7.27](#727-attributetype).

`ApplicablePolicyReference` [Any Number]

: A sequence of `ExactMatchIdReferenceType` objects. If the `ReturnPolicyIdList` property in the `RequestType` object is `true` (see [Section 7.31](#731-requesttype)), a PDP that implements this optional feature MUST return a sequence that includes the identifiers of all policies which were found to be fully applicable, whether or not the effect (after rule combining) was the same or different from the decision. The sequence is unordered. The sequence MAY include the identifiers of other policies that are currently in force, as long as no policies required for the decision are omitted. A PDP MAY satisfy this requirement by including all policies currently in force, or by including all policies which were evaluated in making the decision, or by including all policies which did not evaluate to `NotApplicable`, or by any other algorithm which does not omit any policies which contributed to the decision. However, a decision which returns `NotApplicable` MUST return an empty list.

<a name="multirequeststype"></a>

## 7.38 MultiRequestsType (optional)

_**Support for this object type and associated property (`MultiRequests`) is optional.**_

A `MultiRequestsType` object contains a list of requests by reference to `RequestEntityType` objects in the enclosing `RequestType` object. The `MultiRequests` property is of `MultiRequestsType` object type. The semantics of this property are defined in [[ACAL-Multiple-1.0](#acal-multiple-10)]. If an implementation does not support this property, but receives it, the implementation MUST generate an `Indeterminate` response.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class MultiRequestsType <<dataType>> {
   + RequestReference: RequestReferenceType [1..*] {unordered, unique} {{OCL} self->isUnique(RequestEntityReference->asSet())}
}
@enduml
```

A `MultiRequestsType` object contains the following properties.

`RequestReference` [One to Many]

: A sequence of `RequestReferenceType` objects, each defining a request instance by reference to `RequestEntityType` objects in the enclosing `RequestType` object. See [Section 7.39](#739-requestreferencetype-optional).

<a name="requestreferencetype"></a>

## 7.39 RequestReferenceType (optional)

_**Support for this object type is optional.**_

A `RequestReferenceType` object defines an instance of a request in terms of references to `RequestEntityType` objects. The semantics of this object type are defined in [[ACAL-Multiple-1.0](#acal-multiple-10)].

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class RequestReferenceType <<dataType>> {
   + RequestEntityReference: LocalIdentifierType [1..*] {unordered, unique}
}
@enduml
```

A `RequestReferenceType` object contains the following properties:

`RequestEntityReference` [One to Many]

: A sequence of `LocalIdentifierType` values, each referencing a `RequestEntityType` object in the enclosing `RequestType` object by the value of its `Id` property.

## 7.40 StatusType

A `StatusType` object represents the status of the authorization decision result.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class StatusType <<dataType>> {
   + StatusCode: StatusCodeType [1]
   + StatusMessage: String [0..1]
   + StatusDetail: StatusDetailType [0..1]
}
@enduml
```

A `StatusType` object contains the following properties:

`StatusCode` [Required]

: A `StatusCodeType` object.

`StatusMessage` [Optional]

: A free-form `String` description of the status code.

`StatusDetail` [Optional]

: A `StatusDetailType` object containing additional status information.

## 7.41 StatusCodeType

A `StatusCodeType` object contains a major status code value and an optional recursive series of minor status codes.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class StatusCodeType <<dataType>> {
   + Value: IdentifierType [1]
   + StatusCode: StatusCodeType [0..1]
}
@enduml
```

A `StatusCodeType` object contains the following properties:

`Value` [Required]

: See [Annex D.8](#d8-status-codes) for a list of values. 
`Value` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`StatusCode` [Optional]

: A `StatusCodeType` object describing a minor status code, which qualifies its parent status code. Minor status codes may be nested recursively this way.

## 7.42 StatusDetailType (optional)

_**Support for this object type is optional.**_

A `StatusDetailType` object qualifies its parent `StatusType` object with additional information. A `StatusDetailType` object allows arbitrary content.

The following UML definition (class diagram) is provided for information purposes only:
```plantuml
@startuml
hide empty members 
hide circle
class StatusDetailType <<dataType>> {
   + <any>: AnyType [*] {unordered, nonunique}
}
@enduml
```

The `AnyType` data-type above represents *any type* (e.g. `anyType` [[XS](#xs)] in XML), and the `<any>` name is only a placeholder for any property name. 
This UML definition is for information only, and it is the responsibility of each ACAL representation format (ACAL Profile) to either define the correct representation for arbitrary content in their own format, or simply state that *`StatusDetailType` objects are not supported at all* in that representation format.

For example, this can be represented in XML as follows:

```xml
<xs:element name="StatusDetail" type="xacml:StatusDetailType"/>
<xs:complexType name="StatusDetailType">
   <xs:sequence>
      <xs:any namespace="##any" processContents="lax" minOccurs="0" maxOccurs="unbounded"/>
   </xs:sequence>
</xs:complexType>
```

Inclusion of a `StatusDetailType` object is optional. However, if a PDP returns one of the following ACAL-defined status code values, then the following rules apply.

```text
urn:oasis:names:tc:acal:1.0:status:ok
```

A PDP MUST NOT return a `StatusDetail` property in conjunction with the `ok` status value.

```text
urn:oasis:names:tc:acal:1.0:status:missing-attribute
```

A PDP MAY choose not to return any `StatusDetailType` object or MAY choose to return a `StatusDetailType` object containing one or more `MissingAttributeDetailType` objects.

```text
urn:oasis:names:tc:acal:1.0:status:syntax-error
```

A PDP MUST NOT return a `StatusDetailType` object in conjunction with the `syntax-error` status value. A syntax error may represent either a problem with the policy being used or with the request context. The PDP MAY return a `StatusMessage` property describing the problem.

```text
urn:oasis:names:tc:acal:1.0:status:processing-error
```

A PDP MUST NOT return a `StatusDetailType` object in conjunction with the `processing-error` status value. This status code indicates an error that occurred while the PDP processed the decision request or evaluated policy, including the refusal of a request as specified in [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema). For security reasons, the PDP MAY choose to return no further information to the PEP. In the case of a divide-by-zero error or other computational error, the PDP MAY return a `StatusMessage` property describing the nature of the error.

<a name="missingattributedetailtype"></a>

## 7.43 MissingAttributeDetailType

A `MissingAttributeDetailType` object conveys information about attributes required for policy evaluation that were missing from the request context.

UML definition (class diagram):
```plantuml
@startuml
skinparam style strictuml
hide empty members 
hide circle
class MissingAttributeDetailType <<dataType>> {
   + Category: IdentifierType [0..1]
   + AttributeId: IdentifierType [1]
   + Issuer: Name [0..1]
   + DataType: IdentifierType [1]
   + Value: ValueType [*] {unordered, nonunique}
}
@enduml
```

A `MissingAttributeDetailType` object contains the following properties:

`Value` [Any Number]

: A sequence of `ValueType` objects specifying the required value(s) of the missing attribute. These objects SHALL NOT redefine/override the DataType identifier already defined by the `DataType` property below and SHOULD NOT have any DataType identifier property set at all, if possible.

`Category` [Optional]

: An `IdentifierType` value indicating the category of the missing attribute. Note that an entity attribute designator or entity attribute selector where the `Expression` property evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type does not nominate an attribute category for the named attribute. In this case only the `Category` property is omitted.
`Category` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`AttributeId` [Required]

: An `IdentifierType` value indicating the attribute identifier of the missing attribute.
`AttributeId` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`DataType` [Required]

: An `IdentifierType` value indicating the data type of the missing attribute.
`DataType` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Issuer` [Optional]

: A `Name` value, which if supplied, specifies the required `Issuer` of the missing attribute.

If the PDP includes `ValueType` objects in the `MissingAttributeDetailType` object, then this indicates the acceptable values for that attribute. If no `ValueType` objects are included, then the `MissingAttributeDetailType` object indicates the names of attributes that the PDP failed to resolve during its evaluation. The list of attributes may be partial or complete. There is no guarantee by the PDP that supplying the missing values or attributes will be sufficient to satisfy the policy.

## 7.44 ResultEntityType

A `ResultEntityType` object contains a sequence of `AttributeType` objects reflecting `RequestAttributeType` objects in a given attribute category from the request that had their `IncludeInResult` properties set to `true`. The `ResultEntityType` objects only appear in a result.

UML definition (class diagram):
```plantuml
@startuml
hide empty members 
hide circle
class ResultEntityType <<dataType>> {
  {field} + Category: IdentifierType [1]
  {field} + Id: LocalIdentifierType [0..1]
  {field} + Attribute: AttributeType [1..*] {unordered, unique} {{OCL} self->isUnique(Sequence{AttributeId, DataType, Issuer})}
}
@enduml
```

A `ResultEntityType` object contains the following properties:

`Category` [Required]

: An `IdentifierType` value indicating which attribute category the contained attributes belong to.
`Category` values starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved by the OASIS ACAL \[XACML\] TC for their exclusive use.

`Id` [Optional]

: A `LocalIdentifierType` identifier matching the `Id` property of the corresponding `RequestEntityType` object in the request from which the reflected attributes are obtained.

`Attribute` [One to Many]

: A sequence of `AttributeType` objects representing `RequestAttributeType` objects from the same attribute category in the request. `Attribute` objects MUST be unique within a `ResultEntityType` object by the combination of their `AttributeId`, `DataType` and `Issuer` properties, using the same identifier-equality, effective-`DataType`, and absent-`Issuer` semantics described for `RequestAttribute` in [Section 7.33](#733-requestentitytype).

<a name="entitytype"></a>

## 7.45 EntityType

The `EntityType` object class defines the structure of values of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type. An `EntityType` object contains a sequence of `AttributeType` objects and/or syntax-specific content (i.e., XML or JSON). The `EntityType` object type is similar to the `RequestEntityType` object type but omits the `Category` property; values of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type don't self-identify with any particular attribute category.

UML definition (class diagram):
```plantuml
@startuml
skinparam style strictuml
hide empty members 
hide circle
class EntityType <<dataType>> {
  {field} + Content: ContentType [0..1]
  {field} + Attribute: AttributeType [*] {unordered, unique} {{OCL} self->isUnique(Sequence{AttributeId, DataType, Issuer})}
}
note "{{OCL} Content <> null or Attribute->notEmpty()}" as constraint
EntityType .. constraint
@enduml
```

An `EntityType` object contains the following properties:

`Content` [Optional]

: A `ContentType` object specifying additional sources of attributes in JSON or XML document format which can be referenced using entity attribute selectors.

`Attribute` [Any Number]

: A sequence of `AttributeType` objects. `Attribute` objects MUST be unique within an `EntityType` object by the combination of their `AttributeId`, `DataType` and `Issuer` properties, using the same identifier-equality, effective-`DataType`, and absent-`Issuer` semantics described for `RequestAttribute` in [Section 7.33](#733-requestentitytype). This applies to every use of `EntityType`, including the `PolicyIssuer` property of a `PolicyType` object (see [Section 7.4](#74-policytype)).

## 7.46 BundleType

A `BundleType` object type collects together the policies, short identifier sets and shared variables that a PDP uses to evaluate an authorization request along with the starting point for that evaluation. A PDP is said to be defined by a `BundleType` object, although an implementation is not required to physically represent such an object.

A `BundleType` object might also be used to convey policies, short identifier sets or shared variables between ACAL systems without necessarily being complete for the purpose of evaluating authorization requests. Protocols to enable such transfers are outside the scope of this specification.

UML definition (class diagram):
```plantuml
@startuml
skinparam style strictuml
hide empty members 
hide circle
class BundleType <<dataType>> {
  {field} + ShortIdSet: ShortIdSetType [*] {ordered, unique} {{OCL} self->isUnique(Id)}
  {field} + SharedVariableDefinition: SharedVariableDefinitionType [*] {ordered, unique} {{OCL} self->isUnique(Id)}
  {field} + Policy: PolicyType [*] {ordered, unique} {{OCL} self->isUnique(PolicyId)}
  {field} + PolicyReference: PolicyReferenceType [0..1]
}
/' 
OCL v2.4, Section 11.2.3: "by virtue of the implicit conversion to a collection literal, an expression evaluating to null can be used as source of collection operations [...]. If the source is the null literal, it is implicitly converted to an empty Set by invoking oclAsSet()." Therefore no need for null check on multi-valued properties before calling notEmpty, isUnique, etc.
'/
note "{{OCL} PolicyReference = null or Policy->notEmpty()}" as constraint
BundleType .. constraint
@enduml
```

A `BundleType` object contains the following properties:

`ShortIdSet` [Any Number]

: A sequence of `ShortIdSetType` objects each defining a set of short identifiers that can be referenced by the policies, shared variable definitions and other short identifier sets in the `BundleType` object. Each object's `Id` MUST be unique within the sequence.

`SharedVariableDefinition` [Any Number]

: A sequence of `SharedVariableDefinitionType` objects, each defining an expression that can be referenced from anywhere in the `BundleType` object where an expression can appear. Each object's `Id` MUST be unique within the sequence.

`Policy` [Any Number]

: A sequence of `PolicyType` objects. Each object's `PolicyId` MUST be unique within the sequence.

`PolicyReference` [Optional]

: If present, a `PolicyReferenceType` object that MUST reference a policy in the `Policy` property. A PDP defined by this `BundleType` object SHALL evaluate every authorization request by evaluating this policy reference (the referenced policy is the entry point of evaluation). See [Section 8.13](#813-policyreference-evaluation). If this property is absent, then the PDP returns `NotApplicable` for every authorization request. The policy reference MUST specify arguments if the referenced policy is parameterized.


## 7.47 ArgumentType and NamedArgumentType

The `ArgumentType` object class is the generic type for all kinds of argument expressions passed to function calls (`ApplyType` objects), parameterized policies (`PolicyType` objects) and shared variables (`SharedVariableDefinitionType` objects). It may be either a simple expression (`ExpressionType` object) or a *named argument* (`NamedArgumentType` object).

The `NamedArgumentType` is a subtype of `ArgumentType` representing *named arguments*. A named argument associates an argument  - by its name - with a given parameter of the corresponding function, policy or shared variable, depending on the context. This is similar to the  *named parameters* feature used for function calls in well-known programming languages. In particular, *named arguments* can be declared in any order, regardless of the order of the parameters of the function, policy or shared variable.

UML definition (class diagram):
```plantuml
@startuml
skinparam style strictuml
hide empty members 
hide circle
abstract class ArgumentType <<dataType>> 
abstract class ExpressionType <<datatype>> extends ArgumentType
class NamedArgumentType <<datatype>> extends ArgumentType {
  {field} + Name: LocalIdentifierType [1]
  {field} + Expression: ExpressionType [1]
}
@enduml
```

An `NamedArgumentType` object contains the following properties:

`Name` [Required]

: The name identifying the parameter (in the function, policy or shared variable definition) to which the argument is associated with.

`Expression` [Required]

: The argument value expression

---


# 8 Functional Requirements

This section specifies certain functional requirements that are not directly associated with the production or consumption of a particular ACAL object.

Note that in each case an implementation is conformant as long as it produces the same result as is specified here, regardless of how and in what order the implementation behaves internally.

## 8.1 Unicode Issues

### 8.1.1 Normalization

In Unicode, some equivalent characters can be represented by more than one different Unicode character sequence. See [[CMF](#cmf)]. The process of converting Unicode strings into equivalent character sequences is called "normalization" [[UAX15](#uax15)]. Some operations, such as string comparison, are sensitive to normalization. An operation is normalization-sensitive if its output(s) are different depending on the state of normalization of the input(s); if the output(s) are textual, they are deemed different only if they would remain different were they to be normalized.

For more information on normalization see [[CM](#cm)].

An ACAL implementation MUST behave as if each normalization-sensitive operation normalizes input strings into Unicode Normalization Form C ("NFC"). An implementation MAY use some other form of internal processing (such as using a non-Unicode, "legacy" character encoding) as long as the externally visible results are identical to this specification.

### 8.1.2 Version of Unicode

The version of Unicode used by ACAL is implementation defined. It is RECOMMENDED that the latest version is used. An ACAL implementation SHOULD follow the advice given in the relevant version of [[UTR36](#utr36)]. Also note security issues in [Section 10.3](#103-unicode-security-issues).

## 8.2 Policy Enforcement Point

This section describes the requirements for the PEP.

An application functions in the role of the PEP if it guards access to a set of resources and asks the PDP for an authorization decision. The PEP MUST abide by the authorization decision as described in one of the following sub-sections.

In any case any advice in the decision may be safely ignored by the PEP.

### 8.2.1 Base PEP

If the decision is `Permit`, then the PEP SHALL permit access. If obligation notices accompany the decision, then the PEP SHALL permit access only if it understands and it can and will discharge those obligations.

If the decision is `Deny`, then the PEP SHALL deny access. If obligation notices accompany the decision, then the PEP MUST discharge any obligation it understands to the best of its ability.

If the decision is `NotApplicable`, then the PEP's behavior is undefined.

If the decision is `Indeterminate`, then the PEP's behavior is undefined.

### 8.2.2 Deny-Biased PEP

If the decision is `Permit`, then the PEP SHALL permit access. If obligation notices accompany the decision, then the PEP SHALL permit access only if it understands and it can and will discharge those obligations.

All other decisions SHALL result in the denial of access.

: Note: other actions, e.g. consultation of additional PDPs, reformulation/resubmission of the decision request, etc., are not prohibited.

### 8.2.3 Permit-Biased PEP

If the decision is `Deny`, then the PEP SHALL deny access. If obligation notices accompany the decision, then the PEP MUST discharge any obligation it understands to the best of its ability.

All other decisions SHALL result in the permission of access.

: Note: other actions, e.g. consultation of additional PDPs, reformulation/resubmission of the decision request, etc., are not prohibited.

## 8.3 Identifier Evaluation

Various ACAL artifacts are uniquely identified by URI [[RFC3986](#rfc3986)]. This includes attribute categories, attributes, data types, functions, notices, status codes, combining algorithms. Values of the `IdentifierType` simple type are used to refer to such artifacts, possibly using short identifier names, which are not themselves URIs. Therefore an `IdentifierType` value containing short identifier names MUST undergo evaluation to convert the value to an absolute URI.

The value of a short identifier may also contain short identifier names. The _expanded value_ of the short identifier is the value of the short identifier with any reference to another short identifier (including the curly brackets) replaced by the _expanded value_ of the referenced short identifier (thus the expansion is applied recursively).

In the case where the `IdentifierType` value is already an absolute URI then the result of evaluation is that URI.

In the case where the `IdentifierType` value is just a short identifier name then the result of evaluation is the _expanded value_ of that short identifier.

In the case where the `IdentifierType` value contains curly brackets then the result of evaluation is the value with any reference to a short identifier replaced by the _expanded value_ of the referenced short identifier.

The end result of evaluation MUST be an absolute URI.

### 8.3.1 Identifier Examples (non-normative)

Given the following short identifiers:
```xml
<ShortId Name="xs" Value="urn:oasis:names:tc:acal:1.0:data-type:"/>
<ShortId Name="string" Value="{xs}string"/>
```

these `IdentifierType` values are all equivalent and evaluate to the URI of the string data type:
```json
"urn:oasis:names:tc:acal:1.0:data-type:string"
"string"
"{string}"
"{xs}string"
```

### 8.3.2 Short Identifier Set Usage (non-normative)

The predefined short identifier set is not expected to contain short identifier definitions for all the identifiers an implementation or a deployment of that implementation will be using. In particular, a deployment is likely to have a number of custom ACAL attributes holding information specific to that deployment. Deployments may be part of a community of interest making use of common attributes and categories. Implementations may take advantage of the extension points in ACAL to define proprietary functions and data types, and may define custom categories and custom attributes that are appropriate for their user base. One aim of this specification is give implementors and users the ability to define their own short identifiers to use in these cases. Future ACAL extensions may also provide additional, predefined short identifier sets for any identifiers they introduce.

Ideally, all the short identifiers that a deployment intends to use would be available to a policy or a request by referencing a _single_ short identifier set. Because a short identifier set cannot validly be included directly or indirectly more than once, specifications and implementations should avoid creating short identifier sets that reference short identifier sets outside of their purview and instead leave deployments to create the single short identifier set that references all the sets that are relevant to it.

Short identifier names are not globally unique, so implementations should not hard-wire specific short identifiers or short identifier sets so that users have the flexibility to compose and use alternative short identifier sets to work around any name clashes that arise from attempting to incorporate sets from various, independent sources.

The predefined short identifier set is not required to be used but its use is recommended to promote a common understanding of identifiers between deployments. For this reason, the use of alternative names should be minimized, and preferably allowed _in addition to_ the predefined set. Users should not exclude the standard set and assign any short identifier names from that set to different URIs.

## 8.4 Attribute Evaluation

Attributes are represented in the request context by the context handler, regardless of whether or not they appeared in the original decision request, and are referred to in the policy by attribute designators and attribute selectors. A named attribute is the term used for the criteria that the specific attribute designators use to refer to particular attributes in the `RequestEntityType` objects of the request context.

Implementations MUST convert between the attribute representations in the application environment (e.g., SAML, J2SE, CORBA, and so on) and the attribute representations in the ACAL context. How this is achieved is outside the scope of this specification.

### 8.4.1 Structured Attributes

`ValueType` objects MAY contain an instance of a structured data type, for example an XML element `<ds:KeyInfo>`. ACAL 1.0 supports several ways for comparing the contents of such elements.

1. In some cases, such elements MAY be compared using one of the ACAL string functions, such as `string-regexp-match`, described below. This requires that the element be given the data type `urn:oasis:names:tc:acal:1.0:data-type:string`. For example, a structured data type that is actually a `ds:KeyInfo/KeyName` would appear in the context as:

   ```xml
        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
          &lt;ds:KeyName&gt;jhibbert-key&lt;/ds:KeyName&gt;
        </Value>
   ```

   In general, this method will not be adequate unless the structured data type is quite simple.

1. The structured attribute MAY be made available in the `Content` property of the appropriate attribute category and an attribute selector MAY be used to select the contents of a leaf sub-element of the structured data type by means of a *path* expression whose syntax and semantics depends on the type of content (e.g. XPath for XML content). That value MAY then be compared using one of the supported ACAL functions appropriate for its data type. This method requires support by the PDP for the specific ACAL Profile that defines the particular kind of attribute selector, and type of *path* expression in particular, for the type of `Content` being used (e.g. XPath Profile for XML content).

### 8.4.2 Attribute Bags

ACAL defines implicit collections of its data types. ACAL refers to a collection of values that are of a single data type as a bag. Bags of data types are needed because selections of nodes from an XML/JSON resource or ACAL request context may return more than one value.

An attribute selector uses an expression to specify the selection of data from free-form structured content (e.g. any XML element). The result of the expression evaluation may return multiple values from the content. ACAL also defines attribute designators to have the same matching methodology for attributes in the ACAL request context.

The values in a bag are not ordered, and some of the values may be duplicates. There SHALL be no notion of a bag containing bags, or a bag containing values of differing types; i.e., a bag in ACAL SHALL contain only values that are of the same data type.

### 8.4.3 Multivalued Attributes

If a single attribute in a request context contains multiple attribute values, then the bag of values resulting from evaluation of the attribute MUST be identical to the bag of values that results from evaluating a context in which each attribute value appears in a separate attribute, with each separate attribute carrying identical meta-data.

### 8.4.4 Attribute Matching

A named attribute includes specific criteria with which to match attributes in the context. An attribute specifies a `Category` and `DataType`, and a named attribute also specifies an `AttributeId` and optional `Issuer`. A named attribute SHALL match an attribute if the values of their respective `Category`, `AttributeId`, `DataType` and optional `Issuer` properties match. The `Category` property of the named attribute MUST match, by identifier equality, the `Category` property of the corresponding context attribute. The `AttributeId` property of the named attribute MUST match, by identifier equality, the `AttributeId` property of the corresponding context attribute. The `DataType` property of the named attribute MUST match, by identifier equality, the `DataType` property of the corresponding context attribute. If the `Issuer` property is supplied in the named attribute, then it MUST match, using the `urn:oasis:names:tc:acal:1.0:function:string-equal` function, the `Issuer` property of the corresponding context attribute. If the `Issuer` property is not supplied in the named attribute, then the matching of the context attribute to the named attribute SHALL be governed by the `AttributeId` and `DataType` properties alone, regardless of the presence, absence, or actual value of `Issuer` property in the corresponding context attribute. In the case of an attribute selector, the matching of the attribute to the named attribute SHALL be governed by the `Category`, `Path` expression and `DataType` property and other properties as defined by the respective ACAL Profile being used to provide the concrete `AttributeSelectorType` object.

### 8.4.5 Attribute Retrieval

The PDP SHALL request the values of attributes in the request context from the context handler. The context handler MAY also add attributes to the request context without the PDP requesting them. The PDP SHALL reference the attributes as if they were in a physical request context document, but the context handler is responsible for obtaining and supplying the requested values by whatever means it deems appropriate, including by retrieving them from one or more Policy Information Points. The context handler SHALL return the values of attributes that match the attribute designator, entity attribute designator, attribute selector or entity attribute selector and form them into a bag of values with the specified data type. If no attributes from the request context match, then the attribute SHALL be considered missing. If the attribute is missing, then the `MustBePresent` property governs whether the designator or selector returns an empty bag or an `Indeterminate` result. If the `MustBePresent` property is `false` (default value), then a missing attribute SHALL result in an empty bag. If the `MustBePresent` property is `true`, then a missing attribute SHALL result in `Indeterminate`. This `Indeterminate` result SHALL be handled in accordance with the specification of the encompassing expressions, rules and policies. If the result is `Indeterminate`, then the `AttributeId`, `DataType` and `Issuer` properties of the attribute MAY be listed in the authorization decision as described in [Section 8.17.3](#8173-missing-attributes). However, a PDP MAY choose not to return such information for security reasons.

Regardless of any dynamic modifications of the request context during policy evaluation, the PDP SHALL behave as if each bag of attribute values is fully populated in the context before it is first tested, and is thereafter immutable during evaluation. That is, every subsequent test of that attribute SHALL use the same bag of values that was initially tested.

### 8.4.6 Environment Attributes

Standard environment attributes are listed in [Annex D.7](#d7-environment-attributes). If a value for one of these attributes is supplied in the decision request, then the context handler SHALL use that value. Otherwise, the context handler SHALL supply a value. In the case of date and time attributes, the supplied value SHALL have the semantics of the "date and time that apply to the decision request".

### 8.4.7 Selector Evaluation

An `AttributeSelectorType` or `EntityAttributeSelectorType` object will be evaluated according to the following processing model.

: Note: It is not necessary for an implementation to exactly follow this model. It is only necessary to produce results identical to those that would be produced by following this model.

If the attribute category given by the `Category` property of an `AttributeSelectorType` object is not found or does not have a `Content` property, then the return value is either `Indeterminate` or an empty bag as determined by the `MustBePresent` property.

If the `Expression` property of an `EntityAttributeSelectorType` object evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type and that value does not have a `Content` property, then the return value is either `Indeterminate` or an empty bag as determined by the `MustBePresent` property.

If the `Expression` property of an `EntityAttributeSelectorType` object evaluates to a value of the `urn:oasis:names:tc:acal:1.0:data-type:anyURI` data type and an attribute category with that value as its `Category` is not found or does not have a `Content` property, then the return value is either `Indeterminate` or an empty bag as determined by the `MustBePresent` property.

If the designated attribute category or entity value has a `Content` property, then follow the steps below:

1. Parse the value of the `Content`'s `Body` property into the data structure suitable for processing by the concrete type of AttributeSelector/EntityAttributeSelector defined by the ACAL Profile in use (e.g. XML content for the XPath Profile). If it is not a valid data structure according to the ACAL Profile, then the attribute selector MUST return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

2. Evaluate the expression given in the `Path` property against the data structure obtained in the previous step, according to the syntax and semantics of the respective ACAL Profile in use (as indicated by the concrete subtype of `AttributeSelectorType` being used).

3. The result of step 2 is converted to a bag of values of the data type specified by the `DataType` property, according to the conversion rules of the ACAL Profile in use (e.g. those of the XPath Profile or the JSONPath Profile). An ACAL Profile that defines a concrete type of `AttributeSelectorType` or `EntityAttributeSelectorType` SHALL specify those conversion rules, i.e. which results of step 2 can be converted to a value of each data type the profile supports for this purpose (including, if the profile supports it, the `urn:oasis:names:tc:acal:1.0:data-type:entity` data type) and how each is converted. The following rules apply in addition, whatever the ACAL Profile:

&nbsp;
: If the result of step 2 is empty, then the return value is either `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`, or an empty bag, as determined by the `MustBePresent` property. This rule applies before, and instead of, any conversion case of the ACAL Profile in use, including a case that would otherwise be satisfied vacuously by an empty result.

&nbsp;
: If the data type is one for which the ACAL Profile in use defines a conversion and the result of step 2 does not satisfy any of the cases the profile defines for it, then the attribute selector MUST return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

&nbsp;
: If the data type is not one for which the ACAL Profile in use defines a conversion, then the return values SHALL be constructed from the result of step 2 in a manner specified by the definition of that data type in this specification or in the particular data type extension specification. If no appropriate constructor is specified, then the attribute selector MUST return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

&nbsp;
: If an error occurs when converting the values returned by the expression to the specified data type, then the result of the attribute selector MUST be `Indeterminate`, with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`

## 8.5 Expression Evaluation

ACAL specifies expressions in terms of objects of the object types listed below, of which the `ApplyType` objects recursively compose greater expressions. Expressions SHALL be type correct and satisfy cardinality requirements (i.e., single value versus bag). This means that the types of each of the objects contained within an `ApplyType` object SHALL agree with the respective argument types and cardinalities of the function that is named by the `FunctionId` property. The resultant type and cardinality of the `ApplyType` object SHALL be the resultant type and cardinality of the function. ACAL defines an evaluation result of `Indeterminate`, which is said to be the result of an invalid expression, or an operational error occurring during the evaluation of the expression.

An ACAL expression is a choice between the following object types:

* `ValueType`
* `AttributeDesignatorType`
* `EntityAttributeDesignatorType`
* `AttributeSelectorType`
* `EntityAttributeSelectorType`
* `ApplyType`
* `FunctionType`
* `VariableReferenceType`
* `SharedVariableReferenceType`
* `QuantifiedExpressionType`

## 8.6 Arithmetic Evaluation

This section specifies the required behavior of `double` arithmetic. `integer` arithmetic is exact and is fully specified by [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) and [Annex C.3.2](#c32-arithmetic-functions); it does not depend on this section and is not subject to rounding, a designated precision, or a trap-enabler, because an `integer` result is either exact or `Indeterminate`.

A `double` value is a binary64 (double-precision) floating-point value, as given by the value space of `xs:double` ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)). An ACAL arithmetic function (`urn:oasis:names:tc:acal:1.0:function:double-add`, `-subtract`, `-multiply`, `-divide` and `-abs`, [Annex C.3.2](#c32-arithmetic-functions)) SHALL produce the mathematically exact result of the corresponding operation, rounded to the nearest binary64 value as if the exponent range were unbounded, with a tie rounded to the value whose least significant bit is zero (round-to-nearest, ties-to-even); if no finite binary64 value can represent that rounded result, the result SHALL be positive or negative infinity, matching the sign of the exact result. An operation with a NaN operand, or an operation such as `0 × ∞` that has no defined mathematically exact result, SHALL produce NaN — except where this specification states a different result, such as [Annex C.3.2](#c32-arithmetic-functions)'s rule that a division whose divisor is zero evaluates to `Indeterminate` rather than to a signed infinity or NaN. A representational detail not otherwise stated here, such as the sign of a zero result, the handling of a subnormal value, or the result of an operation on an infinite operand not covered above, follows ordinary binary64 arithmetic.

An ACAL function comparing two `double` values — `urn:oasis:names:tc:acal:1.0:function:double-equal` ([Annex C.3.1](#c31-equality-predicates)) and the `double` functions of [Annex C.3.6](#c36-numeric-comparison-functions) — SHALL follow binary64 comparison: NaN compares unordered with every `double` value, including itself, so each of these functions SHALL evaluate to `false` if either argument is NaN; these functions SHALL treat positive zero and negative zero as equal in value, consistent with ordinary numeric comparison (so `double-equal` returns `true` for a positive-zero/negative-zero pair, and neither is greater than or less than the other).

This is the arithmetic and comparison behavior that a binary64 (or equivalent) floating-point type native to essentially every general-purpose programming language and hardware platform already performs in its default configuration. An implementation conforms by using that native type and its ordinary arithmetic operators and comparisons for `double` values, in a default configuration (standard rounding, no flush-to-zero or "fast-math"-style relaxation, no fused or reduced-precision evaluation of a single ACAL function), together with this specification's own override for a zero divisor ([Annex C.3.2](#c32-arithmetic-functions)) — the one case above where this specification requires a result to differ from a native binary64 operator's ordinary result. [[IEEE754](#ieee754)] is the formal origin of the rest of these rules and MAY be consulted for detail beyond what this section states; conformance with this section does not require access to it.

## 8.7 Target Evaluation

The target value SHALL be `Match` if the `Target` property is absent or the expression specified in the target evaluates to `true`. Otherwise, if the expression evaluates to `false`, then the target SHALL be `No-match`. Otherwise, the target SHALL be `Indeterminate`. The target match table is shown in Table 1.

**Table 1:** Target Match Table

| Expression value | Target value |
| :--- | :--- |
| `true` | `Match` |
| `false` | `No-match` |
| `Indeterminate` | `Indeterminate` |

## 8.8 VariableReference Evaluation

A `VariableReferenceType` object references a single `VariableDefinitionType` object that has a matching `VariableId` property value and is in the `VariableDefinition` property of an enclosing `RuleType` or `PolicyType` object. If no such `VariableDefinitionType` object exists, then the reference is invalid. The PDP MUST detect invalid references either at policy loading time or during runtime evaluation. If the PDP detects an invalid reference during runtime the variable reference evaluates to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.

In any place where a `VariableReferenceType` object occurs, it has the effect as if the `ExpressionType` object defined in the `VariableDefinitionType` object replaces the `VariableReferenceType` object. Any evaluation scheme that preserves this semantic is acceptable. For instance, the expression in the `VariableDefinitionType` object may be evaluated to a particular value and cached for multiple references without consequence (i.e., the value of an `ExpressionType` object remains the same for the entire policy evaluation). This characteristic is one of the benefits of ACAL being a declarative language.

Circular references are invalid. The PDP MUST detect circular references either at policy loading time or during runtime evaluation. If the PDP detects a circular reference during runtime the variable reference evaluates to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.

## 8.9 Condition Evaluation

The condition value SHALL be `true` if the `Condition` property is absent, or if the expression contained in the `Condition` property evaluates to `true`. Its value SHALL be `false` if the expression evaluates to `false`. The condition value SHALL be `Indeterminate` if the expression evaluates to `Indeterminate`.

## 8.10 Extended Indeterminate

Some combining algorithms are defined in terms of an extended set of `Indeterminate` values. The extended set associated with the `Indeterminate` contains the potential effect values which could have occurred if there would not have been an error causing the `Indeterminate`. The possible extended set `Indeterminate` values are

* `Indeterminate{D}`: an `Indeterminate` from a policy or rule which could have evaluated to `Deny`, but not `Permit`

* `Indeterminate{P}`: an `Indeterminate` from a policy or rule which could have evaluated to `Permit`, but not `Deny`

* `Indeterminate{DP}`: an `Indeterminate` from a policy or rule which could have evaluated to `Deny` or `Permit`.

The combining algorithms that are defined in terms of the extended `Indeterminate` make use of the additional information to allow for better treatment of errors in the processing.

The final decision returned by a PDP cannot be an extended `Indeterminate`. Any such decision at the top level policy — the policy referenced by the `PolicyReference` property of the `BundleType` object that defines the PDP (see [Section 8.15](#815-authorization-decision)) — is returned as a plain `Indeterminate` in the response from the PDP.

The tables in [Section 8.11](#811-rule-evaluation) and [Section 8.12](#812-policy-evaluation) define how extended `Indeterminate` values are produced during rule and policy evaluation.

## 8.11 Rule Evaluation

A rule has a value that can be calculated by evaluating the rule's condition. The rule truth table is shown in Table 2.

**Table 2:** Rule Truth Table

| Condition | Rule Value |
| :--- | :--- |
| `true` | `Effect` |
| `false` | `NotApplicable` |
| `Indeterminate` | `Indeterminate{P}` if the `Effect` is `Permit`, or `Indeterminate{D}` if the `Effect` is `Deny` |

## 8.12 Policy Evaluation

The value of a policy SHALL be determined only by its contents, considered in relation to the contents of the request context. A policy's value SHALL be determined by evaluation of the policy's target and evaluation of the specified combining algorithm on the contained policies and rules.

The policy truth table is shown in Table 3.

**Table 3:** Policy Truth Table

| Target | Combining Algorithm Value | Policy Value |
| :--- | :--- | :--- |
| `Match` | `NotApplicable`  | `NotApplicable`  |
| `Match` | `Permit` | `Permit` |
| `Match` | `Deny` | `Deny` |
| `Match` | `Indeterminate` | `Indeterminate{DP}` |
| `Match` | `Indeterminate{DP}` | `Indeterminate{DP}` |
| `Match`| `Indeterminate{P}` | `Indeterminate{P}` |
| `Match`| `Indeterminate{D}` | `Indeterminate{D}` |
| `No-match` | Don't care | `NotApplicable` |
| `Indeterminate` | `NotApplicable`  | `NotApplicable`  |
| `Indeterminate` | `Permit` | `Indeterminate{P}` |
| `Indeterminate` | `Deny` | `Indeterminate{D}` |
| `Indeterminate` | `Indeterminate` | `Indeterminate{DP}` |
| `Indeterminate` | `Indeterminate{DP}` | `Indeterminate{DP}` |
| `Indeterminate`| `Indeterminate{P}` | `Indeterminate{P}` |
| `Indeterminate`| `Indeterminate{D}` | `Indeterminate{D}` |

## 8.13 PolicyReference Evaluation

A policy reference is evaluated by resolving the reference and evaluating the referenced policy.

Resolving a reference means selecting, from the set of policies that the PDP evaluates requests against — represented conceptually by the `Policy` property of the `BundleType` object that defines the PDP ([Section 7.46](#746-bundletype), [Section 8.15](#815-authorization-decision)) — the policy whose `PolicyId` equals the reference's `Id` property (compared as specified in [Section 8.18](#818-identifier-equality)) and whose `Version` satisfies the reference's version-matching expression if one is present ([Section 7.10](#710-patternmatchidreferencetype)). This applies to every policy reference that appears within the `CombinerInput` of another policy. The entry-point reference — a `BundleType` object's own `PolicyReference` property — MUST resolve to a policy in that set ([Section 7.46](#746-bundletype)). For any other reference, if no policy in that set matches and the `Id` property is a URL, then the reference MAY instead be resolved by retrieving the policy from that URL; the retrieved policy's `PolicyId` and `Version` MUST satisfy the same matching requirements.

If resolving the reference fails, the reference evaluates to `Indeterminate` with status code: <!--Newline to fit on PDF page -->
`urn:oasis:names:tc:acal:1.0:status:processing-error`.

If a PDP is provided with policies from distinct sources which might not be fully trusted, it is RECOMMENDED that distinct policy issuers or sources are assigned distinct namespaces for policy identifiers ([Section 10.2.5](#1025-policy-identifiers)).

A policy reference containing circular references is invalid. The PDP MUST detect circular references either at policy loading time or during runtime evaluation. If the PDP detects a circular reference during runtime the reference evaluates to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.

## 8.14 Hierarchical Resources

It is often the case that a resource is organized as a hierarchy (e.g., file system, XML document). ACAL provides several optional mechanisms for supporting hierarchical resources. These are described in the ACAL Hierarchical Resource Profile [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)] and in the ACAL Multiple Decision Profile [[ACAL-Multiple-1.0](#acal-multiple-10)].

## 8.15 Authorization Decision

In relation to a particular decision request, the PDP is defined by a set of policies, a set of shared variable definitions, sets of short identifiers and a policy reference that specifies the starting point for evaluating the request. Conceptually, these items can be collected together as a single `BundleType` object, although an implementation is free to represent and organize this information in any way it chooses as long as it produces the same result as is specified here.

The PDP SHALL return a response context as if it had evaluated the policy reference in the manner specified in [Section 7](#7-structures) and [Section 8](#8-functional-requirements). The PDP MUST return a response context, with one `Decision` property of value `Permit`, `Deny`, `Indeterminate` or `NotApplicable`.

If the PDP cannot make a decision, then an `Indeterminate` `Decision` property SHALL be returned.

## 8.16 Notices

A rule or policy may contain one or more notice expressions. When such a rule or policy is evaluated, the notice expression SHALL be evaluated to a notice, which SHALL be passed up to the next level of evaluation (the enclosing or referencing policy or authorization decision) only if the result of the rule or policy being evaluated matches the value of the `AppliesTo` property of the notice (or matches either `Permit` or `Deny` if the `AppliesTo` property is absent) and the notice expression does not have a condition or it has a condition that evaluates to `true`. If the condition in a notice expression with a matching `AppliesTo` property evaluates to `Indeterminate`, then the whole rule or policy SHALL be `Indeterminate`. If the condition is absent or evaluates to `true` and any of the attribute assignment expressions in the notice expression evaluates to `Indeterminate`, then the whole rule or policy SHALL be `Indeterminate`. If the `AppliesTo` property is present and does not match the result of the combining algorithm or the rule evaluation, then any `Indeterminate` evaluation in a notice expression has no effect.

As a consequence of this procedure, notices SHALL NOT be returned to the PEP if the rules or policies from which they are drawn are not evaluated, or if their evaluated result is `Indeterminate` or `NotApplicable`, or if the decision resulting from evaluating the rule or policy does not match the decision resulting from evaluating an enclosing policy, or if the notice expression has a condition that evaluates to `false`.

If the PDP's evaluation is viewed as a tree of rules and policies, each of which returns `Permit` or `Deny`, then the collection of notices returned by the PDP to the PEP will include only the notices associated with those paths where the result at each level of evaluation is the same as the result being returned by the PDP. In situations where any lack of determinism is unacceptable, a deterministic combining algorithm, such as `ordered-deny-overrides`, SHOULD be used.

Also see [Section 8.2](#82-policy-enforcement-point).

## 8.17 Exception Handling

ACAL specifies behavior for the PDP in the following situations.

### 8.17.1 Unsupported Functionality

If the PDP attempts to evaluate a policy that contains an optional object type or function that the PDP does not support, then the PDP SHALL return a `DecisionType` value of `Indeterminate`. If a `StatusCodeType` object is also returned, then its Value property SHALL be `urn:oasis:names:tc:acal:1.0:status:syntax-error` in the case of an unsupported object type, and `urn:oasis:names:tc:acal:1.0:status:processing-error` in the case of an unsupported function. A policy that contains an `integer` literal outside the implementation's supported integer interval is treated as [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) specifies: the result of that policy is `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error` whenever the PDP evaluates the policy, whether or not evaluation reaches the literal, as for an unsupported function.

### 8.17.2 Syntax and Type Errors

If a policy that contains invalid syntax is evaluated by the ACAL PDP at the time a decision request is received, then the result of that policy SHALL be `Indeterminate` with a status code of `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

If a policy that contains invalid static data types is evaluated by the ACAL PDP at the time a decision request is received, then the result of that policy SHALL be `Indeterminate` with a status code of `urn:oasis:names:tc:acal:1.0:status:processing-error`.

### 8.17.3 Missing Attributes

The absence of matching attributes in the request context for any of the attribute designators, entity attribute designators, attribute selectors or entity attribute selectors that are found in the policy potentially results in the policy evaluating to `Indeterminate`, if the designator or selector has the `MustBePresent` property set to `true`, as described in [Section 7.17](#717-namedattributedesignatortype) and [Section 7.20](#720-baseattributeselectortype-optional) and potentially results in a `Decision` property containing the `Indeterminate` value. In this case, if a status code is supplied, then the value

`urn:oasis:names:tc:acal:1.0:status:missing-attribute`

SHALL be used, to indicate that more information is needed in order for a definitive decision to be rendered. In this case, the `StatusType` object MAY list the names and data types of any attributes that are needed by the PDP to refine its decision (see [Section 7.43](#743-missingattributedetailtype)). A PEP MAY resubmit a refined request context in response to a `Decision` property value of `Indeterminate` with a status code of

`urn:oasis:names:tc:acal:1.0:status:missing-attribute`

by adding attribute values for the attribute names that were listed in the previous response. When the PDP returns a `Decision` property value of `Indeterminate`, with a status code of

`urn:oasis:names:tc:acal:1.0:status:missing-attribute`,

it MUST NOT list the names and data types of any attribute for which values were supplied in the original request. Note, this requirement forces the PDP to eventually return an authorization decision of `Permit`, `Deny`, or `Indeterminate` with some other status code, in response to successively-refined requests.

## 8.18 Identifier Equality

ACAL makes use of URIs and strings as identifiers. When such identifiers are compared for equality, the comparison MUST be done so that the identifiers are equal if they have the same length and the characters in the two identifiers are equal codepoint by codepoint.

Values of the `IdentifierType` simple type may use short identifiers names as aliases for URIs. Where it is necessary to determine identifier equality, values of the `IdentifierType` simple type MUST first be evaluated according to [Section 8.3](#83-identifier-evaluation) and then the comparison SHALL be performed using the resulting URI. This applies to all instances of `IdentifierType`.

This definition of equality MUST also be used by the following URI identifiers (that are not instances of `IdentifierType`):

* the `PolicyId` property in a `PolicyType` object,

* the `Id` property in a `SharedVariableDefinitionType` object and

* the `Id` property in an `IdReferenceType` object.

The following is a list of the string identifiers that MUST use this definition of equality:

* the `Issuer` property in a `NamedAttributeDesignatorType` object,

* the `Issuer` property in a `MissingAttributeDetailType` object,

* the `Issuer` property in an `AttributeType` object,

* the `Issuer` property in an `AttributeAssignmentExpressionType` object,

* the `Id` property in a `RuleType` object,

* the `VariableId` property in a `VariableDefinitionType` object and

* the `VariableId` property in a `VariableReferenceType` object.

It is RECOMMENDED that extensions to ACAL use the same definition of identifier equality for similar identifiers.

It is RECOMMENDED that extensions which define identifiers do not define identifiers which could be easily misinterpreted by people as being subject to other kind of processing, such as URL character escaping, before matching.

## 8.19 Short Identifiers in Responses

A `ResponseType` object may contain references to short identifier sets, and short identifier names from those sets may be used within the response. The PDP can freely choose what short identifier sets it uses in the response, if any. There are two cases that require special care.

ACAL attributes in the request that have the `IncludeInResult` property set to `true` are duplicated in the response. If those attributes contain short identifier names, then those short identifier names are interpreted with respect to the short identifier sets referenced by the request, which may be different from the short identifier sets chosen by the PDP for the response.

Notices in the response originate from notice expressions in policies. If those notice expressions contain short identifier names, then those short identifier names are interpreted with respect to the short identifier sets referenced by the policies, which may also be different from the short identifier sets chosen by the PDP for the response.

The PDP is responsible for ensuring that any short identifier names in the response reflect the correct URI when they are evaluated according to [Section 8.3](#83-identifier-evaluation) in the presence of the short identifier sets it has chosen. An implementation strategy for achieving this is for the PDP and context handler to evaluate any `IdentifierType` values as they are encountered and store them in internal memory as absolute URIs. Then when the response is composed the absolute URIs can be replaced by appropriate short identifier names from the short identifier sets chosen by the PDP.

If the PDP chooses the same short identifier sets referenced by the request, then it has the advantage that they are sets known by the PEP and any attributes included in the result are more likely to have their original short identifier names restored.


---


# 9 ACAL Extensibility Points (non-normative)

This section describes the points within the ACAL model and schema where extensions can be added.

## 9.1 Extensible Properties

The following `IdentifierType` properties have values that evaluate to URIs. They may be extended by the creation of new URIs associated with new semantics. \
`Category`, \
`AttributeId`, \
`DataType`, \
`FunctionId` and the `Id` property of `FunctionType`, \
the `Id` property of `NoticeType` and `NoticeExpressionType`, \
`CombiningAlgId`, \
`StatusCode`.

See [Section 7](#7-structures) for definitions of these properties.

## 9.2 Structured Attributes

_This section needs a major rewrite to de-emphasize XML and incorporate the entity data type._

A `ValueType` object MAY contain an instance of a structured XML data type. [Section 8.4.1](#841-structured-attributes) describes a number of standard techniques to identify data items within such a structured attribute. Listed here are some additional techniques that require ACAL extensions.

1. For a given structured data type, a community of ACAL users MAY define new attribute identifiers for each leaf sub-element of the structured data type that has a type conformant with one of the ACAL-defined data types. Using these new attribute identifiers, the PEPs or context handlers used by that community of users can flatten instances of the structured data type into a sequence of individual `AttributeType` objects. Each such `AttributeType` object can be compared using the ACAL-defined functions. Using this method, the structured data type itself never appears in a `ValueType` object.

2. A community of ACAL users MAY define a new function that can be used to compare a value of the structured data type against some other value. This method may only be used by PDPs that support the new function.


---


# 10 Safety, Security, and Data Protection Considerations


This section identifies possible security and privacy compromise scenarios that should be considered when implementing an ACAL-based system. The section is informative only. It is left to the implementer to decide whether these compromise scenarios are practical in their environment and to select appropriate safeguards.

## 10.1 Threat Model

We assume here that the adversary has access to the communication channel between the ACAL actors and is able to interpret, insert, delete, and modify messages or parts of messages.

Additionally, an actor may use information from a former message maliciously in subsequent transactions. It is further assumed that rules and policies are only as reliable as the actors that create and use them. Thus it is incumbent on each actor to establish appropriate trust in the other actors upon which it relies. Mechanisms for trust establishment are outside the scope of this specification.

The messages that are transmitted between the actors in the ACAL model are susceptible to attack by malicious third parties. Other points of vulnerability include the PEP, the PDP, and the PAP. While some of these entities are not strictly within the scope of this specification, their compromise could lead to the compromise of access control enforced by the PEP.

It should be noted that there are other components of a distributed system that may be compromised, such as an operating system and the domain-name system (DNS) that are outside the scope of this discussion of threat models. Compromise in these components may also lead to a policy violation.

The following sections detail specific compromise scenarios that may be relevant to an ACAL system.

### 10.1.1 Unauthorized Disclosure

ACAL does not specify any inherent mechanisms to protect the confidentiality of the messages exchanged between actors. Therefore, an adversary could observe the messages in transit. Under certain security policies, disclosure of this information is a violation. Disclosure of attributes or the types of decision requests that a subject submits may be a breach of privacy policy. In the commercial sector, the consequences of unauthorized disclosure of personal data may range from embarrassment to the custodian, to imprisonment and/or large fines in the case of medical or financial data.

Unauthorized disclosure is addressed by confidentiality safeguards.

### 10.1.2 Message Replay

A message replay attack is one in which the adversary records and replays legitimate messages between ACAL actors. This attack may lead to denial of service, the use of out-of-date information or impersonation.

Prevention of replay attacks requires the use of message freshness safeguards.

Note that encryption of the message does not mitigate a replay attack since the message is simply replayed and does not have to be understood by the adversary.

### 10.1.3 Message Insertion

A message insertion attack is one in which the adversary inserts messages in the sequence of messages between ACAL actors.

The solution to a message insertion attack is to use mutual authentication and message sequence integrity safeguards between the actors. It should be noted that just using SSL mutual authentication is not sufficient. This only proves that the other party is the one identified by the subject of the X.509 certificate. In order to be effective, it is necessary to confirm that the certificate subject is authorized to send the message.

### 10.1.4 Message Deletion

A message deletion attack is one in which the adversary deletes messages in the sequence of messages between ACAL actors. Message deletion may lead to denial of service. However, a properly designed ACAL system should not render an incorrect authorization decision as a result of a message deletion attack.

The solution to a message deletion attack is to use message sequence integrity safeguards between the actors.

### 10.1.5 Message Modification

If an adversary can intercept a message and change its contents, then they may be able to alter an authorization decision. A message integrity safeguard can prevent a successful message modification attack.

### 10.1.6 NotApplicable Results

A result of `NotApplicable` means that the PDP could not locate a policy whose target matched the information in the decision request. In general, it is highly recommended that a `Deny` effect policy be used, so that when a PDP would have returned `NotApplicable`, a result of `Deny` is returned instead.

In some security models, however, such as those found in many web servers, an authorization decision of `NotApplicable` is treated as equivalent to `Permit`. There are particular security considerations that must be taken into account for this to be safe. These are explained in the following paragraphs.

If `NotApplicable` is to be treated as `Permit`, it is vital that the matching algorithms used by the policy to match attributes in the decision request be closely aligned with the data syntax used by the applications that will be submitting the decision request. A failure to match will result in `NotApplicable` and be treated as `Permit`. So an unintended failure to match may allow unintended access.

Commercial http responders allow a variety of syntaxes to be treated equivalently. The `%` can be used to represent characters by hex value. The URL path `/../` provides multiple ways of specifying the same value. Multiple character sets may be permitted and, in some cases, the same printed character can be represented by different binary values. Unless the matching algorithm used by the policy is sophisticated enough to catch these variations, unintended access may be permitted.

It may be safe to treat `NotApplicable` as `Permit` only in a closed environment where all applications that formulate a decision request can be guaranteed to use the exact syntax expected by the policies. In a more open environment, where decision requests may be received from applications that use any legal syntax, it is strongly recommended that `NotApplicable` NOT be treated as `Permit` unless matching rules have been very carefully designed to match all possible applicable inputs, regardless of syntax or type variations. Note, however, that according to [Section 8.2](#82-policy-enforcement-point), a PEP must deny access unless it receives an explicit `Permit` authorization decision.

### 10.1.7 Negative Rules

A negative rule is one that is based on a predicate not being `true`. If not used with care, negative rules can lead to policy violations, therefore some authorities recommend that they not be used. However, negative rules can be extremely efficient in certain cases, so ACAL has chosen to include them. Nevertheless, it is recommended that they be used with care and avoided if possible.

A common use for negative rules is to deny access to an individual or subgroup when their membership in a larger group would otherwise permit them access. For example, we might want to write a rule that allows all vice presidents to see the unpublished financial data, except for Joe, who is only a ceremonial vice president and can be indiscreet in his communications. If we have complete control over the administration of subject attributes, a superior approach would be to define `Vice President` and `Ceremonial Vice President` as distinct groups and then define rules accordingly. However, in some environments this approach may not be feasible. (It is worth noting in passing that referring to individuals in rules does not scale well. Generally, shared attributes are preferred.)

If not used with care, negative rules can lead to policy violations in two common cases: when attributes are suppressed and when the base group changes. An example of suppressed attributes would be if we have a policy that access should be permitted, unless the subject is a credit risk. If it is possible that the attribute of being a credit risk may be unknown to the PDP for some reason, then unauthorized access may result. In some environments, the subject may be able to suppress the publication of attributes by the application of privacy controls, or the server or repository that contains the information may be unavailable for accidental or intentional reasons.

An example of a changing base group would be if there is a policy that everyone in the engineering department may change software source code, except for secretaries. Suppose now that the department was to merge with another engineering department and the intent is to maintain the same policy. However, the new department also includes individuals identified as administrative assistants, who ought to be treated in the same way as secretaries. Unless the policy is altered, they will unintentionally be permitted to change software source code. Problems of this type are easy to avoid when one individual administers all policies, but when administration is distributed, as ACAL allows, this type of situation must be explicitly guarded against.

### 10.1.8 Denial of Service

A denial of service attack is one in which the adversary overloads an ACAL actor with excessive computations or network traffic such that legitimate users cannot access the services provided by the actor.

The `urn:oasis:names:tc:acal:1.0:function:access-permitted` function may lead to hard to predict behavior in the PDP. It is possible that the function is invoked during the recursive invocations of the PDP such that loops are formed. Such loops may in some cases lead to large numbers of requests to be generated before the PDP can detect the loop and abort evaluation. Such loops could cause a denial of service at the PDP, either because of a malicious policy or because of a mistake in a policy.

Processing `integer` values can also be used for a denial of service. Parsing, converting and computing with `integer` values, including in Profile-defined expressions such as XPath expressions, can consume excessive resources even on an implementation whose supported integer interval is bounded, for example through very long lexical representations, large bags, or functions applied to many arguments; an implementation that imposes no predetermined bound on integer magnitude ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)) is also exposed to values of very large magnitude. Implementations and deployments are therefore advised to apply input acceptance limits, for example to the size of a request and to the length of the lexical representation of a number or a string, at the parser, at a gateway in front of the PDP, or in the PDP itself; for JSON, [[RFC8259](#rfc8259)] Section 9 allows a parser to set limits on the size of texts and on the range and precision of numbers. A request that exceeds such a limit can be refused before any policy is evaluated ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)). When an evaluation exhausts an execution resource, [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) specifies its result: `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`, with no altered value.

### 10.1.9 Implementation-Defined Integer Limits

An ACAL implementation may support only a documented interval of `integer` values ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)), and different conforming PDPs may support different intervals. When an evaluation requires an `integer` value outside the implementation's interval, the evaluation returns `Indeterminate` rather than an altered value. Two PDPs therefore do not return different integer values for the same computation, but one of them may return `Indeterminate` where the other returns a value. Implementations and deployments may also apply input acceptance limits, and an implementation may refuse, before evaluation, a request that contains an `integer` value outside its interval or that exceeds such a limit.

Every conforming PDP supports the integers from −2<sup>63</sup> to 2<sup>63</sup>−1. When every ACAL `integer` literal contained in the evaluated policy, and every other `integer` value that the evaluation requires, is in that range (including attribute values, values produced by attribute selectors, function arguments and results, and each operand and result of an operator or function evaluated as part of a Profile-defined expression such as an XPath expression), the input acceptance limits that apply admit each value, and each value reaches the PDP exactly, integer magnitude does not cause conforming PDPs to differ. In the JSON representation of ACAL (JACAL), JSON software outside ACAL that represents every JSON number as a binary64 floating-point value can change an integer outside the range −(2<sup>53</sup>−1) to 2<sup>53</sup>−1 before an ACAL implementation receives it, and writing such an integer in the typed string form avoids this; in the YAML representation (YACAL) the typed form is needed wherever a YAML processor would not preserve an integer scalar. This covers only differences due to integer magnitude, not differences that arise from other implementation-defined behavior or from exhaustion of an execution resource. Deployments that want a portable subset of requests across conforming PDPs are advised to provide at least one request representation whose input acceptance limits admit the canonical decimal representation of every integer from −2<sup>63</sup> to 2<sup>63</sup>−1. A deployment can use narrower documented input acceptance limits where its safety, security, hardware or operational constraints require them.

Outside that range, whether an evaluation succeeds can depend on the request. An ACAL `integer` literal that a PDP does not support makes every evaluation of the containing policy `Indeterminate`, so testing the policy on that PDP exposes it, as it would expose an unsupported function ([Section 8.17.1](#8171-unsupported-functionality)). An out-of-range value that comes from the request, whether directly as an attribute value, through an attribute selector, or through a conversion or arithmetic applied to request values, makes an evaluation `Indeterminate` only for the requests whose data causes that value to be required. Testing a policy therefore does not establish that no request will reach a PDP's limit. An implementation that refuses, before evaluation, every request containing an `integer` value outside its interval makes this a property of the request alone, independent of the policy, which can be tested directly. A request attribute that exceeds a deployment's input acceptance limits is not evaluated by that deployment, even when the PDP behind it supports the value.

A refused request is not processed by any combining algorithm. If the PDP returns `Indeterminate` for a refused request, the outcome depends on the PEP ([Section 8.2](#82-policy-enforcement-point)): a deny-biased PEP denies access, a permit-biased PEP permits access, and the behavior of a base PEP is undefined. If no ACAL decision is returned, the outcome is outside this specification. By contrast, an `Indeterminate` produced during evaluation, including one caused by an input acceptance limit reached while an attribute value is retrieved, is combined like any other result.

A change in the supported interval, in either direction, can change an authorization decision, including from `Deny` to `Permit`. Consider a rule with effect `Deny` that evaluates to `Indeterminate` on a PDP with a smaller interval, because its condition requires a value outside that interval, but evaluates to `Deny` on a PDP with a larger interval. A policy that directly combines that rule using `permit-unless-deny` ([Annex E.7](#e7-permit-unless-deny)) returns `Permit` on the smaller-interval PDP unless another child evaluates to `Deny`, and returns `Deny` on the larger-interval PDP. Conversely, consider a rule with effect `Permit` that evaluates to `Indeterminate` on the smaller-interval PDP for that reason but evaluates to `Permit` on the larger-interval PDP. A policy that directly combines that rule using `deny-unless-permit` ([Annex E.6](#e6-deny-unless-permit)) returns `Deny` on the smaller-interval PDP unless another child evaluates to `Permit`, and returns `Permit` on the larger-interval PDP.

When an integer error causes a rule that is a child of a `permit-unless-deny` policy to evaluate to `Indeterminate` where the rule would otherwise have evaluated to `Deny`, the rule does not deny access, and the policy returns `Permit` unless another child evaluates to `Deny`. Policy authors are therefore advised not to use `permit-unless-deny` where access has to be denied when a `Deny` rule cannot be evaluated because of an integer error, and to take particular care where the integer values come from the request. Before policies are moved to another PDP, or are evaluated by PDPs with different supported intervals or input acceptance limits, it is recommended that the documented intervals, limits and refusal behavior be compared, and that the policies be tested with integer values at and beyond the bounds of the smaller interval.

## 10.2 Safeguards

### 10.2.1 Authentication

Authentication provides the means for one party in a transaction to determine the identity of the other party in the transaction. Authentication may be in one direction, or it may be bilateral.

Given the sensitive nature of access control systems, it is important for a PEP to authenticate the identity of the PDP to which it sends decision requests. Otherwise, there is a risk that an adversary could provide false or invalid authorization decisions, leading to a policy violation.

It is equally important for a PDP to authenticate the identity of the PEP and assess the level of trust to determine what, if any, sensitive data should be passed. One should keep in mind that even simple `Permit` or `Deny` responses could be exploited if an adversary were allowed to make unlimited requests to a PDP.

Many different techniques may be used to provide authentication, such as co-located code, a private network, a VPN, or digital signatures. Authentication may also be performed as part of the communication protocol used to exchange the contexts. In this case, authentication may be performed either at the message level or at the session level.

### 10.2.2 Policy Administration

If the contents of policies are exposed outside of the access control system, potential subjects may use this information to determine how to gain unauthorized access.

To prevent this threat, the repository used for the storage of policies may itself require access control. In addition, the `StatusType` object should be used to return values of missing attributes only when exposure of the identities of those attributes will not compromise security.

### 10.2.3 Confidentiality

Confidentiality mechanisms ensure that the contents of a message can be read only by the desired recipients and not by anyone else who encounters the message while it is in transit. There are two areas in which confidentiality should be considered: one is confidentiality during transmission; the other is confidentiality within a policy.

#### 10.2.3.1 Communication Confidentiality

In some environments it is deemed good practice to treat all data within an access control system as confidential. In other environments, policies may be made freely available for distribution, inspection, and audit. The idea behind keeping policy information secret is to make it more difficult for an adversary to know what steps might be sufficient to obtain unauthorized access. Regardless of the approach chosen, the security of the access control system should not depend on the secrecy of the policy.

Any security considerations related to transmitting or exchanging ACAL policies are outside the scope of the ACAL standard. While it is important to ensure that the integrity and confidentiality of policies is maintained when they are exchanged between two parties, it is left to the implementers to determine the appropriate mechanisms for their environment.

Communications confidentiality can be provided by a confidentiality mechanism, such as SSL. Using a point-to-point scheme like SSL may lead to other vulnerabilities when one of the end-points is compromised.

#### 10.2.3.2 Statement Level Confidentiality

In some cases, an implementation may want to encrypt only parts of an ACAL policy.

The particular policy encryption mechanism and syntax for encrypted policy or policy parts will be described by the ACAL Representation Profiles (e.g. W3C XML Encryption standard for XACML - XML Representation Profile).

It should go without saying that if a repository is used to facilitate the communication of cleartext (i.e., unencrypted) policy between the PAP and PDP, then a secure repository should be used to store this sensitive data.

### 10.2.4 Policy Integrity

ACAL policies used by the PDP to evaluate the request context are the heart of the system. Therefore, maintaining their integrity is essential. There are two aspects to maintaining the integrity of the policies. One is to ensure that the policies have not been altered since they were originally created by the PAP. The other is to ensure that policies have not been inserted or deleted from the set of policies.

In many cases, both aspects can be achieved by ensuring the integrity of the actors and implementing session-level mechanisms to secure the communication between actors. The selection of the appropriate mechanisms is left to the implementers. However, when policy is distributed between organizations to be acted on at a later time, or when the policy travels with the protected resource, it would be useful to sign the policy. 

The particular policy signature mechanism and syntax for signed policy or policy parts will be described by the ACAL Representation Profiles (W3C XML Signature Syntax and Processing standard [[DS](#ds)] for XACML - XML Representation Profile).

Digital signatures should only be used to ensure the integrity of the statements. Digital signatures should not be used as a method of selecting or evaluating policy. That is, the PDP should not request a policy based on who signed it or whether or not it has been signed (as such a basis for selection would, itself, be a matter of policy). However, the PDP must verify that the key used to sign the policy is one controlled by the purported issuer of the policy. The means to do this are dependent on the specific signature technology chosen and are outside the scope of this document.

### 10.2.5 Policy Identifiers

Since policies can be referenced by their identifiers, it is the responsibility of the PAP to ensure that these are unique. Confusion between identifiers could lead to misidentification of the applicable policy. This specification is silent on whether a PAP must generate a new identifier when a policy is modified or may use the same identifier in the modified policy. This is a matter of administrative practice. However, care must be taken in either case. If the identifier is reused, there is a danger that other policies that reference it may be adversely affected. Conversely, if a new identifier is used, these other policies may continue to use the prior policy, unless it is deleted. In either case the results may not be what the policy administrator intends.

If a PDP is provided with policies from distinct sources which might not be fully trusted, as in the use of the administration profile [[XACMLAdmin](#xacmladmin)], there is a concern that someone could intentionally publish a policy with an id which collides with another policy. This could cause policy references that point to the wrong policy, and may cause other unintended consequences in an implementation which is predicated upon having unique policy identifiers.

If this issue is a concern, distinct policy issuers or sources can be assigned distinct namespaces for policy identifiers, as [Section 8.13](#813-policyreference-evaluation) recommends. One method is to make sure that the policy identifier begins with a string which has been assigned to the particular policy issuer or source. The remainder of the policy identifier is an issuer-specific unique part. For instance, Alice from Example Inc. could be assigned the policy identifiers which begin with `https://example.com/xacml/policyId/alice/`. The PDP or another trusted component can then verify that the authenticated source of the policy is Alice at Example Inc, or otherwise reject the policy. Anyone else will be unable to publish policies with identifiers which collide with the policies of Alice.

### 10.2.6 Trust Model

Discussions of authentication, integrity and confidentiality safeguards necessarily assume an underlying trust model: how can one actor come to believe that a given key is uniquely associated with a specific, identified actor so that the key can be used to encrypt data for that actor or verify signatures (or other integrity structures) from that actor? Many different types of trust models exist, including strict hierarchies, distributed authorities, the Web, the bridge, and so on.

It is worth considering the relationships between the various actors of the access control system in terms of the interdependencies that do and do not exist.

* None of the entities of the authorization system are dependent on the PEP. They may collect data from it, (for example authentication data) but are responsible for verifying it themselves.

* The correct operation of the system depends on the ability of the PEP to actually enforce policy decisions.

* The PEP depends on the PDP to correctly evaluate policies. This in turn implies that the PDP is supplied with the correct inputs. Other than that, the PDP does not depend on the PEP.

* The PDP depends on the PAP to supply appropriate policies. The PAP is not dependent on other components.

### 10.2.7 Privacy

It is important to be aware that any transactions that occur with respect to access control may reveal private information about the actors. For example, if an ACAL policy states that certain data may only be read by subjects with `Gold Card Member` status, then any transaction in which a subject is permitted access to that data leaks information to an adversary about the subject's status. Privacy considerations may therefore lead to encryption and/or to access control requirements surrounding the enforcement of ACAL policy instances themselves: confidentiality-protected channels for the request/response protocol messages, protection of subject attributes in storage and in transit, and so on.

Selection and use of privacy mechanisms appropriate to a given environment are outside the scope of ACAL. The decision regarding whether, how, and when to deploy such mechanisms is left to the implementers associated with the environment.

## 10.3 Unicode Security Issues

There are many security considerations related to use of Unicode. [Section 8.1.2](#812-version-of-unicode) recommends that an ACAL implementation follow the advice given in the relevant version of [[UTR36](#utr36)].

## 10.4 Identifier Equality

[Section 8.18](#818-identifier-equality) defines the identifier equality operation for ACAL. This definition of equality does not do any kind of canonicalization or escaping of characters. The identifiers defined in the ACAL specification have been selected to not include any ambiguity regarding these aspects. [Section 8.18](#818-identifier-equality) recommends that identifiers defined by extensions also do not introduce any identifiers which might be mistaken for being subject to processing, like for instance URL character encoding using `%`.


---


# 11 Conformance


## 11.1 Introduction

The ACAL specification addresses the following aspect of conformance:

The ACAL specification defines a number of functions, etc. that have somewhat special applications, therefore they are not required to be implemented in an implementation that claims to conform to this specification.

## 11.2 Conformance Tables

This section lists those portions of the specification that MUST be included in an implementation of a PDP that claims to conform to ACAL 1.0. 

: Note: "M" means mandatory-to-implement. "O" means optional.

The implementation MUST follow [Section 7](#7-structures), [Section 8](#8-functional-requirements), [Annex C](#annex-c-data-types-and-functions), [Annex D](#annex-d-acal-identifiers) and [Annex E](#annex-e-combining-algorithms) where they apply to implemented items in the following tables.

Many of these items are associated with versions of XACML preceding ACAL but have been assigned new identifiers with the `urn:oasis:names:tc:acal:1.0:` prefix. The older XACML identifiers have been listed in the tables as deprecated identifiers. Implementations MUST support a new identifier defined in this specification but MAY recognize the corresponding deprecated identifier as equivalent. It is RECOMMENDED that these deprecated identifiers not be used in new policies and requests; they are planned to be removed in a subsequent version of ACAL. Note that some items appear to be carried over from a preceding version of XACML but do not list the XACML identifier. This is because ACAL has redefined the item in some way that means it is no longer identical to the original definition in XACML, and so the identifiers can no longer be considered equivalent. Items new to ACAL 1.0 will also not list an XACML identifier.

### 11.2.1 Object Types

The implementation MUST support the object types that are marked `M`. Abstract types are not listed; they cannot appear directly in ACAL documents and have no independent conformance requirement.

| Object Type | M/O | Properties of the Type |
| :--- | :--- | :--- |
| ApplyType | M | Apply |
| AttributeAssignmentExpressionType | M | AttributeAssignmentExpression |
| AttributeAssignmentType | M | AttributeAssignment |
| AttributeDesignatorType | M | AttributeDesignator |
| AttributeSelectorType | O | AttributeSelector |
| AttributeType | M | Attribute |
| BooleanExpressionType | M | Condition, Target |
| BundleType | O | Bundle |
| ContentType | O | Content |
| EntityAttributeDesignatorType | M | EntityAttributeDesignator |
| EntityAttributeSelectorType | O | EntityAttributeSelector |
| EntityType | M | PolicyIssuer |
| ExactMatchIdReferenceType | O | ApplicablePolicyReference |
| FunctionType | M | Function |
| MissingAttributeDetailType | M | MissingAttributeDetail |
| MultiRequestsType | O | MultiRequests |
| NamedArgumentType | O | |
| NoticeExpressionType | M | NoticeExpression |
| NoticeType | M | Notice |
| PatternMatchIdReferenceType | M | |
| PolicyDefaultsType | O | PolicyDefaults |
| ParameterType | M | Parameter |
| PolicyReferenceType | M | PolicyReference |
| PolicyType | M | Policy |
| QuantifiedExpressionType | O | ForAll, ForAny, Map, Select |
| RequestAttributeType | M | RequestAttribute |
| RequestDefaultsType | O | RequestDefaults |
| RequestEntityType | M | RequestEntity |
| RequestReferenceType | O | RequestReference |
| RequestType | M | Request |
| ResponseType | M | Response |
| ResultEntityType | M | ResultEntity |
| ResultType | M | Result |
| RuleType | M | Rule |
| SharedVariableDefinitionType | O | SharedVariableDefinition |
| SharedVariableReferenceType | O | SharedVariableReference |
| ShortIdSetType | M | ShortIdSet |
| ShortIdType | M | ShortId |
| StatusType | M | Status |
| StatusCodeType | M | StatusCode |
| StatusDetailType | O | StatusDetail |
| ValueType | M | Value |
| VariableDefinitionType | M | VariableDefinition |
| VariableReferenceType | M | VariableReference |

### 11.2.2 Identifier Prefixes

The following identifier prefixes are reserved by ACAL.

| Prefix |
| :--- |
| urn:oasis:names:tc:acal:1.0 |
| urn:oasis:names:tc:xacml:4.0 |
| urn:oasis:names:tc:xacml:3.0 |
| urn:oasis:names:tc:xacml:2.0 |
| urn:oasis:names:tc:xacml:1.0 |

### 11.2.3 Algorithms

The implementation MUST include the combining algorithms associated with the following identifiers that are marked `M`

| Algorithm | M/O |
| :--- | :--- |
| urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-overrides | M |
| urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides | M |
| urn:oasis:names:tc:acal:1.0:combining-algorithm:first-applicable | M |
| urn:oasis:names:tc:acal:1.0:combining-algorithm:ordered-deny-overrides | M |
| urn:oasis:names:tc:acal:1.0:combining-algorithm:ordered-permit-overrides | M |
| urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit | M |
| urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-unless-deny | M |

### 11.2.4 Status Codes

Implementation support for the `StatusCodeType` object is optional, but if the object is supported, then the following status codes MUST be supported and MUST be used in the way ACAL has specified.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:status:missing-attribute | M | urn:oasis:names:tc:xacml:1.0:status:missing-attribute |
| urn:oasis:names:tc:acal:1.0:status:ok | M | urn:oasis:names:tc:xacml:1.0:status:ok |
| urn:oasis:names:tc:acal:1.0:status:processing-error | M | urn:oasis:names:tc:xacml:1.0:status:processing-error |
| urn:oasis:names:tc:acal:1.0:status:syntax-error | M | urn:oasis:names:tc:xacml:1.0:status:syntax-error |

### 11.2.5 Environment Attributes

The implementation MUST support the attributes associated with the following identifiers as specified by ACAL. If values for these attributes are not present in the decision request, then their values MUST be supplied by the context handler. So, unlike most other attributes, their semantics are not transparent to the PDP.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:environment:current-time | M | urn:oasis:names:tc:xacml:1.0:environment:current-time |
| urn:oasis:names:tc:acal:1.0:environment:current-date | M | urn:oasis:names:tc:xacml:1.0:environment:current-date |
| urn:oasis:names:tc:acal:1.0:environment:current-dateTime | M | urn:oasis:names:tc:xacml:1.0:environment:current-dateTime |

### 11.2.6 Attributes and Categories

The implementation MUST use the attributes or attribute categories associated with the following identifiers in the way ACAL has defined. This requirement pertains primarily to implementations of a PAP or PEP that uses ACAL, since the semantics of the attributes are transparent to the PDP.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:subject:authn-locality:dns-name | O | urn:oasis:names:tc:xacml:1.0:subject:authn-locality:dns-name |
| urn:oasis:names:tc:acal:1.0:subject:authn-locality:ip-address | O | urn:oasis:names:tc:xacml:1.0:subject:authn-locality:ip-address |
| urn:oasis:names:tc:acal:1.0:subject:authentication-method | O | urn:oasis:names:tc:xacml:1.0:subject:authentication-method |
| urn:oasis:names:tc:acal:1.0:subject:authentication-time | O | urn:oasis:names:tc:xacml:1.0:subject:authentication-time |
| urn:oasis:names:tc:acal:1.0:subject:key-info | O | urn:oasis:names:tc:xacml:1.0:subject:key-info |
| urn:oasis:names:tc:acal:1.0:subject:request-time | O | urn:oasis:names:tc:xacml:1.0:subject:request-time |
| urn:oasis:names:tc:acal:1.0:subject:session-start-time | O | urn:oasis:names:tc:xacml:1.0:subject:session-start-time |
| urn:oasis:names:tc:acal:1.0:subject:subject-id | O | urn:oasis:names:tc:xacml:1.0:subject:subject-id |
| urn:oasis:names:tc:acal:1.0:subject:subject-id-qualifier | O | urn:oasis:names:tc:xacml:1.0:subject:subject-id-qualifier |
| urn:oasis:names:tc:acal:1.0:resource:resource-location | O | urn:oasis:names:tc:xacml:1.0:resource:resource-location |
| urn:oasis:names:tc:acal:1.0:resource:resource-id | M | urn:oasis:names:tc:xacml:1.0:resource:resource-id |
| urn:oasis:names:tc:acal:1.0:resource:simple-file-name | O | urn:oasis:names:tc:xacml:1.0:resource:simple-file-name |
| urn:oasis:names:tc:acal:1.0:resource:target-namespace | O | urn:oasis:names:tc:xacml:2.0:resource:target-namespace |
| urn:oasis:names:tc:acal:1.0:action:action-id | O | urn:oasis:names:tc:xacml:1.0:action:action-id |
| urn:oasis:names:tc:acal:1.0:action:action-namespace | O | urn:oasis:names:tc:xacml:1.0:action:action-namespace |
| urn:oasis:names:tc:acal:1.0:action:implied-action | O | urn:oasis:names:tc:xacml:1.0:action:implied-action |

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:subject-category:access-subject | M | urn:oasis:names:tc:xacml:1.0:subject-category:access-subject |
| urn:oasis:names:tc:acal:1.0:subject-category:codebase | O | urn:oasis:names:tc:xacml:1.0:subject-category:codebase |
| urn:oasis:names:tc:acal:1.0:subject-category:intermediary-subject | O | urn:oasis:names:tc:xacml:1.0:subject-category:intermediary-subject |
| urn:oasis:names:tc:acal:1.0:subject-category:recipient-subject | O | urn:oasis:names:tc:xacml:1.0:subject-category:recipient-subject |
| urn:oasis:names:tc:acal:1.0:subject-category:requesting-machine | O | urn:oasis:names:tc:xacml:1.0:subject-category:requesting-machine |

### 11.2.7 Data Types

The implementation MUST support the data types associated with the following identifiers marked `M`. Support for the `urn:oasis:names:tc:acal:1.0:data-type:integer` data type means support for the implementation's supported integer interval as [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) specifies, which need not be the whole value space.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:data-type:string | M | https://www.w3.org/2001/XMLSchema#string |
| urn:oasis:names:tc:acal:1.0:data-type:boolean | M | https://www.w3.org/2001/XMLSchema#boolean |
| urn:oasis:names:tc:acal:1.0:data-type:integer | M | https://www.w3.org/2001/XMLSchema#integer |
| urn:oasis:names:tc:acal:1.0:data-type:double | M | https://www.w3.org/2001/XMLSchema#double |
| urn:oasis:names:tc:acal:1.0:data-type:time | M | https://www.w3.org/2001/XMLSchema#time |
| urn:oasis:names:tc:acal:1.0:data-type:date | M | https://www.w3.org/2001/XMLSchema#date |
| urn:oasis:names:tc:acal:1.0:data-type:dateTime | M | https://www.w3.org/2001/XMLSchema#dateTime |
| urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration | M | https://www.w3.org/2001/XMLSchema#dayTimeDuration |
| urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration | M | https://www.w3.org/2001/XMLSchema#yearMonthDuration |
| urn:oasis:names:tc:acal:1.0:data-type:anyURI | M | https://www.w3.org/2001/XMLSchema#anyURI |
| urn:oasis:names:tc:acal:1.0:data-type:hexBinary | M | https://www.w3.org/2001/XMLSchema#hexBinary |
| urn:oasis:names:tc:acal:1.0:data-type:base64Binary | M | https://www.w3.org/2001/XMLSchema#base64Binary |
| urn:oasis:names:tc:acal:1.0:data-type:rfc822Name | M | urn:oasis:names:tc:xacml:1.0:data-type:rfc822Name |
| urn:oasis:names:tc:acal:1.0:data-type:x500Name | M | urn:oasis:names:tc:xacml:1.0:data-type:x500Name |
| urn:oasis:names:tc:acal:1.0:data-type:ipAddress | M | urn:oasis:names:tc:xacml:2.0:data-type:ipAddress |
| urn:oasis:names:tc:acal:1.0:data-type:dnsName | M | urn:oasis:names:tc:xacml:2.0:data-type:dnsName |
| urn:oasis:names:tc:acal:1.0:data-type:entity | M | urn:oasis:names:tc:xacml:3.0:data-type:entity |

### 11.2.8 Functions

The implementation MUST properly process those functions associated with the identifiers marked with an `M`.

| Function | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:function:string-equal | M | urn:oasis:names:tc:xacml:1.0:function:string-equal |
| urn:oasis:names:tc:acal:1.0:function:boolean-equal | M | urn:oasis:names:tc:xacml:1.0:function:boolean-equal |
| urn:oasis:names:tc:acal:1.0:function:integer-equal | M | urn:oasis:names:tc:xacml:1.0:function:integer-equal |
| urn:oasis:names:tc:acal:1.0:function:double-equal | M | urn:oasis:names:tc:xacml:1.0:function:double-equal |
| urn:oasis:names:tc:acal:1.0:function:date-equal | M | urn:oasis:names:tc:xacml:1.0:function:date-equal |
| urn:oasis:names:tc:acal:1.0:function:time-equal | M | urn:oasis:names:tc:xacml:1.0:function:time-equal |
| urn:oasis:names:tc:acal:1.0:function:dateTime-equal | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-equal |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-equal | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-equal |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-equal | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-equal |
| urn:oasis:names:tc:acal:1.0:function:string-equal-ignore-case | M | urn:oasis:names:tc:xacml:3.0:function:string-equal-ignore-case |
| urn:oasis:names:tc:acal:1.0:function:anyURI-equal | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-equal |
| urn:oasis:names:tc:acal:1.0:function:x500Name-equal | M | |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-equal | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-equal |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-equal | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-equal |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-equal | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-equal |
| urn:oasis:names:tc:acal:1.0:function:integer-add | M | urn:oasis:names:tc:xacml:1.0:function:integer-add |
| urn:oasis:names:tc:acal:1.0:function:double-add | M | urn:oasis:names:tc:xacml:1.0:function:double-add |
| urn:oasis:names:tc:acal:1.0:function:integer-subtract | M | urn:oasis:names:tc:xacml:1.0:function:integer-subtract |
| urn:oasis:names:tc:acal:1.0:function:double-subtract | M | urn:oasis:names:tc:xacml:1.0:function:double-subtract |
| urn:oasis:names:tc:acal:1.0:function:integer-multiply | M | urn:oasis:names:tc:xacml:1.0:function:integer-multiply |
| urn:oasis:names:tc:acal:1.0:function:double-multiply | M | urn:oasis:names:tc:xacml:1.0:function:double-multiply |
| urn:oasis:names:tc:acal:1.0:function:integer-divide | M | urn:oasis:names:tc:xacml:1.0:function:integer-divide |
| urn:oasis:names:tc:acal:1.0:function:double-divide | M | urn:oasis:names:tc:xacml:1.0:function:double-divide |
| urn:oasis:names:tc:acal:1.0:function:integer-mod | M | urn:oasis:names:tc:xacml:1.0:function:integer-mod |
| urn:oasis:names:tc:acal:1.0:function:integer-abs | M | urn:oasis:names:tc:xacml:1.0:function:integer-abs |
| urn:oasis:names:tc:acal:1.0:function:double-abs | M | urn:oasis:names:tc:xacml:1.0:function:double-abs |
| urn:oasis:names:tc:acal:1.0:function:round | M | urn:oasis:names:tc:xacml:1.0:function:round |
| urn:oasis:names:tc:acal:1.0:function:floor | M | urn:oasis:names:tc:xacml:1.0:function:floor |
| urn:oasis:names:tc:acal:1.0:function:string-normalize-space | M | urn:oasis:names:tc:xacml:1.0:function:string-normalize-space |
| urn:oasis:names:tc:acal:1.0:function:string-normalize-to-lower-case | M | urn:oasis:names:tc:xacml:1.0:function:string-normalize-to-lower-case |
| urn:oasis:names:tc:acal:1.0:function:double-to-integer | M | urn:oasis:names:tc:xacml:1.0:function:double-to-integer |
| urn:oasis:names:tc:acal:1.0:function:integer-to-double | M | urn:oasis:names:tc:xacml:1.0:function:integer-to-double |
| urn:oasis:names:tc:acal:1.0:function:or | M | |
| urn:oasis:names:tc:acal:1.0:function:and | M | |
| urn:oasis:names:tc:acal:1.0:function:n-of | M | |
| urn:oasis:names:tc:acal:1.0:function:not | M | urn:oasis:names:tc:xacml:1.0:function:not |
| urn:oasis:names:tc:acal:1.0:function:ternary-if | M | |
| urn:oasis:names:tc:acal:1.0:function:integer-greater-than | M | urn:oasis:names:tc:xacml:1.0:function:integer-greater-than |
| urn:oasis:names:tc:acal:1.0:function:integer-greater-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:integer-greater-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:integer-less-than | M | urn:oasis:names:tc:xacml:1.0:function:integer-less-than |
| urn:oasis:names:tc:acal:1.0:function:integer-less-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:integer-less-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:double-greater-than | M | urn:oasis:names:tc:xacml:1.0:function:double-greater-than |
| urn:oasis:names:tc:acal:1.0:function:double-greater-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:double-greater-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:double-less-than | M | urn:oasis:names:tc:xacml:1.0:function:double-less-than |
| urn:oasis:names:tc:acal:1.0:function:double-less-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:double-less-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:dateTime-add-dayTimeDuration | M | urn:oasis:names:tc:xacml:3.0:function:dateTime-add-dayTimeDuration |
| urn:oasis:names:tc:acal:1.0:function:dateTime-add-yearMonthDuration | M | urn:oasis:names:tc:xacml:3.0:function:dateTime-add-yearMonthDuration |
| urn:oasis:names:tc:acal:1.0:function:dateTime-subtract-dayTimeDuration | M | urn:oasis:names:tc:xacml:3.0:function:dateTime-subtract-dayTimeDuration |
| urn:oasis:names:tc:acal:1.0:function:dateTime-subtract-yearMonthDuration | M | urn:oasis:names:tc:xacml:3.0:function:dateTime-subtract-yearMonthDuration |
| urn:oasis:names:tc:acal:1.0:function:date-add-yearMonthDuration | M | urn:oasis:names:tc:xacml:3.0:function:date-add-yearMonthDuration |
| urn:oasis:names:tc:acal:1.0:function:date-subtract-yearMonthDuration | M | urn:oasis:names:tc:xacml:3.0:function:date-subtract-yearMonthDuration |
| urn:oasis:names:tc:acal:1.0:function:string-greater-than | M | urn:oasis:names:tc:xacml:1.0:function:string-greater-than |
| urn:oasis:names:tc:acal:1.0:function:string-greater-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:string-greater-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:string-less-than | M | urn:oasis:names:tc:xacml:1.0:function:string-less-than |
| urn:oasis:names:tc:acal:1.0:function:string-less-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:string-less-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:time-greater-than | M | urn:oasis:names:tc:xacml:1.0:function:time-greater-than |
| urn:oasis:names:tc:acal:1.0:function:time-greater-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:time-greater-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:time-less-than | M | urn:oasis:names:tc:xacml:1.0:function:time-less-than |
| urn:oasis:names:tc:acal:1.0:function:time-less-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:time-less-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:time-in-range | M | urn:oasis:names:tc:xacml:2.0:function:time-in-range |
| urn:oasis:names:tc:acal:1.0:function:dateTime-greater-than | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-greater-than |
| urn:oasis:names:tc:acal:1.0:function:dateTime-greater-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-greater-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:dateTime-less-than | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-less-than |
| urn:oasis:names:tc:acal:1.0:function:dateTime-less-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-less-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:date-greater-than | M | urn:oasis:names:tc:xacml:1.0:function:date-greater-than |
| urn:oasis:names:tc:acal:1.0:function:date-greater-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:date-greater-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:date-less-than | M | urn:oasis:names:tc:xacml:1.0:function:date-less-than |
| urn:oasis:names:tc:acal:1.0:function:date-less-than-or-equal | M | urn:oasis:names:tc:xacml:1.0:function:date-less-than-or-equal |
| urn:oasis:names:tc:acal:1.0:function:string-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:string-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:string-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:string-bag-size |
| urn:oasis:names:tc:acal:1.0:function:string-is-in | M | urn:oasis:names:tc:xacml:1.0:function:string-is-in |
| urn:oasis:names:tc:acal:1.0:function:string-bag | M | urn:oasis:names:tc:xacml:1.0:function:string-bag |
| urn:oasis:names:tc:acal:1.0:function:boolean-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:boolean-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:boolean-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:boolean-bag-size |
| urn:oasis:names:tc:acal:1.0:function:boolean-is-in | M | urn:oasis:names:tc:xacml:1.0:function:boolean-is-in |
| urn:oasis:names:tc:acal:1.0:function:boolean-bag | M | urn:oasis:names:tc:xacml:1.0:function:boolean-bag |
| urn:oasis:names:tc:acal:1.0:function:integer-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:integer-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:integer-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:integer-bag-size |
| urn:oasis:names:tc:acal:1.0:function:integer-is-in | M | urn:oasis:names:tc:xacml:1.0:function:integer-is-in |
| urn:oasis:names:tc:acal:1.0:function:integer-bag | M | urn:oasis:names:tc:xacml:1.0:function:integer-bag |
| urn:oasis:names:tc:acal:1.0:function:double-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:double-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:double-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:double-bag-size |
| urn:oasis:names:tc:acal:1.0:function:double-is-in | M | urn:oasis:names:tc:xacml:1.0:function:double-is-in |
| urn:oasis:names:tc:acal:1.0:function:double-bag | M | urn:oasis:names:tc:xacml:1.0:function:double-bag |
| urn:oasis:names:tc:acal:1.0:function:time-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:time-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:time-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:time-bag-size |
| urn:oasis:names:tc:acal:1.0:function:time-is-in | M | urn:oasis:names:tc:xacml:1.0:function:time-is-in |
| urn:oasis:names:tc:acal:1.0:function:time-bag | M | urn:oasis:names:tc:xacml:1.0:function:time-bag |
| urn:oasis:names:tc:acal:1.0:function:date-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:date-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:date-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:date-bag-size |
| urn:oasis:names:tc:acal:1.0:function:date-is-in | M | urn:oasis:names:tc:xacml:1.0:function:date-is-in |
| urn:oasis:names:tc:acal:1.0:function:date-bag | M | urn:oasis:names:tc:xacml:1.0:function:date-bag |
| urn:oasis:names:tc:acal:1.0:function:dateTime-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:dateTime-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-bag-size |
| urn:oasis:names:tc:acal:1.0:function:dateTime-is-in | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-is-in |
| urn:oasis:names:tc:acal:1.0:function:dateTime-bag | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-bag |
| urn:oasis:names:tc:acal:1.0:function:anyURI-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:anyURI-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-bag-size |
| urn:oasis:names:tc:acal:1.0:function:anyURI-is-in | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-is-in |
| urn:oasis:names:tc:acal:1.0:function:anyURI-bag | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-bag |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-bag-size |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-is-in | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-is-in |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-bag | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-bag |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-bag-size |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-is-in | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-is-in |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-bag | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-bag |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-one-and-only | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-bag-size | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-bag-size |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-is-in | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-is-in |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-bag | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-bag |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-one-and-only | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-bag-size | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-bag-size |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-is-in | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-is-in |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-bag | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-bag |
| urn:oasis:names:tc:acal:1.0:function:x500Name-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:x500Name-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:x500Name-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:x500Name-bag-size |
| urn:oasis:names:tc:acal:1.0:function:x500Name-is-in | M | |
| urn:oasis:names:tc:acal:1.0:function:x500Name-bag | M | urn:oasis:names:tc:xacml:1.0:function:x500Name-bag |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-one-and-only | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-bag-size | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-bag-size |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-is-in | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-is-in |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-bag | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-bag |
| urn:oasis:names:tc:acal:1.0:function:ipAddress-one-and-only | M | urn:oasis:names:tc:xacml:2.0:function:ipAddress-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:ipAddress-bag-size | M | urn:oasis:names:tc:xacml:2.0:function:ipAddress-bag-size |
| urn:oasis:names:tc:acal:1.0:function:ipAddress-bag | M | urn:oasis:names:tc:xacml:2.0:function:ipAddress-bag |
| urn:oasis:names:tc:acal:1.0:function:dnsName-one-and-only | M | urn:oasis:names:tc:xacml:2.0:function:dnsName-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:dnsName-bag-size | M | urn:oasis:names:tc:xacml:2.0:function:dnsName-bag-size |
| urn:oasis:names:tc:acal:1.0:function:dnsName-bag | M | urn:oasis:names:tc:xacml:2.0:function:dnsName-bag |
| urn:oasis:names:tc:acal:1.0:function:entity-one-and-only | M | urn:oasis:names:tc:xacml:3.0:function:entity-one-and-only |
| urn:oasis:names:tc:acal:1.0:function:entity-bag-size | M | urn:oasis:names:tc:xacml:3.0:function:entity-bag-size |
| urn:oasis:names:tc:acal:1.0:function:entity-bag | M | urn:oasis:names:tc:xacml:3.0:function:entity-bag |
| urn:oasis:names:tc:acal:1.0:function:is-empty | O | |
| urn:oasis:names:tc:acal:1.0:function:is-not-empty | O | |
| urn:oasis:names:tc:acal:1.0:function:string-concatenate | M | urn:oasis:names:tc:xacml:2.0:function:string-concatenate |
| urn:oasis:names:tc:acal:1.0:function:boolean-from-string | M | urn:oasis:names:tc:xacml:3.0:function:boolean-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-boolean | M | urn:oasis:names:tc:xacml:3.0:function:string-from-boolean |
| urn:oasis:names:tc:acal:1.0:function:integer-from-string | M | urn:oasis:names:tc:xacml:3.0:function:integer-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-integer | M | urn:oasis:names:tc:xacml:3.0:function:string-from-integer |
| urn:oasis:names:tc:acal:1.0:function:double-from-string | M | urn:oasis:names:tc:xacml:3.0:function:double-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-double | M | urn:oasis:names:tc:xacml:3.0:function:string-from-double |
| urn:oasis:names:tc:acal:1.0:function:time-from-string | M | urn:oasis:names:tc:xacml:3.0:function:time-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-time | M | urn:oasis:names:tc:xacml:3.0:function:string-from-time |
| urn:oasis:names:tc:acal:1.0:function:date-from-string | M | urn:oasis:names:tc:xacml:3.0:function:date-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-date | M | urn:oasis:names:tc:xacml:3.0:function:string-from-date |
| urn:oasis:names:tc:acal:1.0:function:dateTime-from-string | M | urn:oasis:names:tc:xacml:3.0:function:dateTime-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-dateTime | M | urn:oasis:names:tc:xacml:3.0:function:string-from-dateTime |
| urn:oasis:names:tc:acal:1.0:function:anyURI-from-string | M | urn:oasis:names:tc:xacml:3.0:function:anyURI-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-anyURI | M | urn:oasis:names:tc:xacml:3.0:function:string-from-anyURI |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-from-string | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-dayTimeDuration | M | urn:oasis:names:tc:xacml:3.0:function:string-from-dayTimeDuration |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-from-string | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-yearMonthDuration | M | urn:oasis:names:tc:xacml:3.0:function:string-from-yearMonthDuration |
| urn:oasis:names:tc:acal:1.0:function:x500Name-from-string | M | urn:oasis:names:tc:xacml:3.0:function:x500Name-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-x500Name | M | urn:oasis:names:tc:xacml:3.0:function:string-from-x500Name |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-from-string | M | urn:oasis:names:tc:xacml:3.0:function:rfc822Name-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-rfc822Name | M | urn:oasis:names:tc:xacml:3.0:function:string-from-rfc822Name |
| urn:oasis:names:tc:acal:1.0:function:ipAddress-from-string | M | urn:oasis:names:tc:xacml:3.0:function:ipAddress-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-ipAddress | M | urn:oasis:names:tc:xacml:3.0:function:string-from-ipAddress |
| urn:oasis:names:tc:acal:1.0:function:dnsName-from-string | M | urn:oasis:names:tc:xacml:3.0:function:dnsName-from-string |
| urn:oasis:names:tc:acal:1.0:function:string-from-dnsName | M | urn:oasis:names:tc:xacml:3.0:function:string-from-dnsName |
| urn:oasis:names:tc:acal:1.0:function:string-starts-with | M | |
| urn:oasis:names:tc:acal:1.0:function:anyURI-starts-with | M | |
| urn:oasis:names:tc:acal:1.0:function:string-ends-with | M | |
| urn:oasis:names:tc:acal:1.0:function:anyURI-ends-with | M | |
| urn:oasis:names:tc:acal:1.0:function:string-contains | M | |
| urn:oasis:names:tc:acal:1.0:function:anyURI-contains | M | |
| urn:oasis:names:tc:acal:1.0:function:string-substring | M | urn:oasis:names:tc:xacml:3.0:function:string-substring |
| urn:oasis:names:tc:acal:1.0:function:anyURI-substring | M | urn:oasis:names:tc:xacml:3.0:function:anyURI-substring |
| urn:oasis:names:tc:acal:1.0:function:any-of | M | urn:oasis:names:tc:xacml:3.0:function:any-of |
| urn:oasis:names:tc:acal:1.0:function:all-of | M | urn:oasis:names:tc:xacml:3.0:function:all-of |
| urn:oasis:names:tc:acal:1.0:function:any-of-any | M | urn:oasis:names:tc:xacml:3.0:function:any-of-any |
| urn:oasis:names:tc:acal:1.0:function:all-of-any | M | urn:oasis:names:tc:xacml:1.0:function:all-of-any |
| urn:oasis:names:tc:acal:1.0:function:any-of-all | M | urn:oasis:names:tc:xacml:1.0:function:any-of-all |
| urn:oasis:names:tc:acal:1.0:function:all-of-all | M | urn:oasis:names:tc:xacml:1.0:function:all-of-all |
| urn:oasis:names:tc:acal:1.0:function:map | M | urn:oasis:names:tc:xacml:3.0:function:map |
| urn:oasis:names:tc:acal:1.0:function:x500Name-match | M | |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-match | M | |
| urn:oasis:names:tc:acal:1.0:function:string-regexp-match | M | |
| urn:oasis:names:tc:acal:1.0:function:anyURI-regexp-match | M | |
| urn:oasis:names:tc:acal:1.0:function:ipAddress-regexp-match | M | |
| urn:oasis:names:tc:acal:1.0:function:dnsName-regexp-match | M | |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-regexp-match | M | |
| urn:oasis:names:tc:acal:1.0:function:x500Name-regexp-match | M | |
| urn:oasis:names:tc:acal:1.0:function:string-intersection | M | urn:oasis:names:tc:xacml:1.0:function:string-intersection |
| urn:oasis:names:tc:acal:1.0:function:string-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:string-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:string-union | M | urn:oasis:names:tc:xacml:1.0:function:string-union |
| urn:oasis:names:tc:acal:1.0:function:string-subset | M | urn:oasis:names:tc:xacml:1.0:function:string-subset |
| urn:oasis:names:tc:acal:1.0:function:string-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:string-set-equals |
| urn:oasis:names:tc:acal:1.0:function:boolean-intersection | M | urn:oasis:names:tc:xacml:1.0:function:boolean-intersection |
| urn:oasis:names:tc:acal:1.0:function:boolean-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:boolean-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:boolean-union | M | urn:oasis:names:tc:xacml:1.0:function:boolean-union |
| urn:oasis:names:tc:acal:1.0:function:boolean-subset | M | urn:oasis:names:tc:xacml:1.0:function:boolean-subset |
| urn:oasis:names:tc:acal:1.0:function:boolean-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:boolean-set-equals |
| urn:oasis:names:tc:acal:1.0:function:integer-intersection | M | urn:oasis:names:tc:xacml:1.0:function:integer-intersection |
| urn:oasis:names:tc:acal:1.0:function:integer-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:integer-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:integer-union | M | urn:oasis:names:tc:xacml:1.0:function:integer-union |
| urn:oasis:names:tc:acal:1.0:function:integer-subset | M | urn:oasis:names:tc:xacml:1.0:function:integer-subset |
| urn:oasis:names:tc:acal:1.0:function:integer-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:integer-set-equals |
| urn:oasis:names:tc:acal:1.0:function:double-intersection | M | urn:oasis:names:tc:xacml:1.0:function:double-intersection |
| urn:oasis:names:tc:acal:1.0:function:double-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:double-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:double-union | M | urn:oasis:names:tc:xacml:1.0:function:double-union |
| urn:oasis:names:tc:acal:1.0:function:double-subset | M | urn:oasis:names:tc:xacml:1.0:function:double-subset |
| urn:oasis:names:tc:acal:1.0:function:double-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:double-set-equals |
| urn:oasis:names:tc:acal:1.0:function:time-intersection | M | urn:oasis:names:tc:xacml:1.0:function:time-intersection |
| urn:oasis:names:tc:acal:1.0:function:time-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:time-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:time-union | M | urn:oasis:names:tc:xacml:1.0:function:time-union |
| urn:oasis:names:tc:acal:1.0:function:time-subset | M | urn:oasis:names:tc:xacml:1.0:function:time-subset |
| urn:oasis:names:tc:acal:1.0:function:time-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:time-set-equals |
| urn:oasis:names:tc:acal:1.0:function:date-intersection | M | urn:oasis:names:tc:xacml:1.0:function:date-intersection |
| urn:oasis:names:tc:acal:1.0:function:date-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:date-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:date-union | M | urn:oasis:names:tc:xacml:1.0:function:date-union |
| urn:oasis:names:tc:acal:1.0:function:date-subset | M | urn:oasis:names:tc:xacml:1.0:function:date-subset |
| urn:oasis:names:tc:acal:1.0:function:date-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:date-set-equals |
| urn:oasis:names:tc:acal:1.0:function:dateTime-intersection | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-intersection |
| urn:oasis:names:tc:acal:1.0:function:dateTime-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:dateTime-union | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-union |
| urn:oasis:names:tc:acal:1.0:function:dateTime-subset | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-subset |
| urn:oasis:names:tc:acal:1.0:function:dateTime-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:dateTime-set-equals |
| urn:oasis:names:tc:acal:1.0:function:anyURI-intersection | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-intersection |
| urn:oasis:names:tc:acal:1.0:function:anyURI-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:anyURI-union | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-union |
| urn:oasis:names:tc:acal:1.0:function:anyURI-subset | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-subset |
| urn:oasis:names:tc:acal:1.0:function:anyURI-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:anyURI-set-equals |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-intersection | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-intersection |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-union | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-union |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-subset | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-subset |
| urn:oasis:names:tc:acal:1.0:function:hexBinary-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:hexBinary-set-equals |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-intersection | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-intersection |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-union | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-union |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-subset | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-subset |
| urn:oasis:names:tc:acal:1.0:function:base64Binary-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:base64Binary-set-equals |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-intersection | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-intersection |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-at-least-one-member-of | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-union | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-union |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-subset | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-subset |
| urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-set-equals | M | urn:oasis:names:tc:xacml:3.0:function:dayTimeDuration-set-equals |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-intersection | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-intersection |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-at-least-one-member-of | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-union | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-union |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-subset | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-subset |
| urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-set-equals | M | urn:oasis:names:tc:xacml:3.0:function:yearMonthDuration-set-equals |
| urn:oasis:names:tc:acal:1.0:function:x500Name-intersection | M | |
| urn:oasis:names:tc:acal:1.0:function:x500Name-at-least-one-member-of | M | |
| urn:oasis:names:tc:acal:1.0:function:x500Name-union | M | |
| urn:oasis:names:tc:acal:1.0:function:x500Name-subset | M | |
| urn:oasis:names:tc:acal:1.0:function:x500Name-set-equals | M | |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-intersection | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-intersection |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-at-least-one-member-of | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-at-least-one-member-of |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-union | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-union |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-subset | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-subset |
| urn:oasis:names:tc:acal:1.0:function:rfc822Name-set-equals | M | urn:oasis:names:tc:xacml:1.0:function:rfc822Name-set-equals |
| urn:oasis:names:tc:acal:1.0:function:string-minimum | O | |
| urn:oasis:names:tc:acal:1.0:function:string-maximum | O | |
| urn:oasis:names:tc:acal:1.0:function:integer-minimum | O | |
| urn:oasis:names:tc:acal:1.0:function:integer-maximum | O | |
| urn:oasis:names:tc:acal:1.0:function:integer-sum | O | |
| urn:oasis:names:tc:acal:1.0:function:integer-average | O | |
| urn:oasis:names:tc:acal:1.0:function:double-minimum | O | |
| urn:oasis:names:tc:acal:1.0:function:double-maximum | O | |
| urn:oasis:names:tc:acal:1.0:function:double-sum | O | |
| urn:oasis:names:tc:acal:1.0:function:double-average | O | |
| urn:oasis:names:tc:acal:1.0:function:dateTime-minimum | O | |
| urn:oasis:names:tc:acal:1.0:function:dateTime-maximum | O | |
| urn:oasis:names:tc:acal:1.0:function:date-minimum | O | |
| urn:oasis:names:tc:acal:1.0:function:date-maximum | O | |
| urn:oasis:names:tc:acal:1.0:function:access-permitted | O | |


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


This document is provided under the [RF on Limited Terms](https://www.oasis-open.org/policies-guidelines/ipr/#RF-on-Limited) IPR mode that was chosen when the project was established, as defined in the IPR Policy. For information on whether any patents have been disclosed that may be essential to implementing this document, and any offers of patent licensing terms, please refer to the Intellectual Property Rights section of the project’s web page ([OASIS ACAL \[XACML\] TC IPR page](https://www.oasis-open.org/committees/acal/ipr.php)).


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


###### [ACAL-Multiple-1.0]

_ACAL v1.0 Multiple Decision Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/multiple/v1.0/acal-multiple-v1.0.html


###### [CMF]

Martin J. Dürst et al, eds., Character Model for the World Wide Web 1.0: Fundamentals, W3C Recommendation 15 February 2005, https://www.w3.org/TR/2005/REC-charmod-20050215/

###### [Hancock]

Hancock, Polymorphic Type Checking, in Simon L. Peyton Jones, Implementation of Functional Programming Languages, Section 8, Prentice-Hall International, 1987.


###### [LDAP-1]

RFC 2256, A summary of the X500(96) User Schema for use with LDAPv3, Section 5, M Wahl, December 1997, https://www.rfc-editor.org/rfc/rfc2256.txt

###### [LDAP-2]

RFC 2798, Definition of the inetOrgPerson, M. Smith, April 2000, https://www.rfc-editor.org/rfc/rfc2798.txt


###### [OCL]

OMG, Object Constraint Language (OCL) Version 2.4 (also ISO/IEC 19507), 2014. Available online: https://www.omg.org/spec/OCL/2.4 

###### [RFC2045]

Freed, N. and N. Borenstein, "Multipurpose Internet Mail Extensions (MIME) Part One: Format of Internet Message Bodies", RFC 2045, DOI 10.17487/RFC2045, November 1996, <https://www.rfc-editor.org/info/rfc2045>.

###### [RFC2046]

Freed, N. and N. Borenstein, "Multipurpose Internet Mail Extensions (MIME) Part Two: Media Types", RFC 2046, DOI 10.17487/RFC2046, November 1996, <https://www.rfc-editor.org/info/rfc2046>.

###### [RFC2119]

*Key Words for Use in RFCs to Indicate Requirement Levels*, BCP 14, RFC 2119, March 1997. [Online]. Available: https://www.rfc-editor.org/info/rfc2119

###### [RFC3986]

RFC 3986, Berners-Lee T, Fielding R, Masinter L, Uniform Resource Identifiers (URI): Generic Syntax, https://www.rfc-editor.org/rfc/rfc3986.txt

###### [RFC4289]

Freed, N. and J. Klensin, "Multipurpose Internet Mail Extensions (MIME) Part Four: Registration Procedures", BCP 13, RFC 4289, DOI 10.17487/RFC4289, December 2005, <https://www.rfc-editor.org/info/rfc4289>.

###### [RFC4514]

Zeilenga, K., Ed., "Lightweight Directory Access Protocol (LDAP): String Representation of Distinguished Names", RFC 4514, DOI 10.17487/RFC4514, June 2006, <https://www.rfc-editor.org/info/rfc4514/>.

###### [RFC5280]

Cooper, D., Santesson, S., Farrell, S., Boeyen, S., Housley, R., and W. Polk, "Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile", RFC 5280, DOI 10.17487/RFC5280, May 2008, <https://www.rfc-editor.org/info/rfc5280>.

###### [RFC5321]

Klensin, J., "Simple Mail Transfer Protocol", RFC 5321, DOI 10.17487/RFC5321, October 2008, <https://www.rfc-editor.org/info/rfc5321>.

###### [RFC6838]

Freed, N., Klensin, J., and T. Hansen, "Media Type Specifications and Registration Procedures", BCP 13, RFC 6838, DOI 10.17487/RFC6838, January 2013, <https://www.rfc-editor.org/info/rfc6838>.

###### [RFC8174]

*Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words*, BCP 14, RFC 8174, May 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8174

###### [UAX15]

Mark Davis, Martin Dürst, Unicode Standard Annex #15: Unicode Normalization Forms, Unicode 5.1, https://unicode.org/reports/tr15/

###### [UML]

OMG, Unified Modeling Language (UML) Version 2.5.1 (also ISO/IEC 19505), 2017. Available online: https://www.omg.org/spec/UML/2.5.1/ 

###### [X690]

ITU-T Recommendation X.690 (12/1997), *Information technology - ASN.1 encoding rules: Specification of Basic Encoding Rules (BER), Canonical Encoding Rules (CER) and Distinguished Encoding Rules (DER)*, https://www.itu.int/rec/T-REC-X.690-199712-S

###### [UTR36]

Davis, Mark, Suignard, Michel, Unicode Technical Report #36: Unicode Security Considerations, https://www.unicode.org/reports/tr36/

###### [XACMLAdmin]

OASIS Committee Draft 03, XACML v3.0 Administration and Delegation Profile Version 1.0. 11 March 2010, https://docs.oasis-open.org/xacml/3.0/xacml-3.0-administration-v1-spec-cd-03-en.doc

###### [XML]

Bray, Tim, et.al. eds, Extensible Markup Language (XML) 1.0 (Fifth Edition), W3C Recommendation 26 November 2008, https://www.w3.org/TR/2008/REC-xml-20081126/

###### [XF]

XPath and XQuery Functions and Operators 3.1, W3C Recommendation 21 March 2017, https://www.w3.org/TR/2017/REC-xpath-functions-31-20170321/

###### [XS]

XML Schema 1.1, parts 1 and 2. Available at: https://www.w3.org/TR/xmlschema11-1/ and https://www.w3.org/TR/xmlschema11-2/

## B.2 Informative References


The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [ACAL-Hierarchical-1.0]

_ACAL v1.0 Hierarchical Resource Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v1.0/acal-hierarchical-v1.0.html


###### [DS]

D. Eastlake et al., XML-Signature Syntax and Processing, https://www.w3.org/TR/xmldsig-core/, World Wide Web Consortium.

###### [ENTITIES]

_XACML v3.0 Related and Nested Entities Profile Version 1.0_. Edited by Steven Legg. 16 February 2021. OASIS Committee Specification 02. https://docs.oasis-open.org/xacml/xacml-3.0-related-entities/v1.0/cs02/xacml-3.0-related-entities-v1.0-cs02.html. Latest stage: https://docs.oasis-open.org/xacml/xacml-3.0-related-entities/v1.0/xacml-3.0-related-entities-v1.0.html.

###### [ISO10181-3]

ISO/IEC 10181-3:1996 Information technology – Open Systems Interconnection -- Security frameworks for open systems: Access control framework.

###### [Kudo00]

Kudo M and Hada S, XML document security based on provisional authorization, Proceedings of the Seventh ACM Conference on Computer and Communications Security, Nov 2000, Athens, Greece, pp 87-96.

###### [MathML]

Mathematical Markup Language (MathML), Version 2.0, W3C Recommendation, 21 October 2003, https://www.w3.org/TR/2003/REC-MathML2-20031021/

###### [Perritt93]

Perritt, H. Knowbots, Permissions Headers and Contract Law, Conference on Technological Strategies for Protecting Intellectual Property in the Networked Multimedia Environment, April 1993. Available at: https://www.cni.org/resources/historical-resources/technological-strategies-for-protecting-intellectual-property-in-the-networked-multimedia-environment/permission-headers-and-contract-law

###### [RBAC]

David Ferraiolo and Richard Kuhn, Role-Based Access Controls, 15th National Computer Security Conference, 1992.

###### [RFC3198]

IETF RFC 3198: Terminology for Policy-Based Management, November 2001. https://www.rfc-editor.org/rfc/rfc3198.txt

###### [RFC4343]

Eastlake 3rd, D., "Domain Name System (DNS) Case Insensitivity Clarification", RFC 4343, DOI 10.17487/RFC4343, January 2006, <https://www.rfc-editor.org/info/rfc4343>.

###### [XMLid]

Marsh, Jonathan, et.al. eds, xml:id Version 1.0. W3C Recommendation 9 September 2005, https://www.w3.org/TR/2005/REC-xml-id-20050909/

###### [XSLT]

XSL Transformations (XSLT) Version 1.0, W3C Recommendation 16 November 1999, https://www.w3.org/TR/xslt/

###### [CM]

Character Model for the World Wide Web: String Matching W3C Working Group Note 11 August 2021, https://www.w3.org/TR/charmod-norm/, World Wide Web Consortium.

###### [Hinton94]

Hinton, H, M, Lee, E, S, The Compatibility of Policies, Proceedings 2nd ACM Conference on Computer and Communications Security, Nov 1994, Fairfax, Virginia, USA.

###### [IEEE754]

IEEE Std 754-2019, IEEE Standard for Floating-Point Arithmetic, DOI: 10.1109/IEEESTD.2019.8766229. [Section 8.6](#86-arithmetic-evaluation) states the `double` arithmetic and comparison behavior this specification requires in terms that do not depend on this document; it is cited here as the formal origin of those rules, for readers who want more detail.

###### [RFC8259]

RFC 8259, Tim Bray, *The JavaScript Object Notation (JSON) Data Interchange Format*, December 2017, https://www.rfc-editor.org/info/rfc8259 .

###### [NISTIR8318]

Black, P. (2020), DADS: The On-Line Dictionary of Algorithms and Data Structures, NIST Interagency/Internal Report (NISTIR), National Institute of Standards and Technology, Gaithersburg, MD, [online](https://doi.org/10.6028/NIST.IR.8318) (Accessed December 16, 2025) 

###### [Sloman94]

Sloman, M. Policy Driven Management for Distributed Systems. Journal of Network and Systems Management, Volume 2, part 4. Plenum Press. 1994.

###### [XACML]

_eXtensible Access Control Markup Language (XACML) Version 3.0 Plus Errata 01_. Edited by Erik Rissanen. OASIS Standard incorporating Approved Errata. https://docs.oasis-open.org/xacml/3.0/xacml-3.0-core-spec-en.html.


---

# Annex C Data Types and Functions


(This annex forms an integral part of this Specification.)


## C.1 Introduction

This section specifies the data types and functions used in ACAL to create predicates for conditions and targets.

This specification combines the various standards set forth by IEEE and ANSI for string representation of numeric values, as well as the evaluation of arithmetic functions. The standard functions are named and their operational semantics are described.

## C.2 Data Types

Although a syntactic representation of ACAL objects may represent most data types as strings, an ACAL PDP must operate on types of data that, while they have string representations, are not just strings. Types such as `Boolean`, `Integer`, and `Double` MUST be converted from their string representations to values that can be compared with values in their domain of discourse, such as numbers. The following data types are specified for use with ACAL and have explicit data representations:

* `urn:oasis:names:tc:acal:1.0:data-type:string`

* `urn:oasis:names:tc:acal:1.0:data-type:boolean`

* `urn:oasis:names:tc:acal:1.0:data-type:integer`

* `urn:oasis:names:tc:acal:1.0:data-type:double`

* `urn:oasis:names:tc:acal:1.0:data-type:time`

* `urn:oasis:names:tc:acal:1.0:data-type:date`

* `urn:oasis:names:tc:acal:1.0:data-type:dateTime`

* `urn:oasis:names:tc:acal:1.0:data-type:anyURI`

* `urn:oasis:names:tc:acal:1.0:data-type:hexBinary`

* `urn:oasis:names:tc:acal:1.0:data-type:base64Binary`

* `urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration`

* `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration`

* `urn:oasis:names:tc:acal:1.0:data-type:x500Name`

* `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`

* `urn:oasis:names:tc:acal:1.0:data-type:ipAddress`

* `urn:oasis:names:tc:acal:1.0:data-type:dnsName`

The definitions of the twelve data types that correspond to XML Schema datatypes are given in [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema).

If a value of data type `dateTime` or `date` does not include a time zone, the equality, comparison and ordering functions of that data type ([Annex C.3.1](#c31-equality-predicates), [Annex C.3.8](#c38-non-numeric-comparison-functions)) resolve it using the *implicit timezone* of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]. (A `time` value without a time zone is resolved differently; see the `time-*` functions and `time-in-range` in [Annex C.3.8](#c38-non-numeric-comparison-functions).) This document does not specify the implicit timezone; a PDP ordinarily configures it, so two conformant PDPs MAY configure different implicit time zones and MAY therefore reach different comparison results, and different decisions, for the identical policy and the identical request when a comparison combines a value that has an explicit time zone with one that does not, or otherwise depends on the implicit timezone. It is RECOMMENDED that every `dateTime`, `time` and `date` value carried in a request or a policy include an explicit time zone, to avoid this hazard; it is not necessary that every value use the same time zone, or that any value use UTC specifically. Independently, for the sake of improved interoperability, it is RECOMMENDED that all time references be in UTC time where a choice of time zone is otherwise unconstrained.

An ACAL PDP SHALL be capable of converting string representations into various data types. For the twelve data types defined by reference to XML Schema ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)), including `urn:oasis:names:tc:acal:1.0:data-type:double`, the conversion SHALL use the lexical mapping given there. Implementations SHALL represent and operate on `double` values as specified in [Section 8.6](#86-arithmetic-evaluation).

ACAL defines four data types representing identifiers for subjects or resources; these are:

* `urn:oasis:names:tc:acal:1.0:data-type:x500Name`,

* `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`,

* `urn:oasis:names:tc:acal:1.0:data-type:ipAddress` and

* `urn:oasis:names:tc:acal:1.0:data-type:dnsName`.

These types appear in several standard applications, such as TLS/SSL and electronic mail.

ACAL defines a data type for representing structured data:

* `urn:oasis:names:tc:acal:1.0:data-type:entity`

### C.2.1 X.500 Directory Name

The `urn:oasis:names:tc:acal:1.0:data-type:x500Name` data type represents an ITU-T Rec. X.520 Distinguished Name. The valid syntax for such a name is described in [[RFC4514](#rfc4514)] "Lightweight Directory Access Protocol (LDAP): String Representation of Distinguished Names".

The value space of `x500Name` is the set of ITU-T Rec. X.520 Distinguished Names, together with the lexical string from which each value was constructed; a Distinguished Name is a sequence of Relative Distinguished Names (RDNs), each an unordered set of attribute-type-and-value pairs. The lexical space is the set of character strings conforming to the [[RFC4514](#rfc4514)] syntax above, and the lexical mapping from such a string to the Distinguished Name it denotes is given by [[RFC4514](#rfc4514)]'s parsing rules. `urn:oasis:names:tc:acal:1.0:function:x500Name-equal` ([Annex C.3.1](#c31-equality-predicates)) determines whether two `x500Name` values are equivalent; two values MAY be equivalent while retaining different original lexical strings, which `urn:oasis:names:tc:acal:1.0:function:string-from-x500Name` preserves rather than normalizing.

### C.2.2 RFC 822 Name

The `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name` data type represents an electronic mail address. The valid syntax for such a name is described in [[RFC5321](#rfc5321)], Section 4.1.2, Command Argument Syntax, under the term "Mailbox".

The value space of `rfc822Name` is the set of pairs of a local-part and a domain-part conforming to the Mailbox syntax above, together with the lexical string from which each value was constructed. The lexical space is the set of character strings conforming to that syntax, and the lexical mapping from such a string to the pair it denotes is given by parsing the string according to that syntax. `urn:oasis:names:tc:acal:1.0:function:rfc822Name-equal` ([Annex C.3.1](#c31-equality-predicates)) determines whether two `rfc822Name` values are equivalent, comparing the domain-part case-insensitively and the local-part case-sensitively; two values MAY be equivalent while retaining different original lexical strings, which `urn:oasis:names:tc:acal:1.0:function:string-from-rfc822Name` preserves rather than normalizing.

### C.2.3 IP Address

The `urn:oasis:names:tc:acal:1.0:data-type:ipAddress` data type represents an IPv4 or IPv6 network address, with optional mask and optional port or port range. The syntax SHALL be:

```abnf
ipAddress = address [ `/` mask ] [ `:` [ portrange ] ]
```

For an IPv4 address, the address and mask SHALL each conform to the `IPv4address` rule defined in [[RFC3986](#rfc3986)], Appendix A.

For an IPv6 address, the address and mask SHALL each conform to the `IP-literal` rule (using the `IPv6address` alternative) defined in [[RFC3986](#rfc3986)], Section 3.2.2 and Appendix A. (Note that an IPv6 address or mask, in this syntax, is enclosed in literal `[` `]` brackets.)

The mask, where present, uses the same syntactic rule as the address component (i.e., `IPv4address` for IPv4, `IP-literal` for IPv6) and represents a network address mask (e.g., `255.255.255.0` for IPv4 or `[ffff:ffff::]` for IPv6). The mask format is defined by this specification and is not derived from any external RFC.

The value space of `ipAddress` is the set of triples of an IPv4 or IPv6 address, an optional network address mask of the same address family, and an optional port or port range (the port-range syntax, common to `ipAddress` and `dnsName`, is given below). The lexical space is the set of character strings conforming to the syntax above and below, and the lexical mapping from such a string to the triple it denotes is given by that syntax. This specification defines no equality or matching relation on `ipAddress` values other than identity of the parsed triple (for example, it does not define whether two address strings that denote overlapping or numerically equal address ranges are related by any standard ACAL function). No standard ACAL function currently depends on such a relation.

### C.2.4 DNS Name

The `urn:oasis:names:tc:acal:1.0:data-type:dnsName` data type represents a Domain Name System (DNS) host name, with optional port or port range. The syntax SHALL be:

```abnf
dnsName = hostname [ `:` portrange ]
```

The hostname SHALL conform to the `reg-name` rule defined in [[RFC3986](#rfc3986)], Section 3.2.2 and Appendix A, except that a wildcard `*` may be used in the left-most component of the hostname to indicate "any subdomain" under the domain specified to its right.

For both the `urn:oasis:names:tc:acal:1.0:data-type:ipAddress` and <!-- Newline added to fit on PDF page -->
`urn:oasis:names:tc:acal:1.0:data-type:dnsName` data types, the port or port range syntax SHALL be

```abnf
portrange = portnumber | `-`portnumber | portnumber`-`[portnumber]
```

where `portnumber` is a decimal port number. If the port number is of the form `-x`, where `x` is a port number, then the range is all ports numbered `x` and below. If the port number is of the form `x-`, then the range is all ports numbered `x` and above. [This syntax is taken from the Java SocketPermission.]

The value space of `dnsName` is the set of pairs of a hostname (optionally beginning with a wildcard label) and an optional port or port range, each as constrained by the syntax above, together with the lexical string from which each value was constructed. The lexical space is the set of character strings conforming to that syntax, and the lexical mapping from such a string to the pair it denotes preserves the hostname's original letter case. This specification defines no equality or matching relation on `dnsName` values other than identity of the parsed pair. Per [[RFC4343](#rfc4343)], DNS name comparison is conventionally case-insensitive, but no standard ACAL function implements such a case-insensitive relation; a `dnsName` value's original letter case is preserved by the lexical mapping and remains observable through `urn:oasis:names:tc:acal:1.0:function:string-from-dnsName` and functions built on it, such as `urn:oasis:names:tc:acal:1.0:function:dnsName-regexp-match`.

### C.2.5 Entity

The `urn:oasis:names:tc:acal:1.0:data-type:entity` data type is used to represent an entity nested within another entity. Values of this data type are objects of the `EntityType` object type [Section 7.45](#745-entitytype).

### C.2.6 Data Types Defined by Reference to XML Schema

Each of the twelve data types in the table below is defined as follows, for every ACAL representation format and every ACAL Profile. Its *value space* (the set of values that a value of the data type can be), its *lexical space* (the set of character strings that represent those values) and its *lexical mapping* (the mapping from each string of the lexical space to the value it represents) are those of the built-in datatype of the same name defined by [[XS](#xs)] Part 2, in the section given in the table.

| ACAL data type | XML Schema 1.1 Part 2 datatype | Section of [[XS](#xs)] Part 2 |
| :--- | :--- | :--- |
| `urn:oasis:names:tc:acal:1.0:data-type:string` | `xs:string` | 3.3.1 |
| `urn:oasis:names:tc:acal:1.0:data-type:boolean` | `xs:boolean` | 3.3.2 |
| `urn:oasis:names:tc:acal:1.0:data-type:integer` | `xs:integer` | 3.4.13 |
| `urn:oasis:names:tc:acal:1.0:data-type:double` | `xs:double` | 3.3.5 |
| `urn:oasis:names:tc:acal:1.0:data-type:dateTime` | `xs:dateTime` | 3.3.7 |
| `urn:oasis:names:tc:acal:1.0:data-type:time` | `xs:time` | 3.3.8 |
| `urn:oasis:names:tc:acal:1.0:data-type:date` | `xs:date` | 3.3.9 |
| `urn:oasis:names:tc:acal:1.0:data-type:hexBinary` | `xs:hexBinary` | 3.3.15 |
| `urn:oasis:names:tc:acal:1.0:data-type:base64Binary` | `xs:base64Binary` | 3.3.16 |
| `urn:oasis:names:tc:acal:1.0:data-type:anyURI` | `xs:anyURI` | 3.3.17 |
| `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration` | `xs:yearMonthDuration` | 3.4.26 |
| `urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration` | `xs:dayTimeDuration` | 3.4.27 |

This specification uses those definitions of value space, lexical space and lexical mapping only. An implementation is not required to process XML, or to perform XML Schema validation, in order to support these data types. A value of one of these data types is a member of the value space of the corresponding XML Schema datatype; it is not a character string, even where an ACAL representation format represents it as one.

Two consequences of this definition are stated here because they are easily overlooked. First, the value space of `urn:oasis:names:tc:acal:1.0:data-type:string` is the set of finite-length sequences of characters that match the `Char` production of [[XML](#xml)], and [[XS](#xs)] leaves it implementation-defined whether the XML 1.0 production, the XML 1.1 production, or both are supported. A sequence of characters that an ACAL representation format can carry but that is outside that set (for example a control character that XML excludes) is therefore not a value of the `string` data type. Second, the lexical space of `urn:oasis:names:tc:acal:1.0:data-type:anyURI` is the same set of character sequences, and its values represent IRI references; it is not the type `URI` of [Section 7.1.2.3.1](#71231-uri), which is an [[RFC3986](#rfc3986)] URI, and a value of the `anyURI` data type need not conform to [[RFC3986](#rfc3986)].

The value space of `urn:oasis:names:tc:acal:1.0:data-type:integer` is the set of all mathematical integers. An ACAL implementation SHOULD NOT impose a predetermined bound on the magnitude of an `integer` value that it evaluates. The *supported integer interval* of an ACAL implementation is the set of `integer` values that it can evaluate. For an implementation that imposes no predetermined bound, it is the set of all integers. For any other implementation it is a contiguous interval of integers, which SHALL include every integer from −9223372036854775808 to 9223372036854775807 inclusive (−2<sup>63</sup> to 2<sup>63</sup>−1). An ACAL implementation SHALL document its supported integer interval for each version and configuration for which it claims conformance. This is the approach that XML Schema 1.1 Part 2 [[XS](#xs)] Section 5.4 (Partial Implementation of Infinite Datatypes) takes to datatypes with infinite value spaces, stated here as a requirement on ACAL implementations and with a larger minimum than that section's.

: Note: A fixed-width implementation built to meet documented safety, hard real-time, hardware or deployment constraints is an example of an implementation with a valid reason not to follow the recommendation above. The recommendation concerns the values that an implementation can evaluate; it does not discourage the input acceptance limits described below.

A predetermined limit that an implementation's evaluation applies to `integer` values, whether built in or configured, such as a maximum magnitude, a fixed width, or a maximum number of bits or significant digits of the value, bounds the supported integer interval. So does a configured limit that the evaluation applies and that, in otherwise normal operation, prevents it from representing or using every `integer` value beyond some magnitude, even if the same limit also applies to values of other data types. Such a limit bounds the supported integer interval whether or not an input acceptance limit prevents the affected integers from reaching evaluation. An ACAL implementation SHALL NOT treat reaching such a limit as exhaustion of an execution resource. An ACAL implementation SHALL NOT describe such a limit as an input acceptance limit. A limit on memory, processing time or stack depth that is reached during evaluation is exhaustion of an execution resource, whether or not the limit is configured in advance.

An ACAL implementation MAY apply input acceptance limits to requests and policies, for example to the size of a request, to the nesting depth of its representation, or to the length of the lexical representation of a number or a string. Before any policy is evaluated for a request, an ACAL implementation MAY refuse the request if the request contains an `integer` value outside the supported integer interval or exceeds an input acceptance limit that the implementation applies. An ACAL implementation that refuses a request SHALL NOT evaluate any policy for that request. The ACAL implementation SHALL NOT evaluate the request with an altered value. If the PDP returns a response context for a refused request, its `Decision` property SHALL be `Indeterminate` and its status code, if any, SHALL be `urn:oasis:names:tc:acal:1.0:status:processing-error`. An input acceptance limit that is reached during evaluation, for example while an attribute value is retrieved from a PIP, does not refuse the request; the evaluation that requires the value is governed by the next paragraph. An ACAL implementation SHALL NOT describe such a failure as refusal of the request. The refusal of a request by a component that does not return an ACAL decision, such as a parser, gateway or firewall in front of the PDP, is outside the scope of this specification.

If an evaluation requires an `integer` value that is outside the supported integer interval, that an input acceptance limit prevents from being obtained, or that cannot be preserved because an execution resource is exhausted, then that evaluation SHALL return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`. An ACAL implementation SHALL NOT replace an `integer` value with one produced by wraparound, modular reduction, saturation, clipping, rounding or any other loss of precision. An ACAL implementation SHALL NOT continue an evaluation with an altered value. An ACAL implementation SHALL NOT return status code `urn:oasis:names:tc:acal:1.0:status:syntax-error` for a valid lexical representation of an integer solely because the integer is outside the supported integer interval, because an input acceptance limit applies to it, or because an execution resource is exhausted. A PDP that has not refused a request SHALL NOT return `Indeterminate` solely because the request contains an `integer` value that is outside the supported integer interval and that the evaluation does not require.

For each version and configuration for which it claims conformance, an ACAL implementation SHALL document each input acceptance limit that it applies and that can cause an input containing an `integer` value to be refused, including a limit applied when an attribute value is retrieved during evaluation, together with the representation or point of input to which the limit applies. For each reason for which this section allows it to refuse a request, an ACAL implementation SHALL document whether it refuses such requests before evaluation or evaluates them.

The supported integer interval applies to each `integer` value that this specification defines: a literal, an attribute value, a value produced by an attribute selector, a variable value, a member of a bag, and an argument or result of a function. If a function has an argument of data type `integer`, an argument that is a bag of `integer` values, or a result of data type `integer`, and every `integer` value supplied to it (including each member of a bag argument) is within the supported integer interval, and the function's definition does not prescribe an `integer` result outside that interval, then the function SHALL return its prescribed result, unless an argument is `Indeterminate` or an execution resource is exhausted. This includes a function whose result is not an `integer`, such as `urn:oasis:names:tc:acal:1.0:function:integer-average`. An ACAL implementation SHALL NOT return `Indeterminate` solely because private state that it uses internally while evaluating a single function is outside the supported integer interval. When no argument is `Indeterminate` and no execution resource is exhausted, the result of such a function therefore does not depend on the order of its arguments, or on the order in which it processes the members of a bag. For example, on an implementation whose supported integer interval is −2<sup>63</sup> to 2<sup>63</sup>−1, `urn:oasis:names:tc:acal:1.0:function:integer-add` applied to the three arguments 2<sup>62</sup>, 2<sup>62</sup> and −2<sup>62</sup> returns 2<sup>62</sup>, and so does `urn:oasis:names:tc:acal:1.0:function:integer-sum` ([Annex C.3.14](#c314-aggregate-functions)) applied to a bag of those three values; whereas `integer-add` applied to the result of `integer-add` of 2<sup>62</sup> and 2<sup>62</sup>, and to −2<sup>62</sup>, returns `Indeterminate`, because the inner result, 2<sup>63</sup>, is outside the interval.

If a PDP evaluates a policy that contains an `integer` literal whose value is outside the supported integer interval, or whose exact value the PDP cannot preserve because an execution resource is exhausted, then the result of that policy SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`, whether or not the evaluation reaches the literal, and the PDP SHALL NOT evaluate the policy with an altered value. This parallels the treatment of an unsupported function in [Section 8.17.1](#8171-unsupported-functionality). An integer literal written within an expression in a language that an ACAL Profile defines, such as an XPath expression, is governed by that Profile. A PDP or PAP MAY refuse to load a policy that contains an `integer` literal whose value is outside the supported integer interval, or that exceeds an input acceptance limit that the implementation applies to policies. An ACAL implementation SHALL document whether it refuses to load such a policy. See also [Section 10.1.9](#1019-implementation-defined-integer-limits).

The equality and ordering of values of these data types in ACAL expressions, and all other operations on them, are specified by the functions in [Annex C.3](#c3-functions).

The data types `urn:oasis:names:tc:acal:1.0:data-type:x500Name`, `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`, `urn:oasis:names:tc:acal:1.0:data-type:ipAddress` and `urn:oasis:names:tc:acal:1.0:data-type:dnsName` are not defined by reference to XML Schema (see [Annex C.2.1](#c21-x500-directory-name) to [Annex C.2.4](#c24-dns-name)).

An ACAL Profile that converts a value between a profile-specific form and a value of one of these data types SHALL specify the conversion in terms of the value spaces defined here.

## C.3 Functions

ACAL specifies the following functions. Unless otherwise specified, if an argument of one of these functions were to evaluate to `Indeterminate`, then the function SHALL evaluate to `Indeterminate`.

Note that in each case an implementation is conformant as long as it produces the same result as is specified here, regardless of how and in what order the implementation behaves internally.

### C.3.1 Equality Predicates

The following functions are the equality functions for the various data types. Each function for a particular data type follows a specified standard convention for that data type.

`urn:oasis:names:tc:acal:1.0:function:string-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL return `true` if and only if the value of both of its arguments are of equal length and each string is determined to be equal. Otherwise, it SHALL return `false`. The comparison SHALL use Unicode codepoint collation, as defined for the identifier `https://www.w3.org/2005/xpath-functions/collation/codepoint/` by [[XF](#xf)].

`urn:oasis:names:tc:acal:1.0:function:string-equal-ignore-case`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The result SHALL be `true` if and only if the two strings are equal as defined by `urn:oasis:names:tc:acal:1.0:function:string-equal` after they have both been converted to lower case with `urn:oasis:names:tc:acal:1.0:function:string-normalize-to-lower-case`.

`urn:oasis:names:tc:acal:1.0:function:boolean-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:boolean` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL return `true` if and only if the arguments are equal. Otherwise, it SHALL return `false`.

`urn:oasis:names:tc:acal:1.0:function:integer-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:integer` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL return `true` if and only if the two arguments represent the same number.

`urn:oasis:names:tc:acal:1.0:function:double-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:double` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL perform its evaluation as specified in [Section 8.6](#86-arithmetic-evaluation).

`urn:oasis:names:tc:acal:1.0:function:date-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:date` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL perform its evaluation according to the `op:date-equal` function [[XF](#xf)] Section 9.4.4.

`urn:oasis:names:tc:acal:1.0:function:time-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:time` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL perform its evaluation according to the `op:time-equal` function [[XF](#xf)] Section 9.4.7.

`urn:oasis:names:tc:acal:1.0:function:dateTime-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:dateTime` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL perform its evaluation according to the `op:dateTime-equal` function [[XF](#xf)] Section 9.4.1.

`urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. This function SHALL perform its evaluation according to the `op:duration-equal` function [[XF](#xf)] Section 8.2.5. Note that the lexical representation of each argument MUST be converted to a value expressed in fractional seconds [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. This function SHALL perform its evaluation according to the `op:duration-equal` function [[XF](#xf)] Section 8.2.5. Note that the lexical representation of each argument MUST be converted to a value expressed in months [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:anyURI-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL convert the arguments to strings with urn:oasis:names:tc:acal:1.0:function:string-from-anyURI and return `true` if and only if the values of the two arguments are equal on a codepoint-by-codepoint basis.

`urn:oasis:names:tc:acal:1.0:function:x500Name-equal`

: This function SHALL take two arguments of `urn:oasis:names:tc:acal:1.0:data-type:x500Name` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if each Relative Distinguished Name (RDN) in the two arguments matches. Otherwise, it SHALL return `false`. Two RDNs match if and only if the result of the following operations is `true`.

    1. Parse each argument into its sequence of RDNs according to [[RFC4514](#rfc4514)] Section 3 `Parsing a String Back to a Distinguished Name`.

    2. If any RDN contains multiple attributeTypeAndValue pairs, re-order the attributeTypeAndValue pairs in that RDN in ascending order when compared as octet strings (described in [[X690](#x690)] Section 11.6 `Set-of components`).

    3. Compare RDNs using the rules in [[RFC5280](#rfc5280)] `Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile`, Section 7.1 `Internationalized Names in Distinguished Names`.

`urn:oasis:names:tc:acal:1.0:function:rfc822Name-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the two arguments are equal. Otherwise, it SHALL return `false`. An RFC822 name consists of a local-part followed by `@` followed by a domain-part. The local-part is case-sensitive, while the domain-part (which is usually a DNS host name) is not case-sensitive. Perform the following operations:

    1. Normalize the domain-part of each argument to lower case.

    2. Compare the expressions by applying the function `urn:oasis:names:tc:acal:1.0:function:string-equal` to the normalized arguments.

`urn:oasis:names:tc:acal:1.0:function:hexBinary-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:hexBinary` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if the octet sequences represented by the value of both arguments have equal length and are equal in a conjunctive, point-wise, comparison using the `urn:oasis:names:tc:acal:1.0:function:integer-equal` function. Otherwise, it SHALL return `false`. The conversion from the string representation to an octet sequence SHALL be as specified in [[XS](#xs)] Part 2, Section 3.3.15.

`urn:oasis:names:tc:acal:1.0:function:base64Binary-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:base64Binary` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if the octet sequences represented by the value of both arguments have equal length and are equal in a conjunctive, point-wise, comparison using the `urn:oasis:names:tc:acal:1.0:function:integer-equal` function. Otherwise, it SHALL return `false`. The conversion from the string representation to an octet sequence SHALL be as specified in [[XS](#xs)] Part 2, Section 3.3.16.

### C.3.2 Arithmetic Functions

All of the following functions SHALL take two arguments of the specified data type, integer, or double, and SHALL return a value of integer or double data type, respectively, except that the `add` and `multiply` functions SHALL take two or more arguments. Each function evaluation operating on doubles SHALL proceed as specified in [Section 8.6](#86-arithmetic-evaluation). For all of these functions, if any argument is `Indeterminate`, then the function SHALL evaluate to `Indeterminate`. In the case of `urn:oasis:names:tc:acal:1.0:function:integer-divide`, `urn:oasis:names:tc:acal:1.0:function:double-divide` and `urn:oasis:names:tc:acal:1.0:function:integer-mod`, if the second argument (the divisor) is zero, then the function SHALL evaluate to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.

An arithmetic function defined in this section whose result is of data type `urn:oasis:names:tc:acal:1.0:data-type:integer` SHALL return exactly the result that its definition prescribes, or `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error` where [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) requires it: for a value outside the supported integer interval, or for exhaustion of an execution resource. Such a function SHALL NOT wrap around, reduce modulo, saturate or otherwise lose precision. [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) also requires a function whose arguments and prescribed result are within the supported integer interval to return that result whatever state the implementation uses internally, so the result of `integer-add` or `integer-multiply` with more than two arguments is independent of the order of its arguments.

: Note: An `Indeterminate` result is not a `Deny` result. If an integer error causes a child of a policy that uses `permit-unless-deny` ([Annex E.7](#e7-permit-unless-deny)) to evaluate to `Indeterminate` where that child would otherwise have evaluated to `Deny`, that policy returns `Permit` unless another child evaluates to `Deny`. See also [Section 10.1.9](#1019-implementation-defined-integer-limits).

`urn:oasis:names:tc:acal:1.0:function:integer-add`

: This function MUST accept two or more arguments. The result is the sum of the arguments.

`urn:oasis:names:tc:acal:1.0:function:double-add`

: This function MUST accept two or more arguments.

`urn:oasis:names:tc:acal:1.0:function:integer-subtract`

: The result is the second argument subtracted from the first argument.

`urn:oasis:names:tc:acal:1.0:function:double-subtract`

: The result is the second argument subtracted from the first argument.

`urn:oasis:names:tc:acal:1.0:function:integer-multiply`

: This function MUST accept two or more arguments. The result is the product of the arguments.

`urn:oasis:names:tc:acal:1.0:function:double-multiply`

: This function MUST accept two or more arguments.

`urn:oasis:names:tc:acal:1.0:function:integer-divide`

: The result is the first argument divided by the second argument, truncated toward zero to a whole number.

`urn:oasis:names:tc:acal:1.0:function:double-divide`

: The result is the first argument divided by the second argument.

`urn:oasis:names:tc:acal:1.0:function:integer-mod`

: The result is the first argument minus the product of the second argument and *q*, where *q* is the first argument divided by the second argument, truncated toward zero to a whole number (the result that `urn:oasis:names:tc:acal:1.0:function:integer-divide` prescribes for the same arguments); the result is zero or has the sign of the first argument. This result is prescribed even when *q* is outside the supported integer interval ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)): for example, on an implementation whose supported integer interval is −2<sup>63</sup> to 2<sup>63</sup>−1, `integer-mod` applied to −2<sup>63</sup> and −1 returns 0, although `integer-divide` applied to the same arguments returns `Indeterminate`.

The following functions SHALL take a single argument of the specified data type. The round and floor functions SHALL take a single argument of data type `urn:oasis:names:tc:acal:1.0:data-type:double` and return a value of the data type `urn:oasis:names:tc:acal:1.0:data-type:double`.

* `urn:oasis:names:tc:acal:1.0:function:integer-abs`

* `urn:oasis:names:tc:acal:1.0:function:double-abs`

* `urn:oasis:names:tc:acal:1.0:function:round`

* `urn:oasis:names:tc:acal:1.0:function:floor`

The result of `urn:oasis:names:tc:acal:1.0:function:integer-abs` is the absolute value of its argument.

: Note: On an implementation whose supported integer interval ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)) is −2<sup>63</sup> to 2<sup>63</sup>−1, `integer-abs` applied to −2<sup>63</sup>, `integer-divide` applied to −2<sup>63</sup> and −1, and `integer-subtract` applied to 0 and −2<sup>63</sup> each return `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`, because each prescribed result is 2<sup>63</sup>. In these cases two's-complement machine arithmetic gives a wrapped result, or behavior that the programming language leaves undefined; satisfying [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) means detecting them rather than returning a wrapped value.

### C.3.3 String Conversion Functions

The following functions convert between values of the `urn:oasis:names:tc:acal:1.0:data-type:string` data type.

`urn:oasis:names:tc:acal:1.0:function:string-normalize-space`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL normalize the value by stripping off all leading and trailing white space characters. The whitespace characters are defined in the metasymbol S (Production 3) of [[XML](#xml)].

`urn:oasis:names:tc:acal:1.0:function:string-normalize-to-lower-case`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL normalize the value by converting each upper case character to its lower case equivalent. Case mapping SHALL be done as specified for the fn:lower-case function in [[XF](#xf)] with no tailoring for particular languages or environments.

### C.3.4 Numeric Data Type Conversion Functions

The following functions convert values between the `urn:oasis:names:tc:acal:1.0:data-type:integer` and `urn:oasis:names:tc:acal:1.0:data-type:double` data types.

`urn:oasis:names:tc:acal:1.0:function:double-to-integer`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:double` and SHALL return a value of data type `urn:oasis:names:tc:acal:1.0:data-type:integer`. If the argument is NaN or infinite, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`. Otherwise the result SHALL be exactly the argument with its fractional part discarded (truncated toward zero), unless that integer is outside the supported integer interval ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)) or the implementation cannot produce it because an execution resource is exhausted, in which case the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.

`urn:oasis:names:tc:acal:1.0:function:integer-to-double`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:integer` and SHALL convert the exact value of the argument to a `urn:oasis:names:tc:acal:1.0:data-type:double` value using the round-to-nearest, ties-to-even rounding specified in [Section 8.6](#86-arithmetic-evaluation). If that conversion would produce positive or negative infinity, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`. Otherwise the result SHALL be the converted value, which MAY differ from the argument when the argument cannot be represented exactly.

### C.3.5 Logical Functions

This section contains the specification for logical functions that operate on arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:boolean`.

`urn:oasis:names:tc:acal:1.0:function:or`

: This function SHALL take zero or more arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:boolean`.

: This function returns `true` if at least one of its arguments evaluates to `true`; otherwise, the function returns `Indeterminate` if any argument evaluates to `Indeterminate`; otherwise, the function returns `false` (which applies in the case of zero arguments). The arguments may be evaluated in any order. Evaluation of the arguments MAY stop if evaluation of the remaining arguments will not change the result of the function, e.g., if any argument evaluates to `true`.

`urn:oasis:names:tc:acal:1.0:function:and`

: This function SHALL take zero or more arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:boolean`.

: This function returns `false` if at least one of its arguments evaluates to `false`; otherwise, the function returns `Indeterminate` if any argument evaluates to `Indeterminate`; otherwise, the function returns `true` (which applies in the case of zero arguments). The arguments may be evaluated in any order. Evaluation of the arguments MAY stop if evaluation of the remaining arguments will not change the result of the function, e.g., if any argument evaluates to `false`.

`urn:oasis:names:tc:acal:1.0:function:n-of`

: The first argument to this function SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:integer`. The remaining arguments (the Boolean arguments) SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The first argument specifies the minimum number of the Boolean arguments that must evaluate to `true` for the expression to be considered `true`.

: Let N be the value of the first argument and let M be the number of Boolean arguments. This function returns `Indeterminate` if N is `Indeterminate`; otherwise, the function returns `true` if N is less than or equal to 0; otherwise, the function returns `false` if N is greater than M; otherwise, the function returns `true` if at least N of the Boolean arguments evaluate to `true`; otherwise, the function returns `false` if at least (M + 1 - N) of the Boolean arguments evaluate to `false`; otherwise, the function returns `Indeterminate`.

: The first argument MUST be evaluated first. If it is not `Indeterminate` then the Boolean arguments may be evaluated in any order. Evaluation of the Boolean arguments MAY stop if evaluation of the remaining arguments will not change the result of the function, e.g., if the requirements to return `true` or `false` have been satisfied or if there are insufficient remaining Boolean arguments to satisfy the requirements to return either `true` or `false`.

: Note that this function differs from the similarly-named function in XACML [[XACML](#xacml)], which returned `Indeterminate` if N was less than zero or greater than M.

`urn:oasis:names:tc:acal:1.0:function:not`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:boolean`. This function returns `true` if the argument evaluates to `false`; otherwise, the function returns `false` if the argument evaluates to `true`; otherwise, the function returns `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:ternary-if`

: This function SHALL take three arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:boolean`. If the first argument evaluates to `true`, then the function returns the result of evaluating the second argument and the third argument need not be evaluated; otherwise, if the first argument evaluates to `false`, then the function returns the result of evaluating the third argument and the second argument need not be evaluated; otherwise, the function returns `Indeterminate`.

### C.3.6 Numeric Comparison Functions

These functions form a minimal set for comparing two numbers, yielding a Boolean result. For doubles they SHALL comply with [Section 8.6](#86-arithmetic-evaluation).

* `urn:oasis:names:tc:acal:1.0:function:integer-greater-than`

* `urn:oasis:names:tc:acal:1.0:function:integer-greater-than-or-equal`

* `urn:oasis:names:tc:acal:1.0:function:integer-less-than`

* `urn:oasis:names:tc:acal:1.0:function:integer-less-than-or-equal`

* `urn:oasis:names:tc:acal:1.0:function:double-greater-than`

* `urn:oasis:names:tc:acal:1.0:function:double-greater-than-or-equal`

* `urn:oasis:names:tc:acal:1.0:function:double-less-than`

* `urn:oasis:names:tc:acal:1.0:function:double-less-than-or-equal`

### C.3.7 Date and Time Arithmetic Functions

These functions perform arithmetic operations with date and time.

`urn:oasis:names:tc:acal:1.0:function:dateTime-add-dayTimeDuration`

: This function SHALL take two arguments, the first SHALL be of data type <!-- Line break added for the previous line to fit on a PDF page -->
`urn:oasis:names:tc:acal:1.0:data-type:dateTime` and the second SHALL be of data type <!-- Line break added for the previous line to fit on PDF page -->
`urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration`. It SHALL return a result of <!-- Line break added for the previous line to fit on a PDF page -->
`urn:oasis:names:tc:acal:1.0:data-type:dateTime`. This function SHALL return the value by adding the second argument to the first argument according to the specification of adding durations to date and time [[XS](#xs)] Appendix E.

`urn:oasis:names:tc:acal:1.0:function:dateTime-add-yearMonthDuration`

: This function SHALL take two arguments, the first SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:dateTime` and the second SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration`. It SHALL return a result of `urn:oasis:names:tc:acal:1.0:data-type:dateTime`. This function SHALL return the value by adding the second argument to the first argument according to the specification of adding durations to date and time [[XS](#xs)] Appendix E.

`urn:oasis:names:tc:acal:1.0:function:dateTime-subtract-dayTimeDuration`

: This function SHALL take two arguments, the first SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:dateTime` and the second SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration`. It SHALL return a result of `urn:oasis:names:tc:acal:1.0:data-type:dateTime`. If the second argument is a positive duration, then this function SHALL return the value by adding the corresponding negative duration, as per the specification [[XS](#xs)] Appendix E. If the second argument is a negative duration, then the result SHALL be as if the function `urn:oasis:names:tc:acal:1.0:function:dateTime-add-dayTimeDuration` had been applied to the corresponding positive duration.

`urn:oasis:names:tc:acal:1.0:function:dateTime-subtract-yearMonthDuration`

: This function SHALL take two arguments, the first SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:dateTime` and the second SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration`. It SHALL return a result of `urn:oasis:names:tc:acal:1.0:data-type:dateTime`. If the second argument is a positive duration, then this function SHALL return the value by adding the corresponding negative duration, as per the specification [[XS](#xs)] Appendix E. If the second argument is a negative duration, then the result SHALL be as if the function `urn:oasis:names:tc:acal:1.0:function:dateTime-add-yearMonthDuration` had been applied to the corresponding positive duration.

`urn:oasis:names:tc:acal:1.0:function:date-add-yearMonthDuration`

: This function SHALL take two arguments, the first SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:date` and the second SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration`. It SHALL return a result of `urn:oasis:names:tc:acal:1.0:data-type:date`. This function SHALL return the value by adding the second argument to the first argument according to the specification of adding duration to date [[XS](#xs)] Appendix E.

`urn:oasis:names:tc:acal:1.0:function:date-subtract-yearMonthDuration`

: This function SHALL take two arguments, the first SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:date` and the second SHALL be a `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration`. It SHALL return a result of `urn:oasis:names:tc:acal:1.0:data-type:date`. If the second argument is a positive duration, then this function SHALL return the value by adding the corresponding negative duration, as per the specification [[XS](#xs)] Appendix E. If the second argument is a negative duration, then the result SHALL be as if the function `urn:oasis:names:tc:acal:1.0:function:date-add-yearMonthDuration` had been applied to the corresponding positive duration.

### C.3.8 Non-numeric Comparison Functions

These functions perform comparison operations on two arguments of non-numerical types.

`urn:oasis:names:tc:acal:1.0:function:string-greater-than`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is lexicographically strictly greater than the second argument. Otherwise, it SHALL return `false`. The comparison SHALL use Unicode codepoint collation, as defined for the identifier `https://www.w3.org/2005/xpath-functions/collation/codepoint/` by [[XF](#xf)].

`urn:oasis:names:tc:acal:1.0:function:string-greater-than-or-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is lexicographically greater than or equal to the second argument. Otherwise, it SHALL return `false`. The comparison SHALL use Unicode codepoint collation, as defined for the identifier `https://www.w3.org/2005/xpath-functions/collation/codepoint/` by [[XF](#xf)].

`urn:oasis:names:tc:acal:1.0:function:string-less-than`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is lexicographically strictly less than the second argument. Otherwise, it SHALL return `false`. The comparison SHALL use Unicode codepoint collation, as defined for the identifier `https://www.w3.org/2005/xpath-functions/collation/codepoint/` by [[XF](#xf)].

`urn:oasis:names:tc:acal:1.0:function:string-less-than-or-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is lexicographically less than or equal to the second argument. Otherwise, it SHALL return `false`. The comparison SHALL use Unicode codepoint collation, as defined for the identifier `https://www.w3.org/2005/xpath-functions/collation/codepoint/` by [[XF](#xf)].

`urn:oasis:names:tc:acal:1.0:function:time-greater-than`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:time` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is greater than the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#time` by [[XS](#xs)] Part 2, Section 3.3.8. Otherwise, it SHALL return `false`. Note: it is illegal to compare a time that includes a time-zone value with one that does not. In such cases, the `time-in-range` function SHOULD be used.

`urn:oasis:names:tc:acal:1.0:function:time-greater-than-or-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:time` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is greater than or equal to the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#time` by [[XS](#xs)] Part 2, Section 3.3.8. Otherwise, it SHALL return `false`. Note: it is illegal to compare a time that includes a time-zone value with one that does not. In such cases, the `time-in-range` function SHOULD be used.

`urn:oasis:names:tc:acal:1.0:function:time-less-than`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:time` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is less than the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#time` by [[XS](#xs)] Part 2, Section 3.3.8. Otherwise, it SHALL return `false`. Note: it is illegal to compare a time that includes a time-zone value with one that does not. In such cases, the `time-in-range` function SHOULD be used.

`urn:oasis:names:tc:acal:1.0:function:time-less-than-or-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:time` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is less than or equal to the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#time` by [[XS](#xs)] Part 2, Section 3.3.8. Otherwise, it SHALL return `false`. Note: it is illegal to compare a time that includes a time-zone value with one that does not. In such cases, the `time-in-range` function SHOULD be used.

`urn:oasis:names:tc:acal:1.0:function:time-in-range`

: This function SHALL take three arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:time` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if the first argument falls in the range defined inclusively by the second and third arguments. Otherwise, it SHALL return `false`. Regardless of its value, the third argument SHALL be interpreted as a time that is equal to, or later than by less than twenty-four hours, the second argument. If no time zone is provided for the first argument, it SHALL use the default time zone at the context handler. If no time zone is provided for the second or third arguments, then they SHALL use the time zone from the first argument.

`urn:oasis:names:tc:acal:1.0:function:dateTime-greater-than`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:dateTime` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is greater than the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#dateTime` by [[XS](#xs)] Part 2, Section 3.3.7. Otherwise, it SHALL return `false`. Note: if a `dateTime` value does not include a time-zone value, this function SHALL resolve it using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; see [Annex C.2](#c2-data-types) for the resulting cross-PDP hazard and the recommendation that every value carry an explicit time zone.

`urn:oasis:names:tc:acal:1.0:function:dateTime-greater-than-or-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:dateTime` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is greater than or equal to the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#dateTime` by [[XS](#xs)] Part 2, Section 3.3.7. Otherwise, it SHALL return `false`. Note: if a `dateTime` value does not include a time-zone value, this function SHALL resolve it using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; see [Annex C.2](#c2-data-types) for the resulting cross-PDP hazard and the recommendation that every value carry an explicit time zone.

`urn:oasis:names:tc:acal:1.0:function:dateTime-less-than`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:dateTime` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is less than the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#dateTime` by [[XS](#xs)] Part 2, Section 3.3.7. Otherwise, it SHALL return `false`. Note: if a `dateTime` value does not include a time-zone value, this function SHALL resolve it using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; see [Annex C.2](#c2-data-types) for the resulting cross-PDP hazard and the recommendation that every value carry an explicit time zone.

`urn:oasis:names:tc:acal:1.0:function:dateTime-less-than-or-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:dateTime` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is less than or equal to the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#dateTime` by [[XS](#xs)] Part 2, Section 3.3.7. Otherwise, it SHALL return `false`. Note: if a `dateTime` value does not include a time-zone value, this function SHALL resolve it using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; see [Annex C.2](#c2-data-types) for the resulting cross-PDP hazard and the recommendation that every value carry an explicit time zone.

`urn:oasis:names:tc:acal:1.0:function:date-greater-than`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:date` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is greater than the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#date` by [[XS](#xs)] Part 2, Section 3.3.9. Otherwise, it SHALL return `false`. Note: if a `date` value does not include a time-zone value, this function SHALL resolve it using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; see [Annex C.2](#c2-data-types) for the resulting cross-PDP hazard and the recommendation that every value carry an explicit time zone.

`urn:oasis:names:tc:acal:1.0:function:date-greater-than-or-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:date` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is greater than or equal to the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#date` by [[XS](#xs)] Part 2, Section 3.3.9. Otherwise, it SHALL return `false`. Note: if a `date` value does not include a time-zone value, this function SHALL resolve it using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; see [Annex C.2](#c2-data-types) for the resulting cross-PDP hazard and the recommendation that every value carry an explicit time zone.

`urn:oasis:names:tc:acal:1.0:function:date-less-than`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:date` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is less than the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#date` by [[XS](#xs)] Part 2, Section 3.3.9. Otherwise, it SHALL return `false`. Note: if a `date` value does not include a time-zone value, this function SHALL resolve it using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; see [Annex C.2](#c2-data-types) for the resulting cross-PDP hazard and the recommendation that every value carry an explicit time zone.

`urn:oasis:names:tc:acal:1.0:function:date-less-than-or-equal`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:date` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is less than or equal to the second argument according to the order relation specified for `https://www.w3.org/2001/XMLSchema#date` by [[XS](#xs)] Part 2, Section 3.3.9. Otherwise, it SHALL return `false`. Note: if a `date` value does not include a time-zone value, this function SHALL resolve it using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; see [Annex C.2](#c2-data-types) for the resulting cross-PDP hazard and the recommendation that every value carry an explicit time zone.

### C.3.9 String Functions

The following functions operate on strings and convert to and from other data types.

`urn:oasis:names:tc:acal:1.0:function:string-concatenate`

: This function SHALL take two or more arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the concatenation, in order, of the arguments.

`urn:oasis:names:tc:acal:1.0:function:boolean-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The result SHALL be the string converted to a Boolean. If the argument is not a valid lexical representation of a Boolean, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-boolean`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:boolean`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the Boolean converted to a string in the canonical form specified in [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:integer-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:integer`. The result SHALL be the string converted to an integer. If the argument is not a valid lexical representation of an integer, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`. If the argument is a valid lexical representation of an integer, then the result SHALL be exactly that integer, unless that integer is outside the supported integer interval ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)) or the implementation cannot produce it because an execution resource is exhausted, in which case the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-integer`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:integer`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the integer converted to a string in the canonical form specified in [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:double-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:double`. The result SHALL be the string converted to a double. If the argument is not a valid lexical representation of a double, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-double`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:double`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the double converted to a string in the canonical form specified in [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:time-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:time`. The result SHALL be the string converted to a time. If the argument is not a valid lexical representation of a time, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-time`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:time`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the time converted to a string in the canonical form specified in [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:date-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:date`. The result SHALL be the string converted to a date. If the argument is not a valid lexical representation of a date, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-date`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:date`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the date converted to a string in the canonical form specified in [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:dateTime-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:dateTime`. The result SHALL be the string converted to a dateTime. If the argument is not a valid lexical representation of a dateTime, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-dateTime`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:dateTime`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the dateTime converted to a string in the canonical form specified in [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:anyURI-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:anyURI`. The result SHALL be the URI constructed by converting the argument to a URI. If the argument is not a valid lexical representation of a URI, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-anyURI`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the URI converted to a string in the form it was originally represented.

`urn:oasis:names:tc:acal:1.0:function:dayTimeDuration-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration`. The result SHALL be the string converted to a dayTimeDuration. If the argument is not a valid lexical representation of a dayTimeDuration, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-dayTimeDuration`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the dayTimeDuration converted to a string in the canonical form specified in [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:yearMonthDuration-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration`. The result SHALL be the string converted to a yearMonthDuration. If the argument is not a valid lexical representation of a yearMonthDuration, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-yearMonthDuration`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the yearMonthDuration converted to a string in the canonical form specified in [[XS](#xs)].

`urn:oasis:names:tc:acal:1.0:function:x500Name-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:x500Name`. The result SHALL be the string converted to an x500Name. If the argument is not a valid lexical representation of a X500Name, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-x500Name`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:x500Name`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the x500Name converted to a string in the form it was originally represented.

`urn:oasis:names:tc:acal:1.0:function:rfc822Name-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`. The result SHALL be the string converted to an rfc822Name. If the argument is not a valid lexical representation of an rfc822Name, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-rfc822Name`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the rfc822Name converted to a string in the form it was originally represented.

`urn:oasis:names:tc:acal:1.0:function:ipAddress-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:ipAddress`. The result SHALL be the string converted to an ipAddress. If the argument is not a valid lexical representation of an ipAddress, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-ipAddress`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:ipAddress`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the ipAddress converted to a string in the form it was originally represented.

`urn:oasis:names:tc:acal:1.0:function:dnsName-from-string`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:dnsName`. The result SHALL be the string converted to a dnsName. If the argument is not a valid lexical representation of a dnsName, then the result SHALL be `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

`urn:oasis:names:tc:acal:1.0:function:string-from-dnsName`

: This function SHALL take one argument of data type `urn:oasis:names:tc:acal:1.0:data-type:dnsName`, and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the dnsName converted to a string in the form it was originally represented.

`urn:oasis:names:tc:acal:1.0:function:string-starts-with`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The result SHALL be `true` if the first string begins with the second string, and `false` otherwise. Equality testing SHALL be done as defined for `urn:oasis:names:tc:acal:1.0:function:string-equal`.

: Note that the arguments to this function are swapped compared to the similarly-named function in XACML [[XACML](#xacml)].

`urn:oasis:names:tc:acal:1.0:function:anyURI-starts-with`

: This function SHALL take a first argument of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI` and a second argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The result SHALL be `true` if the URI converted to a string with `urn:oasis:names:tc:acal:1.0:function:string-from-anyURI` begins with the string, and `false` otherwise. Equality testing SHALL be done as defined for `urn:oasis:names:tc:acal:1.0:function:string-equal`.

: Note that the arguments to this function are swapped compared to the similarly-named function in XACML [[XACML](#xacml)].

`urn:oasis:names:tc:acal:1.0:function:string-ends-with`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The result SHALL be `true` if the first string ends with the second string, and `false` otherwise. Equality testing SHALL be done as defined for `urn:oasis:names:tc:acal:1.0:function:string-equal`.

: Note that the arguments to this function are swapped compared to the similarly-named function in XACML [[XACML](#xacml)].

`urn:oasis:names:tc:acal:1.0:function:anyURI-ends-with`

: This function SHALL take a first argument of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI` and a second argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The result SHALL be `true` if the URI converted to a string with `urn:oasis:names:tc:acal:1.0:function:string-from-anyURI` ends with the string, and `false` otherwise. Equality testing SHALL be done as defined for `urn:oasis:names:tc:acal:1.0:function:string-equal`.

: Note that the arguments to this function are swapped compared to the similarly-named function in XACML [[XACML](#xacml)].

`urn:oasis:names:tc:acal:1.0:function:string-contains`

: This function SHALL take two arguments of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The result SHALL be `true` if the first string contains the second string, and `false` otherwise. Equality testing SHALL be done as defined for `urn:oasis:names:tc:acal:1.0:function:string-equal`.

: Note that the arguments to this function are swapped compared to the similarly-named function in XACML [[XACML](#xacml)].

`urn:oasis:names:tc:acal:1.0:function:anyURI-contains`

: This function SHALL take a first argument of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI` and a second argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The result SHALL be `true` if the URI converted to a string with `urn:oasis:names:tc:acal:1.0:function:string-from-anyURI` contains the string, and `false` otherwise. Equality testing SHALL be done as defined for `urn:oasis:names:tc:acal:1.0:function:string-equal`.

: Note that the arguments to this function are swapped compared to the similarly-named function in XACML [[XACML](#xacml)].

`urn:oasis:names:tc:acal:1.0:function:string-substring`

: This function SHALL take a first argument of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and a second and a third argument of type `urn:oasis:names:tc:acal:1.0:data-type:integer` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the substring of the first argument beginning at the position given by the second argument and ending at the position before the position given by the third argument. The first character of the string has position zero. The negative integer value -1 given for the third argument indicates the end of the string. If the second or third arguments are out of bounds, then the function MUST evaluate to `Indeterminate` with a status code of `urn:oasis:names:tc:acal:1.0:status:processing-error`.

`urn:oasis:names:tc:acal:1.0:function:anyURI-substring`

: This function SHALL take a first argument of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI` and a second and a third argument of type `urn:oasis:names:tc:acal:1.0:data-type:integer` and SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:string`. The result SHALL be the substring of the first argument converted to a string with `urn:oasis:names:tc:acal:1.0:function:string-from-anyURI` beginning at the position given by the second argument and ending at the position before the position given by the third argument. The first character of the URI converted to a string has position zero. The negative integer value -1 given for the third argument indicates the end of the string. If the second or third arguments are out of bounds, then the function MUST evaluate to `Indeterminate` with a status code of `urn:oasis:names:tc:acal:1.0:status:processing-error`. If the resulting substring is not syntactically a valid URI, then the function MUST evaluate to `Indeterminate` with a status code of `urn:oasis:names:tc:acal:1.0:status:processing-error`.

### C.3.10 Bag Functions

These functions operate on a bag of `type` values, where `type` is one of the ACAL data types, and x.x is a version of XACML where the function has been defined. Some additional conditions defined for each function below SHALL cause the expression to evaluate to `Indeterminate` if not satisfied.

`urn:oasis:names:tc:acal:1.0:function:type-one-and-only`

: This function SHALL take a bag of `type` values as an argument and SHALL return a value of `type`. It SHALL return the only value in the bag. If the bag does not have one and only one value, then the expression SHALL evaluate to `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:type-bag-size`

: This function SHALL take a bag of `type` values as an argument and SHALL return an <!-- Line break added for the previous line to fit on a PDF page -->
`urn:oasis:names:tc:acal:1.0:data-type:integer` indicating the number of values in the bag.

`urn:oasis:names:tc:acal:1.0:function:type-is-in`

: This function SHALL take an argument of `type` as the first argument and a bag of `type` values as the second argument and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL evaluate to `true` if and only if the first argument matches by <!-- Line break added for the previous line to fit on a PDF page -->
`urn:oasis:names:tc:acal:1.0:function:type-equal` any value in the bag. Otherwise, it SHALL return `false`.

`urn:oasis:names:tc:acal:1.0:function:type-bag`

: This function SHALL take any number of arguments of `type` and return a bag of `type` values containing the values of the arguments. An application of this function to zero arguments SHALL produce an empty bag of the specified data type.

`urn:oasis:names:tc:acal:1.0:function:is-empty`

: This function SHALL take a single bag argument of any data type and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL evaluate to `true` if and only if the bag argument has no values.

`urn:oasis:names:tc:acal:1.0:function:is-not-empty`

: This function SHALL take a single bag argument of any data type and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL evaluate to `true` if and only if the bag argument has at least one value.

### C.3.11 Set Functions

These functions operate on bags mimicking sets by eliminating duplicate values from the bag.

`urn:oasis:names:tc:acal:1.0:function:type-intersection`

: This function SHALL take two arguments that are both a bag of `type` values. It SHALL return a bag of `type` values such that it contains only values that are common between the two bags, which is determined by `urn:oasis:names:tc:acal:1.0:function:type-equal`. Duplicates, as determined by `urn:oasis:names:tc:acal:1.0:function:type-equal`, SHALL NOT exist in the result.

`urn:oasis:names:tc:acal:1.0:function:type-at-least-one-member-of`

: This function SHALL take two arguments that are both a bag of `type` values. It SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The function SHALL evaluate to `true` if and only if at least one value of the first argument is contained in the second argument as determined by `urn:oasis:names:tc:acal:1.0:function:type-is-in`.

`urn:oasis:names:tc:acal:1.0:function:type-union`

: This function SHALL take two or more arguments that are both a bag of `type` values. The expression SHALL return a bag of `type` such that it contains all the values of all the argument bags. Duplicates, as determined by `urn:oasis:names:tc:acal:1.0:function:type-equal`, SHALL NOT exist in the result.

`urn:oasis:names:tc:acal:1.0:function:type-subset`

: This function SHALL take two arguments that are both a bag of `type` values. It SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the first argument is a subset of the second argument. Each argument SHALL be considered to have had its duplicates removed, as determined by `urn:oasis:names:tc:acal:1.0:function:type-equal`, before the subset calculation.

`urn:oasis:names:tc:acal:1.0:function:type-set-equals`

: This function SHALL take two arguments that are both a bag of `type` values. It SHALL return a `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return the result of applying `urn:oasis:names:tc:acal:1.0:function:and` to the application of <!-- Line break added for the previous line to fit on a PDF page -->
`urn:oasis:names:tc:acal:1.0:function:type-subset` to the first and second arguments and the application of `urn:oasis:names:tc:acal:1.0:function:type-subset` to the second and first arguments.

### C.3.12 Higher-order Bag Functions

This section describes functions in ACAL that perform operations on bags such that functions may be applied to the bags in general.

Examples in this section are presented in both the XML and JSON representations and assume the use of the standardized short identifier set `urn:oasis:names:tc:acal:1.0:core:identifiers`.

* `urn:oasis:names:tc:acal:1.0:function:any-of`

  This function applies a Boolean function between single values and a bag of values, and SHALL return `true` if and only if the function is `true` for at least one value in the bag.

  This function SHALL take n+1 arguments, where n is one or greater. The first argument SHALL be a `FunctionType` object that names a Boolean function that takes n single value arguments. Under the remaining n arguments, n-1 arguments SHALL be single values and one SHALL be a bag of values. The expression SHALL be evaluated as if the function named in the `FunctionType` object were applied to the n-1 single value arguments and each value in the bag argument and the results are combined with `urn:oasis:names:tc:acal:1.0:function:or`.

  For example, the following expression evaluates to `true`:

  ```xml
  <Apply FunctionId="any-of">
    <Function Id="string-equal"/>
    <Value>Paul</Value>
    <Apply FunctionId="string-bag">
      <Value>John</Value>
      <Value>Paul</Value>
      <Value>George</Value>
      <Value>Ringo</Value>
    </Apply>
  </Apply>
  ```

  ```json
  "Apply":{
    "FunctionId":"any-of",
    "Argument":[
      { "Function":{ "Id":"string-equal" } },
      { "Value": "Paul" },
      { "Apply":{
        "FunctionId":"string-bag",
        "Argument":[
          { "Value": "John" },
          { "Value": "Paul" },
          { "Value": "George" },
          { "Value": "Ringo" }
        ]
      }}
    ]
  }
  ```

<span> </span>
:  This expression is `true` because the first argument is equal to at least one of the values in the bag, according to the function.

* `urn:oasis:names:tc:acal:1.0:function:all-of`

  This function applies a Boolean function between single values and a bag of values, and returns `true` if and only if the function is `true` for every value in the bag.

  This function SHALL take n+1 arguments, where n is one or greater. The first argument SHALL be a `FunctionType` object that names a Boolean function that takes n single value arguments. Under the remaining n arguments, n-1 arguments SHALL be single values and one SHALL be a bag of values. The expression SHALL be evaluated as if the function named in the `FunctionType` object were applied to the n-1 single-value arguments and each value of the bag argument and the results are combined with `urn:oasis:names:tc:acal:1.0:function:and`.

  For example, the following expression evaluates to `true`:

  ```xml
  <Apply FunctionId="all-of">
    <Function Id="integer-greater-than"/>
    <Value>10</Value>
    <Apply FunctionId="integer-bag">
      <Value>9</Value>
      <Value>3</Value>
      <Value>4</Value>
      <Value>2</Value>
    </Apply>
  </Apply>
  ```

  ```json
  "Apply":{
    "FunctionId":"all-of",
    "Argument":[
      { "Function":{ "Id":"integer-greater-than" } },
      { "Value": 10 },
      { "Apply":{
        "FunctionId":"integer-bag",
        "Argument":[
          { "Value": 9 },
          { "Value": 3 },
          { "Value": 4 },
          { "Value": 2 }
        ]
      }}
    ]
  }
  ```

<span> </span>
:  The expression is `true` because the first argument (10) is greater than all of the values in the bag (9, 3, 4 and 2).

* `urn:oasis:names:tc:acal:1.0:function:any-of-any`

  This function applies a Boolean function on each tuple from the cross product on all bag arguments, and returns `true` if and only if the function is `true` for at least one inside-function call.

This function SHALL take n+1 arguments, where n is one or greater. The first argument SHALL be a `FunctionType` object that names a Boolean function that takes n single-value arguments. The remaining arguments are either single values or bags of values. The expression SHALL be evaluated as if the function named in the `FunctionType` object was applied between every tuple of the cross product on all bags and single values, and the results were combined using `urn:oasis:names:tc:acal:1.0:function:or`. The semantics are that the result of the expression SHALL be `true` if and only if the applied function is `true` for at least one function call on the tuples from the bags and single values.

  For example, the following expression evaluates to `true`:

  ```xml
  <Apply FunctionId="any-of-any">
    <Function Id="string-equal"/>
    <Apply FunctionId="string-bag">
      <Value>Ringo</Value>
      <Value>Mary</Value>
    </Apply>
    <Apply FunctionId="string-bag">
      <Value>John</Value>
      <Value>Paul</Value>
      <Value>George</Value>
      <Value>Ringo</Value>
    </Apply>
  </Apply>
  ```

  ```json
  "Apply":{
    "FunctionId":"any-of-any",
    "Argument":[
      { "Function":{ "Id":"string-equal" } },
      { "Apply":{
        "FunctionId":"string-bag",
        "Argument":[
          { "Value": "Ringo" },
          { "Value": "Mary" }
        ]
      }},
      { "Apply":{
        "FunctionId":"string-bag",
        "Argument":[
          { "Value": "John" },
          { "Value": "Paul" },
          { "Value": "George" },
          { "Value": "Ringo" }
        ]
      }}
    ]
  }
  ```

<span> </span>
:  The expression is `true` because at least one of the values of the first bag, namely `Ringo`, is equal to at least one of the values of the second bag.

* `urn:oasis:names:tc:acal:1.0:function:all-of-any`

  This function applies a Boolean function between the values of two bags. The expression SHALL be `true` if and only if the supplied function is `true` between each value of the first bag and any value of the second bag.

  This function SHALL take three arguments. The first argument SHALL be a `FunctionType` object that names a Boolean function that takes two single-value arguments. The second argument SHALL be a bag of values. The third argument SHALL be a bag of values. The expression SHALL be evaluated as if the `urn:oasis:names:tc:acal:1.0:function:any-of` function had been applied to each value of the first bag and the whole of the second bag using the supplied function, and the results were then combined using `urn:oasis:names:tc:acal:1.0:function:and`.

  For example, the following expression evaluates to `true`:

  ```xml
  <Apply FunctionId="all-of-any">
    <Function Id="integer-greater-than"/>
    <Apply FunctionId="integer-bag">
      <Value>10</Value>
      <Value>20</Value>
    </Apply>
    <Apply FunctionId="integer-bag">
      <Value>1</Value>
      <Value>3</Value>
      <Value>5</Value>
      <Value>19</Value>
    </Apply>
  </Apply>
  ```

  ```json
  "Apply":{
    "FunctionId":"all-of-any",
    "Argument":[
      { "Function":{ "Id":"integer-greater-than" } },
      { "Apply":{
        "FunctionId":"integer-bag",
        "Argument":[
          { "Value": 10 },
          { "Value": 20 }
        ]
      }},
      { "Apply":{
        "FunctionId":"integer-bag",
        "Argument":[
          { "Value": 1 },
          { "Value": 3 },
          { "Value": 5 },
          { "Value": 19 }
        ]
      }}
    ]
  }
  ```

<span> </span>
:  The expression is `true` because each of the values of the first bag is greater than at least one of the values of the second bag.

* `urn:oasis:names:tc:acal:1.0:function:any-of-all`

  This function applies a Boolean function between the values of two bags. The expression SHALL be `true` if and only if the supplied function is `true` between each value of the second bag and any value of the first bag.

  This function SHALL take three arguments. The first argument SHALL be a `FunctionType` object that names a Boolean function that takes two single-value arguments. The second argument SHALL be a bag of values. The third argument SHALL be a bag of values. The expression SHALL be evaluated as if the `urn:oasis:names:tc:acal:1.0:function:any-of` function had been applied to each value of the second bag and the whole of the first bag using the supplied function, and the results were then combined using `urn:oasis:names:tc:acal:1.0:function:and`.

  For example, the following expression evaluates to `true`:

  ```xml
  <Apply FunctionId="any-of-all">
    <Function Id="integer-greater-than"/>
    <Apply FunctionId="integer-bag">
      <Value>3</Value>
      <Value>5</Value>
    </Apply>
    <Apply FunctionId="integer-bag">
      <Value>1</Value>
      <Value>2</Value>
      <Value>3</Value>
      <Value>4</Value>
    </Apply>
  </Apply>
  ```

  ```json
  "Apply":{
    "FunctionId":"any-of-all",
    "Argument":[
      { "Function":{ "Id":"integer-greater-than" } },
      { "Apply":{
        "FunctionId":"integer-bag",
        "Argument":[
          { "Value": 3 },
          { "Value": 5 }
        ]
      }},
      { "Apply":{
        "FunctionId":"integer-bag",
        "Argument":[
          { "Value": 1 },
          { "Value": 2 },
          { "Value": 3 },
          { "Value": 4 }
        ]
      }}
    ]
  }
  ```

<span> </span>
:  The expression is `true` because, for all of the values in the second bag, there is a value in the first bag that is greater.

* `urn:oasis:names:tc:acal:1.0:function:all-of-all`

  This function applies a Boolean function between the values of two bags. The expression SHALL be `true` if and only if the supplied function is `true` between each and every value of the first bag collectively against all the values of the second bag.

This function SHALL take three arguments. The first argument SHALL be a `FunctionType` object that names a Boolean function that takes two single-value arguments. The second argument SHALL be a bag of values. The third argument SHALL be a bag of values. The expression is evaluated as if the function named in the `FunctionType` object were applied between every value in the second argument and every value in the third argument and the results were combined using `urn:oasis:names:tc:acal:1.0:function:and`. The semantics are that the result of the expression is `true` if and only if the applied function is `true` for all the values of the first bag compared to all the values of the second bag.

  For example, the following expression evaluates to `true`:

  ```xml
  <Apply FunctionId="all-of-all">
    <Function Id="integer-greater-than"/>
    <Apply FunctionId="integer-bag">
      <Value>6</Value>
      <Value>5</Value>
    </Apply>
    <Apply FunctionId="integer-bag">
      <Value>1</Value>
      <Value>2</Value>
      <Value>3</Value>
      <Value>4</Value>
    </Apply>
  </Apply>
  ```

  ```json
  "Apply":{
    "FunctionId":"all-of-all",
    "Argument":[
      { "Function":{ "Id":"integer-greater-than" } },
      { "Apply":{
        "FunctionId":"integer-bag",
        "Argument":[
          { "Value":6 },
          { "Value":5 }
        ]
      }},
      { "Apply":{
        "FunctionId":"integer-bag",
        "Argument":[
          { "Value":1 },
          { "Value":2 },
          { "Value":3 },
          { "Value":4 }
        ]
      }}
    ]
  }
  ```

<span> </span>
:  The expression is `true` because all values of the first bag, i.e., `5` and `6`, are each greater than all of the integer values `1`, `2`, `3`, `4` of the second bag.

* `urn:oasis:names:tc:acal:1.0:function:map`

  This function converts a bag of values to another bag of values.

  This function SHALL take n+1 arguments, where n is one or greater. The first argument SHALL be a `FunctionType` object naming a function that takes n single-value arguments and returns a single value. Under the remaining n arguments, n-1 arguments SHALL be single values and one SHALL be a bag of values. The expression SHALL be evaluated as if the function named in the `FunctionType` object were applied to the n-1 single-value arguments and each value in the bag argument and resulting in a bag of the converted values. The result SHALL be a bag of the data type that is returned by the function named in the `FunctionType` object.

  For example, the following expression,

  ```xml
  <Apply FunctionId="map">
    <Function Id="string-normalize-to-lower-case"/>
    <Apply FunctionId="string-bag">
      <Value>Hello</Value>
      <Value>World!</Value>
    </Apply>
  </Apply>
  ```

  ```json
  "Apply":{
    "FunctionId":"map",
    "Argument":[
      { "Function":{ "Id":"string-normalize-to-lower-case" } },
      { "Apply":{
        "FunctionId":"string-bag",
        "Argument":[
          { "Value": "Hello" },
          { "Value": "World!" }
        ]
      }}
    ]
  }
  ```

<span> </span>
:  evaluates to a bag containing `hello` and `world!`.

### C.3.13 Regular-Expression-Based Functions

These functions operate on various types using regular expressions and evaluate to <!-- Line break added for the previous line to fit on a PDF page -->
`urn:oasis:names:tc:acal:1.0:data-type:boolean`.

Note that the arguments to these functions are swapped compared to the similarly-named functions in XACML [[XACML](#xacml)].

* `urn:oasis:names:tc:acal:1.0:function:string-regexp-match`

This function decides a regular expression match. It SHALL take two arguments of <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return an
  `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The first argument SHALL be a general string and the second argument SHALL be a regular expression. The function specification SHALL be that of the `fn:matches` function [[XF](#xf)] Section 5.6.3.

* `urn:oasis:names:tc:acal:1.0:function:anyURI-regexp-match`

  This function decides a regular expression match. It SHALL take two arguments; the first is of type `urn:oasis:names:tc:acal:1.0:data-type:anyURI` and the second is of type <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:string`. It SHALL return an <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The first argument SHALL be a URI and the second argument SHALL be a regular expression. The function SHALL convert the first argument to type `urn:oasis:names:tc:acal:1.0:data-type:string` with <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-from-anyURI`, then apply <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-regexp-match`.

* `urn:oasis:names:tc:acal:1.0:function:ipAddress-regexp-match`

  This function decides a regular expression match. It SHALL take two arguments; the first is of type `urn:oasis:names:tc:acal:1.0:data-type:ipAddress` and the second is of type <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:string`. It SHALL return an <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The first argument SHALL be an IPv4 or IPv6 address and the second argument SHALL be a regular expression. The function SHALL convert the first argument to type `urn:oasis:names:tc:acal:1.0:data-type:string` with <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-from-ipAddress`, then apply <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-regexp-match`.

* `urn:oasis:names:tc:acal:1.0:function:dnsName-regexp-match`

  This function decides a regular expression match. It SHALL take two arguments; the first is of type `urn:oasis:names:tc:acal:1.0:data-type:dnsName` and the second is of type <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:string`. It SHALL return an <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The first argument SHALL be a DNS name and the second argument SHALL be a regular expression. The function SHALL convert the first argument to type `urn:oasis:names:tc:acal:1.0:data-type:string` with `urn:oasis:names:tc:acal:1.0:function:string-from-dnsName`, then apply <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-regexp-match`.

* `urn:oasis:names:tc:acal:1.0:function:rfc822Name-regexp-match`

  This function decides a regular expression match. It SHALL take two arguments; the first is of type `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name` and the second is of type <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:string`. It SHALL return an <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The first argument SHALL be an RFC 822 name and the second argument SHALL be a regular expression. The function SHALL convert the first argument to type `urn:oasis:names:tc:acal:1.0:data-type:string` with <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-from-rfc822Name`, then apply <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-regexp-match`.

* `urn:oasis:names:tc:acal:1.0:function:x500Name-regexp-match`

  This function decides a regular expression match. It SHALL take two arguments; the first is of type `urn:oasis:names:tc:acal:1.0:data-type:x500Name` and the second is of type <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:string`. It SHALL return an <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:data-type:boolean`. The first argument SHALL be an X.500 directory name and the second argument SHALL be a regular expression. The function SHALL convert the first argument to type `urn:oasis:names:tc:acal:1.0:data-type:string` with <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-from-x500Name`, then apply <!-- Line break added for the previous line to fit on a PDF page -->
  `urn:oasis:names:tc:acal:1.0:function:string-regexp-match`.

### C.3.14 Aggregate Functions

These functions perform a calculation on a bag of values to produce a summary result as a single value.

`urn:oasis:names:tc:acal:1.0:function:string-minimum`

: This function returns the lexicographically least value in a bag of strings. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:string` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:string` data type. If the first argument evaluates to a bag with at least one value then the function SHALL return the lexicographically least value in the bag, which may occur more than once. The comparison SHALL use Unicode codepoint collation, as defined for the identifier `https://www.w3.org/2005/xpath-functions/collation/codepoint/` by [[XF](#xf)]. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:string-maximum`

: This function returns the lexicographically greatest value in a bag of strings. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:string` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:string` data type. If the first argument evaluates to a bag with at least one value then the function SHALL return the lexicographically greatest value in the bag, which may occur more than once. The comparison SHALL use Unicode codepoint collation, as defined for the identifier `https://www.w3.org/2005/xpath-functions/collation/codepoint/` by [[XF](#xf)]. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:integer-minimum`

: This function returns the least integer value in a bag of integers. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:integer` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:integer` data type. If the first argument evaluates to a bag with at least one value then the function SHALL return the least integer value in the bag, which may occur more than once. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:integer-maximum`

: This function returns the greatest integer value in a bag of integers. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:integer` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:integer` data type. If the first argument evaluates to a bag with at least one value then the function SHALL return the greatest integer value in the bag, which may occur more than once. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:integer-sum`

: This function returns the sum of a bag of integers. The function takes one argument, which MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:integer` data type. If the argument evaluates to a bag with at least one value then the function SHALL return the sum of the values in the bag as a value of the `urn:oasis:names:tc:acal:1.0:data-type:integer` data type. If the argument evaluates to an empty bag, then the function SHALL return zero as an `urn:oasis:names:tc:acal:1.0:data-type:integer` value.

`urn:oasis:names:tc:acal:1.0:function:integer-average`

: This function returns the average of a bag of integers. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:integer` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. If the first argument evaluates to a bag with at least one value then the function SHALL return the average of the values in the bag as a value of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:double-minimum`

: This function returns the least numeric value in a bag of floating-point numbers. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. If the first argument evaluates to a bag with at least one value then the function SHALL return the least numeric value in the bag, which may occur more than once. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:double-maximum`

: This function returns the greatest numeric value in a bag of floating-point numbers. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. If the first argument evaluates to a bag with at least one value then the function SHALL return the greatest numeric value in the bag, which may occur more than once. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:double-sum`

: This function returns the sum of a bag of floating-point numbers. The function takes one argument, which MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. If the argument evaluates to a bag with at least one value then the function SHALL return the sum of the values in the bag as a value of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. If the argument evaluates to an empty bag, then the function SHALL return zero as an `urn:oasis:names:tc:acal:1.0:data-type:double` value.

`urn:oasis:names:tc:acal:1.0:function:double-average`

: This function returns the average of a bag of floating-point numbers. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. If the first argument evaluates to a bag with at least one value then the function SHALL return the average of the values in the bag as a value of the `urn:oasis:names:tc:acal:1.0:data-type:double` data type. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:dateTime-minimum`

: This function returns the least dateTime in a bag of dateTime values. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:dateTime` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:dateTime` data type. If a dateTime value does not include a time-zone, then the time-zone SHALL be assumed to be `+14:00`. If such a value is determined to be the least dateTime then it is returned as is, without a time-zone. If the first argument evaluates to a bag with at least one value then the function SHALL return the least value in the bag, which may occur more than once. The comparison SHALL use the order relation specified for `https://www.w3.org/2001/XMLSchema#dateTime` by [[XS](#xs)] Part 2, Section 3.3.7. If multiple dateTime values are equally least, then a value with a time-zone MUST be preferred over one without. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:dateTime-maximum`

: This function returns the greatest dateTime in a bag of dateTime values. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:dateTime` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:dateTime` data type. If a dateTime value does not include a time-zone, then the time-zone SHALL be assumed to be `-14:00`. If such a value is determined to be the greatest dateTime then it is returned as is, without a time-zone. If the first argument evaluates to a bag with at least one value then the function SHALL return the greatest value in the bag, which may occur more than once. The comparison SHALL use the order relation specified for `https://www.w3.org/2001/XMLSchema#dateTime` by [[XS](#xs)] Part 2, Section 3.3.7. If multiple dateTime values are equally greatest, then a value with a time-zone MUST be preferred over one without. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:date-minimum`

: This function returns the least date in a bag of date values. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:date` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:date` data type. If a date value does not include a time-zone, then the time-zone SHALL be assumed to be `+14:00`. If such a value is determined to be the least date then it is returned as is, without a time-zone. If the first argument evaluates to a bag with at least one value then the function SHALL return the least value in the bag, which may occur more than once. The comparison SHALL use the order relation specified for `https://www.w3.org/2001/XMLSchema#date` by [[XS](#xs)] Part 2, Section 3.3.9. If multiple date values are equally least, then a value with a time-zone MUST be preferred over one without. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

`urn:oasis:names:tc:acal:1.0:function:date-maximum`

: This function returns the greatest date in a bag of date values. The function takes one or two arguments. The first argument MUST be a bag of the `urn:oasis:names:tc:acal:1.0:data-type:date` data type. The second argument, if present, MUST be a value of the `urn:oasis:names:tc:acal:1.0:data-type:date` data type. If a date value does not include a time-zone, then the time-zone SHALL be assumed to be `-14:00`. If such a value is determined to be the greatest date then it is returned as is, without a time-zone. If the first argument evaluates to a bag with at least one value then the function SHALL return the greatest value in the bag, which may occur more than once. The comparison SHALL use the order relation specified for `https://www.w3.org/2001/XMLSchema#date` by [[XS](#xs)] Part 2, Section 3.3.9. If multiple date values are equally greatest, then a value with a time-zone MUST be preferred over one without. If the first argument evaluates to an empty bag and the second argument is present, then the function SHALL return the value of the second argument. If the first argument evaluates to an empty bag and the second argument is absent, then the function SHALL return `Indeterminate`.

### C.3.15 Special Match Functions

These functions operate on various types and evaluate to `urn:oasis:names:tc:acal:1.0:data-type:boolean` based on the specified standard matching algorithm.

`urn:oasis:names:tc:acal:1.0:function:x500Name-match`

: This function SHALL take two arguments of `urn:oasis:names:tc:acal:1.0:data-type:x500Name` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. It SHALL return `true` if and only if the second argument matches some terminal sequence of RDNs from the first argument when compared using `x500Name-equal`.

: As an example (non-normative), if the first argument is `cn=John Smith,o=Medico Corp,c=US` and the second argument is `O=Medico Corp,C=US`, then the function will return `true`.

: Note that the arguments to this function are swapped compared to the similarly-named function in XACML [[XACML](#xacml)].

`urn:oasis:names:tc:acal:1.0:function:rfc822Name-match`

: This function SHALL take two arguments, the first is of data type `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name` and the second is of data type `urn:oasis:names:tc:acal:1.0:data-type:string` and SHALL return an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. This function SHALL evaluate to `true` if the second argument matches the first argument according to the following specification.

: An RFC822 name consists of a local-part followed by `@` followed by a domain-part. The local-part is case-sensitive, while the domain-part (which is usually a DNS name) is not case-sensitive.

: The first argument contains a complete rfc822Name. The second argument is a complete or partial rfc822Name used to select appropriate values in the first argument as follows.

: In order to match a particular address in the first argument, the second argument must specify the complete mail address to be matched. For example, if the second argument is `Anderson@sun.com`, this matches a value in the first argument of `Anderson@sun.com` and `Anderson@SUN.COM`, but not `Anne.Anderson@sun.com`, `anderson@sun.com` or `Anderson@east.sun.com`.

: In order to match any address at a particular domain in the first argument, the second argument must specify only a domain name (usually a DNS name). For example, if the second argument is `sun.com`, this matches a value in the first argument of `Anderson@sun.com` or `Baxter@SUN.COM`, but not `Anderson@east.sun.com`.

: In order to match any address in a particular domain in the first argument, the second argument must specify the desired domain-part with a leading `.`. For example, if the second argument is `.east.sun.com`, this matches a value in the first argument of `Anderson@east.sun.com` and `anne.anderson@ISRG.EAST.SUN.COM` but not `Anderson@sun.com`.

: Note that the arguments to this function are swapped compared to the similarly-named function in XACML [[XACML](#xacml)].

### C.3.16 Other Functions

`urn:oasis:names:tc:acal:1.0:function:access-permitted`

: This function SHALL take an `urn:oasis:names:tc:acal:1.0:data-type:anyURI` and an <!-- Line break added for the previous line to fit on a PDF page -->
`urn:oasis:names:tc:acal:1.0:data-type:entity` as arguments. The first argument SHALL be interpreted as an attribute category. The second argument SHALL be interpreted as a `RequestEntityType` object with the `Category` property set to the value of the first argument. The function evaluates to an `urn:oasis:names:tc:acal:1.0:data-type:boolean`. This function SHALL return `true` if and only if the policy evaluation described below returns the value of `Permit`.

: The following evaluation is described as if the context is actually instantiated, but it is only required that an equivalent result be obtained.

: The function SHALL construct a new context, by copying all the information from the current context, omitting any `RequestEntityType` object with `Category` property equal to the first argument. The second function argument SHALL be added to the context as a `RequestEntityType` object with the `Category` property set to the value of the first argument.

: The function SHALL invoke a complete policy evaluation using the newly constructed context. This evaluation SHALL be completely isolated from the evaluation which invoked the function, but SHALL use all current policies and combining algorithms, including any per-request policies.

: The PDP SHALL detect any loop which may occur if successive evaluations invoke this function by counting the number of total invocations of any instance of this function during any single initial invocation of the PDP. If the total number of invocations exceeds the bound for such invocations, the initial invocation of this function evaluates to `Indeterminate` with a `urn:oasis:names:tc:acal:1.0:status:processing-error` status code. Also, see the security considerations in [Section 10.1.8](#1018-denial-of-service).

### C.3.17 Extension Functions and Data Types

Functions and data types are specified by string identifiers allowing for the introduction of functions in addition to those specified by ACAL. This approach allows one to extend the ACAL module with special functions and special data types.

In order to preserve the integrity of the ACAL evaluation strategy, the result of an extension function SHALL depend only on the values of its arguments. Global and hidden parameters SHALL NOT affect the evaluation of an expression. Functions SHALL NOT have side effects, as evaluation order cannot be guaranteed in a standard way.


# Annex D ACAL Identifiers


(This annex forms an integral part of this Specification.)

This section defines standard identifiers for commonly used definitions.

## D.1 ACAL Namespaces

ACAL 1.0 is defined using this identifier.

`urn:oasis:names:tc:acal:1.0:core:schema`

## D.2 Attribute Categories

The following attribute category identifiers MUST be used when an XACML 3.0 or earlier policy or request is translated into ACAL 1.0.

Attributes previously placed in the Resource, Action, and Environment sections of a request are placed in an attribute category with the following identifiers respectively. It is RECOMMENDED that they are used to list attributes of resources, actions, and the environment respectively when authoring ACAL policies or requests.

`urn:oasis:names:tc:acal:1.0:attribute-category:resource`

`urn:oasis:names:tc:acal:1.0:attribute-category:action`

`urn:oasis:names:tc:acal:1.0:attribute-category:environment`

Attributes previously placed in the Subject section of a request are placed in an attribute category which is identical to the subject category in XACML 2.0, as defined below. It is RECOMMENDED that they are used to list attributes of subjects when authoring ACAL 1.0 policies or requests.

This identifier indicates the system entity that initiated the access request, that is, the initial entity in a request chain; if the subject category is not specified in XACML 2.0, this is also the default translation value:

`urn:oasis:names:tc:acal:1.0:subject-category:access-subject`

This identifier indicates the system entity that will receive the results of the request (used when it is distinct from the access-subject):

`urn:oasis:names:tc:acal:1.0:subject-category:recipient-subject`

This identifier indicates a system entity through which the access request was passed:

`urn:oasis:names:tc:acal:1.0:subject-category:intermediary-subject`

This identifier indicates a system entity associated with a local or remote codebase that generated the request (corresponding subject attributes might include the URL from which it was loaded and/or the identity of the code-signer):

`urn:oasis:names:tc:acal:1.0:subject-category:codebase`

This identifier indicates a system entity associated with the computer that initiated the access request (for example, an IPsec identity):

`urn:oasis:names:tc:acal:1.0:subject-category:requesting-machine`

## D.3 Data Types

The following identifiers indicate data types that are defined in [Annex C.2](#c2-data-types):

* `urn:oasis:names:tc:acal:1.0:data-type:x500Name`

* `urn:oasis:names:tc:acal:1.0:data-type:rfc822Name`

* `urn:oasis:names:tc:acal:1.0:data-type:ipAddress`

* `urn:oasis:names:tc:acal:1.0:data-type:dnsName`

* `urn:oasis:names:tc:acal:1.0:data-type:entity`

The following data type identifiers are defined in [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) by reference to W3C XML Schema [[XS](#xs)] (each `urn:oasis:names:tc:acal:1.0:data-type:<name>` below corresponds to the `xs:<name>` type in the XML schema Data Types specification):

* `urn:oasis:names:tc:acal:1.0:data-type:string`

* `urn:oasis:names:tc:acal:1.0:data-type:boolean`

* `urn:oasis:names:tc:acal:1.0:data-type:integer`

* `urn:oasis:names:tc:acal:1.0:data-type:double`

* `urn:oasis:names:tc:acal:1.0:data-type:time`

* `urn:oasis:names:tc:acal:1.0:data-type:date`

* `urn:oasis:names:tc:acal:1.0:data-type:dateTime`

* `urn:oasis:names:tc:acal:1.0:data-type:anyURI`

* `urn:oasis:names:tc:acal:1.0:data-type:hexBinary`

* `urn:oasis:names:tc:acal:1.0:data-type:base64Binary`.

* `urn:oasis:names:tc:acal:1.0:data-type:dayTimeDuration`

* `urn:oasis:names:tc:acal:1.0:data-type:yearMonthDuration`.

## D.4 Subject Attributes

These identifiers indicate attributes of a subject. When used, it is RECOMMENDED that they appear within a `RequestEntityType` object of the request context with a subject category (see [Annex D.2](#d2-attribute-categories)).

At most one of each of these attributes is associated with each subject. Each attribute associated with authentication included within a single `RequestEntityType` object relates to the same authentication event.

This identifier indicates the name of the subject:

`urn:oasis:names:tc:acal:1.0:subject:subject-id`

This identifier indicates the security domain of the subject. It identifies the administrator and policy that manages the name-space in which the subject id is administered:

`urn:oasis:names:tc:acal:1.0:subject:subject-id-qualifier`

This identifier indicates a public key used to confirm the subject's identity:

`urn:oasis:names:tc:acal:1.0:subject:key-info`

This identifier indicates the time at which the subject was authenticated:

`urn:oasis:names:tc:acal:1.0:subject:authentication-time`

This identifier indicates the method used to authenticate the subject:

`urn:oasis:names:tc:acal:1.0:subject:authentication-method`

This identifier indicates the time at which the subject initiated the access request, according to the PEP:

`urn:oasis:names:tc:acal:1.0:subject:request-time`

This identifier indicates the time at which the subject's current session began, according to the PEP:

`urn:oasis:names:tc:acal:1.0:subject:session-start-time`

The following identifiers indicate the location where authentication credentials were activated:

- This identifier indicates that the location is expressed as an IP address:

  `urn:oasis:names:tc:acal:1.0:subject:authn-locality:ip-address`

  The corresponding attribute SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:ipAddress`.

- This identifier indicates that the location is expressed as a DNS name.

  `urn:oasis:names:tc:acal:1.0:subject:authn-locality:dns-name`

  The corresponding attribute SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:dnsName`.

Where a suitable attribute is already defined in LDAP [[LDAP-1](#ldap-1)], [[LDAP-2](#ldap-2)], the ACAL identifier SHALL be the OID of the LDAP attribute represented as a URN. For example, the ACAL attribute identifier for the LDAP `title` attribute defined in RFC 2256 with the OID `2.5.4.12` would be `urn:oid:2.5.4.12`.

Short identifiers can be used to improve readability. For example `title` could be defined as a short identifier name for `urn:oid:2.5.4.12`.

## D.5 Resource Attributes

These identifiers indicate attributes of the resource. When used, it is RECOMMENDED they appear within the `RequestEntityType` object of the request context with the `Category` property that evaluates to <!-- Line break added for the previous line to fit on a PDF page -->
`urn:oasis:names:tc:acal:1.0:attribute-category:resource`.

This attribute identifies the resource to which access is requested:

`urn:oasis:names:tc:acal:1.0:resource:resource-id`

This attribute identifies the namespace of the top element(s) of the contents of the `ContentType` object's `Body`:

: `urn:oasis:names:tc:acal:1.0:resource:target-namespace`

: In the case where the resource content is supplied in the request context and the resource namespaces are defined in the resource, the PEP MAY provide this attribute in the request to indicate the namespaces of the resource content. In this case there SHALL be one value of this attribute for each unique namespace of the top level elements in the `ContentType` object's `Body`. The data type of the corresponding attribute SHALL be `urn:oasis:names:tc:acal:1.0:data-type:anyURI`.

This attribute is used to identify the location of a resource, such as a file path or a network address:

`urn:oasis:names:tc:acal:1.0:resource:resource-location`

This attribute indicates the last (rightmost) component of a file name identifying the resource. For example, if the URI is `file://home/my/status#pointer`, then the simple file name is "status":

`urn:oasis:names:tc:acal:1.0:resource:simple-file-name`

## D.6 Action Attributes

These identifiers indicate attributes of the action being requested. When used, it is RECOMMENDED they appear within the `RequestEntityType` object of the request context with the `Category` property that evaluates to `urn:oasis:names:tc:acal:1.0:attribute-category:action`.

This attribute identifies the action for which access is requested:

`urn:oasis:names:tc:acal:1.0:action:action-id`

Where the action is implicit, the value of the action-id attribute SHALL be:

`urn:oasis:names:tc:acal:1.0:action:implied-action`

This attribute identifies the namespace in which the action-id attribute is defined:

`urn:oasis:names:tc:acal:1.0:action:action-namespace`

## D.7 Environment Attributes

These identifiers indicate attributes of the environment within which the decision request is to be evaluated. When used in the decision request, it is RECOMMENDED they appear in the `RequestEntityType` object of the request context with the `Category` property that evaluates to `urn:oasis:names:tc:acal:1.0:attribute-category:environment`.

This identifier indicates the current time at the context handler:

: `urn:oasis:names:tc:acal:1.0:environment:current-time`

: In practice it is the time at which the request context was created. For this reason, if these identifiers appear in multiple places within a policy, then the same value SHALL be assigned to each occurrence in the evaluation procedure, regardless of how much time elapses between the processing of the occurrences.

: The corresponding attribute SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:time`.

This identifier indicates the current date at the context handler:

: `urn:oasis:names:tc:acal:1.0:environment:current-date`

: The corresponding attribute SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:date`.

This identifier indicates the current date and time at the context handler:

: `urn:oasis:names:tc:acal:1.0:environment:current-dateTime`

: The corresponding attribute SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:dateTime`.

## D.8 Status Codes

The following status code values are defined.

This identifier indicates success:

`urn:oasis:names:tc:acal:1.0:status:ok`

This identifier indicates that all the attributes necessary to make a policy decision were not available (see [Section 7.43](#743-missingattributedetailtype)):

`urn:oasis:names:tc:acal:1.0:status:missing-attribute`

This identifier indicates that some attribute value contained a syntax error, such as a letter in a numeric field:

`urn:oasis:names:tc:acal:1.0:status:syntax-error`

This identifier indicates that an error occurred while the PDP processed the decision request or evaluated policy (examples would be division by zero, or the refusal of a request as specified in [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)):

`urn:oasis:names:tc:acal:1.0:status:processing-error`

## D.9 Combining Algorithms

The deny-overrides combining algorithm has the following value for the `CombiningAlgId` property:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-overrides`

The permit-overrides combining algorithm has the following value for the `CombiningAlgId` property:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides`

The first-applicable combining algorithm has the following value for the `CombiningAlgId` property:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:first-applicable`

The ordered-deny-overrides combining algorithm has the following value for the `CombiningAlgId` property:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:ordered-deny-overrides`

The ordered-permit-overrides combining algorithm has the following value for the `CombiningAlgId` property:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:ordered-permit-overrides`

The deny-unless-permit combining algorithm has the following value for the `CombiningAlgId` property:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit`

The permit-unless-deny combining algorithm has the following value for the `CombiningAlgId` property:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-unless-deny`


## D.10 Content Types

These standard *Media Type* identifiers ([[RFC2046](#rfc2046)]) - registered at IANA ( [[RFC6838](#rfc6838)] ) - SHALL be used as values for the `MediaType` property of `ContentType` objects, whenever applicable to the Content type: 

- For XML content: `application/xml`;
- For JSON content: `application/json`.

## D.11 Content Encodings

This standard *Encoding mechanism* identifier ([[RFC2045](#rfc2045)] Section 6) - registered at IANA ( [[RFC4289](#rfc4289)] ) - SHALL be used as values for the `Encoding` property of `ContentType` objects, whenever applicable to the Content type: 

- `base64`.

---

# Annex E Combining Algorithms


(This annex forms an integral part of this Specification.)

This section contains a description of the combining algorithms specified by ACAL. Pseudo code is normative, descriptions in English are non-normative.

Note that in each case an implementation is conformant as long as it produces the same result as is specified here, regardless of how and in what order the implementation behaves internally.

## E.1 Extended Indeterminate Values

Some combining algorithms are defined in terms of an extended set of `Indeterminate` values. See [Section 8.10](#810-extended-indeterminate) for the definition of the Extended Indeterminate values. For these algorithms, the PDP MUST keep track of the extended set of `Indeterminate` values during rule and policy combining.

The output of a combining algorithm which does not track the extended set of `Indeterminate` values MUST be treated as `Indeterminate{DP}` for the value `Indeterminate` by a combining algorithm which tracks the extended set of `Indeterminate` values.

A combining algorithm which does not track the extended set of `Indeterminate` values MUST treat the output of a combining algorithm which tracks the extended set of `Indeterminate` values as an `Indeterminate` for any of the possible values of the extended set of `Indeterminate`.

## E.2 Deny Overrides

This section defines the `deny-overrides` combining algorithm of a policy.

This combining algorithm makes use of the extended `Indeterminate`.

The combining algorithm defined here has the following identifier:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-overrides`

The following is a non-normative description of this combining algorithm. The `deny-overrides` combining algorithm is intended for those cases where a `Deny` decision should have priority over a `Permit` decision. This algorithm has the following behavior.

1. If any decision is `Deny`, the result is `Deny`.

2. Otherwise, if any decision is `Indeterminate{DP}`, the result is `Indeterminate{DP}`.

3. Otherwise, if any decision is `Indeterminate{D}` and another decision is `Indeterminate{P}` or `Permit`, the result is `Indeterminate{DP}`.

4. Otherwise, if any decision is `Indeterminate{D}`, the result is `Indeterminate{D}`.

5. Otherwise, if any decision is `Permit`, the result is `Permit`.

6. Otherwise, if any decision is `Indeterminate{P}`, the result is `Indeterminate{P}`.

7. Otherwise, the result is `NotApplicable`.

The following pseudo-code represents the normative specification of this combining algorithm. The algorithm is presented here in a form where the input to it is an array with children (the policies or rules) of the policy. The children may be processed in any order, so the list of notices provided by this algorithm is not deterministic.

```java
Decision denyOverridesCombiningAlgorithm(Node[] children)
{
   Boolean atLeastOneErrorD  = false;
   Boolean atLeastOneErrorP  = false;
   Boolean atLeastOneErrorDP  = false;
   Boolean atLeastOnePermit = false;
   for( i=0 ; i < lengthOf(children) ; i++ )
   {
          Decision decision = children[i].evaluate();
          if (decision == Deny)
          {
                return Deny;
          }
          if (decision == Permit)
          {
                atLeastOnePermit = true;
                continue;
          }
          if (decision == NotApplicable)
          {
                continue;
          }
          if (decision == Indeterminate{D})
          {
                atLeastOneErrorD = true;
                continue;
          }
          if (decision == Indeterminate{P})
          {
                atLeastOneErrorP = true;
                continue;
          }
          if (decision == Indeterminate{DP})
          {
                atLeastOneErrorDP = true;
                continue;
          }
   }
   if (atLeastOneErrorDP)
   {
          return Indeterminate{DP};
   }
   if (atLeastOneErrorD && (atLeastOneErrorP || atLeastOnePermit))
   {
          return Indeterminate{DP};
   }
   if (atLeastOneErrorD)
   {
          return Indeterminate{D};
   }
   if (atLeastOnePermit)
   {
          return Permit;
   }
   if (atLeastOneErrorP)
   {
          return Indeterminate{P};
   }
   return NotApplicable;
}
```

Notices SHALL be combined as described in [Section 8.16](#816-notices).

## E.3 Ordered Deny Overrides

The following specification defines the `ordered-deny-overrides` combining algorithm of a policy. The behavior of this algorithm is identical to that of the `deny-overrides` combining algorithm with one exception: the order in which the collection of policies and rules is evaluated SHALL match the order as listed in the policy.

The combining algorithm defined here has the following identifier:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:ordered-deny-overrides`

## E.4 Permit Overrides

This section defines the `permit-overrides` combining algorithm of a policy.

This combining algorithm makes use of the extended `Indeterminate`.

The combining algorithm defined here has the following identifier:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides`

The following is a non-normative description of this combining algorithm. The `permit-overrides` combining algorithm is intended for those cases where a `Permit` decision should have priority over a `Deny` decision. This algorithm has the following behavior.

1. If any decision is `Permit`, the result is `Permit`.

2. Otherwise, if any decision is `Indeterminate{DP}`, the result is `Indeterminate{DP}`.

3. Otherwise, if any decision is `Indeterminate{P}` and another decision is `Indeterminate{D}` or `Deny`, the result is `Indeterminate{DP}`.

4. Otherwise, if any decision is `Indeterminate{P}`, the result is `Indeterminate{P}`.

5. Otherwise, if any decision is `Deny`, the result is `Deny`.

6. Otherwise, if any decision is `Indeterminate{D}`, the result is `Indeterminate{D}`.

7. Otherwise, the result is `NotApplicable`.

The following pseudo-code represents the normative specification of this combining algorithm. The algorithm is presented here in a form where the input to it is an array with all children (the policies or rules) of the policy. The children may be processed in any order, so the list of notices provided by this algorithm is not deterministic.

```java
Decision permitOverridesCombiningAlgorithm(Node[] children)
{
   Boolean atLeastOneErrorD  = false;
   Boolean atLeastOneErrorP  = false;
   Boolean atLeastOneErrorDP  = false;
   Boolean atLeastOneDeny = false;
   for( i=0 ; i < lengthOf(children) ; i++ )
   {
          Decision decision = children[i].evaluate();
          if (decision == Deny)
          {
                atLeastOneDeny = true;
                continue;
          }
          if (decision == Permit)
          {
                return Permit;
          }
          if (decision == NotApplicable)
          {
                continue;
          }
          if (decision == Indeterminate{D})
          {
                atLeastOneErrorD = true;
                continue;
          }
          if (decision == Indeterminate{P})
          {
                atLeastOneErrorP = true;
                continue;
          }
          if (decision == Indeterminate{DP})
          {
                atLeastOneErrorDP = true;
                continue;
          }
   }
   if (atLeastOneErrorDP)
   {
          return Indeterminate{DP};
   }
   if (atLeastOneErrorP && (atLeastOneErrorD || atLeastOneDeny))
   {
          return Indeterminate{DP};
   }
   if (atLeastOneErrorP)
   {
          return Indeterminate{P};
   }
   if (atLeastOneDeny)
   {
          return Deny;
   }
   if (atLeastOneErrorD)
   {
          return Indeterminate{D};
   }
   return NotApplicable;
}
```

Notices SHALL be combined as described in [Section 8.16](#816-notices).

## E.5 Ordered Permit Overrides

The following specification defines the `ordered-permit-overrides` combining algorithm of a policy. The behavior of this algorithm is identical to that of the `permit-overrides` combining algorithm with one exception: the order in which the collection of policies and rules is evaluated SHALL match the order as listed in the policy.

The combining algorithm defined here has the following identifier:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:ordered-permit-overrides`

## E.6 Deny Unless Permit

This section defines the `deny-unless-permit` combining algorithm of a policy.

The combining algorithm defined here has the following identifier:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit`

The following is a non-normative description of this combining algorithm. The `deny-unless-permit` combining algorithm is intended for those cases where a `Permit` decision should have priority over a `Deny` decision, and an `Indeterminate` or `NotApplicable` must never be the result. It is particularly useful at the top level in a policy structure to ensure that a PDP will always return a definite `Permit` or `Deny` result. This algorithm has the following behavior.

1. If any decision is `Permit`, the result is `Permit`.

2. Otherwise, the result is `Deny`.

The following pseudo-code represents the normative specification of this combining algorithm. The algorithm is presented here in a form where the input to it is an array with all the children (the policies or rules) of the policy. The children may be processed in any order, so the list of notices provided by this algorithm is not deterministic.

```java
Decision denyUnlessPermitCombiningAlgorithm(Node[] children)
{
   for( i=0 ; i < lengthOf(children) ; i++ )
   {
          if (children[i].evaluate() == Permit)
          {
                return Permit;
          }
   }
   return Deny;
}
```

Notices SHALL be combined as described in [Section 8.16](#816-notices).

## E.7 Permit Unless Deny

This section defines the `permit-unless-deny` combining algorithm of a policy.

The combining algorithm defined here has the following identifier:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-unless-deny`

The following is a non-normative description of this combining algorithm. The `permit-unless-deny` combining algorithm is intended for those cases where a `Deny` decision should have priority over a `Permit` decision, and an `Indeterminate` or `NotApplicable` must never be the result. It is particularly useful at the top level in a policy structure to ensure that a PDP will always return a definite `Permit` or `Deny` result. This algorithm has the following behavior.

1. If any decision is `Deny`, the result is `Deny`.

2. Otherwise, the result is `Permit`.

The following pseudo-code represents the normative specification of this combining algorithm. The algorithm is presented here in a form where the input to it is an array with all the children (the policies or rules) of the policy. The children may be processed in any order, so the list of notices provided by this algorithm is not deterministic.

```java
Decision permitUnlessDenyCombiningAlgorithm(Node[] children)
{
   for( i=0 ; i < lengthOf(children) ; i++ )
   {
          if (children[i].evaluate() == Deny)
          {
                return Deny;
          }
   }
   return Permit;
}
```

Notices SHALL be combined as described in [Section 8.16](#816-notices).

: Note: A child that evaluates to `Indeterminate` does not prevent this algorithm from returning `Permit`. In particular, if an integer error causes a child that would otherwise have evaluated to `Deny` to evaluate to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`, this algorithm returns `Permit` unless another child evaluates to `Deny` ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema), [Annex C.3.2](#c32-arithmetic-functions), [Section 10.1.9](#1019-implementation-defined-integer-limits)).

## E.8 First Applicable

This section defines the `first-applicable` combining algorithm of a policy.

The combining algorithm defined here has the following identifier:

`urn:oasis:names:tc:acal:1.0:combining-algorithm:first-applicable`

The following is a non-normative description of the `first-applicable` combining algorithm of a policy.

For a particular child policy or rule, if that policy or rule evaluates to `Permit`, `Deny` or `Indeterminate`, then the evaluation SHALL halt and the enclosing policy shall evaluate to the value of that policy or rule. If the policy or rule evaluates to `NotApplicable`, then the next child policy or rule in the order SHALL be evaluated. If no further child policy or rule exists in the order, then the enclosing policy shall evaluate to `NotApplicable`. If an error occurs while evaluating a policy or rule, or a policy reference is considered invalid, then the evaluation SHALL halt, and the enclosing policy shall evaluate to `Indeterminate`, with the appropriate error status.

The following pseudo-code represents the normative specification of this combining algorithm.

```java
Decision firstApplicableEffectRuleCombiningAlgorithm(Node[] children)
{
   for( i = 0 ; i < lengthOf(children) ; i++ )
   {
          Decision decision = children[i].evaluate();
          if (decision == Deny)
          {
                return Deny;
          }
          if (decision == Permit)
          {
                return Permit;
          }
          if (decision == NotApplicable)
          {
                continue;
          }
          if (decision == Indeterminate)
          {
                return Indeterminate;
          }
   }
   return NotApplicable;
}
```

Notices SHALL be combined as described in [Section 8.16](#816-notices).


---

# Annex F How to generate HTML and PDF Versions

(This annex does not form an integral part of this Specification and is informational.)

## Online generation

HTML/PDF versions are generated automatically online via Github Actions after each update pushed to the main branch of [OASIS ACAL \[XACML\] TC Github repository](https://github.com/oasis-tcs/acal-spec/). Go to Github Actions on the github repository, then go to the latest workflow run, and, if the run succeeded, the summary should display the links to the generated HTML/PDF documents.

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
$ pandoc/mkdocs.sh --output /tmp acal-core-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

The publication date is automatically set to the current date by default (using Lua filter `pandoc/meta_vars.lua`). However, you may set a specific date of your choice instead, by adding the argument `--metadata date="My date in the form DD Month YYYY"` at the end of the command. 

### PDF generation

For PDF output, add the `--pdf` option as follows:

```console
$ pandoc/mkdocs.sh --pdf --output /tmp acal-core-v%version%.md
```

The HTML file is generated like the previous command and, in addition, a PDF file is generated with the same name as the input file except the `.md` extension is replaced with `.pdf` in this case.

Beware that **the result PDF - the embedded fonts in particular - may differ depending on the system/machine** where you run this command. Mainly, it depends on which fonts are actually installed on the system, as the HTML-to-PDF converter (Chrome / Chromium in this case) selects available fonts according to the prioritized lists defined by `font-family` properties in the CSS.

**For official TC publications**, add the `--official` argument to avoid this issue and produce a system-independent output:

```console
$ pandoc/mkdocs.sh --pdf --official --output /tmp acal-core-v%version%.md
```

In this case, the generation will use a public Linux container image (`ghcr.io/oasis-tcs/chrome-headless`) with a fixed installed set of fonts to generate the PDF.

---

# Annex G UML Model

The full UML Class diagram of the ACAL model is shown in the **Figure G-1** below. 

![ACAL UML Model](images/ACAL_UML_Model.png)

**Figure G-1.** ACAL UML class diagram

As a courtesy to software architects, the UML Model is also provided in the standard machine-readable format *XMI* (XML Metadata Interchange) on [OASIS ACAL \[XACML\] TC's github repository](https://github.com/oasis-tcs/acal-spec/tree/v%version%-%stage_revision%/UML/Eclipse_Papyrus_project) to facilitate reuse in UML-aware software engineering tools.

To facilitate the reading of the model and its implementation in ACAL systems, the model is split in three packages:
- `PDP_API` contains the part of the model that a PEP should support for interacting with a PDP, i.e. send authorization decision requests to a PDP and receive decision responses from it.
- `PDP_CONFIG` contains the part of the model that a PAP should typically support for managing the policies and all the associated required configuration of the PDP.
- `Common` contains the base model that is common to all the packages above.

Obviously, a PDP should support all of them, with the possible exception of certain optional features - see [the Conformance section](#11-conformance) - depending on the implementation.


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
  - Bill Parducci, Individual


## Participants


The following individuals were members of this committee during the creation of this document, not just this version of the document, and their contributions are gratefully acknowledged:

**OASIS ACAL \[XACML\] TC Members:**

- Bill Parducci, Individual
- Steven Legg, ViewDS Identity Solutions
- Cyril Dangerville, THALES


---


# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)


The changes made since the previous version (Committee Specification Draft 01) are the following. Section numbers refer to this version.

- The `Expression` property of `ApplyType`, `PolicyReferenceType` and `SharedVariableReferenceType` is renamed `Argument`, and a function, parameterized policy or shared variable may now be given *named* arguments as an alternative to positional ones, using the new `ArgumentType` and `NamedArgumentType` object types ([Section 7.11](#711-policyreferencetype), [Section 7.15](#715-applytype), [Section 7.24b](#724b-sharedvariablereferencetype), [Section 7.47](#747-argumenttype-and-namedargumenttype)).
- `RequestEntityReferenceType` is removed. The `RequestEntityReference` property of `RequestReferenceType` is now a sequence of `LocalIdentifierType` values ([Section 7.39](#739-requestreferencetype-optional)); the subsequent sections of Section 7 are renumbered accordingly.
- Attributes within a `RequestEntityType`, `ResultEntityType` or `EntityType` object are unique by the combination `(AttributeId, DataType, Issuer)` instead of by `AttributeId` alone ([Section 7.33](#733-requestentitytype), with a worked example in [Section 7.33.1](#7331-uniqueness-example-non-normative); [Section 7.44](#744-resultentitytype); [Section 7.45](#745-entitytype)).
- The `Id` of a notice or notice expression identifies the semantics of the notice, and the same `Id` may now occur more than once in a sequence of notices or notice expressions; the `(AttributeId, Category)` uniqueness constraint on the `AttributeAssignment` and `AttributeAssignmentExpression` properties is removed ([Section 7.26](#726-noticetype), [Section 7.29](#729-noticeexpressiontype)). The `IsObligation` property of `NoticeExpressionType` now has the default value `false`.
- The `Category` property of `MissingAttributeDetailType` is now optional ([Section 7.43](#743-missingattributedetailtype)).
- `IdentifierType` values have a minimum length of one character, so the empty string is not a valid identifier ([Section 7.1.2.3.8](#71238-identifiertype)).
- The rules for identifying the concrete `ValueType` subtype of a value in a concrete representation are stated: a representation may distinguish the literal subtypes by native scalar syntax or use a uniform literal form, and the subtype is determined from the effective `DataType`, not by inspecting a structured value's content ([Section 7.23](#723-valuetype)).
- Attribute retrieval and the handling of missing attributes explicitly cover entity attribute designators and entity attribute selectors as well as attribute designators and attribute selectors ([Section 8.4.5](#845-attribute-retrieval), [Section 8.17.3](#8173-missing-attributes)).
- Identifier values and URIs starting with `urn:oasis:names:tc:xacml:` or `urn:oasis:names:tc:acal:` are reserved for the exclusive use of the OASIS ACAL \[XACML\] TC ([Section 7.1.2.3.1](#71231-uri), [Section 7.1.2.3.8](#71238-identifiertype) and the identifier-valued properties of Section 7). The predefined short identifier set gains four entries (`resource-location`, `simple-file-name`, `is-empty` and `is-not-empty`) and is also provided in YAML, and the JSON artifact is `acal-core-json-v1.0-identifiers.json` (csd01 cited `acal-core-xml-v4.0-identifiers.json`) ([Section 7.2](#72-shortidsettype)).
- A `PolicyDefaults` object now also applies within the policies nested in its policy; a nested policy's own object of the same concrete type applies inside that nested policy in place of the enclosing object; a policy included by a `PolicyReference` is not nested ([Section 7.4](#74-policytype), [Section 7.5](#75-policydefaultstype-optional)).
- Resolving a policy reference is defined as a selection from the policies that define the PDP: the entry-point reference of a `BundleType` object is required to resolve within that set, and another reference that matches no policy in it may be resolved by retrieving the policy from its `Id` when that is a URL ([Section 8.13](#813-policyreference-evaluation)).
- The conversion of the result of an attribute selector's or entity attribute selector's `Path` expression to a bag of values is now specified by the ACAL Profile that defines the concrete selector type; the XPath-specific conversion rules moved to the XPath Profile ([Section 8.4.7](#847-selector-evaluation)).
- The value space, lexical space and lexical mapping of the twelve data types that correspond to XML Schema datatypes are stated explicitly, and the value spaces, lexical spaces and lexical mappings of `x500Name`, `rfc822Name`, `ipAddress` and `dnsName` are defined ([Annex C.2](#c2-data-types), [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)). The `integer` value space is unbounded; an implementation that applies a bound documents its *supported integer interval*, which includes at least −2<sup>63</sup> to 2<sup>63</sup>−1, and an integer result is exact or `Indeterminate`. Input acceptance limits are defined, and so is the optional refusal of a request before evaluation. Support for the `integer` data type means support for the implementation's supported integer interval ([Section 11.2.7](#1127-data-types)), and a policy containing an `integer` literal outside that interval evaluates to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error` whenever it is evaluated ([Section 8.17.1](#8171-unsupported-functionality)).
- The syntax of `ipAddress` and `dnsName` values is stated as conformance to the `IPv4address`, `IP-literal` and `reg-name` rules of [[RFC3986](#rfc3986)] ([Annex C.2.3](#c23-ip-address), [Annex C.2.4](#c24-dns-name)).
- `double` arithmetic and comparison are specified as binary64 operations with round-to-nearest, ties-to-even, replacing the former IEEE 754 context settings (flags, trap-enablers, precision and rounding) ([Section 8.6](#86-arithmetic-evaluation)). The integer arithmetic and conversion functions state their exact results, including truncation toward zero for `integer-divide` and `integer-mod`, and the `add` and `multiply` functions are required to take two or more arguments, where csd01 only permitted it (the `integer-add` and `integer-multiply` entries already required it) ([Annex C.3.2](#c32-arithmetic-functions), [Annex C.3.4](#c34-numeric-data-type-conversion-functions)). A zero divisor of `integer-divide`, `double-divide` or `integer-mod` evaluates to `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:processing-error` (csd01 named only the divide functions and no status code) ([Annex C.3.2](#c32-arithmetic-functions)). `integer-from-string` keeps `syntax-error` for an invalid lexical form and returns `processing-error` for a valid integer outside the supported integer interval or one the implementation cannot produce ([Annex C.3.9](#c39-string-functions)).
- The `or` and `and` functions may evaluate their arguments in any order, and so may `n-of` after its first argument, instead of strictly from first to last ([Annex C.3.5](#c35-logical-functions)).
- `x500Name-equal` compares Relative Distinguished Names using the rules of [[RFC5280](#rfc5280)] Section 7.1 (LDAP StringPrep with case-insensitive matching) instead of those of the obsoleted RFC 3280 Section 4.1.2.4, and its first step now parses each argument according to [[RFC4514](#rfc4514)] Section 3 instead of "normalizing" it ([Annex C.3.1](#c31-equality-predicates)); because its result can now differ from that of XACML's `x500Name-equal`, the XACML identifiers of `x500Name-equal` and of the `x500Name` bag and set functions defined through it (`x500Name-is-in`, `-intersection`, `-at-least-one-member-of`, `-union`, `-subset`, `-set-equals`) are no longer listed as equivalent ([Section 11.2.8](#1128-functions)).
- In the equality, comparison and ordering functions of [Annex C.3.1](#c31-equality-predicates) and [Annex C.3.8](#c38-non-numeric-comparison-functions), a `dateTime` or `date` value without a time zone is resolved using the implicit timezone of the PDP's dynamic evaluation context, as defined by [[XF](#xf)]; the resulting dependence of a decision on the PDP's configuration is stated, and an explicit time zone on every `dateTime`, `time` and `date` value is recommended ([Annex C.2](#c2-data-types), [Annex C.3.8](#c38-non-numeric-comparison-functions)).
- New security considerations for integer processing ([Section 10.1.8](#1018-denial-of-service), [Section 10.1.9](#1019-implementation-defined-integer-limits)).
- `RequestType.MultiRequests` gains an OCL constraint that every `RequestEntityReference` value equals the `Id` of a `RequestEntity` ([Section 7.31](#731-requesttype)).
- The `IsObligation` property of a `NoticeExpressionType` object states its default value, `false` ([Section 7.29](#729-noticeexpressiontype)), as the `NoticeType` object already did.
- Property descriptions are aligned with the UML, which is unchanged: `MaxDelegationDepth` is a `NonNegativeInteger` ([Section 7.4](#74-policytype)), `Issuer` is a `Name` ([Section 7.17](#717-namedattributedesignatortype)), the quantified-expression domain is a `NonLiteralExpressionType` ([Section 7.25](#725-quantifiedexpressiontype-optional)), and the `Id` of a `RequestEntityType` or `ResultEntityType` object is a `LocalIdentifierType` ([Section 7.33](#733-requestentitytype), [Section 7.44](#744-resultentitytype)). The conditions under which the `MediaType` and `ContentEncodingType` types and the `ContentType` object are required are stated in terms of what the implementation supports ([Section 7.1.2.3.14](#712314-mediatype-optional), [Section 7.1.2.3.15](#712315-contentencodingtype-optional), [Section 7.34](#734-contenttype-optional)).
- The non-normative description of a policy target ([Section 5.3.2.1](#5321-policy-target)) no longer offers a target calculated from the components' targets and conditions, or rules inheriting the policy target; a component policy or rule applies only when both the outer policy's target and its own target or condition are satisfied.
- The normative [[XF](#xf)] reference is the XPath and XQuery Functions and Operators 3.1 Recommendation (csd01 cited its namespace document), and the `op:dateTime-equal`, `op:date-equal` and `op:time-equal` citations are corrected to its Sections 9.4.1, 9.4.4 and 9.4.7 ([Annex C.3.1](#c31-equality-predicates)); `string-regexp-match` cites `fn:matches` ([Annex C.3.13](#c313-regular-expression-based-functions)).
- The `processing-error` status code is described as an error while the PDP processes the decision request or evaluates policy, including the refusal of a request as specified in [Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema) (csd01: an error during policy evaluation) ([Annex D.8](#d8-status-codes)). The target value "No Match" is written `No-match`, as in the policy truth table ([Section 8.7](#87-target-evaluation)). In the glossary, "Context handler" refers to the ACAL context instead of the XACML canonical form, and the Condition definition writes its values `true` and `false` (csd01: `True`, `False`) ([Section 2.1.2](#212-terms-defined-in-this-document)).
- The base-PEP decision value "Not Applicable" is written `NotApplicable` ([Section 8.2.1](#821-base-pep)); [Section 8.10](#810-extended-indeterminate) defines the top-level policy, at which an extended `Indeterminate` is returned as a plain `Indeterminate`, as the policy referenced by the `PolicyReference` property of the `BundleType` object that defines the PDP; and the local-identifier examples of [Section 7.1.2.3.9](#71239-localidentifiertype) use `Name` for a parameter and `Id` for a rule (csd01: `ParameterName` and `RuleId`) and describe `RequestEntityReference` as a `LocalIdentifierType` value.
- The `entity` data type is listed among the data type identifiers ([Annex D.3](#d3-data-types)).
- On a `Deny` decision, the base PEP and the Permit-biased PEP no longer deny access "only if" they understand and can discharge the accompanying obligations; they deny access in every case and MUST discharge any obligation they understand to the best of their ability ([Section 8.2.1](#821-base-pep), [Section 8.2.3](#823-permit-biased-pep)).
- Requirement keywords previously written in lowercase or mixed case ("must", "shall", "should", "SHALL not") are written in uppercase, with the wording otherwise unchanged (Sections 7.1.2.3, 7.3, 7.4, 7.6, 7.11, 7.15, 7.21, 7.22, 7.24b, 7.29, 7.31, 7.34, 7.43, 8.3, 8.4.5, 8.16 and 11.2.4, and Annexes C.3.1, C.3.3, C.3.8, C.3.15 and C.3.16). A lowercase "must" or "shall" that states a condition or a consequence rather than a requirement stays lowercase, and in [Section 7.34](#734-contenttype-optional) "required only if the implementation must support extensions" reads "required only if the implementation supports extensions".
- In the object-type conformance table, `NamedArgumentType` (optional) and `PatternMatchIdReferenceType` are added, `SharedVariableReferenceType` is now optional, and `DecisionType` (a simple type), `DescriptionType` (not defined by the model) and `PolicyIssuerType` (the policy issuer is an `EntityType`) are no longer listed, `PatternMatchIdReferenceType` is mandatory, and the deprecated identifier of `base64Binary-at-least-one-member-of` is corrected to its XACML 1.0 identifier ([Section 11.2.8](#1128-functions)); the other changes are in the object-type table ([Section 11.2.1](#1121-object-types)). The reference to conformance test cases is removed from [Section 11.2](#112-conformance-tables).
- A response holds one `ResultType` object per Individual Decision Request, or a single combined `ResultType` object, instead of one per requested resource ([Section 7.36](#736-responsetype)).
- Requirements formerly stated in non-normative sections are moved into normative ones: the conversion of attribute representations ([Section 8.4](#84-attribute-evaluation)), the advice of [[UTR36](#utr36)] ([Section 8.1.2](#812-version-of-unicode)) and distinct namespaces for policy identifiers from distinct sources ([Section 8.13](#813-policyreference-evaluation)). [Section 5.2](#52-acal-context), [Section 10.2.5](#1025-policy-identifiers) and [Section 10.3](#103-unicode-security-issues) now refer to those sections, [Section 10.4](#104-identifier-equality) refers to [Section 8.18](#818-identifier-equality), which already stated its recommendation, and [Section 5.3.1.1](#5311-condition) no longer states a requirement of its own but refers to [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)].
- The examples are corrected so that each validates against its representation's schema and evaluates as its text describes: in [Section 6](#6-examples-non-normative) the JSON examples carry their JACAL root key, the example short-identifier set defines every short identifier the rules use, Rule 1's YAML variable definition uses `Expression`, Rule 2 tests "under 16" with `date-less-than`, Rule 2's JSON is well-formed, and Rule 3's notice reads the physician's `physician-id`.
- New glossary terms: lexical mapping, lexical space and value space ([Section 2.1.1](#211-terms-defined-elsewhere)); input acceptance limit and supported integer interval ([Section 2.1.2](#212-terms-defined-in-this-document)). The examples of [Section 6](#6-examples-non-normative) are also given in YAML; in them, `RuleId` is replaced by `Id`, and the example request's `patient-number` attribute is a `string`, as Rule 1 reads it. The complete UML class diagram is added as [Annex G](#annex-g-uml-model).
- [Annex F](#annex-f-how-to-generate-html-and-pdf-versions) describes online generation by the repository's GitHub Actions workflow and offline generation with `pandoc/mkdocs.sh`, lists the tools that script requires, and no longer describes a Docker alternative.
- Editorial: the Technical Committee is renamed, and document and repository URLs are updated accordingly; references to the multiple decision and hierarchical resource profiles now cite the ACAL profiles; section and table numbering, cross-references and the table of contents are corrected (in Annex C, "Entity" moves from C.2.6 to C.2.5 and "Extension Functions and Data Types" from C.3.18 to C.3.17, closing numbering gaps); citations of XML Schema datatype sections use the XML Schema 1.1 numbering of [[XS](#xs)] (e.g. Section 3.3.7 for `dateTime`, formerly the XML Schema 1.0 number 3.2.7); references to RFC 2396, RFC 2253 and RFC 2821 are replaced by [[RFC3986](#rfc3986)], [[RFC4514](#rfc4514)] and [[RFC5321](#rfc5321)]; the property descriptions of `ResultType`, `StatusCodeType` and `ResultEntityType` now state the same multiplicities as their UML definitions; and the `isBag` property of `ParameterType` is spelled `IsBag`, as in the XML Schema.

The remainder of this appendix describes how ACAL 1.0 differs from XACML 3.0.

ACAL 1.0 is a successor to XACML 3.0. ACAL 1.0 differs from XACML 3.0 in the following ways:

- ACAL constructs can be represented in JSON, YAML or XML at the implementor's discretion.

- The policy (`Policy`) and policy set (`PolicySet`) constructs have been merged into a single construct which is known as a policy (`Policy`) in ACAL 1.0.

  - Compared to XACML 3.0, the `<PolicySet>`, `<PolicySetIdReference>`, `<PolicySetCombinerParameters>` and `<PolicySetDefaults>` elements and `PolicySet` type no longer appear.

  - Compared to XACML 3.0, the `PolicyType` type now allows child `<Policy>` and `<PolicyReference>` (was `PolicyIdReference`) elements.

  - Compared to XACML 3.0, a `Policy` may contain more than one `PolicyDefaults` element, one per ACAL Profile possibly.

  - The scope of the `PolicyDefaults` property now extends into policies nested within the enclosing policy; a nested policy that carries its own `PolicyDefaults` object of a given concrete type overrides the enclosing policy's object of that type within the nested policy. A policy included by a `PolicyReference` is not nested within the referencing policy, and does not use the referencing policy's `PolicyDefaults`. (In XACML 3.0, `<PolicyDefaults>` applied only within its own `<Policy>` and `<PolicySetDefaults>` only within its own `<PolicySet>`; neither was inherited by a nested policy set or policy.)

  - Separate rule and policy combining algorithms have been replaced with a single collection of combining algorithms. Legacy combining algorithms have been removed. The `only-one-applicable` policy combining algorithm has been removed.

  - EarliestVersion and LatestVersion attributes removed from `<PolicyReference>`

- The target (`Target` element) of a policy has been changed to have the same structure as the condition of a rule (i.e., a single Boolean expression). From the XML perspective, this means that the `<AnyOf>`, `<AllOf>` and `<Match>` elements no longer appear.

- Rules no longer have a target (`Target` element removed).

- Obligations and advice no longer have distinct syntactic representations. Instead they now share the common `NoticeType` object type. The difference between obligations and advice is indicated by an `IsObligation` property. (XML elements `ObligationExpressions`, `ObligationExpression`, `Obligations`, `Obligation`, `AdviceExpressions`, `AdviceExpression`, `AssociatedAdvice`, `Advice` replaced with `NoticeExpression` and `Notice`.)

- Combiner parameters are no longer supported and the `<CombinerParameter>`, `<CombinerParameters>`, `<PolicyCombinerParameters>` and `<RuleCombinerParameters>` elements no longer appear.

- Users are able to define short identifiers (`ShortIdSet` objects), which provide simple alias names to use in place of absolute URIs to refer to ACAL definitions. A predefined set of short identifiers for standard-defined URIs is also provided.

- The `IncludeInResult` XML attribute of the `<Attribute>` element has been prohibited in results and entity data type values. It is meaningless in these cases.

- `IncludeInResult`, `ReturnPolicyIdList` and `CombinedDecision` attributes (in a `Request`) are now optional with default value `false`.

- A `Request` may contain more than one `RequestDefaults` element, one per ACAL Profile possibly.

- Different types are now used to represent attribute categories in a request versus a response. Categories in the result don't have the `Content` property, since there is no mechanism to request their inclusion, and their attributes don't have the `IncludeInResult` property because it is meaningless in that context. Categories in the request have both `Content` properties and attributes with `IncludeInResult` properties. Attribute categories in the request are `RequestEntityType` objects and attributes in the response are `ResultEntityType` objects. These types supersede the XML Schema `AttributesType` complex type. As a result:

  - `Attributes` element replaced with new `RequestEntity` and `ResultEntity` elements in the `Request` and `Result` elements respectively
  - `AttributesReference` replaced with new `RequestEntityReference`.

- `Attribute` has a new optional `DataType` attribute (set to the standard string type as default), to have a common data-type for all the attribute values. In XACML 3.0, defining the data-type for each `AttributeValue` individually led to the risk of mixing different datatypes in the same attribute. We consider this bad practice (one may simply split in different attributes if using different data-types).

- The uniqueness rule for attributes within a `RequestEntity`, `ResultEntity` or `entity` data type value keys on the combination `(AttributeId, DataType, Issuer)` — where `DataType` is compared on its effective value after applying its default, and an absent `Issuer` is never a duplicate of a present one. (This replaces the csd01 rule that keyed on `AttributeId` alone, which contradicted the attribute-designator matching rule and could not represent, for example, a node's ancestors given in more than one data type as the Hierarchical Resource Profile allows.)

- `AttributeValue` is replaced with more generic `Value` whose `DataType` is now optional, i.e. it may be omitted when it is already defined at the parent or ancestor level, which simplifies expressions with literal values. In particular, as a result of the previous change, in an `Attribute`, the `Value`'s `DataType` is now omitted since defined at the `Attribute` level already.

- A `Content` may now contain XML, JSON and possibly other content types in the future, and therefore has a new data model - more generic - that consists of three properties: `Body` (content body which is similar to former Content value), `MediaType` (Content media type which indicates whether it is XML, JSON or some other content type) and `Encoding` which indicates whether the body is encoded with a particular mechanism, e.g. Base64-encoded data.

- `AttributeSelector` changes:

  - `DataType` attribute changed to be optional with the standard string type as default value to simplify the element declaration in most cases.
   * `MustBePresent`: changed to be optional with `false` as default value, to simplify the element declaration in most cases.
   * `AttributeSelector` and `Path` type of expression are abstract in ACAL model, concrete types of AttributeSelector Path expressions to be defined in ACAL Profiles, e.g. XPath Profile.
   * The conversion of the result of a `Path` expression to a bag of values of the `DataType` ([Section 8.4.7](#847-selector-evaluation)) is likewise specified by the ACAL Profile that defines the concrete selector type; this Core specification keeps only the rules that apply whatever the profile (an empty result, a result matching no conversion case, a data type extension, an error during conversion). The XPath Profile's conversion is in its Section 7, written for the sequence-of-items result of the supported XPath versions instead of XPath 1.0's node-set, and differs from the former Core table in ways that section's changes list describes.

- The value space, lexical space and lexical mapping of the twelve data types that correspond to XML Schema datatypes are stated explicitly ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema)), by reference to the like-named XML Schema 1.1 Part 2 datatype and independently of any ACAL representation format.

- The value space of the `integer` data type, and the behavior of integer results, are now stated explicitly ([Annex C.2.6](#c26-data-types-defined-by-reference-to-xml-schema), [Annex C.3.2](#c32-arithmetic-functions)). The value space is unbounded. An implementation should not impose a predetermined bound on the integers it evaluates; one that does documents its *supported integer interval*, which includes at least −2<sup>63</sup> to 2<sup>63</sup>−1. An integer result is exact, or is `Indeterminate` with status code `processing-error` when a required value is outside that interval, cannot be obtained because of an input acceptance limit, or cannot be preserved because an execution resource is exhausted, and is never wrapped around, reduced modulo a bound, saturated or rounded. An implementation may apply documented input acceptance limits and may refuse, before evaluation, a request that exceeds them or that contains an integer outside its interval. A function that takes an `integer` argument or a bag of `integer` values, or that prescribes an `integer` result, returns its prescribed result independently of argument or bag order if every supplied integer value, and any prescribed integer result, is within the interval, unless an argument is `Indeterminate` or an execution resource is exhausted; this includes `integer-average`, whose result is a `double`. `integer-divide`, `integer-mod` and `integer-abs` now state their results, and `integer-to-double` and `double-to-integer` state their rounding and error behavior ([Annex C.3.4](#c34-numeric-data-type-conversion-functions)). The terms *input acceptance limit* and *supported integer interval* are defined in [Section 2.1.2](#212-terms-defined-in-this-document), and the consequences for policy portability, testing and combining algorithms are described in the new [Section 10.1.9](#1019-implementation-defined-integer-limits).

- `AttributeDesignator` changes to simplify the declaration in most cases: 

  * `DataType` attribute changed to be optional, with the standard string type as default.
  * `MustBePresent`: changed to be optional with `false` as default value.

- The `xml:id` attribute ([[XMLid](#xmlid)]) for an attribute category is replaced by a generic 'Id' property so that all ACAL representation formats are on an equal footing.

- `Apply` changes: `Expression` elements are now `Argument` elements which may be either positional arguments (simple `Expression` elements) or named arguments (`Expressions` associated to a function parameter if the function has defined parameter names). 

- New `ArgumentType` and `NamedArgumentType` adding support for *named arguments* in `Apply` expressions as described above.

- The quantified expressions (`ForAny`, `ForAll`, `Select` and `Map`) and the `entity` data type from the XACML 3.0 Entities Profile [[ENTITIES](#entities)] have been incorporated in ACAL version 1.0. The `attribute-designator` function from the profile has been reinvented as the `EntityAttributeDesignatorType` expression object type and the `attribute-selector` function from the profile has been reinvented as the `EntityAttributeSelectorType` expression object type.

- Added new `BundleType` object which allows to bundle variable definitions (`SharedVariableDefinition`), short identifiers (`ShortIdSet`) and policies together in order to be portable / reused from one ACAL system to another, more particularly one PDP to another.

- The arguments to each of the following functions have been swapped: `string-starts-with`, `anyURI-starts-with`, `string-ends-with`, `anyURI-ends-with`, `string-contains`, `anyURI-contains`, `x500Name-match`, `rfc822Name-match`, `string-regexp-match`, `anyURI-regexp-match`, `ipAddress-regexp-match`, `dnsName-regexp-match`, `rfc822Name-regexp-match` and `x500Name-regexp-match`.

- Added a new logical function (annex C.3) commonly known as *ternary (conditional) operator*: `function ternary-if(a,b,c) -> if a is true, return b, else return c`.

- Added new aggregate functions (annex C.3) for computing:
  - Sums and averages of integers/doubles;
  - Minimum and maximum values among integers, doubles, strings, dates, date-times.

- XPath features moved to separate ACAL XPath Profile: XPath-based AttributeSelector, XPath-based functions, XPath expression datatype.

- Deprecated prefixes `urn:oasis:names:tc:xacml:` and `https://www.w3.org/2001/XMLSchema#` in favor of `urn:oasis:names:tc:acal:` for all standard identifiers (algorithms, status codes, data-types, functions, attributes and categories)

## Revision History

Latest revision history can be obtained from [OASIS ACAL \[XACML\] TC's github repository](https://github.com/oasis-tcs/acal-spec/blob/v%version%-%stage_revision%/acal-core-v%version%-%stage_revision%.md).


<!-- The following centered line represents the end of the document -->  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
