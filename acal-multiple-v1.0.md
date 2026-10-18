---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: ACAL v1.0 Multiple Decision Profile Version 1.0
subtitle: Committee Specification Draft 02
version: "1.0"
stage_revision: csd02 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access", "authorization", "ABAC", "policylanguage", "multiple decision", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version

- https://docs.oasis-open.org/acal/acal/profiles/multiple/v%version%/%stage_revision%/acal-multiple-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/multiple/v%version%/%stage_revision%/acal-multiple-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/acal/acal/profiles/multiple/v%version%/%stage_revision%/acal-multiple-v%version%-%stage_revision%.md


### Previous version


N/A

### Latest version


- https://docs.oasis-open.org/acal/acal/profiles/multiple/v1.0/acal-multiple-v1.0.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/multiple/v1.0/acal-multiple-v1.0.pdf
- https://docs.oasis-open.org/acal/acal/profiles/multiple/v1.0/acal-multiple-v1.0.md


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


This specification is a profile of ACAL that defines how to construct, and combine the results of, requests concerning multiple resources or multiple decisions in a single ACAL request, via four complementary schemes plus the conceptual model that ties them together.


### Citation Format


When referencing this document, the following citation format should be used:

**[ACAL-Multiple-1.0]**
_%title%_.
Edited by Steven Legg, Cyril Dangerville and Bill Parducci. %date%. OASIS %subtitle%. https://docs.oasis-open.org/acal/acal/profiles/multiple/v%version%/%stage_revision%/acal-multiple-v%version%-%stage_revision%.html . Latest version: https://docs.oasis-open.org/acal/acal/profiles/multiple/v1.0/acal-multiple-v1.0.html .


### Related Work

This document is related to:

