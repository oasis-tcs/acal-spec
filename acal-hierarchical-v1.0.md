---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: ACAL v1.0 Hierarchical Resource Profile Version 1.0
subtitle: Committee Specification Draft 02
version: "1.0"
stage_revision: csd02 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access", "authorization", "ABAC", "policylanguage", "hierarchical", "resource", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version

- https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v%version%/%stage_revision%/acal-hierarchical-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v%version%/%stage_revision%/acal-hierarchical-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v%version%/%stage_revision%/acal-hierarchical-v%version%-%stage_revision%.md


### Previous version


N/A

### Latest version


- https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v1.0/acal-hierarchical-v1.0.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v1.0/acal-hierarchical-v1.0.pdf
- https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v1.0/acal-hierarchical-v1.0.md


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


### Abstract


This specification is a profile of ACAL that defines how to identify, and request access to, a node within a hierarchically-organized resource (for example a node in an XML document, a resource addressed by a hierarchical URI such as a file-system path, or a node identified by its ancestor nodes), via three complementary node-identity schemes.


### Citation Format


When referencing this document, the following citation format should be used:

**[ACAL-Hierarchical-1.0]**
_%title%_.
Edited by Steven Legg, Cyril Dangerville and William Parducci. %date%. OASIS %subtitle%. https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v%version%/%stage_revision%/acal-hierarchical-v%version%-%stage_revision%.html . Latest version: https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v1.0/acal-hierarchical-v1.0.html .


### Related Work

This document is related to:

- _Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html
- _ACAL v1.0 XPath Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/acal-xpath-v1.0.html


## License, Document Status, and Notices


Copyright © OASIS Open 2026. All Rights Reserved.  For license and copyright information, and complete status, please see Annex A which contains the License, Document Status and Notices.

---


