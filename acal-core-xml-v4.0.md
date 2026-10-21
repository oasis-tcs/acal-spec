---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: XACML Version 4.0 (eXtensible Access Control Markup Language)
subtitle: Committee Specification Draft 02
version: "4.0"
stage_revision: csd02 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access", "authorization", "ABAC", "policylanguage", "XML", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version


- https://docs.oasis-open.org/acal/xacml/core/v%version%/%stage_revision%/acal-core-xml-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/acal/xacml/core/v%version%/%stage_revision%/acal-core-xml-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/acal/xacml/core/v%version%/%stage_revision%/acal-core-xml-v%version%-%stage_revision%.md

### Previous version

- https://docs.oasis-open.org/acal/xacml/core/v4.0/csd01/acal-core-xml-v4.0-csd01.html (Authoritative)
- https://docs.oasis-open.org/acal/xacml/core/v4.0/csd01/acal-core-xml-v4.0-csd01.pdf
- https://docs.oasis-open.org/acal/xacml/core/v4.0/csd01/acal-core-xml-v4.0-csd01.md

### Latest version

- https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html (Authoritative)
- https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.pdf
- https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.md


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

### Additional artifacts

This document is one component of a Work Product that also includes:

* [Core XML schema](acal-core-xml-v%version%-schema.xsd);
* [Core Schematron rules](acal-core-xml-v%version%-schematron.sch);
* [Short identifier set](acal-core-xml-v%version%-identifiers.xml).

The XPath and JSONPath Profiles are separate Work Products with their own machine-readable artifacts; see those profiles' specifications for details.


### Abstract

This specification defines XACML Version 4.0 (eXtensible Access Control Markup Language), which is now the XML representation of the ACAL Version 1.0 model, also produced by the OASIS ACAL \[XACML\] TC.

### Citation Format

When referencing this specification the following citation format should be used:

**[XACML-Core-4.0]**
_%title%_.
Edited by Steven Legg, Cyril Dangerville and Bill Parducci. %date%. OASIS %subtitle%. https://docs.oasis-open.org/acal/xacml/core/v%version%/%stage_revision%/acal-core-xml-v%version%-%stage_revision%.html. Latest version: https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html.

### Related Work

This specification replaces or supersedes:

* _eXtensible Access Control Markup Language (XACML) Version 3.0 Plus Errata 01_. Edited by Erik Rissanen. OASIS Standard incorporating Approved Errata. https://docs.oasis-open.org/xacml/3.0/xacml-3.0-core-spec-en.html.

This specification is related to:

* _Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html


## License, Document Status, and Notices

Copyright © OASIS Open 2026. All Rights Reserved.  For license and copyright information, and complete status, please see Annex A which contains the License, Document Status and Notices.

-------