- _Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html
- _ACAL v1.0 Hierarchical Resource Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v1.0/acal-hierarchical-v1.0.html
- _ACAL v1.0 XPath Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/acal-xpath-v1.0.html


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
  - [4.2 Changes From the Previous Version](#42-changes-from-the-previous-version)
- [5 Request Construction Schemes](#5-request-construction-schemes)
  - [5.1 Nodes Identified by Scope](#51-nodes-identified-by-scope)
  - [5.2 Nodes Identified by XPath Expression](#52-nodes-identified-by-xpath-expression)
  - [5.3 Repeated Categories](#53-repeated-categories)
  - [5.4 Reference](#54-reference)
- [6 Combined Decision](#6-combined-decision)
- [7 Conceptual Model for Creating Individual Decision Requests](#7-conceptual-model-for-creating-individual-decision-requests)
- [8 Examples (non-normative)](#8-examples-non-normative)
  - [8.1 Nodes Identified by Scope](#81-nodes-identified-by-scope)
  - [8.2 Nodes Identified by XPath Expression](#82-nodes-identified-by-xpath-expression)
  - [8.3 Repeated Categories](#83-repeated-categories)
  - [8.4 Reference](#84-reference)
  - [8.5 Combined Decision](#85-combined-decision)
- [9 Representation Considerations](#9-representation-considerations)
  - [9.1 XML](#91-xml)
  - [9.2 JSON](#92-json)
  - [9.3 YAML](#93-yaml)
- [10 Safety, Security, and Data Protection Considerations](#10-safety-security-and-data-protection-considerations)
- [11 Conformance](#11-conformance)
  - [11.1 Introduction](#111-introduction)
  - [11.2 Conformance Tables](#112-conformance-tables)
    - [11.2.1 Profile Identifiers](#1121-profile-identifiers)
    - [11.2.2 Attributes](#1122-attributes)
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

This ACAL profile defines four complementary, independently optional schemes for constructing a request that concerns multiple resources or produces multiple decisions — repeated categories, reference, scope-based expansion, and XPath-expression-based expansion — plus a mandatory conceptual model describing how a PDP resolves any combination of them into individual decisions, and how those decisions may optionally be combined into one.

Concrete representations (data formats) are provided by the ACAL XML, JSON and YAML representation specifications. The XPath-expression scheme additionally depends on the ACAL XPath Profile [[ACAL-XPath-1.0](#acal-xpath-10)], and the scope scheme's `Children`/`Descendants` values depend on the ACAL Hierarchical Resource Profile [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)] for what a node's position in a hierarchy means.

---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

See Section 2 of [[ACAL-Core-1.0](#acal-core-10)]. `Node`, `Hierarchy` and `Ancestor` are defined in Section 2.1.2 of [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)].

### 2.1.2 Terms Defined in this Document

`Child`

: With respect to a given node, a node for which the given node is the immediate parent (see `Node` and `Hierarchy` in [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)] Section 2.1.2). The inverse of `Ancestor`'s immediate case.

`Descendant`

: With respect to a given node, any node from which the given node is reachable by following one or more immediate-parent arcs — equivalently, a node of which the given node is an `Ancestor` ([[ACAL-Hierarchical-1.0](#acal-hierarchical-10)] Section 2.1.2). A node is not its own descendant.

`Individual Decision Request`

: A single, complete ACAL `RequestType` object, containing exactly one `RequestEntityType` object per attribute category (per [[ACAL-Core-1.0](#acal-core-10)] Section 7.31's ordinary, non-multiple-decision rule), produced by resolving one or more of the schemes in [Section 5](#5-request-construction-schemes) against an original request that used them.

### 2.1.3 Related terms

None.


## 2.2 Abbreviations and Acronyms

`HRP`

: Hierarchical Resource Profile [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)].

`MDP`

: Multiple Decision Profile (this document or the previous version [[Multi](#multi)], depending on the context).

---


# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [[RFC2119](#rfc2119)] [[RFC8174](#rfc8174)] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions

None.

---


# 4 Introduction (non-normative)


## 4.1 Background

A single ACAL request ordinarily concerns one resource and produces one decision. This profile defines how a Policy Enforcement Point (PEP) may instead submit one request that concerns several resources, or that must be evaluated as several logically separate requests, and how the corresponding several decisions relate to each other in the response — including, optionally, how they combine into a single overall decision.

Four schemes construct multiple decision requests, each addressing a different way multiplicity arises in practice: several resource representations already present in one request ([Section 5.3](#53-repeated-categories)), a request that itself names several other requests by reference ([Section 5.4](#54-reference)), a single resource expanded to include its children or descendants in a hierarchy ([Section 5.1](#51-nodes-identified-by-scope)), and a single resource's XML content expanded to one request per matching node ([Section 5.2](#52-nodes-identified-by-xpath-expression)). [Section 7](#7-conceptual-model-for-creating-individual-decision-requests) describes, as a non-binding conceptual model, how a PDP resolves any combination of these into the set of `Individual Decision Request`s it must actually evaluate.

## 4.2 Changes From the Previous Version

This is the first ACAL version of this profile, ported from _XACML v3.0 Multiple Decision Profile Version 1.0_, **Committee Specification 02, 18 May 2014** [[Multi](#multi)]. ACAL Core's bibliography previously cited the superseded 2010 Committee Draft 03 of this profile; corrected in this document's own Annex B and in the other ACAL documents that carry the same citation. CS02 renumbers every section relative to CD-03 (the four request schemes moved from §2.x to §3.x, combined decision §3→§4, conceptual model §4→§5) but is substantively identical to CD-03 on every point this port depends on.

Porting this profile involves more than renaming its XML vocabulary; every scheme needs rework, for the following reasons:

- **`Attributes` → `RequestEntityType`; `xml:id` → unqualified `Id`.** These are the names ACAL Core uses (`RequestEntity`, `RequestEntityReference`).
- **`AttributesReference ReferenceId="x"` → `RequestEntityReference` whose value *is* `x`.** ACAL Core has no `RequestEntityReferenceType` wrapper around an `Id` property; the reference element is now typed directly as `LocalIdentifierType`, so `RequestEntityReference` *is* a `LocalIdentifierType` value, not an element with its own `Id`/`ReferenceId` attribute. `LocalIdentifierType` is a restricted `String`, not `xs:ID`/`xs:IDREF` — referenced ids need not be XML NCNames and do not share a document-wide `xml:id` namespace.
- **The `Notice` merge rewrites the combined-decision rules.** XACML 3.0 MDP's combined-decision rule about "obligations or advice" is restated over ACAL's merged `NoticeType`/`IsObligation` model — see [Section 6](#6-combined-decision).
- **Two schemes depend on the ACAL Hierarchical Resource Profile.** The scope scheme's `Children`/`Descendants` values need a definition of hierarchy membership; the XPath-expression scheme rewrites its `multiple:content-selector` attribute into the plain `content-selector` HRP takes a normative dependency on. This is why this profile includes all four schemes.
- **The XPath-expression scheme** ([Section 5.2](#52-nodes-identified-by-xpath-expression)) **applies only when the resource's `Content` is itself an XML document**, for the same reason and by the same decision as the ACAL Hierarchical Resource Profile's XML-document scheme: the ACAL JSONPath Profile does not yet define the identifier and conformance apparatus a JSON-*content* counterpart would depend on. This restricts the resource's `Content`, not the serialization carrying the request — see [Section 8.2](#82-nodes-identified-by-xpath-expression) for a worked example of this scheme in all three ACAL representations. Disclosed here as a deliberate, tracked gap, not silent incompleteness.
- **The dangling-reference layering question** ([Section 5.4](#54-reference)) is resolved: both the schema-validation layer and the runtime-evaluation layer apply, and a non-validating implementation MUST still produce the runtime error.
- **Identifier namespace.** All identifiers introduced by this profile use the `urn:oasis:names:tc:acal:1.0:` prefix, with the XACML 3.0 identifiers recorded as deprecated equivalents. The XACML identifier `…:multiple:repeated-attribute-categories` is respelled `…:multiple:repeated-categories`, since ACAL's `RequestEntity` rename already dropped "Attributes" from the underlying object type's name.
- **Target restructure.** Example policies in this document use the boolean `Apply` form rather than XACML 3.0's `AnyOf`/`AllOf`/`Match` structure, consistent with ACAL Core.
- **No new schema artifacts.** Like the ACAL Hierarchical Resource Profile, this profile defines attribute identifiers and request-construction/evaluation rules, not new object types; `MultiRequestsType`, `RequestReferenceType` and `RequestEntityReference` already exist in ACAL Core's XSD, JSON Schema and YAML structural schema.
- **Document title.** ACAL Core referred to this profile inconsistently — "multiple decision profile" in one place, "ACAL Profile for Requests for Multiple Resources" in another. Both are now corrected to reference this document by its formal title.

---


# 5 Request Construction Schemes

The types `RequestEntityType`, `RequestAttributeType`, `MultiRequestsType`, `RequestReferenceType` and `ContentType` used in this section are defined in [[ACAL-Core-1.0](#acal-core-10)]. Each scheme below is independently OPTIONAL.

## 5.1 Nodes Identified by Scope

A single resource `RequestAttribute` is expanded, at evaluation time, into one `Individual Decision Request` per node the `scope` value selects.

**Attribute.** The resource `RequestEntityType` object carries a `RequestAttributeType` object with `AttributeId` `urn:oasis:names:tc:acal:1.0:resource:scope` ([Annex C.3](#c3-attributes)), `DataType` `urn:oasis:names:tc:acal:1.0:data-type:string`, whose value is one of:

`Immediate` [Default]

: Only the resource itself.

`Children`

: The resource, plus every `Child` ([Section 2.1.2](#212-terms-defined-in-this-document)) of the resource.

`Descendants`

: The resource, plus every `Descendant` ([Section 2.1.2](#212-terms-defined-in-this-document)) of the resource.

This scheme does not itself define how an implementation determines which nodes are children or descendants of a given resource — that is a property of the hierarchy the resource belongs to, external to the request, exactly as in [XACML 3.0 Multiple Decision Profile](#multi) §3.1.

**Request resolution.** For each node selected, an `Individual Decision Request` is produced naming that single resource; the `scope` attribute is dropped from each. The resource `RequestEntityType` object of each generated request carries a `resource-id` attribute with the same `DataType`, `Issuer` and `IncludeInResult` properties as the original `resource-id` attribute and with value(s) identifying that single resource; every other `RequestAttribute` of the original resource entity, except the dropped `scope` attribute, is preserved unchanged.


**Profile identifier.** `urn:oasis:names:tc:acal:1.0:profile:multiple:scope` (deprecated identifier: `urn:oasis:names:tc:xacml:3.0:profile:multiple:scope`).

## 5.2 Nodes Identified by XPath Expression

A single resource `RequestAttribute` naming an XPath expression is expanded, at evaluation time, into one `Individual Decision Request` per node the expression selects within the resource's XML `Content`.

**Applicability.** This scheme applies only to XML `Content` — see [Section 4.2](#42-changes-from-the-previous-version).

**Attribute.** The resource `RequestEntityType` object carries a `Content` property (the XML document) and a `RequestAttributeType` object with `AttributeId` `urn:oasis:names:tc:acal:1.0:profile:multiple:content-selector` ([Annex C.3](#c3-attributes)), `DataType` `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` ([[ACAL-XPath-1.0](#acal-xpath-10)] Annex C.2.1), whose value is an XPath expression evaluating to a set of nodes in that `Content`.

**Request resolution.** For each node selected, an `Individual Decision Request` is produced whose resource `RequestEntityType` object carries the same `Content`, with the `…:multiple:content-selector` attribute removed and replaced by a `RequestAttributeType` object with `AttributeId` `urn:oasis:names:tc:acal:1.0:content-selector` ([[ACAL-XPath-1.0](#acal-xpath-10)] Annex D.3) whose value is an XPath expression selecting that single node. `Issuer` and `IncludeInResult` properties are preserved. Where several resource categories each carry a `…:multiple:content-selector` attribute, the `Individual Decision Request`s are the cross product of the selected node sets — one request per combination, one node substituted per category.

**Profile identifier.** `urn:oasis:names:tc:acal:1.0:profile:multiple:xpath-expression` (deprecated identifier: `urn:oasis:names:tc:xacml:3.0:profile:multiple:xpath-expression`).

## 5.3 Repeated Categories

Several `RequestEntityType` objects sharing the same `Category` are expanded into the cross product of one request per combination.

**Request structure.** The request contains more than one `RequestEntityType` object with the same `Category` value — ordinarily a syntax error ([[ACAL-Core-1.0](#acal-core-10)] Section 7.31), permitted here because this scheme is implemented ([[ACAL-Core-1.0](#acal-core-10)] Section 7.31's `RequestEntity` property already states this carve-out).

**Request resolution.** One request is produced per combination of repeated categories, each containing exactly one `RequestEntityType` object per repeated `Category`, together with every non-repeated category unchanged. If any of the `RequestEntityType` objects in a combination carries a `scope` attribute other than `Immediate` ([Section 5.1](#51-nodes-identified-by-scope)) or a `…:multiple:content-selector` attribute ([Section 5.2](#52-nodes-identified-by-xpath-expression)), that expansion is applied per [Section 7](#7-conceptual-model-for-creating-individual-decision-requests); otherwise the request is an `Individual Decision Request`. The results are combined per [Section 6](#6-combined-decision) if the original request's `CombinedDecision` property is `true`, and otherwise become the `Result` objects of a single `ResponseType` object.

**Profile identifier.** `urn:oasis:names:tc:acal:1.0:profile:multiple:repeated-categories` (deprecated identifier: `urn:oasis:names:tc:xacml:3.0:profile:multiple:repeated-attribute-categories`; respelled, see [Section 4.2](#42-changes-from-the-previous-version)).

## 5.4 Reference

A request names several other requests by reference to `RequestEntityType` objects present in the same request, rather than repeating them.

**Request structure.** The `RequestType` object's `MultiRequests` property ([[ACAL-Core-1.0](#acal-core-10)] Section 7.38) contains one or more `RequestReferenceType` objects, each listing one or more `RequestEntityReference` values ([[ACAL-Core-1.0](#acal-core-10)] Section 7.39) — `LocalIdentifierType` values referencing `RequestEntityType` objects in the same `RequestType` object by their `Id` property.

**Dangling references.** A `RequestEntityReference` value that does not match the `Id` of any `RequestEntityType` object in the request is invalid. Two enforcement layers apply and are both normative:

1. A schema-validating implementation using the XML representation rejects a dangling reference at validation time, before evaluation begins, via [[XACML-Core-4.0](#xacml-core-40)]'s XSD keyref. Neither JSON Schema nor a structural YAML check provides an equivalent validation-time mechanism for this rule — see [Section 9](#9-representation-considerations) for what each representation's own schema tooling actually enforces.
2. A non-schema-validating implementation MUST still detect a dangling reference at evaluation time and produce `Indeterminate` with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error` for the corresponding `Individual Decision Request`.

Both layers exist so the same guarantee holds whether or not an implementation validates against the schema before evaluating.

**Sibling uniqueness.** Sibling `RequestReferenceType` objects MUST NOT denote the same set of `RequestEntityType` objects ([[ACAL-Core-1.0](#acal-core-10)] Section 7.38's `MultiRequestsType` OCL constraint `self->isUnique(RequestEntityReference->asSet())`) — a constraint XACML 3.0 MDP [[Multi](#multi)] did not have, introduced by ACAL Core independent of this profile.

**RequestEntityReference uniqueness**: a `RequestReferenceType` object SHALL NOT contain duplicate `RequestEntityReference` values, as per the `RequestEntityReference` property definition in [[ACAL-Core-1.0](#acal-core-10)] Section 7.39 (`unique` modifier).

**Request resolution.** One request is produced per `RequestReferenceType` object, containing exactly the `RequestEntityType` objects its `RequestEntityReference` values name (by reference, resolved to the actual objects), and no others; if that request still contains repeated categories, a `scope` attribute other than `Immediate` ([Section 5.1](#51-nodes-identified-by-scope)), or a `…:multiple:content-selector` attribute ([Section 5.2](#52-nodes-identified-by-xpath-expression)), it is expanded further per [Section 7](#7-conceptual-model-for-creating-individual-decision-requests); otherwise it is an `Individual Decision Request`. The results are combined per [Section 6](#6-combined-decision) if the original request's `CombinedDecision` property is `true`, and otherwise become the `Result` objects of a single `ResponseType` object.

**Profile identifier.** `urn:oasis:names:tc:acal:1.0:profile:multiple:reference` (deprecated identifier: `urn:oasis:names:tc:xacml:3.0:profile:multiple:reference`).

---


# 6 Combined Decision

A *Combined Decision* is triggered by the `RequestType` object's `CombinedDecision` property ([[ACAL-Core-1.0](#acal-core-10)] Section 7.31) set to `true`. If the implementation does not support this property, [[ACAL-Core-1.0](#acal-core-10)] Section 7.31 already requires the Response to be  a single `Indeterminate` Result with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`; the rules below apply once support is confirmed.

1. The `ResponseType` object MUST contain only a single combined decision, in a single `ResultType` object.
2. The combined `ResultType` object MUST NOT contain any `ResultEntity` objects ([[ACAL-Core-1.0](#acal-core-10)] Section 7.37), regardless of the `IncludeInResult` properties of any `RequestAttributeType` object in any of the individual requests.
3. If any of the individual results to be combined contains any `Notice` object ([[ACAL-Core-1.0](#acal-core-10)] Section 7.26), whether an obligation (`IsObligation = true`) or advice (`IsObligation = false`), then the combined decision MUST be `Indeterminate`, with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`. This restates XACML 3.0 MDP [[Multi](#multi)] §4's "obligations or advice" rule over ACAL's merged `Notice` model: both kinds of notice trigger the rule, since neither can be reliably delivered against a single combined decision that stands in for several individual ones.
4. Otherwise, if every individual result carries the same `Decision` value (`Permit`, `Deny`, `NotApplicable`, or `Indeterminate`), that is the combined decision — status code `urn:oasis:names:tc:acal:1.0:status:processing-error` if the common value is `Indeterminate`, otherwise `urn:oasis:names:tc:acal:1.0:status:ok`.
5. Otherwise (the individual results do not all carry the same `Decision` value), the combined decision is `Indeterminate`, with status code `urn:oasis:names:tc:acal:1.0:status:processing-error`.

**Profile identifier.** `urn:oasis:names:tc:acal:1.0:profile:multiple:combined-decision` (deprecated identifier: `urn:oasis:names:tc:xacml:3.0:profile:multiple:combined-decision`).

---


# 7 Conceptual Model for Creating Individual Decision Requests

Support for this section, in the sense that its externally observable results MUST hold, is **MANDATORY** for any implementation claiming support for one or more of the four schemes in [Section 5](#5-request-construction-schemes) or for [Section 6](#6-combined-decision); it has no effect, and imposes no requirement, on an implementation that supports none of them.

This profile does **NOT** require that an implementation's actual evaluation of a request follow the steps below, or that `Individual Decision Request` objects literally be constructed. It requires only that the `ResultType` objects produced be the same as if the steps below were followed.

1. Resolve [Section 5.4](#54-reference) (reference): if the request's `MultiRequests` property is present, produce one working request per `RequestReferenceType` object, each containing exactly its referenced `RequestEntityType` objects. If `MultiRequests` is absent, there is exactly one working request, the original request itself.
2. Resolve [Section 5.3](#53-repeated-categories) (repeated categories): for each working request from step 1, if it contains more than one `RequestEntityType` object sharing a `Category`, expand it into the cross product of one working request per combination.
3. Resolve [Section 5.1](#51-nodes-identified-by-scope) (scope) and [Section 5.2](#52-nodes-identified-by-xpath-expression) (XPath expression): for each working request from step 2, if any `RequestEntityType` object carries a `scope` attribute other than `Immediate`, or a `…:multiple:content-selector` attribute, expand it per that scheme's request-resolution rule. Where more than one such attribute is present across categories, the expansion is the cross product across all of them.
4. Evaluate each resulting `Individual Decision Request` per [[ACAL-Core-1.0](#acal-core-10)], producing one `ResultType` object per request. Any `Indeterminate` result produced during steps 1–3 (a dangling reference, an invalid expression, etc.) is carried forward as a `ResultType` object at this step rather than resolved further.
5. If the original request's `CombinedDecision` property is `true`, apply [Section 6](#6-combined-decision) to the collected `ResultType` objects, producing the single `ResultType` object of the final `ResponseType` object. Otherwise, the final `ResponseType` object's `Result` property is the collected `ResultType` objects from step 4, in any order.

---


# 8 Examples (non-normative)

This section gives one worked example for each of the five schemes in [Section 5](#5-request-construction-schemes) and [Section 6](#6-combined-decision), in the same order as [Section 5](#5-request-construction-schemes) itself. Attribute categories other than the ones relevant to each scheme are omitted for brevity.

## 8.1 Nodes Identified by Scope

A request naming a single folder resource, using [Section 5.1](#51-nodes-identified-by-scope)'s scheme with `scope` set to `Children`.

**Plain language**: Resolve to one decision request for the folder itself, and one for each of its immediate children.

---

**XACML v4.0 (XML)**

```xml
<RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
        <Value>file:///acme-docs/finance/2026</Value>
    </RequestAttribute>
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:resource:scope"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
        <Value>Children</Value>
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
                    "file:///acme-docs/finance/2026"
                ]
            },
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:scope",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                "Value": [
                    "Children"
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
        - "file:///acme-docs/finance/2026"
    - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:scope"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
      Value:
        - Children
```

**What this shows**

- Resolves, per [Section 5.1](#51-nodes-identified-by-scope), into one `Individual Decision Request` for the folder itself and one per `Child` ([Section 2.1.2](#212-terms-defined-in-this-document)) — which nodes those are is determined externally to this request, by the hierarchy the resource belongs to (e.g. via [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)]), not by anything the request itself states.
- Each generated request drops the `scope` attribute and carries `resource-id` value(s) identifying its individual node (the original value for the folder itself, an identifier of the child for each child), in all three representations.

---

## 8.2 Nodes Identified by XPath Expression

A request selecting every `<md:patient>` node inside a batch medical-records document, using [Section 5.2](#52-nodes-identified-by-xpath-expression)'s scheme. This scheme applies only to XML `Content` ([Section 4.2](#42-changes-from-the-previous-version)), but — as with [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)] Section 7.1's equivalent case — that restricts the resource's `Content.Body`, not the serialization carrying the request.

**Plain language**: Resolve to one decision request per patient record found inside the batch document.

---

**XACML v4.0 (XML)**

```xml
<RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource" xmlns:md="urn:example:med:schemas:record">
    <Content>
        <Body>
            <md:records xmlns:md="urn:example:med:schemas:record">
                <md:patient><md:patientDoB>1992-03-21</md:patientDoB></md:patient>
                <md:patient><md:patientDoB>2014-07-09</md:patientDoB></md:patient>
            </md:records>
        </Body>
    </Content>
    <RequestAttribute
        AttributeId="urn:oasis:names:tc:acal:1.0:profile:multiple:content-selector"
        DataType="urn:oasis:names:tc:acal:1.0:data-type:xpathExpression">
        <Value
            XPathVersion="https://www.w3.org/TR/xpath20/"
            XPathCategory="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
            XPath="md:records/md:patient" />
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
            "Body": "<md:records xmlns:md=\"urn:example:med:schemas:record\"><md:patient><md:patientDoB>1992-03-21</md:patientDoB></md:patient><md:patient><md:patientDoB>2014-07-09</md:patientDoB></md:patient></md:records>"
        },
        "RequestAttribute": [
            {
                "AttributeId": "urn:oasis:names:tc:acal:1.0:profile:multiple:content-selector",
                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:xpathExpression",
                "Value": [
                    {
                        "XPathVersion": "https://www.w3.org/TR/xpath20/",
                        "Namespaces": {
                            "md": "urn:example:med:schemas:record"
                        },
                        "XPathCategory": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                        "XPath": "md:records/md:patient"
                    }
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
      <md:records xmlns:md="urn:example:med:schemas:record"><md:patient><md:patientDoB>1992-03-21</md:patientDoB></md:patient><md:patient><md:patientDoB>2014-07-09</md:patientDoB></md:patient></md:records>
  RequestAttribute:
    - AttributeId: "urn:oasis:names:tc:acal:1.0:profile:multiple:content-selector"
      DataType: "urn:oasis:names:tc:acal:1.0:data-type:xpathExpression"
      Value:
        - XPathVersion: "https://www.w3.org/TR/xpath20/"
          Namespaces:
            md: "urn:example:med:schemas:record"
          XPathCategory: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
          XPath: "md:records/md:patient"
```

**What this shows**

- Resolves, per [Section 5.2](#52-nodes-identified-by-xpath-expression), into one `Individual Decision Request` per matched `<md:patient>` node, each carrying the same `Content` with `…:multiple:content-selector` replaced by a plain `content-selector` attribute ([[ACAL-XPath-1.0](#acal-xpath-10)] Annex D.3) selecting that single node.
- The `md` prefix inside the `XPath` expression needs its own namespace binding, separate from `Content.Body`'s embedded `xmlns:md`, for the same reason as [[ACAL-Hierarchical-1.0](#acal-hierarchical-10)] Section 7.1's equivalent example: in XML it comes from ordinary in-scope namespaces (here, `xmlns:md` on `RequestEntity`, an ancestor of the `Value` element), unchanged from XACML 3.0; in JACAL/YACAL, which have no ancestor inheritance, it is carried on the value's own `Namespaces` property (a mapping from prefix to namespace name). The value also carries its own `XPathVersion` in all three representations, because this is a bare `RequestEntity` fragment with no enclosing `Request` and hence no `XPathRequestDefaults` for the value to take its version from ([[ACAL-XPath-1.0](#acal-xpath-10)] Section 5.3.5) — in a complete `Request` with an `XPathRequestDefaults` it could be omitted. `Content.Body`'s own encoding (literal elements in XML, an escaped string in JACAL, a block scalar in YACAL) is what stays representation-specific beyond that; the XPath expression itself is identical in all three.

---

## 8.3 Repeated Categories

A request naming access to two resources at once, using [Section 5.3](#53-repeated-categories)'s scheme.

**Plain language**: Permit or deny read access to two patient records for the same subject and action, as two separate decisions.

---

**XACML v4.0 (XML)**

```xml
<Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:subject:subject-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:rfc822Name">
            <Value>bs@simpsons.com</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>file:///records/bart-simpson.xml</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>file:///records/lisa-simpson.xml</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:action">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id">
            <Value>read</Value>
        </RequestAttribute>
    </RequestEntity>
</Request>
```

**JACAL v1.0 (JSON)**

```json
{
    "Request": {
        "RequestEntity": [
            {
                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:subject-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:rfc822Name",
                        "Value": [
                            "bs@simpsons.com"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                        "Value": [
                            "file:///records/bart-simpson.xml"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                        "Value": [
                            "file:///records/lisa-simpson.xml"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                        "Value": [
                            "read"
                        ]
                    }
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
Request:
  RequestEntity:
    - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:subject-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:rfc822Name"
          Value:
            - bs@simpsons.com
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value:
            - file:///records/bart-simpson.xml
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value:
            - file:///records/lisa-simpson.xml
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          Value:
            - read
```

**What this shows**

- Resolves to two `Individual Decision Request`s, one per resource, each pairing the shared subject and action with one of the two `resource` entities.
- No `Id` properties are needed on any `RequestEntity` object — repetition, not reference, is what identifies the combinations, unlike [Section 8.4](#84-reference) below.
- This example reappears, unchanged, in [Section 8.5](#85-combined-decision) with `CombinedDecision` added.

---

## 8.4 Reference

The same two resources, requested by reference instead of by repetition, using [Section 5.4](#54-reference)'s scheme.

**Plain language**: The same two decisions as [Section 8.3](#83-repeated-categories), constructed by naming entities instead of repeating a category.

---

**XACML v4.0 (XML)**

```xml
<Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject" Id="subj">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:subject:subject-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:rfc822Name">
            <Value>bs@simpsons.com</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource" Id="res1">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>file:///records/bart-simpson.xml</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource" Id="res2">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>file:///records/lisa-simpson.xml</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:action" Id="act">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id">
            <Value>read</Value>
        </RequestAttribute>
    </RequestEntity>
    <MultiRequests>
        <RequestReference>
            <RequestEntityReference>subj</RequestEntityReference>
            <RequestEntityReference>res1</RequestEntityReference>
            <RequestEntityReference>act</RequestEntityReference>
        </RequestReference>
        <RequestReference>
            <RequestEntityReference>subj</RequestEntityReference>
            <RequestEntityReference>res2</RequestEntityReference>
            <RequestEntityReference>act</RequestEntityReference>
        </RequestReference>
    </MultiRequests>
</Request>
```

**JACAL v1.0 (JSON)**

```json
{
    "Request": {
        "RequestEntity": [
            {
                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                "Id": "subj",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:subject-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:rfc822Name",
                        "Value": [
                            "bs@simpsons.com"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "Id": "res1",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                        "Value": [
                            "file:///records/bart-simpson.xml"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "Id": "res2",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                        "Value": [
                            "file:///records/lisa-simpson.xml"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                "Id": "act",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                        "Value": [
                            "read"
                        ]
                    }
                ]
            }
        ],
        "MultiRequests": {
            "RequestReference": [
                {
                    "RequestEntityReference": ["subj", "res1", "act"]
                },
                {
                    "RequestEntityReference": ["subj", "res2", "act"]
                }
            ]
        }
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
Request:
  RequestEntity:
    - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      Id: subj
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:subject-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:rfc822Name"
          Value:
            - bs@simpsons.com
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      Id: res1
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value:
            - file:///records/bart-simpson.xml
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      Id: res2
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value:
            - file:///records/lisa-simpson.xml
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      Id: act
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          Value:
            - read
  MultiRequests:
    RequestReference:
      - RequestEntityReference: [subj, res1, act]
      - RequestEntityReference: [subj, res2, act]
```

**What this shows**

- Each `RequestReference` names exactly the three entities its `Individual Decision Request` should contain; a `RequestEntityReference` value of, say, `res3` (no matching `Id`) would be a dangling reference per [Section 5.4](#54-reference).
- `Id` is an ordinary attribute/property in every representation (an XML attribute, a JSON/YAML property); `RequestEntityReference` values are plain strings matching it, not a cross-format construct.

---

## 8.5 Combined Decision

The [Section 8.3](#83-repeated-categories) example above, with `CombinedDecision` set to `true`.

**Plain language**: The same two resources as [Section 8.3](#83-repeated-categories), but returned as a single merged decision instead of two.

---

**XACML v4.0 (XML)**

```xml
<Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema" CombinedDecision="true">
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:subject:subject-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:rfc822Name">
            <Value>bs@simpsons.com</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>file:///records/bart-simpson.xml</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
        <RequestAttribute
            AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>file:///records/lisa-simpson.xml</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:action">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id">
            <Value>read</Value>
        </RequestAttribute>
    </RequestEntity>
</Request>
```

**JACAL v1.0 (JSON)**

```json
{
    "Request": {
        "CombinedDecision": true,
        "RequestEntity": [
            {
                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:subject-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:rfc822Name",
                        "Value": [
                            "bs@simpsons.com"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                        "Value": [
                            "file:///records/bart-simpson.xml"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                        "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                        "Value": [
                            "file:///records/lisa-simpson.xml"
                        ]
                    }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                "RequestAttribute": [
                    {
                        "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                        "Value": [
                            "read"
                        ]
                    }
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
Request:
  CombinedDecision: true
  RequestEntity:
    - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:subject-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:rfc822Name"
          Value:
            - bs@simpsons.com
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value:
            - file:///records/bart-simpson.xml
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value:
            - file:///records/lisa-simpson.xml
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          Value:
            - read
```

**What this shows**

- Setting `CombinedDecision` to `true` (or adding it to [Section 8.4](#84-reference)'s reference-based request instead) requests that the two individual `Permit`/`Deny`/etc. decisions be merged into one, per [Section 6](#6-combined-decision), rather than returned as two separate `ResultType` objects.
- `CombinedDecision` is a property of the `RequestType` object itself in every representation — an XML attribute on `<Request>`, a JSON/YAML property alongside `RequestEntity` — not tied to either the repeated-categories or reference scheme specifically.

---


# 9 Representation Considerations

[Section 4.2](#42-changes-from-the-previous-version) states that this profile needs no new schema artifacts: `MultiRequestsType`, `RequestReferenceType` and `RequestEntityReference` already exist in [[ACAL-Core-1.0](#acal-core-10)]'s XSD, JSON Schema and YAML structural schema. This section states, for each representation, what that existing schema actually enforces of [Section 5.4](#54-reference)'s dangling-reference and sibling-uniqueness rules — [Section 5.4](#54-reference) itself already requires both a schema-validation layer and a runtime-evaluation layer precisely because the schema-validation layer's coverage is uneven across representations, as this section makes concrete.

## 9.1 XML

Dangling-reference detection is enforced by the *Core XML Schema*'s `<xs:keyref name="Request_RequestEntityReference">`, which requires every `RequestEntityReference` value to match some `RequestEntity`'s `Id`. Sibling uniqueness (`self->isUnique(RequestEntityReference->asSet())`, [Section 5.4](#54-reference)) is enforced by an XSD 1.1 `<xs:assert>` on `MultiRequestsType`; where only XSD 1.0 is available, [[XACML-Core-4.0](#xacml-core-40)] Section 5.2.6.2's Schematron option covers the same rule. `RequestEntityReference` value uniqueness within one `RequestReferenceType` object is enforced by `<xs:unique name="RequestReference_RequestEntityReference">`. **All three of this profile's referential rules are fully covered by structural validation alone in the XML representation** — unlike the JSON and YAML cases below.

## 9.2 JSON

JSON Schema 2020-12 has no keyword analogous to XSD's `keyref`: nothing in the vocabulary can require that a string value elsewhere in the document match some other value used as a key. **Dangling-reference detection is not enforced by JSON Schema validation at all**, so a JACAL implementation is necessarily in [Section 5.4](#54-reference) item 2's "non-schema-validating" case for this specific rule regardless of whether it validates the rest of the request against JSON Schema — that item's `MUST` therefore governs unconditionally for JACAL, not merely as a fallback. Sibling uniqueness fares no better: the *Core JSON Schema* itself marks the corresponding constraint an open TODO (`"$comment": "TODO: translate/enforce ACAL constraint: {OCL} self->isUnique(RequestEntityReference->asSet())"`), since it is a uniqueness test over *derived sets* of values rather than over individual values, which neither `uniqueItems` nor the `uniqueKeys` extension [[JACAL-Core-1.0](#jacal-core-10)] Section 5.2.4 discusses can express.

## 9.3 YAML

The `acal-core-yaml-v1.0-constraints.yaml` catalog [[YACAL-Core-1.0](#yacal-core-10)] documents both rules explicitly — `requestreference-requestentityreference-resolves` (`Kind: referenceMustResolve`) for dangling references, and `multirequests-requestreference-unique-by-entity-id-set` (`Kind: uniqueByDerivedSet`) for sibling uniqueness. The catalog is a declarative statement of each requirement, not a JSON-Schema-loadable artifact a generic YAML validator executes, so **no standard YAML or JSON Schema mechanism enforces either rule mechanically**; both, like their JSON counterparts, depend entirely on [Section 5.4](#54-reference)'s runtime-evaluation layer for actual enforcement. The catalog's value is telling an implementer precisely what that runtime check must do — the durable record of the requirement — not replacing the check itself.

---

# 10 Safety, Security, and Data Protection Considerations

Refer to [[ACAL-Core-1.0](#acal-core-10)] Section 10.

An implementation supporting [Section 5.1](#51-nodes-identified-by-scope) (scope) SHOULD be aware that `Children`/`Descendants` expansion can enumerate a number of resources not evident from the original request's size — a request naming one resource with `scope="Descendants"` against a large hierarchy may expand into a correspondingly large number of `Individual Decision Request`s. Implementations SHOULD apply appropriate resource limits.

---


# 11 Conformance

## 11.1 Introduction

The specification defines four independently optional request-construction schemes and one combined-decision scheme, plus a conceptual model whose observable results are mandatory for any implementation claiming one or more of them.

## 11.2 Conformance Tables

This section lists those portions of the specification that MUST be included in an implementation of a PDP, PAP or PEP that claims to conform to this profile.

: Note: "M" means mandatory-to-implement. "O" means optional.

The implementation MUST follow [Section 5](#5-request-construction-schemes), [Section 6](#6-combined-decision), [Section 7](#7-conceptual-model-for-creating-individual-decision-requests) and [Annex C](#annex-c-acal-identifiers) where they apply to implemented items in the following tables. `urn:oasis:names:tc:acal:1.0:content-selector` is defined, and its conformance status given, by [[ACAL-XPath-1.0](#acal-xpath-10)] Annex D.3/Section 9.2.4; this profile references it without restating its conformance status.

### 11.2.1 Profile Identifiers

The implementation MUST support the schemes associated with the following identifiers marked `M`. An implementation supporting any one of them MUST also support [Section 7](#7-conceptual-model-for-creating-individual-decision-requests)'s observable results.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:profile:multiple:scope | O | urn:oasis:names:tc:xacml:3.0:profile:multiple:scope |
| urn:oasis:names:tc:acal:1.0:profile:multiple:xpath-expression | O | urn:oasis:names:tc:xacml:3.0:profile:multiple:xpath-expression |
| urn:oasis:names:tc:acal:1.0:profile:multiple:repeated-categories | O | urn:oasis:names:tc:xacml:3.0:profile:multiple:repeated-attribute-categories |
| urn:oasis:names:tc:acal:1.0:profile:multiple:reference | O | urn:oasis:names:tc:xacml:3.0:profile:multiple:reference |
| urn:oasis:names:tc:acal:1.0:profile:multiple:combined-decision | O | urn:oasis:names:tc:xacml:3.0:profile:multiple:combined-decision |

### 11.2.2 Attributes

The implementation MUST use the attributes associated with the following identifiers in the way this profile has defined (see [Annex C.3](#c3-attributes)).

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:resource:scope | O | urn:oasis:names:tc:xacml:2.0:resource:scope |
| urn:oasis:names:tc:acal:1.0:profile:multiple:content-selector | O | urn:oasis:names:tc:xacml:3.0:profile:multiple:content-selector |

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

_YACAL Version 1.0 (YAML Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.html

###### [JACAL-Core-1.0]

_JACAL Version 1.0 (JSON Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/jacal/core/v1.0/acal-core-json-v1.0.html

###### [XACML-Core-4.0]

_XACML Version 4.0 (eXtensible Access Control Markup Language)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html

###### [ACAL-Core-1.0]

_Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html

###### [ACAL-Hierarchical-1.0]

_ACAL v1.0 Hierarchical Resource Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v1.0/acal-hierarchical-v1.0.html

###### [ACAL-XPath-1.0]

_ACAL v1.0 XPath Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/xpath/v1.0/acal-xpath-v1.0.html

###### [RFC2119]

RFC 2119, *Key Words for Use in RFCs to Indicate Requirement Levels*, BCP 14, RFC 2119, March 1997. [Online]. Available: https://www.rfc-editor.org/info/rfc2119

###### [RFC8174]

RFC 8174, *Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words*, BCP 14, RFC 8174, May 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8174

## B.2 Informative References

The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [Multi]

XACML v3.0 Multiple Decision Profile Version 1.0. 18 May 2014. Committee Specification 02. https://docs.oasis-open.org/xacml/3.0/multiple/v1.0/xacml-3.0-multiple-v1.0.html

# Annex C ACAL Identifiers


(This annex forms an integral part of this Specification.)

This section defines standard identifiers for commonly used definitions.

## C.1 ACAL Namespaces

This ACAL Profile is defined using this identifier.

`urn:oasis:names:tc:acal:1.0:multiple:schema`

## C.2 Profile Identifiers

See [Section 11.2.1](#1121-profile-identifiers) for the five profile identifiers this document defines, their meaning, and their deprecated XACML 3.0 equivalents.

## C.3 Attributes

This profile defines the following standard attribute identifiers.

This attribute, used within a `RequestEntityType` object with `Category` evaluating to `urn:oasis:names:tc:acal:1.0:attribute-category:resource`, requests expansion per [Section 5.1](#51-nodes-identified-by-scope):

`urn:oasis:names:tc:acal:1.0:resource:scope`

: The corresponding attribute SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:string`, with value `Immediate`, `Children` or `Descendants`.

This attribute, used within a `RequestEntityType` object with `Category` evaluating to `urn:oasis:names:tc:acal:1.0:attribute-category:resource`, requests expansion per [Section 5.2](#52-nodes-identified-by-xpath-expression):

`urn:oasis:names:tc:acal:1.0:profile:multiple:content-selector`

: The corresponding attribute SHALL be of data type `urn:oasis:names:tc:acal:1.0:data-type:xpathExpression` ([[ACAL-XPath-1.0](#acal-xpath-10)] Annex C.2.1). Distinct from, and not to be confused with, the plain `urn:oasis:names:tc:acal:1.0:content-selector` attribute ([[ACAL-XPath-1.0](#acal-xpath-10)] Annex D.3) that replaces it in each generated `Individual Decision Request`.

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
$ pandoc/mkdocs.sh --output /tmp acal-multiple-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

This document has no `{.numberLines}` code fences, so the `--number-lines` option is not needed.

The publication date is automatically set to the current date by default (using Lua filter `pandoc/meta_vars.lua`). However, you may set a specific date of your choice instead, by adding the argument `--metadata date="My date in the form DD Month YYYY"` at the end of the command.

### PDF generation

For PDF output, add the `--pdf` option as follows:

```console
$ pandoc/mkdocs.sh --pdf --output /tmp acal-multiple-v%version%.md
```

The HTML file is generated like the previous command and, in addition, a PDF file is generated with the same name as the input file except the `.md` extension is replaced with `.pdf` in this case.

Beware that **the result PDF - the embedded fonts in particular - may differ depending on the system/machine** where you run this command. Mainly, it depends on which fonts are actually installed on the system, as the HTML-to-PDF converter (Chrome / Chromium in this case) selects available fonts according to the prioritized lists defined by `font-family` properties in the CSS.

**For official TC publications**, add the `--official` argument to avoid this issue and produce a system-independent output:

```console
$ pandoc/mkdocs.sh --pdf --official --output /tmp acal-multiple-v%version%.md
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


---


# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)

This is the first version of this profile. See [Section 4.2](#42-changes-from-the-previous-version) for the changes relative to its XACML 3.0 predecessor.

## Revision History

Latest revision history can be obtained from [OASIS ACAL \[XACML\] TC's github repository](https://github.com/oasis-tcs/acal-spec/blob/v%version%-%stage_revision%/acal-multiple-v%version%-%stage_revision%.md).

<!-- The following centered line represents the end of the document -->
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