## Table of Contents

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
  - [4.1 Background](#41-background)
  - [4.2 Hierarchy Glossary](#42-hierarchy-glossary)
  - [4.3 Changes From the Previous Version](#43-changes-from-the-previous-version)
- [5 Node Identity Schemes](#5-node-identity-schemes)
  - [5.1 Nodes in XML Documents](#51-nodes-in-xml-documents)
  - [5.2 Nodes Identified by URI](#52-nodes-identified-by-uri)
  - [5.3 Nodes Identified by Ancestor Attributes](#53-nodes-identified-by-ancestor-attributes)
- [6 Policy Authoring Guidance (non-normative)](#6-policy-authoring-guidance-non-normative)
  - [6.1 Matching Ancestor Attributes](#61-matching-ancestor-attributes)
  - [6.2 Matching Nodes in XML Documents](#62-matching-nodes-in-xml-documents)
  - [6.3 Matching URIs](#63-matching-uris)
- [7 Examples (non-normative)](#7-examples-non-normative)
  - [7.1 Nodes in XML Documents](#71-nodes-in-xml-documents)
  - [7.2 Nodes Identified by URI](#72-nodes-identified-by-uri)
  - [7.3 Nodes Identified by Ancestor Attributes](#73-nodes-identified-by-ancestor-attributes)
- [8 Representation Considerations](#8-representation-considerations)
  - [8.1 XML](#81-xml)
  - [8.2 JSON](#82-json)
  - [8.3 YAML](#83-yaml)
- [9 Safety, Security, and Data Protection Considerations](#9-safety-security-and-data-protection-considerations)
- [10 Conformance](#10-conformance)
  - [10.1 Introduction](#101-introduction)
  - [10.2 Conformance Tables](#102-conformance-tables)
    - [10.2.1 Profile Identifiers](#1021-profile-identifiers)
    - [10.2.2 Attributes](#1022-attributes)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
  - [B.2 Informative References](#b2-informative-references)
- [Annex C ACAL Identifiers](#annex-c-acal-identifiers)
  - [C.1 ACAL Namespaces](#c1-acal-namespaces)
  - [C.2 Profile Identifiers](#c2-profile-identifiers)
  - [C.3 Attributes](#c3-attributes)
- [Annex D How to generate HTML and PDF versions](#annex-d-how-to-generate-html-and-pdf-versions)
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

This ACAL profile defines three complementary schemes for identifying, and constructing requests for access to, a node within a hierarchically-organized resource: identification by location within an XML document ([Section 5.1](#51-nodes-in-xml-documents)), identification by a hierarchical URI ([Section 5.2](#52-nodes-identified-by-uri)), and identification by ancestor attributes ([Section 5.3](#53-nodes-identified-by-ancestor-attributes)). It also defines the attribute identifiers each scheme uses.

Each scheme is independently OPTIONAL. Concrete representations (data formats) for the request/response structures involved are provided by the ACAL XML, JSON and YAML representation specifications; the XML-document scheme additionally depends on the ACAL XPath Profile [[ACAL-XPath-1.0](#acal-xpath-10)] for locating a node within an XML document. A JSONPath counterpart to the XML-document scheme is out of scope of this version — see [Section 4.3](#43-changes-from-the-previous-version).

---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

See Section 2 of [[ACAL-Core-1.0](#acal-core-10)].

### 2.1.2 Terms Defined in this Document

`Hierarchy`

: A directed graph of nodes representing a resource, in which every arc represents an immediate-parent relationship between two nodes. See [Section 4.2](#42-hierarchy-glossary) for the three kinds of hierarchy this profile addresses.

`Node`

: A single element of a hierarchy — for example a file, a directory, an LDAP directory entry, or an element of an XML document.

`Ancestor`

: With respect to a given node, any node reachable by following one or more immediate-parent arcs from the given node. A node is not its own ancestor.

### 2.1.3 Related terms

None.


## 2.2 Abbreviations and Acronyms

`DAG`

: Directed Acyclic Graph.

`HRP`

: Hierarchical Resource Profile


---


# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [[RFC2119](#rfc2119)] [[RFC8174](#rfc8174)] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions

None.

---


# 4 Introduction (non-normative)


## 4.1 Background

A hierarchical resource is one whose elements — nodes — are organized so that some nodes are reachable from others by an immediate-parent relationship: a file within a directory, an entry beneath another in an LDAP directory, or an element nested within another in an XML document. A single authorization decision typically concerns one node, but a policy frequently needs to reason about a node's position in the hierarchy — for instance, "a manager may read records in any project beneath their department" is a statement about ancestors, not just about the record itself.

The governing principle of this profile, carried forward from [[Hier](#hier)]: an authorization decision that permits access to an interior node does not imply that access to its descendant nodes is permitted, and vice versa. Each node's access is decided independently unless a policy explicitly says otherwise.

## 4.2 Hierarchy Glossary

This profile addresses three kinds of hierarchy:

`Single-rooted hierarchy`

: Every node has at most one parent, and there is exactly one node with no parent (the root). Equivalent to a tree.

`DAG (Directed Acyclic Graph)`

: A node MAY have more than one parent (multi-rooted), but no node is its own ancestor.

`Polyarchy`

: Multiple disjoint hierarchies that MAY be related to one another, including via cycles introduced by switching from one hierarchy to another. The most general case; this profile's ancestor-attribute scheme ([Section 5.3](#53-nodes-identified-by-ancestor-attributes)) makes no assumption about which of the three shapes is in use.

## 4.3 Changes From the Previous Version

This is the first ACAL version of this profile, ported from _XACML v3.0 Hierarchical Resource Profile Version 1.0_, **Committee Specification 02, 18 May 2014** [[Hier](#hier)]. ACAL Core's bibliography previously cited the superseded 2010 Committee Draft 03 of this profile; that citation is corrected by [[Hier](#hier)] in this document's own Annex B, and by the corresponding update to `acal-core-v1.0.md` and the other ACAL documents that carry the same citation.

The following substantive changes and decisions apply relative to the XACML 3.0 source:

- **No narrowing of the ancestor-attribute scheme.** An earlier analysis of this port considered requiring a single data type per ancestor attribute per request, because ACAL's original `isUnique(AttributeId)` constraint on `RequestEntityType`/`ResultEntityType`/`EntityType` made [XACML 3.0 HRP](#hier) §2.3's mixed-data-type ancestor representations unrepresentable. That constraint was independently identified as contradicting ACAL Core's own designator-matching rule ([[ACAL-Core-1.0](#acal-core-10)] Section 7.17) and was relaxed to `isUnique(Sequence{AttributeId, DataType, Issuer})` ([[ACAL-Core-1.0](#acal-core-10)] Section 7.33) before this profile was drafted. As a result, **no narrowing is needed**: a node's ancestors, and a node itself, MAY be identified using attributes of any ACAL data type, and there is no requirement that different nodes, or nodes in the same hierarchy, use the same data type — exactly as [XACML 3.0 HRP](#hier) §2.3 permits. See [Section 5.3](#53-nodes-identified-by-ancestor-attributes).
- **Erratum 1 (identifier naming).** The published CS02 body (§2.2, §2.3, §3.2, §3.3, §7.2, §7.3) and its §6 identifier summary disagree on the names of two of the three scheme identifiers — the body uses `URI-node-id` and `attribute-node-id`, §6 instead lists `non-xml-node-id` and `non-xml-node-req` (and omits `attribute-node-id` entirely). This document follows the body's spelling, which is used three times each against §6's one occurrence each: `urn:oasis:names:tc:acal:1.0:profile:hierarchical:URI-node-id` and `urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-id`. Because an implementation of the published profile could have followed either spelling, [Section 10.2.1](#1021-profile-identifiers) records both as deprecated identifiers rather than only the one this document follows.
- **Erratum 2 (version-segment contradiction).** The three optional sub-identifiers for partial ancestor-attribute support appear in CS02 §3.3 as `…:xacml:2.0:profile:hierarchical:non-xml-node-req:resource-*` and in §6 as `…:xacml:3.0:profile:…`. This document uses the `3.0` segment consistently, matching the version segment already used by the rest of this profile's identifiers. As with Erratum 1, [Section 10.2.1](#1021-profile-identifiers) records both version segments as deprecated identifiers, since an implementation of the published profile could have followed either.
- **Erratum 3 (malformed URNs).** CS02 §5 gives five attribute identifiers with a doubled colon after `oasis` (`urn:oasis::names:tc:xacml:…`). This document's identifiers ([Annex C.3](#c3-attributes)) correct this.
- **Erratum 4 (non-existent datatype).** CS02 §2.2/§5.2 specify the `resource-id`/`document-id` DataType as `http://urn:oasis:names:tc:xacml:1.0:data-type:anyURI` (§2.2) or the same URN without the `http://` prefix (§5.2) — neither identifies an actual XACML or ACAL data type. This document uses ACAL's own `urn:oasis:names:tc:acal:1.0:data-type:anyURI`.
- **Erratum 5 (XACML 2.0 leftover).** CS02 §3.1 refers to XACML 2.0's `<Resource>` element, which does not exist in XACML 3.0 or ACAL. This document uses `RequestEntityType`.
- **§2.2.1 (the `xpointer(…)` URI-reference representation for XML documents) is dropped from ACAL 1.0.** It is referenced by neither CS02 §6 nor §7 (no conformance clause exists for it in the published profile), and its percent-encoded XPath-in-a-fragment syntax duplicates the function of [Section 5.1](#51-nodes-in-xml-documents)'s `content-selector`-based scheme without adding capability. It MAY be reconsidered for a future version if an implementer needs it.
- **JSON content is out of scope for this version.** [Section 5.1](#51-nodes-in-xml-documents) (nodes in XML documents) applies only to XML `Content`; a JSONPath counterpart, paired with the ACAL JSONPath Profile, is a known and deliberate gap rather than an oversight — the JSONPath Profile does not yet define the identifier and conformance apparatus such a counterpart would depend on. This is tracked as follow-up work once the JSONPath Profile itself is more complete, and the ACAL Multiple Decision Profile's own XPath/JSONPath-expression scheme is expected to make the same choice for the same reason.
- **Renames**, consistent with ACAL Core: `<Attributes>` → `RequestEntityType`; `<Attribute>` → `RequestAttributeType`; `<AttributeValue>` → `Value`; `<Resource>` → gone (erratum 5, above).
- **Identifier namespace.** All identifiers introduced by this profile use the `urn:oasis:names:tc:acal:1.0:` prefix, with the XACML 3.0 identifiers recorded as deprecated identifiers per the standard ACAL convention.
- **`content-selector` is defined in the ACAL XPath Profile, not here.** In XACML 3.0, `urn:oasis:names:tc:xacml:3.0:content-selector` is defined by this profile (§5.1) but consumed by XACML core's `ContextSelectorId` mechanism. ACAL inverts that arrangement: `urn:oasis:names:tc:acal:1.0:content-selector` is defined alongside the mechanism that consumes it, in [[ACAL-XPath-1.0](#acal-xpath-10)] Annex D.3, because the identifier is not specific to hierarchical resources. This document references that definition (see [Section 5.1](#51-nodes-in-xml-documents)) rather than restating it.
- **Function argument order.** [XACML 3.0 HRP](#hier) §4.3's `regexp-uri-match` takes the URI argument first and the regular expression second. ACAL's equivalent, `urn:oasis:names:tc:acal:1.0:function:anyURI-regexp-match`, takes the regular expression first, matching the argument order of ACAL's other `*-regexp-match` functions. Any policy text carried over from an [XACML 3.0 HRP](#hier) example MUST have its arguments swapped — see [Section 6.3](#63-matching-uris).
- **Target restructure.** Example policies in this document use the boolean `Apply` form rather than XACML 3.0's `AnyOf`/`AllOf`/`Match` structure, consistent with ACAL Core.
- **No new schema artifacts.** Like the ACAL Multiple Decision Profile, this profile defines attribute identifiers and node-identity/request-construction rules, not new object types; it needs no new XSD, JSON Schema or YAML structure/constraint artifacts.

---


# 5 Node Identity Schemes

The types `RequestEntityType`, `RequestAttributeType` and `ContentType` used in this section are defined in [[ACAL-Core-1.0](#acal-core-10)]. Each of the three schemes below is independently OPTIONAL; an implementation MAY support any combination of them. [Section 10](#10-conformance) gives the identifier that names each scheme for conformance purposes. [Section 7](#7-examples-non-normative) gives a worked example of each.

## 5.1 Nodes in XML Documents

A node is identified as the single node of an XML document selected by an XPath expression, evaluated against the `Body` property of a `ContentType` object.

**Applicability.** This scheme applies only to XML content — see [Section 4.3](#43-changes-from-the-previous-version).

**Node identity.** The node is the single element or attribute node selected by evaluating an XPath expression, of ACAL data type `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` (defined by [[ACAL-XPath-1.0](#acal-xpath-10)] Annex C.2.1), against the XML document in a `ContentType` object's `Body` property.

**Request construction.** The `RequestEntityType` object holding the resource's attributes:

1. SHALL include a `Content` property whose `Body` is the XML document.
2. SHALL include a `RequestAttributeType` object with `AttributeId` `urn:oasis:names:tc:acal:1.0:content-selector` (defined by [[ACAL-XPath-1.0](#acal-xpath-10)] Annex D.3) whose value is the XPath expression locating the node.
3. MAY include a `RequestAttributeType` object with `AttributeId` `urn:oasis:names:tc:acal:1.0:resource:document-id` ([Annex C.3](#c3-attributes)) when it is necessary to indicate which document instance the node belongs to — for example when a single request's resource category could otherwise be read as referring to more than one document.

**Profile identifier.** `urn:oasis:names:tc:acal:1.0:profile:hierarchical:xml-node-id` (deprecated identifier: `urn:oasis:names:tc:xacml:3.0:profile:hierarchical:xml-node-id`).

## 5.2 Nodes Identified by URI

A node is identified by a single, fully-resolved hierarchical URI, such as a file-system path.

**Node identity.** The URI:

- SHALL conform to [[RFC3986](#rfc3986)].
- SHALL use the `file:` scheme unless a more specific standard scheme applies to the resource (for example `http:`/`https:` for a web-addressable resource).
- SHALL be hierarchical, with path segments separated by `/`.
- SHALL be absolute, with all components in canonical form;
- SHALL NOT end with a trailing `/`; and
- SHALL have each run of repeated `/` characters within its path component collapsed to a single `/`.

**Request construction.** The `RequestEntityType` object holding the resource's attributes SHALL include exactly one `RequestAttributeType` object with `AttributeId` `urn:oasis:names:tc:acal:1.0:resource:resource-id` (defined by [[ACAL-Core-1.0](#acal-core-10)] Annex D.5) and `DataType` `urn:oasis:names:tc:acal:1.0:data-type:anyURI`, whose value is the fully-resolved URI.

Parent and ancestor attributes ([Section 5.3](#53-nodes-identified-by-ancestor-attributes)) SHALL NOT be provided for a resource identified using this scheme — the URI already encodes the node's position in the hierarchy, so separate ancestor attributes would be redundant and could contradict it.

**Profile identifier.** `urn:oasis:names:tc:acal:1.0:profile:hierarchical:URI-node-id` (deprecated identifiers: `urn:oasis:names:tc:xacml:3.0:profile:hierarchical:URI-node-id` and `urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-id`; see Erratum 1 in [Section 4.3](#43-changes-from-the-previous-version)).

## 5.3 Nodes Identified by Ancestor Attributes

A node's ancestors, and optionally the node itself, are identified using dedicated attributes rather than embedding the hierarchy in a single value.

**Node identity.** An ancestor node MAY be identified using an attribute value of any ACAL data type. There is no requirement that different ancestor nodes, or nodes within the same hierarchy, use the same data type — see [Section 4.3](#43-changes-from-the-previous-version).

**Request construction.** The `RequestEntityType` object holding the resource's attributes SHALL include a `RequestAttributeType` object using the appropriate `AttributeId` below ([Annex C.3](#c3-attributes)) for each combination of `DataType` and `Issuer` in which the requested node's ancestors are represented:

`urn:oasis:names:tc:acal:1.0:resource:resource-parent`

: The immediate parent of the requested node.

`urn:oasis:names:tc:acal:1.0:resource:resource-ancestor`

: An ancestor of the requested node, not including the node itself.

`urn:oasis:names:tc:acal:1.0:resource:resource-ancestor-or-self`

: An ancestor of the requested node, including the node itself.

A `RequestAttributeType` object's `Value` property is a bag of one or more values ([[ACAL-Core-1.0](#acal-core-10)] Section 7.27); duplicate values within that bag are permitted. Because `RequestAttributeType` objects are unique within a `RequestEntityType` object by the combination of their `AttributeId`, `DataType` and `Issuer` properties ([[ACAL-Core-1.0](#acal-core-10)] Section 7.33), **several ancestors sharing the same `AttributeId`, `DataType` and `Issuer` are represented as several values in the `Value` bag of a single `RequestAttributeType` object, not as several `RequestAttributeType` objects** — two objects with the same `AttributeId`, `DataType` and `Issuer` would be duplicates and are not permitted. A request needs more than one `RequestAttributeType` object for a given `AttributeId` above only when the ancestors are represented using more than one combination of `DataType` and `Issuer`. This is the mechanism by which [XACML 3.0 HRP](#hier) §2.3's mixed-data-type ancestor representations remain fully representable in ACAL: each distinct combination of data type and issuer gets its own `RequestAttributeType` object, and every ancestor sharing that combination is a value within it.

: See [[ACAL-Core-1.0](#acal-core-10)] Section 7.33.1 for a worked example of the underlying uniqueness rule (in terms of `AttributeId`/`DataType`/`Issuer` generally, not specific to this profile).

**Partial support.** An implementation MAY support producing or consuming a subset of the three `AttributeId`s above. The following identifiers each independently name support for one of them, for conformance purposes ([Section 10](#10-conformance); see Erratum 2 in [Section 4.3](#43-changes-from-the-previous-version)):

- `urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-req:resource-parent` (deprecated identifiers: `urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-req:resource-parent` and `urn:oasis:names:tc:xacml:2.0:profile:hierarchical:non-xml-node-req:resource-parent`; see Erratum 2 in [Section 4.3](#43-changes-from-the-previous-version))
- `urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-req:resource-ancestor` (deprecated identifiers: `urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-req:resource-ancestor` and `urn:oasis:names:tc:xacml:2.0:profile:hierarchical:non-xml-node-req:resource-ancestor`; see Erratum 2 in [Section 4.3](#43-changes-from-the-previous-version))
- `urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-req:resource-ancestor-or-self` (deprecated identifiers: `urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-req:resource-ancestor-or-self` and `urn:oasis:names:tc:xacml:2.0:profile:hierarchical:non-xml-node-req:resource-ancestor-or-self`; see Erratum 2 in [Section 4.3](#43-changes-from-the-previous-version))

**Profile identifier.** `urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-id` (deprecated identifiers: `urn:oasis:names:tc:xacml:3.0:profile:hierarchical:attribute-node-id` and `urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-req`; see Erratum 1 in [Section 4.3](#43-changes-from-the-previous-version)).

: Note (non-normative): [[Hier](#hier)] §3.3.1 gives non-normative pseudo-code (`ResHierId`, `collectAncestorNodes`, `walkUpHierarchyDag`) for one way to compute the set of ancestor representations to include in a request; this document does not reproduce it, but the technique carries over directly since this scheme's request-construction rule is otherwise unchanged from XACML 3.0.

---


# 6 Policy Authoring Guidance (non-normative)

This section illustrates how a policy typically matches against the attributes defined by [Section 5](#5-node-identity-schemes). It does not define any new normative behavior.

## 6.1 Matching Ancestor Attributes

A policy that must grant access based on a specific ancestor value typically applies a bag or higher-order-bag function (see [[ACAL-Core-1.0](#acal-core-10)] Annex C.3.10 and Annex C.3.12) over the bag of values returned by an attribute designator for `urn:oasis:names:tc:acal:1.0:resource:resource-ancestor` (or `resource-ancestor-or-self`), testing each value with an equality function appropriate to its data type — for example `urn:oasis:names:tc:acal:1.0:function:string-equal` for a string-typed ancestor representation, or `urn:oasis:names:tc:acal:1.0:function:anyURI-equal` for a URI-typed one.

## 6.2 Matching Nodes in XML Documents

A policy that must match a node located by [Section 5.1](#51-nodes-in-xml-documents) typically uses an `XPathAttributeSelectorType` or `XPathEntityAttributeSelectorType` object ([[ACAL-XPath-1.0](#acal-xpath-10)] Section 5.3.3/5.3.4) with `ContextSelectorId` set to `urn:oasis:names:tc:acal:1.0:content-selector`, or applies `urn:oasis:names:tc:acal:1.0:function:xpath-node-match` ([[ACAL-XPath-1.0](#acal-xpath-10)] Annex C.3.1) directly.

## 6.3 Matching URIs

A policy that must match a URI produced by [Section 5.2](#52-nodes-identified-by-uri) typically applies `urn:oasis:names:tc:acal:1.0:function:anyURI-equal` for an exact match, or `urn:oasis:names:tc:acal:1.0:function:anyURI-regexp-match` for a pattern match.

: **Note**: unlike [XACML 3.0 HRP](#hier) §4.3's `regexp-uri-match`, which takes the URI argument first and the regular expression second, `urn:oasis:names:tc:acal:1.0:function:anyURI-regexp-match` takes the regular expression first — matching the argument order of ACAL's other `*-regexp-match` functions. Any policy text carried over from an [XACML 3.0 HRP](#hier) example must have its arguments swapped.

---


# 7 Examples (non-normative)

This section gives one worked example for each of the three schemes in [Section 5](#5-node-identity-schemes), each a single resource `RequestEntity` shown on its own rather than inside a full `Request`. The other attribute categories (subject, action, environment) are omitted for brevity; a complete request would include them, and would wrap the `RequestEntity` in a `Request`, as shown in [[ACAL-Core-1.0](#acal-core-10)] Section 6.1.2.

## 7.1 Nodes in XML Documents

A request for read access to the `<md:patientDoB>` node inside a medical-record document, using [Section 5.1](#51-nodes-in-xml-documents)'s scheme. The scheme's XML-content restriction ([Section 4.3](#43-changes-from-the-previous-version)) applies to the resource's `Content.Body`, not to the serialization carrying the request itself — the same `content-selector` attribute and XPath expression work unchanged whether the request is XACML, JACAL, or YACAL.

**Plain language**: Permit read access to the date-of-birth element inside this patient record, identified by an XPath expression rather than by a named attribute.

---

**XACML v4.0 (XML)**

```xml
<RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource" xmlns:md="urn:example:med:schemas:record">
    <Content>
        <Body>
            <md:record xmlns:md="urn:example:med:schemas:record">
                <md:patient>
                    <md:patientDoB>1992-03-21</md:patientDoB>
                </md:patient>
            </md:record>
        </Body>
    </Content>
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:content-selector"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:xpathExpression">
        <Value
            XPathVersion="https://www.w3.org/TR/xpath20/"
            XPathCategory="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
            XPath="md:record/md:patient/md:patientDoB" />
    </RequestAttribute>
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:resource:document-id"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
        <Value>urn:example:med:record:BartSimpson</Value>
    </RequestAttribute>
</RequestEntity>
```

**JACAL v1.0 (JSON)**

```json
{
    "RequestEntity": {
        "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
        "Content": {
            "MediaType": "application/xml",
            "Body": "<md:record xmlns:md=\"urn:example:med:schemas:record\"><md:patient><md:patientDoB>1992-03-21</md:patientDoB></md:patient></md:record>"
        },
        "RequestAttribute": [
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:content-selector",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:xpathExpression",
                "Value": [
                    {
                        "XPathVersion": "https://www.w3.org/TR/xpath20/",
                        "Namespaces": {
                            "md": "urn:example:med:schemas:record"
                        },
                        "XPathCategory": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                        "XPath": "md:record/md:patient/md:patientDoB"
                    }
                ]
            },
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:document-id",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                "Value": [
                    "urn:example:med:record:BartSimpson"
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
RequestEntity:
  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
  Content:
    MediaType: "application/xml"
    Body: |-
      <md:record xmlns:md="urn:example:med:schemas:record"><md:patient><md:patientDoB>1992-03-21</md:patientDoB></md:patient></md:record>
  RequestAttribute:
    - AttributeId: "urn:oasis:names:tc:acal:1.0:content-selector"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:xpathExpression"
      Value:
        - XPathVersion: "https://www.w3.org/TR/xpath20/"
          Namespaces:
            md: "urn:example:med:schemas:record"
          XPathCategory: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
          XPath: "md:record/md:patient/md:patientDoB"
    - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:document-id"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
      Value:
        - urn:example:med:record:BartSimpson
```

**What this shows**

- The `md` prefix used inside the `XPath` expression string needs its own namespace binding, independent of `Content.Body`'s embedded `xmlns:md` declaration — the two are separate namespace scopes, one for the embedded document, one for the expression text itself ([[ACAL-XPath-1.0](#acal-xpath-10)] Annex C.2.1). In XML that binding comes from ordinary in-scope namespaces, so declaring `xmlns:md` on `RequestEntity` (an ancestor of the `Value` element carrying the expression) is sufficient — XML namespace resolution here is unchanged from XACML 3.0. JACAL and YACAL have no ancestor-based namespace inheritance, so the same binding is carried explicitly on the value's own `Namespaces` property, a mapping from prefix to namespace name ([[ACAL-XPath-1.0](#acal-xpath-10)] Section 5.2).
- The `xpathExpression` value carries its own `XPathVersion` here — in all three representations — because these examples are bare `RequestEntity` fragments with no enclosing `Request` and therefore no `XPathRequestDefaults` for the value to take its version from ([[ACAL-XPath-1.0](#acal-xpath-10)] Section 5.3.5). In a complete `Request` carrying an `XPathRequestDefaults`, the local `XPathVersion` could be omitted.
- In XML, `Content.Body` holds the medical-record document as literal child elements. In JACAL, the same document is a JSON string, escaped per [[JACAL-Core-1.0](#jacal-core-10)] Section 5.3's rules for XML content in a JSON `Content` object. In YACAL, a block scalar (`|`) carries the same string without JSON's escaping.
- The `content-selector` attribute's value — an `xpathExpression` — is itself a structured value (`XPath`, `XPathCategory`, a namespace context, and an XPath version), not a plain string, in every representation. In JACAL/YACAL the namespace context is the value's own `Namespaces` property; in XML it is ordinary in-scope namespaces.
- `document-id` is included to disambiguate which document instance the `content-selector` expression applies to, in case the same request references more than one such document.

---

## 7.2 Nodes Identified by URI

A request for read access to a budget document identified by its file-system path, using [Section 5.2](#52-nodes-identified-by-uri)'s scheme. No ancestor attributes are present — the URI already encodes the node's position in the hierarchy.

**Plain language**: Permit read access to the resource whose fully-resolved path is `file:///acme-docs/finance/2026/budget.xml`.

---

**XACML v4.0 (XML)**

```xml
<RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
        <Value>file:///acme-docs/finance/2026/budget.xml</Value>
    </RequestAttribute>
</RequestEntity>
```

**JACAL v1.0 (JSON)**

```json
{
    "RequestEntity": {
        "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
        "RequestAttribute": [
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                "Value": [
                    "file:///acme-docs/finance/2026/budget.xml"
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
RequestEntity:
  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
  RequestAttribute:
    - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
      Value:
        - "file:///acme-docs/finance/2026/budget.xml"
```

**What this shows**

- This scheme has no dependency on any particular representation ([Section 5](#5-node-identity-schemes)) — a single `resource-id` attribute is sufficient in all three, unlike [Section 7.1](#71-nodes-in-xml-documents)'s scheme, which always needs a `Content` object regardless of the request's own serialization.
- The URI value itself is identical byte-for-byte across all three representations; only the surrounding wrapper syntax differs.

---

## 7.3 Nodes Identified by Ancestor Attributes

A request for read access to a project node, using [Section 5.3](#53-nodes-identified-by-ancestor-attributes)'s scheme. Unlike [Section 7.2](#72-nodes-identified-by-uri)'s example, the node's own identity (`resource-id`) is an opaque `string` name rather than a URI that already encodes its position in a hierarchy — the [Section 5.2](#52-nodes-identified-by-uri) scheme could not express this node's position on its own, so the ancestor attributes below are what carry it. Its immediate ancestor is, separately, represented in two data types at once — a `string` display name and an `anyURI` alias sharing the same `AttributeId`. This is the exact case [Section 4.3](#43-changes-from-the-previous-version) describes as fully representable without narrowing.

**Plain language**: Permit read access to "Project Falcon", identified by its own name and by the chain of ancestor teams and organizations it sits under.

---

**XACML v4.0 (XML)**

```xml
<RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
        <Value>Project Falcon</Value>
    </RequestAttribute>
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-parent"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
        <Value>Platform Engineering Team</Value>
    </RequestAttribute>
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-parent"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
        <Value>acme:org/platform-team</Value>
    </RequestAttribute>
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-ancestor-or-self"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
        <Value>Engineering Teams</Value>
        <Value>Platform Engineering Team</Value>
        <Value>Project Falcon</Value>
    </RequestAttribute>
</RequestEntity>
```

**JACAL v1.0 (JSON)**

```json
{
    "RequestEntity": {
        "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
        "RequestAttribute": [
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                "Value": [
                    "Project Falcon"
                ]
            },
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-parent",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                "Value": [
                    "Platform Engineering Team"
                ]
            },
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-parent",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                "Value": [
                    "acme:org/platform-team"
                ]
            },
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-ancestor-or-self",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                "Value": [
                    "Engineering Teams",
                    "Platform Engineering Team",
                    "Project Falcon"
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
RequestEntity:
  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
  RequestAttribute:
    - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
      Value:
        - Project Falcon
    - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-parent"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
      Value:
        - Platform Engineering Team
    - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-parent"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
      Value:
        - acme:org/platform-team
    - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-ancestor-or-self"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
      Value:
        - Engineering Teams
        - Platform Engineering Team
        - Project Falcon
```

**What this shows**

- The two `resource-parent` objects are not duplicates of one another: they share an `AttributeId` but differ in `DataType`, so both are permitted by [[ACAL-Core-1.0](#acal-core-10)] Section 7.33's uniqueness rule ([Section 4.3](#43-changes-from-the-previous-version)). A policy that only understands `anyURI`-typed ancestor representations can ignore the `string`-typed one, and vice versa, without either being invalid. This holds identically in all three representations.
- The three `resource-ancestor-or-self` values, by contrast, share one `AttributeId` **and** one `DataType`, so they are three values in a single `RequestAttributeType` object's `Value` bag ([[ACAL-Core-1.0](#acal-core-10)] Section 7.27) rather than three separate objects — three objects with the same `AttributeId`, `DataType` and (absent) `Issuer` would be duplicates of one another and would violate [[ACAL-Core-1.0](#acal-core-10)] Section 7.33's uniqueness rule. This is the distinction [Section 5.3](#53-nodes-identified-by-ancestor-attributes) draws: multiple values of the *same* representation go in one object's bag; only a genuinely *different* representation (a different `DataType` and/or `Issuer`, as with the two `resource-parent` objects above) needs its own `RequestAttributeType` object.
- The bag/multiple-object distinction is the same shape in all three formats: XML repeats `<Value>` inside one `<RequestAttribute>`; JACAL and YACAL repeat entries inside one `Value` array.

---

---


# 8 Representation Considerations

[Section 4.3](#43-changes-from-the-previous-version) states that this profile needs no new schema artifacts: `resource-parent`, `resource-ancestor` and `resource-ancestor-or-self` are ordinary attribute identifiers, fully covered by [[ACAL-Core-1.0](#acal-core-10)]'s existing XSD, JSON Schema and YAML structure/constraint artifacts. That coverage is not uniform across the three representations. This section states, for each, what its own schema tooling actually enforces for the one profile-specific case this profile exercises more heavily than most Core-only documents: the three ancestor attributes carry no fixed `DataType`, so the same `AttributeId` legitimately repeats across `RequestAttribute` objects that differ only in `DataType` — [Section 7.3](#73-nodes-identified-by-ancestor-attributes)'s worked example is a live instance.

## 8.1 XML

`RequestAttribute` objects are unique within a `RequestEntityType` object by `(AttributeId, DataType, Issuer)`, enforced by the *Core XML Schema*'s `<xs:unique name="RequestEntity_RequestAttribute_AttributeId-DataType-Issuer">` key. That key is subject to two distinct limitations [[XACML-Core-4.0](#xacml-core-40)] states generally for this constraint, each with a different remedy. First ([[XACML-Core-4.0](#xacml-core-40)] Section 5.2.5 rule 4.5): where `DataType` is omitted from one of two otherwise-identical `RequestAttribute` objects, [[XS11](#xs11)] §3.11.4 excludes that object from the key's qualified node set entirely rather than comparing it as holding the type's default (`string`) value, so the pair validates as if it were not a duplicate. **Implementations requiring full enforcement of this case SHOULD additionally apply [[XACML-Core-4.0](#xacml-core-40)] Section 5.2.6's Option 1 (XSD 1.1 assertions) or Option 2 (Schematron rules)**, exactly as that section already requires for the constraint generally. Second, and distinct ([[XACML-Core-4.0](#xacml-core-40)] Section 5.2.6.3): where two `DataType` values differ only in short-identifier-name-vs-URI spelling, **neither `<xs:unique>` nor Option 1 nor Option 2 can recognize them as equal** — full enforcement of this case requires the identifier-expansion step of [[ACAL-Core-1.0](#acal-core-10)] Section 8.3, which none of XML Schema validation, XSD 1.1 assertions, or Schematron rules perform; **implementers requiring full enforcement MUST perform this expansion themselves**, before validation, exactly as [[XACML-Core-4.0](#xacml-core-40)] Section 5.2.6.3 already requires for the constraint generally. This profile introduces no new limitation in either case, only a scheme ([Section 5.3](#53-nodes-identified-by-ancestor-attributes)) that reliably exercises the general one.

## 8.2 JSON

The same `(AttributeId, DataType, Issuer)` constraint is **not enforced by the JSON subschemas** [[JACAL-Core-1.0](#jacal-core-10)] Section 5.2.4 generates for `RequestAttribute`: the standard `uniqueItems` keyword cannot express a keyed comparison, and the third-party `uniqueKeys` extension it discusses as a candidate does not correctly enforce this constraint either, since `DataType` is a key property carrying a schema default. This applies unchanged to ancestor-attribute `RequestAttribute` objects — the two `resource-parent` objects in [Section 7.3](#73-nodes-identified-by-ancestor-attributes)'s example, differing only in `DataType`, are exactly the pair this gap concerns. **Implementations enforcing this constraint SHALL do so outside JSON Schema validation**, first applying [[ACAL-Core-1.0](#acal-core-10)] Section 8.3's short-identifier expansion to `AttributeId` and `DataType`, then setting `DataType` to its default (`urn:oasis:names:tc:acal:1.0:data-type:string`) wherever absent, per [[JACAL-Core-1.0](#jacal-core-10)] Section 5.2.4.

## 8.3 YAML

The `acal-core-yaml-v1.0-constraints.yaml` catalog's `request-attribute-id-unique-within-entity` rule states the same requirement — resolve short identifiers to their full URI, and compare `DataType` on its effective value after applying its default — in its `Requirement` field, per [[YACAL-Core-1.0](#yacal-core-10)] Section 5.12.2. No structural check over the YAML document alone can perform either step. **Implementations enforcing this constraint SHALL apply both steps explicitly**, outside structural validation, before treating two `RequestAttribute` objects as distinct.

---

# 9 Safety, Security, and Data Protection Considerations

Refer to [[ACAL-Core-1.0](#acal-core-10)] Section 10.

A policy author using this profile SHOULD keep in mind the governing principle stated in [Section 4.1](#41-background): a decision that permits access to an interior node does not imply permission for its descendants, or the reverse. Where a policy relies on the [Section 5.3](#53-nodes-identified-by-ancestor-attributes) scheme to make an access decision conditional on a node's position in a hierarchy, the correctness of that decision depends entirely on the accuracy of the ancestor attributes supplied in the request; this profile does not itself provide a mechanism to verify that a claimed ancestor attribute correctly reflects the resource's actual position in its hierarchy, which remains the responsibility of the PEP or an upstream attribute source.

---


# 10 Conformance

## 10.1 Introduction

The specification defines three independently optional node-identity schemes and their associated attribute identifiers; an implementation MAY support any combination of them.

## 10.2 Conformance Tables

This section lists those portions of the specification that MUST be included in an implementation of a PDP, PAP or PEP that claims to conform to this profile.

: Note: "M" means mandatory-to-implement. "O" means optional.

The implementation MUST follow [Section 5](#5-node-identity-schemes), [Section 8](#8-representation-considerations) and [Annex C](#annex-c-acal-identifiers) where they apply to implemented items in the following tables. `urn:oasis:names:tc:acal:1.0:content-selector` and `urn:oasis:names:tc:acal:1.0:resource:resource-id` are defined, and their conformance status given, by [[ACAL-XPath-1.0](#acal-xpath-10)] Annex D.3/Section 9.2.4 and [[ACAL-Core-1.0](#acal-core-10)] Annex D.5/Section 11.2.6 respectively; this profile references them without restating their conformance status.

### 10.2.1 Profile Identifiers

The implementation MUST support the node-identity schemes associated with the following identifiers marked `M`.

| Identifier | M/O | Deprecated Identifier(s) |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:profile:hierarchical:xml-node-id | O | urn:oasis:names:tc:xacml:3.0:profile:hierarchical:xml-node-id |
| urn:oasis:names:tc:acal:1.0:profile:hierarchical:URI-node-id | O | urn:oasis:names:tc:xacml:3.0:profile:hierarchical:URI-node-id <br> urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-id |
| urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-id | O | urn:oasis:names:tc:xacml:3.0:profile:hierarchical:attribute-node-id <br> urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-req |
| urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-req:resource-parent | O | urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-req:resource-parent <br> urn:oasis:names:tc:xacml:2.0:profile:hierarchical:non-xml-node-req:resource-parent |
| urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-req:resource-ancestor | O | urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-req:resource-ancestor <br> urn:oasis:names:tc:xacml:2.0:profile:hierarchical:non-xml-node-req:resource-ancestor |
| urn:oasis:names:tc:acal:1.0:profile:hierarchical:attribute-node-req:resource-ancestor-or-self | O | urn:oasis:names:tc:xacml:3.0:profile:hierarchical:non-xml-node-req:resource-ancestor-or-self <br> urn:oasis:names:tc:xacml:2.0:profile:hierarchical:non-xml-node-req:resource-ancestor-or-self |

Note: all six are `O` because each names an independently optional scheme, or partial support within the ancestor-attribute scheme ([Section 5.3](#53-nodes-identified-by-ancestor-attributes)). Rows with two deprecated identifiers reflect [Section 4.3](#43-changes-from-the-previous-version)'s Erratum 1 and Erratum 2: the published CS02's own body and §6 identifier summary disagree on the identifier's spelling or version segment, so both forms are recognized as deprecated equivalents of the current ACAL identifier — see [Section 4.3](#43-changes-from-the-previous-version) for which erratum applies to which row.

### 10.2.2 Attributes

The implementation MUST use the attributes associated with the following identifiers in the way this profile has defined (see [Annex C.3](#c3-attributes)). This requirement pertains primarily to implementations of a PAP or PEP that uses ACAL, since the semantics of the attribute are transparent to the PDP.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:resource:document-id | O | urn:oasis:names:tc:xacml:2.0:resource:document-id |
| urn:oasis:names:tc:acal:1.0:resource:resource-parent | O | urn:oasis:names:tc:xacml:2.0:resource:resource-parent |
| urn:oasis:names:tc:acal:1.0:resource:resource-ancestor | O | urn:oasis:names:tc:xacml:2.0:resource:resource-ancestor |
| urn:oasis:names:tc:acal:1.0:resource:resource-ancestor-or-self | O | urn:oasis:names:tc:xacml:2.0:resource:resource-ancestor-or-self |

Note: `document-id` is `O` because it is only ever optionally supplied within [Section 5.1](#51-nodes-in-xml-documents); the ancestor-attribute identifiers are `O` because [Section 5.3](#53-nodes-identified-by-ancestor-attributes) itself is an optional scheme.

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

###### [YACAL-Core-1.0]

_YACAL, Version 1.0 (YAML Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.html

###### [JACAL-Core-1.0]

_JACAL, Version 1.0 (JSON Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/jacal/core/v1.0/acal-core-json-v1.0.html

###### [XACML-Core-4.0]

_XACML, Version 4.0 (eXtensible Access Control Markup Language)_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html

###### [ACAL-Core-1.0]

_Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html

###### [ACAL-XPath-1.0]

_ACAL v1.0 XPath Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and William Parducci. https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/acal-xpath-v1.0.html

###### [RFC2119]

RFC 2119, *Key Words for Use in RFCs to Indicate Requirement Levels*, BCP 14, RFC 2119, March 1997. [Online]. Available: https://www.rfc-editor.org/info/rfc2119

###### [RFC3986]

RFC 3986, *Uniform Resource Identifier (URI): Generic Syntax*, T. Berners-Lee, R. Fielding, L. Masinter, January 2005. [Online]. Available: https://www.rfc-editor.org/info/rfc3986

###### [RFC8174]

RFC 8174, *Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words*, BCP 14, RFC 8174, May 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8174

## B.2 Informative References


The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [Hier]

XACML v3.0 Hierarchical Resource Profile Version 1.0. 18 May 2014. Committee Specification 02. https://docs.oasis-open.org/xacml/3.0/hierarchical/v1.0/xacml-3.0-hierarchical-v1.0.html

###### [XS11]

XML Schema 1.1, parts 1 and 2. Available at: https://www.w3.org/TR/xmlschema11-1/ and https://www.w3.org/TR/xmlschema11-2/


---

# Annex C ACAL Identifiers


(This annex forms an integral part of this Specification.)

This section defines standard identifiers for commonly used definitions.

## C.1 ACAL Namespaces

This ACAL Profile is defined using this identifier.

`urn:oasis:names:tc:acal:1.0:hierarchical:schema`

## C.2 Profile Identifiers

See [Section 10.2.1](#1021-profile-identifiers) for the six profile identifiers this document defines, their meaning, and their deprecated XACML 3.0 equivalents.

## C.3 Attributes

This profile defines the following standard attribute identifiers, for use within a `RequestEntityType` object with the `Category` property evaluating to `urn:oasis:names:tc:acal:1.0:attribute-category:resource`. `urn:oasis:names:tc:acal:1.0:content-selector` and `urn:oasis:names:tc:acal:1.0:resource:resource-id`, also used by the schemes in [Section 5](#5-node-identity-schemes), are defined by [[ACAL-XPath-1.0](#acal-xpath-10)] Annex D.3 and [[ACAL-Core-1.0](#acal-core-10)] Annex D.5 respectively.

This attribute identifies to which document instance a node identified by [Section 5.1](#51-nodes-in-xml-documents) belongs, when a request could otherwise be read as referring to more than one document:

`urn:oasis:names:tc:acal:1.0:resource:document-id`

: The corresponding attribute SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI`.

These attributes identify a node's ancestors, per [Section 5.3](#53-nodes-identified-by-ancestor-attributes):

`urn:oasis:names:tc:acal:1.0:resource:resource-parent`

: The immediate parent of the requested node. No fixed data type is specified — the value MAY be of any ACAL data type.

`urn:oasis:names:tc:acal:1.0:resource:resource-ancestor`

: An ancestor of the requested node, not including the node itself. No fixed data type is specified — the value MAY be of any ACAL data type.

`urn:oasis:names:tc:acal:1.0:resource:resource-ancestor-or-self`

: An ancestor of the requested node, including the node itself. No fixed data type is specified — the value MAY be of any ACAL data type.

---

# Annex D How to generate HTML and PDF versions

(This annex does not form an integral part of this Specification and is informational.)

## Online generation

HTML/PDF versions are generated automatically online via Github Actions after each update pushed to the main branch of [OASIS ACAL \[XACML\] TC Github repository](https://github.com/oasis-tcs/acal-spec/). Go to  Github Actions on the github repository, then go to the latest workflow run, and, if the run succeeded, the summary should display the links to the generated HTML/PDF documents.

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
$ pandoc/mkdocs.sh --output /tmp acal-hierarchical-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

This document has no `{.numberLines}` code fences, so the `--number-lines` option is not needed.

The publication date is automatically set to the current date by default (using Lua filter `pandoc/meta_vars.lua`). However, you may set a specific date of your choice instead, by adding the argument `--metadata date="My date in the form DD Month YYYY"` at the end of the command.

### PDF generation

For PDF output, add the `--pdf` option as follows:

```console
$ pandoc/mkdocs.sh --pdf --output /tmp acal-hierarchical-v%version%.md
```

The HTML file is generated like the previous command and, in addition, a PDF file is generated with the same name as the input file except the `.md` extension is replaced with `.pdf` in this case.

Beware that **the result PDF - the embedded fonts in particular - may differ depending on the system/machine** where you run this command. Mainly, it depends on which fonts are actually installed on the system, as the HTML-to-PDF converter (Chrome / Chromium in this case) selects available fonts according to the prioritized lists defined by `font-family` properties in the CSS.

**For official TC publications**, add the `--official` argument to avoid this issue and produce a system-independent output:

```console
$ pandoc/mkdocs.sh --pdf --official --output /tmp acal-hierarchical-v%version%.md
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

This is the first version of this profile. See [Section 4.3](#43-changes-from-the-previous-version) for the changes relative to its XACML 3.0 predecessor.

## Revision History

Latest revision history can be obtained from [OASIS ACAL \[XACML\] TC's github repository](https://github.com/oasis-tcs/acal-spec/blob/v%version%-%stage_revision%/acal-hierarchical-v%version%-%stage_revision%.md).

<!-- The following centered line represents the end of the document -->
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