# Table of Contents


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
  - [3.3 Schema organization and namespaces](#33-schema-organization-and-namespaces)
- [4 Introduction (non-normative)](#4-introduction-non-normative)
  - [4.1 Requirements](#41-requirements)
  - [4.2 Abstraction Layer](#42-abstraction-layer)
  - [4.3 Example Short Identifier Set (Non-normative)](#43-example-short-identifier-set-non-normative)
  - [4.4 Changes From the Previous Version](#44-changes-from-the-previous-version)
- [5 Syntax (normative, with the exception of the schema fragments)](#5-syntax-normative-with-the-exception-of-the-schema-fragments)
  - [5.1 Mapping ACAL simple types](#51-mapping-acal-simple-types)
    - [5.1.1 Primitive types mapped to standard XSD data-types](#511-primitive-types-mapped-to-standard-xsd-data-types)
    - [5.1.2 Restricted String types (UML stereotype `<<restrictedString>>`)](#512-restricted-string-types-uml-stereotype-restrictedstring)
    - [5.1.3 Enum types (UML stereotype `<<enumeration>>`)](#513-enum-types-uml-stereotype-enumeration)
  - [5.2 Mapping complex ACAL types (UML stereotype `<<dataType>>`)](#52-mapping-complex-acal-types-uml-stereotype-datatype)
    - [5.2.1 AnyType mapping rule](#521-anytype-mapping-rule)
    - [5.2.2 Single-use empty datatypes](#522-single-use-empty-datatypes)
    - [5.2.3 ValueType mapping rules](#523-valuetype-mapping-rules)
    - [5.2.4 Default mapping rules for complex ACAL types (other than ValueType)](#524-default-mapping-rules-for-complex-acal-types-other-than-valuetype)
    - [5.2.5 Property mapping rules](#525-property-mapping-rules)
    - [5.2.6 Mapping complex ACAL constraints (OCL)](#526-mapping-complex-acal-constraints-ocl)
      - [5.2.6.1 Option 1: XML Schema 1.1 assertions](#5261-option-1-xml-schema-11-assertions)
      - [5.2.6.2 Option 2: Schematron rules](#5262-option-2-schematron-rules)
      - [5.2.6.3 Limitations common to both options: identifier-typed keys](#5263-limitations-common-to-both-options-identifier-typed-keys)
  - [5.3 Content Types and Body representations (optional)](#53-content-types-and-body-representations-optional)
- [6 Safety, Security and Privacy Considerations (non-normative)](#6-safety-security-and-privacy-considerations-non-normative)
  - [6.1 Threat model](#61-threat-model)
  - [6.2 Safeguards](#62-safeguards)
    - [6.2.1 Policy confidentiality](#621-policy-confidentiality)
    - [6.2.2 Policy integrity](#622-policy-integrity)
- [7 Conformance](#7-conformance)
  - [7.1 Introduction](#71-introduction)
  - [7.2 Conformance Categories](#72-conformance-categories)
  - [7.3 Conformance Tables](#73-conformance-tables)
    - [7.3.1 ACAL Object-Type Conformance](#731-acal-object-type-conformance)
    - [7.3.2 Machine-Readable Artifact Support](#732-machine-readable-artifact-support)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
  - [B.2 Informative References](#b2-informative-references)
- [Annex C XACML identifiers (normative)](#annex-c-xacml-identifiers-normative)
  - [C.1 XACML namespaces](#c1-xacml-namespaces)
  - [C.2 Core Short-Identifier Set](#c2-core-short-identifier-set)
- [Annex D XML Schema (normative)](#annex-d-xml-schema-normative)
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


-------

# 1 Scope


This specification defines the XML [[XML](#xml)] representation format of the [[ACAL-Core-1.0](#acal-core-10)] model and any XML-specific syntax, semantics and processing instructions that are not already specified by [[ACAL-Core-1.0](#acal-core-10)]. For more information on the scope, please refer to [[ACAL-Core-1.0](#acal-core-10)].

---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

Terms in bold-face italic, such as **_policy_** and **_resource_**, have the meaning defined in [[ACAL-Core-1.0](#acal-core-10)] Section 2.

### 2.1.2 Terms Defined in this Document

This document defines the following terms:

None.

### 2.1.3 Related terms

None.

## 2.2 Abbreviations and Acronyms

This document uses the abbreviations and acronyms defined in [[ACAL-Core-1.0](#acal-core-10)] Section 2.2.

---

# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [[RFC2119](#rfc2119)] [[RFC8174](#rfc8174)] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions


This specification contains schema conforming to W3C XML Schema and normative text to describe the syntax and semantics of XML-encoded **_policy_** statements.

```xml
Listings of XACML schema and code listings appear like this.
```

Conventional XML namespace prefixes are used throughout the listings in this specification to stand for their respective namespaces as follows, whether or not a namespace declaration is present in the example:

* The prefix `xacml:` stands for the XACML 4.0 namespace.

* The prefix `ds:` stands for the W3C XML Signature namespace [[DS](#ds)].

* The prefix `xs:` stands for the W3C XML Schema namespace [[XS](#xs)].

* The prefix `xf:` stands for the XPath and XQuery Functions and Operators 3.1 specification namespace [[XF](#xf)].

* The prefix `xml:` stands for the XML namespace https://www.w3.org/XML/1998/namespace.

This specification uses the following typographical conventions in text: `<XACMLElement>`, `<ns:ForeignElement>`, `Attribute`, `Datatype`, `OtherCode`. Terms in **_bold-face italic_** are intended to have the meaning defined in [[ACAL-Core-1.0](#acal-core-10)] Section 2.


## 3.3 Schema organization and namespaces

The XACML syntax is defined in a schema associated with the following XML namespace:

<!-- Newline to fit on PDF page -->
`urn:oasis:names:tc:xacml:4.0:core:schema`

-------


# 4 Introduction (non-normative)

The Attribute-Centric Authorization Language (ACAL) Version 1.0
[[ACAL-Core-1.0](#acal-core-10)] defines an abstract policy language for
attribute-based access control (ABAC) decisions. The ACAL abstract
model is independent of any concrete representation format; concrete
representations are defined by companion specifications.

XACML defines the XML representation of ACAL. It is one of multiple
concrete projections of the same ACAL model.


## 4.1 Requirements

The XML representation (XACML) should be as aligned as possible with
[[ACAL-Core-1.0](#acal-core-10)] (Section 7 in particular).
Indeed, XACML is a concrete representation format for ACAL.
Every construct in the ACAL abstract model has a corresponding XACML
representation defined in this specification.
The normative reference for semantics, evaluation rules, and abstract
conformance requirements is [[ACAL-Core-1.0](#acal-core-10)].
This specification defines how ACAL abstract model types are expressed in XML.

The authoritative definitions of ACAL simple types, object structures,
inheritance relationships, and `ValueType` subtypes remain in
[[ACAL-Core-1.0](#acal-core-10)] Section 7.
Likewise, the mandatory-versus-optional support classification of ACAL object
types remains in [[ACAL-Core-1.0](#acal-core-10)] Section 11.2.
XACML does not redefine those abstract model elements;
it defines only their XML representation.

## 4.2 Abstraction Layer

In the case where the native request/response format is specified in XML Schema (e.g. a SAML-conformant PEP), the transformation between the native format and the ACAL context may be specified in the form of an Extensible Stylesheet Language Transformation [[XSLT](#xslt)].

Similarly, in the case where the resource to which access is requested is an XML document, the resource itself may be included in, or referenced by, the request context. Then, through the use of XPath expressions [[XPath](#xpath)] in the policy, values in the resource may be included in the policy evaluation. The use of XPath expressions is not specified here but in the XPath Profile of ACAL.

## 4.3 Example Short Identifier Set (Non-normative)

A set of Short Identifiers with the Id `urn:oasis:names:tc:acal:1.0:core:identifiers` is defined by ACAL in the XML Representation according to this specification, for the various identifiers assigned by ACAL, and provided with this specification as a machine-readable artifact. However, a deployment will usually have need for additional identifiers, especially for locally-defined attributes, so it is usually desirable to define a set of additional short identifiers to use in the deployment, that may import the first set.

The following short-identifier set defines an XML representation of short identifiers for the additional attributes in this example and also imports the standardized set.

```xml
<ShortIdSet xmlns="urn:oasis:names:tc:xacml:4.0:core:schema"
  Id="urn:oasis:names:tc:acal:1.0:example:identifiers">

  <!-- Include the short identifiers for standard URIs. -->
  <ShortIdSetReference>urn:oasis:names:tc:acal:1.0:core:identifiers</ShortIdSetReference>

  <!-- These are the short identifiers specific to the deployment. -->
  <!-- Attributes -->
  <ShortId Name="patient-number" Value="urn:oasis:names:tc:acal:1.0:example:attribute:patient-number"/>
  <ShortId Name="collection" Value="urn:oasis:names:tc:acal:1.0:example:attribute:collection"/>

</ShortIdSet>
```

Short Identifiers can reuse other Short Identifiers in their values, typically as prefix, for example, given the following short identifiers:
```xml
<ShortId Name="xs" Value="urn:oasis:names:tc:acal:1.0:data-type:"/>
<ShortId Name="string" Value="{xs}string"/>
```

The following `IdentifierType` values are all equivalent and evaluate to the URI of the string data type:
```
string
{string}
{xs}string
```

## 4.4 Changes From the Previous Version


The list of changes from the previous version and any revision history can be found in [Appendix 2](#appendix-2-changes-from-previous-version).


---


# 5 Syntax (normative, with the exception of the schema fragments)

The next sections describe the rules that SHALL be applied for mapping the [[ACAL-Core-1.0](#acal-core-10)] agnostic model (UML-based) to [XML schema](#xs) definitions for this XML representation (XACML).
These rules have been applied to produce XACML's core XML schema in [Annex D](#annex-d-xml-schema-normative) (also in the [Core XML schema file](acal-core-xml-v%version%-schema.xsd) accompanying this document) from [[ACAL-Core-1.0](#acal-core-10)] core model.

In all XSD definitions from now, the XACML core namespace `urn:oasis:names:tc:xacml:4.0:core:schema` is the default namespace.


## 5.1 Mapping ACAL simple types

For each simple type (stereotyped `<<primitive>>`, `<<restrictedString>>` or `<<enumeration>>`) in
Section 7.1.2 of the [[ACAL-Core-1.0](#acal-core-10)] model, apply the mapping
rules in the next subsections to obtain the XML representation.

### 5.1.1 Primitive types mapped to standard XSD data-types

The ACAL primitive types in the following table have a direct XML equivalent in the XSD standard, provided in the second column, and that is used for the XML representation (the expression `xs:foo` means the `foo` type in W3C [XML schema](#xs) standard):

Table 1: Mapping ACAL primitive types to standard XSD data-types

|ACAL (UML) |XML schema|
|-------|----------|
|String |xs:string |
|Boolean|xs:boolean|
|Double|xs:double|
|Integer|xs:integer|
|NonNegativeInteger|xs:nonNegativeInteger|
|URI|xs:anyURI|
|Name|xs:Name|

An `xs:integer` value that denotes an integer outside an implementation's supported integer interval ([[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6) is a valid `xs:integer` value. An ACAL implementation SHALL NOT treat such a value as schema-invalid solely because of its magnitude. [[ACAL-Core-1.0](#acal-core-10)] Annex C.2.6 specifies when an implementation is permitted to refuse the containing request or policy instead, and the result when an evaluation requires the value.

### 5.1.2 Restricted String types (UML stereotype `<<restrictedString>>`)

Each ACAL restricted-string simple type `FooType` with stereotype `<<restrictedString>>` in Section 7.1.2.3 of [[ACAL-Core-1.0](#acal-core-10)] (e.g., `VersionType`, `VersionMatchType`, `ShortIdNameType`, `ShortIdValueType`, `IdentifierType`, `LocalIdentifierType`, etc.), i.e., with a given `pattern` property set to a regular expression *\<REGEX>*, is mapped to the following XSD definition:

```xml
<xs:simpleType name="FooType">
  <xs:restriction base="xs:string">
    <xs:pattern value="<REGEX without ^$ anchors>"/>
  </xs:restriction>
</xs:simpleType>
```

In XSD, the ^$ anchors are implicit as the pattern is always matched against the whole string, therefore they MUST be omitted from the pattern.


`FooType` may also have a (optional) `minLength` property set to a (strictly) positive integer `N`, in which case the XSD definition becomes:
```xml
<xs:simpleType name="FooType">
  <xs:restriction base="xs:string">
        <xs:pattern value="<REGEX without ^$ anchors>"/>
    <xs:minLength value="<N>"/>
  </xs:restriction>
</xs:simpleType>
```

For example, ACAL `VersionType` translates to the following XSD definition:

```xml
<xs:simpleType name="VersionType">
   <xs:restriction base="xs:string">
      <xs:pattern value="(0|[1-9]\d*)(\.(0|[1-9]\d*)){0,3}"/>
   </xs:restriction>
</xs:simpleType>
```

### 5.1.3 Enum types (UML stereotype `<<enumeration>>`)

Each ACAL enumerated type `FooType` (stereotyped `<<enumeration>>`) from Section 7.1.2.3 of [[ACAL-Core-1.0](#acal-core-10)] with enum values *V1, V2, ... Vn* is mapped to the following XSD definition:

```xml
<xs:simpleType name="FooType">
    <xs:restriction base="xs:string">
        <xs:enumeration value="V1"/>
        <xs:enumeration value="V2"/>
        ...
        <xs:enumeration value="Vn"/>
    </xs:restriction>
</xs:simpleType>
```

For example, ACAL `DecisionType` translates to the following XSD definition:
```xml
<xs:simpleType name="DecisionType">
   <xs:restriction base="xs:string">
      <xs:enumeration value="Permit"/>
      <xs:enumeration value="Deny"/>
      <xs:enumeration value="Indeterminate"/>
      <xs:enumeration value="NotApplicable"/>
   </xs:restriction>
</xs:simpleType>
```

## 5.2 Mapping complex ACAL types (UML stereotype `<<dataType>>`)

For each complex type (stereotyped `<<dataType>>`) in [[ACAL-Core-1.0](#acal-core-10)] model, apply the mapping rules in the next subsections.

The expression *`xs:foo` type (respectively element)* means the `foo` type (respectively element) defined in W3C [XML schema](#xs) standard.

<a name="anonymized-datatypes"></a>

### 5.2.1 AnyType mapping rule

The ACAL `AnyType` is mapped to the `xs:anyType` type in XML.

**WARNING:** for safety/security reasons, in production, ACAL implementers SHOULD add further restrictions to the XML schema and/or enforce security measures in the XML processor to mitigate possible security issues that may occur when allowing any XML type as input. 

### 5.2.2 Single-use empty datatypes

There are complex ACAL datatypes playing the role of *Union* datatype, such as `CombinerInputType`, which are *empty* (no property and no class inheritance) and have as many subtypes as possible types in the *union*. These are usually used once for a property that can take one of multiple alternative types, such as `CombinerInput`. 

Except the `AnyType` already addressed in the previous section, a single-use empty ACAL datatype `FooType` (i.e. used only for one property `P` in the whole ACAL model (e.g. `CombinerInput`) and not to be used in any ACAL extension) SHALL NOT be mapped to any dedicated XML type, element or attribute in the XSD. The mapping is done only at the level of property `P` (Section 5.2.5) to a `xs:choice` of XSD elements corresponding to the subtypes of `FooType`.

### 5.2.3 ValueType mapping rules

The authoritative definition of ACAL `ValueType` and subtypes is in [[ACAL-Core-1.0](#acal-core-10)] Section 7.23. The XACML representation of ACAL `ValueType` is defined by the following XSD:

```xml
<xs:complexType name="ValueType" mixed="true">
  <xs:complexContent mixed="true">
    <xs:extension base="ExpressionType">
      <xs:sequence>
        <xs:any namespace="##any" processContents="lax" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
      <xs:attribute name="DataType" type="IdentifierType" use="optional"/>
      <xs:anyAttribute  namespace="##any" processContents="lax"/>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
```

Unlike the primitive JSON and YAML forms, this XACML surface form does not by itself distinguish `LiteralBooleanType`, `LiteralIntegerType`, `LiteralDoubleType`, `LiteralStringType`, `LiteralRestrictedStringType`, or a concrete `StructuredValueType` subtype. In XACML, the concrete `ValueType` subtype is determined from the effective ACAL `DataType` together with the XML content form. For the `<<fixedDatatype>>` literal subtypes, the effective `DataType` is their fixed ACAL data-type identifier, whether supplied explicitly or inferred by the parent-context rules in [[ACAL-Core-1.0](#acal-core-10)] Section 7.23. `LiteralRestrictedStringType` and concrete `StructuredValueType` subtypes require an explicit or inherited `DataType` that identifies the intended ACAL data type, and the element content MUST conform to the lexical or structured representation defined for that type.

### 5.2.4 Default mapping rules for complex ACAL types (other than ValueType)

If a complex ACAL type `FooType` is not in the previous cases (Section 5.2.1, 5.2.2 and 5.2.3), then:

1. If `FooType` is abstract (italicized title in the UML diagram), then:
   * 1.1. If `FooType` is empty (no class inheritance, no property), then:
     - 1.1.1. If and only if `FooType` is used by more than one property in ACAL model (e.g. `ArgumentType`), then map it to the following XSD definition:
       ```xml 
       <xs:element name="Foo" type="FooType" abstract="true" />
       <xs:complexType name="FooType" abstract="true"/>
       ```
     - 1.1.2. Else (it is single-used) skip it as instructed in Section 5.2.2.

   * 1.2. Else (`FooType` is not empty, i.e. inherits a type and/or has at least one property):
     - 1.2.1. If  `FooType` inherits from a Datatype `BarType` (Generalization relationship), then:
       + 1.2.1.1. If `BarType` is a single-use empty type as defined in Section 5.2.2, `BarType` is not mapped to any XSD type (mapping is done only at the property level), therefore `FooType` SHALL be mapped to the following XSD definition (not inheriting from `BarType`):

          ```xml
          <xs:element name="Foo" type="FooType" abstract="true" />
          <xs:complexType name="FooType" abstract="true">
            ...property mapping rules (5.2.5) apply...
          </xs:complexType>
          ```

+ 1.2.1.2. Else (`BarType` is not a single-use empty type, therefore mapped to a dedicated XML type and element) if `FooType` has no property (e.g. `ExpressionType`), map it to the following XSD element definition:

         ```xml
         <xs:element name="Foo" type="FooType" substitutionGroup="Bar" abstract="true"/>
         <xs:complexType name="FooType" abstract="true">
              <xs:complexContent>
                <xs:extension base="BarType" />
              </xs:complexContent>
         </xs:complexType>
         ```

	    + 1.2.1.3. Else (`FooType` has at least one property):

            ```xml
            <xs:element name="Foo" type="FooType" substitutionGroup="Bar" abstract="true"/>
            <xs:complexType name="FooType" abstract="true">
              <xs:complexContent>
                <xs:extension base="BarType">
                  ...property mapping rules (5.2.5) apply...
                </xs:extension>
              </xs:complexContent>
            </xs:complexType>
            ```

     - 1.2.2. Else (`FooType` does not inherit any type) map `FooType` to the following XSD definition:

       ```xml
       <xs:complexType name="FooType" abstract="true">
         ...property mapping rules (5.2.5) apply...
       </xs:complexType>
       ```
2. Else (`FooType` is not abstract) apply the same mapping rules as in the first case, except remove `abstract="true"` from the `xs:complexType` and `xs:element` definitions.

3. If `FooType` has a UML *link* (kind of *Association*) via its property *keyRefProp* to another type `BarType`'s property *keyProp* (e.g. a reference to a BarType instance via its identifier), then add a `<xs:keyref>` element as defined in Section 3.11.2 of [[XS11](#xs11)] (Identity-constraint Definitions), into the XML element declaration of the root object type (*RootObjectType*) enclosing the property(ies) of type *FooType* and *BarType* (created previously), as follows:
   ```xml
   <xs:element name="RootObject" ...>
     ...
     <!-- The xs:key should already be declared from mapping BarType before FooType.  -->
     <xs:key name="RootObject_Bar_keyProp">
       <xs:selector xpath="<XPath_to_Bar_element>" />
       <xs:field xpath="@keyProp" />
     </xs:key>

     <!-- New keyRef -->
     <xs:keyref name="RootObject_Foo_keyRefProp" refer="RootObject_Bar_keyProp">
       <xs:selector xpath="<XPath_to_Foo_element>" />
       <xs:field xpath="@keyRefProp" />
     </xs:keyref>
   </xs:element>
   ```
   where `<XPath_to_Foo_element>` is the XPath expression to select the *Foo* element of `FooType`.

4. If `FooType` has *Object-level constraints* as defined in Section 7.1.1.1.2 of [[ACAL-Core-1.0](#acal-core-10)], implementers SHOULD apply the recommended mappings in the Section [5.2.6](#526-mapping-complex-acal-constraints-ocl), or they MAY also apply alternative implementation-specific mapping mechanisms as they see fit.

### 5.2.5 Property mapping rules

Inside the `xs:complexType` or `xs:extension` element created by the previous mapping rules, apply the property mappings for each property *Prop* of the complex ACAL type. Let *PropType* be *Prop*'s datatype.

1. If *Prop* has special name `<any>` (and special type `AnyType`) in ACAL, then map the property to the following XSD definition (replace *{min}* with the lower bound of *Prop*'s multiplicity in the ACAL (UML) model, and *{max}* with the upper bound, using `unbounded` as equivalent for `*`):
   ```xml
   <xs:sequence>
		<xs:any namespace="##any" processContents="lax" minOccurs="{min}" maxOccurs="{max}"/>
	 </xs:sequence>
   ```

2. Else if *PropType* is a simple type (stereotyped `<<primitive>>`, `<<restrictedString>>` or `<<enumeration>>`, Section 5.1), then:

   - 2.1. Map *PropType* to a XSD type according to mapping rules of Section 5.1. The obtained XSD type is referred to as `PropXsdType` in the next steps.
   - 2.2. If *PropType* is other than (unrestricted) `String` (it may be a restricted String type as in Section 5.1.2) AND single-valued (the upper bound of the multiplicity is 1), then map to an XML attribute as follows (if *Prop*'s multiplicity is `0..1`, replace `$use` with `optional`, else with `required`):

     ```xml
     <xs:attribute name="Prop" type="PropXsdType" use="$use"/>
     ```
     If *Prop* has a default value `$default`, then add the `default` attribute:
     ```xml
     <xs:attribute name="Prop" type="PropXsdType" use="$use" default="$default"/>
     ```
   - 2.3. Else (if *PropType* is `String` (unrestricted, i.e. not a derived type) or multi-valued), then:

     Define a global element named *Prop* in XACML namespace:

     ```xml
     <xs:element name="Prop" type="PropXsdType"/>
     ```

     If this is the first property in the datatype, then create  a `<xs:sequence>`. 

     Add an element reference to the *Prop* global element above inside the `<xs:sequence>` as follows (replace `$min` with the lower bound and `$max` with the upper bound of *Prop*'s multiplicity in the ACAL (UML) model, using `unbounded` as equivalent for `*`):

        ```xml
        <xs:sequence>
           ...other properties mapped to elements...
           <xs:element ref="Prop" minOccurs="$min" maxOccurs="$max"/>
           ...other properties mapped to elements...
        </xs:sequence>
        ```

   - 2.4. If *Prop* is multivalued and has a *simple uniqueness constraint* as defined in Section 7.1.1.1.1.1 of [[ACAL-Core-1.0](#acal-core-10)], i.e. a UML `unique` annotation, then add an `<xs:key>` element as defined in Section 3.11.2 of [[XS11](#xs11)] (Identity-constraint Definitions), into the XML element declaration of the root object type enclosing *Prop* (created previously), as follows:

     ```xml
     <xs:element name="RootAncestorOfProp" ...>
        ...
        <xs:key name="RootAncestorOfProp_Prop">
          <xs:selector xpath="<XPath_to_Prop>" />
          <xs:field xpath="." />
        </xs:key>
     </xs:element>
     ```

     where `<XPath_to_Prop>` is the XPath expression to select the *Prop* element from `RootAncestorOfProp` element.

3. Else if *PropType* is a *single-use empty type* as defined in Section 5.2.2 (e.g.`CombinerInputType`), i.e. an empty abstract type only used by *Prop* in the ACAL model, with subtypes *Sub1Type, Sub2Type, etc.*, then for each subtype *SubXType* of *PropType*, apply the mapping rules in the previous section and this section to *SubXType*, and create an element `<xs:element name="SubX" type="SubXType" />` in XACML namespace if it does not already exist (`<xs:element name="SubX" type="SubXType" abstract="true"/>` if *SubXType* is abstract). Then *PropType* maps to the following XSD definition (replace `$min` with the lower bound of *Prop*'s multiplicity in the ACAL (UML) model, and `$max` with the upper bound, using `unbounded` as equivalent for `*`):

   ```xml
   <xs:choice minOccurs="$min" maxOccurs="$max">
      <xs:element ref="Sub1"/>
      <xs:element ref="Sub2"/>
      ...
   </xs:choice>
   ``` 

4. Else (*PropType* is not a single-use empty type), apply the mapping rules in the previous section and this section to *PropType*, then:

   - 4.1. Define a global element named `Prop` of type `PropType` in XACML namespace if it does not already exist:

     ```xml
     <xs:element name="Prop" type="PropType"/>
     ```
     If `PropType` is abstract, add the `abstract="true"` attribute:

     ```xml
     <xs:element name="Prop" type="PropType" abstract="true"/>
     ``` 

If `PropType` inherits from a type `BarType`, apply the mapping rules in the previous section and this section to `BarType` if the XSD type `BarType` is not already defined, then create a global element named `Bar` of type `BarType` in XACML namespace by re-applying this same rule 4.1 with `Bar` as *Prop* and `BarType` as *PropType*, if the element `Bar` does not already exist. Then add *Prop* element to `Bar` substitution group:

     ```xml
     <xs:element name="Prop" type="PropType" substitutionGroup="Bar"/>
     ```

   - 4.2. Map *Prop* to the following XSD definition (replace `$min` with the lower bound of *Prop*'s multiplicity in the ACAL (UML) model, and `$max` with the upper bound, using `unbounded` as equivalent for `*`):

     ```xml
     <xs:sequence>
       ...other properties mapped to elements...
       <xs:element ref="Prop" minOccurs="$min" maxOccurs="$max"/>
       ...other properties mapped to elements...
     </xs:sequence>
     ```

   - 4.3. If *Prop* has a *mandatory-property-based uniqueness constraint* as defined in Section 7.1.1.1.1.2 of [[ACAL-Core-1.0](#acal-core-10)], i.e. `self->isUnique(itemProp)`, then add an `<xs:key>` element as defined in Section 3.11.2 of [[XS11](#xs11)] (Identity-constraint Definitions), into the XML element of the root object type enclosing *Prop* (created previously), as follows (such `itemProp` is always mapped to an XML attribute in this case):

     ```xml
     <xs:element name="RootAncestorOfProp" ...>
        <xs:key name="RootAncestorOfProp_Prop">
          <xs:selector xpath="<XPath_to_Prop>" />
          <xs:field xpath="@itemProp" />
        </xs:key>
     </xs:element> 
     ```
     where `<XPath_to_Prop>` is the XPath expression to select the *Prop* element from `RootAncestorOfProp` element.

   - 4.4 Else if *Prop* has a *optional-property-based uniqueness constraint* as defined in Section 7.1.1.1.1.2 of [[ACAL-Core-1.0](#acal-core-10)], i.e. `self->select(itemProp <> null)->isUnique(itemProp)`, then add an `<xs:unique>` element as defined in Section 3.11.2 of [[XS11](#xs11)] (Identity-constraint Definitions), into the XML element of the root object type enclosing *Prop* (created previously), as follows (such `itemProp` is always mapped to an XML attribute in this case):

     ```xml
     <xs:element name="RootAncestorOfProp" ...>
        <xs:unique name="RootAncestorOfProp_Prop">
          <xs:selector xpath="<XPath_to_Prop>" />
          <xs:field xpath="@itemProp" />
        </xs:unique>
     </xs:element>
     ```

     where `<XPath_to_Prop>` is the XPath expression to select the *Prop* element from `RootAncestorOfProp` element.

   - 4.5. Else if *Prop* has a *multi-property-based uniqueness constraint* as defined in Section 7.1.1.1.1.2 of [[ACAL-Core-1.0](#acal-core-10)], i.e. ` self->isUnique(Sequence{itemProp1, itemProp2, ...})`, then add an `<xs:unique>` element as defined in Section 3.11.2 of [[XS11](#xs11)] (Identity-constraint Definitions), into the XML element of the root object type enclosing *Prop* (created previously), as follows (such `itemProp1`, `itemProp2`, etc. are always mapped to XML attributes in this case):

     ```xml
     <xs:element name="RootAncestorOfProp" ...>
        <xs:unique name="RootAncestorOfProp_Prop">
          <xs:selector xpath="<XPath_to_Prop>" />
          <xs:field xpath="@itemProp1" />
          <xs:field xpath="@itemProp2" />
          ...
        </xs:unique>
     </xs:element> 
     ```

     where `<XPath_to_Prop>` is the XPath expression to select the *Prop* element from `RootAncestorOfProp` element.

     When one or more of `itemProp1`, `itemProp2`, etc. is itself optional (i.e. may be absent from an element instance), the `<xs:unique>` element above is necessarily incomplete: per Section 3.11.4 of [[XS11](#xs11)], an element for which any `{field}` has no corresponding value is excluded from the *qualified node set* entirely, rather than being compared as holding a distinct or absent value for that field. Two elements that are otherwise identical, including sharing the same absence of the optional property, will therefore validate successfully as if they were not duplicates. Implementers requiring full enforcement of the constraint in this case SHOULD additionally apply Section 5.2.6's Option 1 (XSD 1.1 assertions) or Option 2 (Schematron rules) alongside the `<xs:unique>` element above; the `<xs:unique>` element alone is not sufficient. The *Core XML schema* accompanying this document applies this pattern at `RequestEntityType`, `ResultEntityType` and `EntityType` (see [[ACAL-Core-1.0](#acal-core-10)] Sections 7.33, 7.44 and 7.45).

   - 4.6. Else if *Prop* has other kinds of constraints defined in Section 7.1.1.1.1.2 of [[ACAL-Core-1.0](#acal-core-10)] not mentioned previously, implementers SHOULD apply the recommended mappings in the next section, or they MAY also apply alternative implementation-specific mapping mechanisms as they see fit.

### 5.2.6 Mapping complex ACAL constraints (OCL)

_*This section is non-normative.*_ 

The following kinds of OCL-defined UML constraints in the [[ACAL-Core-1.0](#acal-core-10)] model do not have any equivalent in [[XSD 1.0](#xs)]:

- Some of the OCL-defined property-level constraints in [[ACAL-Core-1.0](#acal-core-10)] Section 7.1.1.1.1.2:
  - Multivalued-property-based uniqueness constraint;
  - Value type uniqueness constraint.
- All object-level constraints in [[ACAL-Core-1.0](#acal-core-10)] Section 7.1.1.1.2.

This document does not mandate a particular method to map and/or implement these more complex constraints, and leaves this part of the specification implementation-defined. Instead, this document provides only an implementation guidance that recommends two possible options described in the next sections:

- Option 1: [[XSD 1.1](#xs11)] schema with XML Schema 1.1 *assertions*;
- Option 2: [[XSD 1.0](#xs)] schema with [ISO Schematron](#schematron) rules.


#### 5.2.6.1 Option 1: XML Schema 1.1 assertions

Implementations supporting [W3C XML Schema 1.1](#xs11) standard SHOULD use XSD 1.1 assertions as defined in Section 3.13 of XSD 1.1 standard to implement the aforementioned constraints. The general mapping rule consists for each constraint specified on a ACAL Datatype `FooType` or one of its properties, to define an equivalent XSD 1.1 assertion `<xs:assert test="expression"/>` - where *expression* is the XPath equivalent of the OCL constraint expression - inside the `xs:complexType` definition of `FooType`.

The equivalent XSD 1.1 assertions are already defined in the *Core XML schema* accompanying this document (`<xs:assert>` elements). However, certain generic assertions may be problematic for certain XSD 1.1 / XPath engines or use cases, in which case alternative assertions are suggested in XML comments before or after each possibly problematic `<xs:assert>` element currently in use in the schema. Implementers SHOULD review these before use.

Moreover, implementers MAY choose to replace some of the assertions with possibly more optimal implementations as long as they provide equivalent constraint enforcement.

For information only, the following table suggests generic mappings for some of the aforementioned complex UML constraints used in ACAL model:

**Table 2:** ACAL/UML constraints mapped to [[XSD 1.1](#xs11)] assertions

| ACAL constraint's OCL expression | XSD 1.1 assertion's XPath expression |
| :--- | :--- |
| `X or Y` <br> *(X, Y can be any of the predicates below)* | `X or Y` |
| `prop <> null` <br> *(`prop` is single-valued)* | `prop` <br> *(the `prop` element occurs)* |
| `prop = null` <br> *(`prop` is single-valued)* | `not(prop)` <br> *(no `prop` element occurs)* |
| `prop->notEmpty()` <br> *(`prop` is multivalued)* | `prop` <br> *(at least one `prop` element occurs)* |

You may find further guidance about XSD-1.1-based validation on [OASIS ACAL \[XACML\] TC's code repository](https://github.com/oasis-tcs/acal-spec/).


#### 5.2.6.2 Option 2: Schematron rules

Due to the current general lack of adoption of XSD 1.1 (and limited availability of implementations), implementations only supporting XSD 1.0 MAY achieve the same result by combining the following: 

- An XSD 1.0 version of the *Core XML Schema*, obtained by filtering out all the schema elements with attribute `vc:minVersion="1.1"` (according to [[XSV](#xsv)]) from the XSD 1.1 schema (e.g. with an [[XSLT](#xslt)] stylesheet);
- [ISO Schematron](#schematron) rules provided with this document (file with `.sch` extension), that implement the complex OCL constraints with similar - if not the same - XPath expressions as the XSD 1.1 assertions in the previous Option 1. Therefore, like XSD 1.1 assertions, certain generic Schematron assertions may be problematic for certain XSLT / XPath engines or use cases, in which case alternative assertions are suggested in XML comments before or after each possibly problematic `<assert>` element currently in use in the Schematron rules. Implementers SHOULD review these before use. Moreover, implementers MAY choose to replace some of the assertions with possibly more optimal implementations as long as they provide equivalent constraint enforcement. Each Schematron `pattern` element has the corresponding  [[ACAL-Core-1.0](#acal-core-10)] model's UML constraint (with OCL expression) reminded in the child `title` element. You may find further guidance about Schematron-based validation on [OASIS ACAL \[XACML\] TC's code repository](https://github.com/oasis-tcs/acal-spec/).

#### 5.2.6.3 Limitations common to both options: identifier-typed keys

Neither Option 1 nor Option 2 can achieve full enforcement of a constraint whose key properties (whether from Section 5.2.5 rules 4.3 through 4.5, or from this section) include a value of the `IdentifierType` simple type (see [[ACAL-Core-1.0](#acal-core-10)] Section 7.1.2.3.8). Determining identifier equality for such properties requires first resolving any short identifier name to its full URI per [[ACAL-Core-1.0](#acal-core-10)] Section 8.3, a processing step that XML Schema validation and Schematron validation do not, and cannot, perform. Two elements whose `IdentifierType`-typed key properties differ only in short-identifier-name-vs-URI spelling will not be recognized as duplicates by either option. Implementers requiring full enforcement of such a constraint MUST perform this expansion themselves — for example with a preliminary XSLT canonicalization pass — before schema and/or Schematron validation.

Where this limitation applies to a specific constraint in the *Core XML Schema* or Schematron rules accompanying this document, it is noted in an XML comment adjacent to the corresponding `<xs:assert>` or Schematron `<pattern>` element; those comments illustrate this general limitation rather than being exceptions to it. Implementers deriving an XSD 1.0 schema via the filtering procedure described in Section 5.2.6.2 should note that XML comments, including these, are not preserved by that procedure (the [XSLT] stylesheet `xsd1.1-to-1.0.xsl` provided with this repository does not copy comment nodes, and a filtering stylesheet must say so explicitly if it is to copy them); this section is the durable statement of the limitation for implementers relying on that derivation path.

## 5.3 Content Types and Body representations (optional)

Although this specification defines an XML representation, both XML and non-XML data may be represented in a `<Content>` element (corresponding to an ACAL `ContentType` object).
This specification defines the following `Content` types in order to support ACAL Profiles with AttributeSelector and/or DataType extensions based on such Content (e.g. XPath and JSONPath Profiles):

- XML document:
  - `MediaType` attribute SHALL be set to `application/xml` (default value);
  - `Encoding` attribute unused;
  - `Body` element has only a single child element that is the XML document itself.

- JSON object *(note that a JSON array can be wrapped in a JSON object if there is a need to support JSON arrays)*:
  - `MediaType` attribute SHALL be `application/json`;
  - `Encoding` attribute unused;
  - `Body` element has only a text node that contains the JSON object, either escaped to fit in a simple XML string, or unescaped in a XML CDATA section as follows:
    ```xml
    <Body>
      <![CDATA[
        ... JSON object ...
      ]]>
    </Body>
    ```

The implementation SHALL support a given content type in this list if and only if there is an ACAL Profile that makes it mandatory (refer to the Profile's specification for more information).

-------

# 6 Safety, Security and Privacy Considerations (non-normative)

This section identifies possible security and privacy compromise scenarios that should be considered when implementing this specification. The section is informative only. It is left to the implementer to decide whether these compromise scenarios are practical in their environment and to select appropriate safeguards.

## 6.1 Threat model

Refer to [[ACAL-Core-1.0](#acal-core-10)] Section 10.1.

## 6.2 Safeguards

Refer to [[ACAL-Core-1.0](#acal-core-10)] Section 10.2 for general considerations.

### 6.2.1 Policy confidentiality

Where the policy is represented in XML Representation defined by this specification, the *XML Encryption Syntax and Processing* W3C Recommendation can be used to encrypt all or parts of an XML document. XML Encryption is recommended for use with XACML.

### 6.2.2 Policy integrity

The selection of the appropriate mechanisms is left to the implementers. However, when **_policy_** is distributed between organizations to be acted on at a later time, or when the **_policy_** travels with the protected **_resource_**, it would be useful to sign the **_policy_**. In these cases and when the XML representation of policies (according to this specification) is used, the *XML Signature Syntax and Processing standard* from W3C is recommended to be used with XACML.

-------

# 7 Conformance


## 7.1 Introduction

The XACML specification addresses conformance for ACAL object types and features when represented in XML.

Some ACAL objects and features are optional to implement, either because
they are optional in the ACAL core or because they are only required when
supporting specific ACAL profiles or deployment scenarios. If an
implementation claims support for such an optional feature, it MUST
implement the corresponding XML syntax, typing, and constraint rules
consistently.

This specification is accompanied by normative machine-readable
artifacts for core XACML syntax and core short
identifiers. These artifacts support
consistent implementation and validation of XACML, but they do not
change the peer relationship between XACML and the YAML and JSON ACAL
representations.

## 7.2 Conformance Categories

For the purposes of this specification:

- **M** means mandatory-to-implement for a processor claiming core XACML
  conformance
- **O** means optional-to-implement

For ACAL object types, these categories are inherited unchanged from
[[ACAL-Core-1.0](#acal-core-10)] Section 11.2.1. XACML uses the same notation
again in [Section 7.3.2](#732-machine-readable-artifact-support) for
XACML-specific artifacts.

An implementation MUST follow
[Section 5](#5-syntax-normative-with-the-exception-of-the-schema-fragments)
and [Annex C](#annex-c-xacml-identifiers-normative) where they apply to
the ACAL object types and machine-readable artifacts that the
implementation supports.

## 7.3 Conformance Tables

### 7.3.1 ACAL Object-Type Conformance

XACML inherits ACAL object-type conformance from
[[ACAL-Core-1.0](#acal-core-10)] Section 11.2.1.

A processor claiming core XACML conformance MUST support the XACML
representation of every ACAL object type marked `M` in that table. It
MAY omit support for ACAL object types marked `O` unless it claims the
corresponding optional ACAL feature.

This specification therefore does not repeat the ACAL core object-type
conformance table.
[Section 5](#5-syntax-normative-with-the-exception-of-the-schema-fragments)
defines the XML representation of those same ACAL object types, while
[[ACAL-Core-1.0](#acal-core-10)] remains authoritative for their
mandatory/optional classification.

### 7.3.2 Machine-Readable Artifact Support

The following machine-readable artifacts accompany this specification:

| Artifact | Status | Notes |
|:---|:---:|:---|
| `acal-core-xml-v4.0-schema.xsd` | M | Core XML Schema |
| `acal-core-xml-v4.0-identifiers.xml` | M | Core short identifier set represented in XML |
| `acal-core-xml-v4.0-schematron.sch` | O | Schematron rules used with the XSD 1.0 version ([Section 5.2.6.2](#5262-option-2-schematron-rules)) |

The XML Schemas and short identifier sets for XPath Profile and JSONPath Profile support are artifacts of those Profiles' own Work Products, not of this Core specification.

-------


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

This section contains the normative and informative references that are used in this document. 

Normative references are specific (identified by date of publication and/or edition number or version number) and Informative references are either specific or non-specific. For specific references, only the cited version applies. For non-specific references, the latest version of the reference document (including any amendments) applies. While any hyperlinks included in this section were valid at the time of publication, OASIS cannot guarantee their long term validity.

## B.1 Normative References

The following documents are referenced in such a way that some or all of their content constitutes requirements of this document.

###### [ACAL-Core-1.0]

_Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html

###### [DS]

D. Eastlake et al., XML Signature Syntax and Processing (Second Edition), W3C Recommendation 10 June 2008, https://www.w3.org/TR/2008/REC-xmldsig-core-20080610/

###### [RFC2119]

Bradner, S., "Key words for use in RFCs to Indicate Requirement Levels", BCP 14, RFC 2119, DOI 10.17487/RFC2119, March 1997, https://www.rfc-editor.org/info/rfc2119.

###### [RFC8174]

Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP 14, RFC 8174, DOI 10.17487/RFC8174, May 2017, https://www.rfc-editor.org/info/rfc8174.

###### [XF]

W3C XQuery, XPath, and XSLT Functions and Operators Namespace Document (XPath and XQuery Functions and Operators 3.1) 21 March 2017, https://www.w3.org/2005/xpath-functions/

###### [XML]

Bray, Tim, et.al. eds, Extensible Markup Language (XML) 1.0 (Fifth Edition), W3C Recommendation 26 November 2008, https://www.w3.org/TR/2008/REC-xml-20081126/

###### [XS]

XML Schema 1.0, parts 1 and 2. Available at: https://www.w3.org/TR/xmlschema-1/ and https://www.w3.org/TR/xmlschema-2/

###### [XS11]

XML Schema 1.1, parts 1 and 2. Available at: https://www.w3.org/TR/xmlschema11-1/ and https://www.w3.org/TR/xmlschema11-2/

## B.2 Informative References

The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [Schematron]

ISO/IEC 19757-3:2025, Information technology — Document Schema Definition Languages (DSDL) - Part 3: Rule-based validation using Schematron, Edition 4, September 2025. Online: https://www.iso.org/standard/85625.html.

###### [XSLT]

XSL Transformations (XSLT) Version 1.0, W3C Recommendation 16 November 1999, https://www.w3.org/TR/xslt/

###### [XSV]

W3C, XML Schema Versioning namespace, August 2007. Online: https://www.w3.org/2007/XMLSchema-versioning/

###### [ENTITIES]

_XACML v3.0 Related and Nested Entities Profile Version 1.0_. Edited by Steven Legg. 16 February 2021. OASIS Committee Specification 02. https://docs.oasis-open.org/xacml/xacml-3.0-related-entities/v1.0/cs02/xacml-3.0-related-entities-v1.0-cs02.html. Latest stage: https://docs.oasis-open.org/xacml/xacml-3.0-related-entities/v1.0/xacml-3.0-related-entities-v1.0.html.

###### [XPath]

XML Path Language (XPath) 3.1, W3C Recommendation 21 March 2017, https://www.w3.org/TR/xpath-31/

# Annex C XACML identifiers (normative)

(This annex forms an integral part of this Specification.)

This section defines standard identifiers for commonly used entities.

## C.1 XACML namespaces

XACML is defined using this identifier:

`urn:oasis:names:tc:xacml:4.0:core:schema`

## C.2 Core Short-Identifier Set

This work product provides the standard XML serialization of the ACAL
core short-identifier set in the file
`acal-core-xml-v4.0-identifiers.xml`.

The `ShortIdSet.Id` value of this artifact is:

`urn:oasis:names:tc:acal:1.0:core:identifiers`

**CAUTION:** This short identifier set SHALL NOT be modified except by the OASIS ACAL \[XACML\] TC. Since its `ShortIdSet.Id` is using one of the prefixes reserved for OASIS ACAL \[XACML\] TC use (`urn:oasis:names:tc:acal:`), a user outside the TC SHALL NOT create a short identifier set of their own with the same `Id`.

-------

# Annex D XML Schema (normative)

(This annex forms an integral part of this Specification.)

This section includes the XML Schema for the XACML syntax defined in this specification, more particularly in Section 5 (i.e. obtained by applying the ACAL-to-XML mapping rules):

```xml 
!include`xslt="pandoc/remove-comments.xsl"` acal-core-xml-v4.0-schema.xsd
```

-------

# Annex E How to generate HTML and PDF versions

(This annex does not form an integral part of this Specification and is informational.)

## Online generation

HTML/PDF versions are generated automatically online via GitHub Actions after each update pushed to the main branch of [OASIS ACAL \[XACML\] TC code repository](https://github.com/oasis-tcs/acal-spec/). Go to GitHub Actions on the repository, then go to the latest workflow run, and, if the run succeeded, the summary should display the links to the generated HTML/PDF documents.

## Offline generation

### Prerequisites

The following tools are required:
- [Pandoc](https://pandoc.org/) **v3.2.1 or later** ( [latest release](https://github.com/jgm/pandoc/releases/latest) );
- [Pandoc-include filter](https://github.com/DCsunset/pandoc-include).

Install them on your system.

Git clone or get a local copy of [OASIS ACAL \[XACML\] TC code repository](https://github.com/oasis-tcs/acal-spec/), open a terminal and **change your working directory to the root directory of your local copy of the repository**.

### CSS stylesheet

The generation command uses the CSS stylesheet file `pandoc/styles/markdown-styles-v1.7.3b.css` (with `-c` argument) based on the [v1.7.3a](https://docs.oasis-open.org/templates/css/markdown-styles-v1.7.3a.css) provided by OASIS.

### HTML generation

Run the following command line to generate the HTML from this markdown file (input file specified as last argument):

```console
$ pandoc/mkdocs.sh --output /tmp acal-core-xml-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

The publication date is automatically set to the current date by default (using Lua filter `pandoc/meta_vars.lua`). However, you may set a specific date of your choice instead, by adding the argument `--metadata date="My date in the form DD Month YYYY"` at the end of the command. 

### PDF generation

For PDF output, add the `--pdf` option as follows:

```console
$ pandoc/mkdocs.sh --pdf --output /tmp acal-core-xml-v%version%.md
```

The HTML file is generated like the previous command and, in addition, a PDF file is generated with the same name as the input file except the `.md` extension is replaced with `.pdf` in this case.

Beware that **the result PDF - the embedded fonts in particular - may differ depending on the system/machine** where you run this command. Mainly, it depends on which fonts are actually installed on the system, as the HTML-to-PDF converter (Chrome / Chromium in this case) selects available fonts according to the prioritized lists defined by `font-family` properties in the CSS.

**For official TC publications**, add the `--official` argument to avoid this issue and produce a system-independent output:

```console
$ pandoc/mkdocs.sh --pdf --official --output /tmp acal-core-xml-v%version%.md
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
  - Bill Parducci, Individual


## Participants


The following individuals were members of this committee during the creation of this document, not just this version of the document, and their contributions are gratefully acknowledged:

**OASIS ACAL \[XACML\] TC Members:**

- Bill Parducci, Individual
- Steven Legg, ViewDS Identity Solutions
- Cyril Dangerville, THALES

-------

# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)


The changes made since the previous version (Committee Specification Draft 01) are the following. Section numbers refer to this version.

- The XML Schema follows the changes to the ACAL model made since that version, which [[ACAL-Core-1.0](#acal-core-10)] Appendix 2 lists: among them, `Argument` replaces `Expression` in `Apply`, `PolicyReference` and `SharedVariableReference`, with named arguments; `RequestReference` contains a sequence of `RequestEntityReference` elements, each a local identifier, instead of a sequence of `RequestEntityReferenceType` objects; attributes are unique by `(AttributeId, DataType, Issuer)`; notice identifiers need not be unique; and the `Category` of `MissingAttributeDetail` is optional.
- This specification states that [[ACAL-Core-1.0](#acal-core-10)] remains authoritative for the ACAL model, its evaluation semantics and the mandatory or optional status of each object type, and that XACML defines only their XML representation ([Section 4.1](#41-requirements)).
- An `xs:integer` value outside an implementation's supported integer interval is a valid `xs:integer` value and is not to be treated as schema-invalid solely because of its magnitude ([Section 5.1.1](#511-primitive-types-mapped-to-standard-xsd-data-types)).
- The `ValueType` mapping states how the concrete `ValueType` subtype is determined from the effective `DataType` and the XML content form ([Section 5.2.3](#523-valuetype-mapping-rules)).
- Under the default mapping rules ([Section 5.2.4](#524-default-mapping-rules-for-complex-acal-types-other-than-valuetype)), an abstract XSD element is now defined for an empty abstract type used by more than one property (rule 1.1.1) and for an abstract type that inherits from another type (rules 1.2.1.1 to 1.2.1.3). Where the supertype is mapped to an element, the subtype's element is in the substitution group of its direct supertype's element (rules 1.2.1.2 and 1.2.1.3), replacing csd01's rule based on the closest supertype used as a property's datatype; and a subtype with no property now has its own abstract complex type extending its supertype (rule 1.2.1.2).
- The limits of XML Schema and Schematron enforcement are stated for a multi-property uniqueness constraint whose key properties are optional ([Section 5.2.5](#525-property-mapping-rules), rule 4.5) and for any key that contains an `IdentifierType` value ([Section 5.2.6.3](#5263-limitations-common-to-both-options-identifier-typed-keys)).
- The Conformance section is restructured: XACML inherits ACAL object-type conformance from [[ACAL-Core-1.0](#acal-core-10)] instead of repeating a schema-element table, and lists the machine-readable artifacts that accompany this specification ([Section 7](#7-conformance)). The XML Schemas of the XPath and JSONPath Profiles are now artifacts of those Profiles. An implementation follows Section 5 and Annex C where they apply to the ACAL object types and machine-readable artifacts that the implementation supports ([Section 7.2](#72-conformance-categories)).
- The core short identifier set artifact and its reserved `ShortIdSet` identifier are described in [Annex C.2](#c2-core-short-identifier-set).
- Requirements and recommendations previously written in lowercase or mixed case are written with the uppercase BCP 14 keywords: a single-use empty datatype "SHALL NOT be mapped" to a dedicated XML type ([Section 5.2.2](#522-single-use-empty-datatypes)), and the recommendation that implementers add further restrictions to the XML schema in production ([Section 5.2.1](#521-anytype-mapping-rule)) now uses "SHOULD"; and "SHALL not" in the `PolicyReference` and `SharedVariableReference` annotations of the XML schema and in the corresponding Schematron rule titles is written "SHALL NOT".
- The simple-type mapping covers `<<restrictedString>>` types alongside `<<primitive>>` and `<<enumeration>>` types, and the property mapping rule applies to all three ([Section 5.1](#51-mapping-acal-simple-types), [Section 5.2.5](#525-property-mapping-rules) rule 2).
- [Annex E](#annex-e-how-to-generate-html-and-pdf-versions) describes online generation by the repository's GitHub Actions workflow and offline generation with `pandoc/mkdocs.sh`, lists the tools that script requires, and no longer describes a Docker alternative.
- The example short-identifier set in [Section 4.3](#43-example-short-identifier-set-non-normative) is well-formed (its `ShortIdSet` element had been closed before its children), and the example `IdentifierType` values are written without quotation marks.
- Editorial: the title is now "XACML Version 4.0 (eXtensible Access Control Markup Language)" (csd01: "eXtensible Access Control Markup Language (XACML) Version 4.0 (XML Representation of ACAL Version 1.0)"), and the Technical Committee is renamed, and document and repository URLs are updated accordingly; the references and citations are corrected; and the example short identifier set is marked non-normative ([Section 4.3](#43-example-short-identifier-set-non-normative)) and repaired so that its `ShortIdSet` element is well-formed (csd01 closed it before its children).

The remainder of this appendix describes how XACML 4.0 differs from XACML 3.0.

XACML 4.0 differs from XACML 3.0 in the following ways:

- The policy (`Policy`) and policy set (`PolicySet`) constructs have been merged into a single construct which is known as a policy (`Policy`) in ACAL 1.0.

  - Compared to XACML 3.0, the `<PolicySet>`, `<PolicySetIdReference>`, `<PolicySetCombinerParameters>` and `<PolicySetDefaults>` elements and `PolicySet` type no longer appear.

  - Compared to XACML 3.0, the `PolicyType` type now allows child `<Policy>` and `<PolicyReference>` (was `PolicyIdReference`, which also replaces `PolicySetIdReference`) elements.

  - Compared to XACML 3.0, a `Policy` may contain more than one `PolicyDefaults` element, one per ACAL Profile possibly. 

  -  EarliestVersion and LatestVersion attributes removed from `<PolicyReference>`

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

- `AttributeValue` is replaced with more generic `Value` whose `DataType` is now optional, i.e. it may be omitted when it is already defined at the parent or ancestor level, which simplifies expressions with literal values. In particular, as a result of the previous change, in an `Attribute`, the `Value`'s `DataType` is now omitted since defined at the `Attribute` level already.

- `Content` may now contain XML, JSON and possibly other content types in the future, and therefore has a new data model - more generic - that consists of a `Body` element (content body which is similar to former Content value) and two attributes: `MediaType` (Content media type which indicates whether it is XML, JSON or some other content type) and `Encoding` (indicates whether the body is encoded with a particular mechanism, e.g. Base64-encoded data).

- `AttributeSelector` changes:

  - `DataType` attribute changed to be optional with the standard string type as default value to simplify the element declaration in most cases.
   * `MustBePresent`: changed to be optional with `false` as default value, to simplify the element declaration in most cases.
   * `AttributeSelector` and `Path` type of expression are abstract in ACAL model, concrete types of AttributeSelector Path expressions to be defined in ACAL Profiles, e.g. XPath Profile.

- `AttributeDesignator` changes to simplify the declaration in most cases: 

  * `DataType` attribute changed to be optional, with the standard string type as default.
  * `MustBePresent`: changed to be optional with `false` as default value.

- The `xml:id` attribute for an attribute category is replaced by a generic 'Id' property so that all ACAL representation formats are on an equal footing.

- The quantified expressions (`ForAny`, `ForAll`, `Select` and `Map`) and the `entity` data type from the XACML 3.0 Entities Profile [[ENTITIES](#entities)] have been incorporated in ACAL version 1.0. The `attribute-designator` function from the profile has been reinvented as the `EntityAttributeDesignatorType` expression object type and the `attribute-selector` function from the profile has been reinvented as the `EntityAttributeSelectorType` expression object type.

- Added new `BundleType` object which allows to bundle variable definitions (`SharedVariableDefinition`), short identifiers (`ShortIdSet`) and policies together in order to be portable / reused from one ACAL system to another, more particularly one PDP to another.
- Changed `Decision` element to an XML attribute in `Result`.

- XPath features moved to separate ACAL XPath Profile: XPath-based AttributeSelector, XPath-based functions, XPath expression datatype.

- Deprecated prefixes `urn:oasis:names:tc:xacml:` and `http://www.w3.org/2001/XMLSchema#` in favor of `urn:oasis:names:tc:acal:` for all standard identifiers (algorithms, status codes, data-types, functions, attributes and categories)
- `SharedVariableReference` is in the substitution group of `NonLiteralExpression` like the other expression elements, so that it can be used where an expression is expected; the `VersionMatchType` pattern allows `+` only as the last component; the XML Schema data types' deprecated identifiers begin with `http://`; drafting comments with issue numbers and typos are removed from the schemas.
- Editorial: the terms of [ACAL Core](#acal-core-10) Section 2 and its abbreviations apply ([Section 2](#2-definitions-and-acronyms)); the documentation of the `Body` element recommends (SHOULD) that implementers add restrictions, as [Section 5.2.1](#521-anytype-mapping-rule) does (it said "shall"); a sentence on the location of Schematron alternatives and the description of `RequestEntityReference` of this appendix are corrected.

- An `xs:integer` value that is outside an implementation's supported integer interval is not schema-invalid, although the implementation may refuse the containing request or policy ([Section 5.1.1](#511-primitive-types-mapped-to-standard-xsd-data-types)).

## Revision History

Latest revision history can be obtained from [OASIS ACAL \[XACML\] TC's code repository](https://github.com/oasis-tcs/acal-spec/blob/v1.0-%stage_revision%/acal-core-xml-v%version%-%stage_revision%.md).

| Revision | Date | Editor | Changes Made |
| :--- | :--- | :--- | :--- |
| acal-core-xml-v4.0-wd01 | 2024-08-09 | Steven Legg | Initial working draft |
| | 2024-09-09 | Steven Legg | Changed **_targets_** to a single child expression. |
| | | | Removed the `<AnyOf>`, `<AllOf>` and `<Match>` elements. |
| | | | Removed **_targets_** from rules. |
| | | | Removed the only-one-applicable **_combining algorithm_**. |
| | 2024-09-28 | Cyril Dangerville | Embedded diagrams. |
| | 2024-09-30 | Cyril Dangerville | Added support for definition lists. |
| | 2024-10-22 | Steven Legg | Reformatted indented paragraphs. |
| | | | Made MustBePresent, CombinedDecision and ReturnPolicyIdList XML attributes default false. |
| | 2025-04-16 | Steven Legg | Restructured the type hierarchy for policy references. |
| | 2025-04-17 | Steven Legg | Merged **_obligations_** and **_advice_** into **_notices_**. |
| | 2025-07-15 | Steven Legg | Added support for **_short identifiers_**. |
| | 2025-07-23 | Steven Legg | Added example two showing **_short identifiers_**. |
| | 2025-07-25 | Steven Legg | Grouping **_short identifiers_** in sets rather than collections. |
| | | | Replaced ShortIdentifier with ShortId. |
| | | | Replaced SIDCollection with ShortIdSet. |

-------

<!-- The following centered line represents the end of the document -->  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
