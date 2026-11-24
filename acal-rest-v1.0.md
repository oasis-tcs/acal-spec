---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: ACAL v1.0 REST Profile Version 1.0
subtitle: Committee Specification Draft 02
version: "1.0"
stage_revision: csd02 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access", "authorization", "ABAC", "REST", "HTTP", "PDP", "policylanguage", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version

- https://docs.oasis-open.org/acal/acal/profiles/rest/v%version%/%stage_revision%/acal-rest-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/rest/v%version%/%stage_revision%/acal-rest-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/acal/acal/profiles/rest/v%version%/%stage_revision%/acal-rest-v%version%-%stage_revision%.md


### Previous version


N/A

### Latest version


- https://docs.oasis-open.org/acal/acal/profiles/rest/v1.0/acal-rest-v1.0.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/rest/v1.0/acal-rest-v1.0.pdf
- https://docs.oasis-open.org/acal/acal/profiles/rest/v1.0/acal-rest-v1.0.md


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


This specification is a profile of ACAL that defines how a Policy Enforcement Point obtains an authorization decision from a Policy Decision Point over HTTP in a RESTful architecture: the resources a server offers, the link relations by which a client discovers them, the media types that identify the ACAL representations in an exchange, and the HTTP status codes that report the outcome.


### Citation Format


When referencing this document, the following citation format should be used:

**[ACAL-REST-1.0]**
_%title%_.
Edited by Steven Legg, Cyril Dangerville and Bill Parducci. %date%. OASIS %subtitle%. https://docs.oasis-open.org/acal/acal/profiles/rest/v%version%/%stage_revision%/acal-rest-v%version%-%stage_revision%.html . Latest version: https://docs.oasis-open.org/acal/acal/profiles/rest/v1.0/acal-rest-v1.0.html .


### Related Work

This document replaces or supersedes:

- _XACML REST Profile Version 1.1_. Edited by Rémon Sinnema. 20 June 2019. OASIS Standard. https://docs.oasis-open.org/xacml/xacml-rest/v1.1/os/xacml-rest-v1.1-os.html . Latest version: https://docs.oasis-open.org/xacml/xacml-rest/v1.1/xacml-rest-v1.1.html .

This document is related to:

- _Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html
- _ACAL v1.0 Multiple Decision Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/multiple/v1.0/acal-multiple-v1.0.html


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
- [5 RESTful Services](#5-restful-services)
  - [5.1 Network Transport](#51-network-transport)
  - [5.2 Link Relations](#52-link-relations)
  - [5.3 Home Resource](#53-home-resource)
  - [5.4 PDP Resource](#54-pdp-resource)
    - [5.4.1 Decision Request](#541-decision-request)
    - [5.4.2 Status Codes](#542-status-codes)
    - [5.4.3 Use of POST and Caching](#543-use-of-post-and-caching)
- [6 Representations](#6-representations)
  - [6.1 Media Types](#61-media-types)
  - [6.2 Content Negotiation](#62-content-negotiation)
  - [6.3 Linking](#63-linking)
  - [6.4 Home Resource Representation](#64-home-resource-representation)
- [7 Examples (non-normative)](#7-examples-non-normative)
  - [7.1 Obtaining an Access Decision](#71-obtaining-an-access-decision)
  - [7.2 The Same Exchange in XACML and YACAL](#72-the-same-exchange-in-xacml-and-yacal)
  - [7.3 A Request that Cannot Be Parsed, and a Request that Core Rejects](#73-a-request-that-cannot-be-parsed-and-a-request-that-core-rejects)
- [8 Safety, Security, and Data Protection Considerations](#8-safety-security-and-data-protection-considerations)
  - [8.1 Network Transport](#81-network-transport)
  - [8.2 Authentication](#82-authentication)
  - [8.3 Authorization](#83-authorization)
  - [8.4 Integrity and Non-Repudiation](#84-integrity-and-non-repudiation)
- [9 Conformance](#9-conformance)
  - [9.1 Introduction](#91-introduction)
  - [9.2 Conformance Tables](#92-conformance-tables)
    - [9.2.1 Profile Identifiers](#921-profile-identifiers)
    - [9.2.2 Media Types](#922-media-types)
    - [9.2.3 Link Relations](#923-link-relations)
- [Annex A License, Document Status and Notices](#annex-a-license-document-status-and-notices)
  - [A.1 Document Status](#a1-document-status)
  - [A.2 License and Notices](#a2-license-and-notices)
- [Annex B References](#annex-b-references)
  - [B.1 Normative References](#b1-normative-references)
  - [B.2 Informative References](#b2-informative-references)
- [Annex C ACAL Identifiers](#annex-c-acal-identifiers)
  - [C.1 Profile Identifiers](#c1-profile-identifiers)
  - [C.2 Link Relation Types](#c2-link-relation-types)
- [Annex D IANA Considerations](#annex-d-iana-considerations)
  - [D.1 The application/jacal+json Media Type](#d1-the-applicationjacaljson-media-type)
  - [D.2 The application/yacal+yaml Media Type](#d2-the-applicationyacalyaml-media-type)
  - [D.3 The application/xacml+xml Media Type](#d3-the-applicationxacmlxml-media-type)
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

This ACAL profile defines how a client — typically a Policy Enforcement Point (PEP) — obtains an authorization decision from a server that offers a Policy Decision Point (PDP), using HTTP in a RESTful architecture. It defines:

- the use of HTTP as the transport ([Section 5.1](#51-network-transport));
- the link relation types by which a client discovers the server's resources ([Section 5.2](#52-link-relations));
- an optional **Home Resource**, from which a client discovers the PDP ([Section 5.3](#53-home-resource));
- the **PDP Resource**, to which a client sends an ACAL Request (or, optionally, a SAML decision query) and from which it receives an ACAL Response (or the SAML response), and the HTTP status codes that report the outcome ([Section 5.4](#54-pdp-resource));
- the media types that identify the XACML, JACAL and YACAL representations of a Request and a Response, and how client and server negotiate them ([Section 6](#6-representations));
- the identifiers this profile introduces ([Annex C](#annex-c-acal-identifiers)), and the registration of two new media types ([Annex D](#annex-d-iana-considerations)).

Only the interaction between a PEP and a PDP is in scope. A server MAY also accept a SAML decision query of the XACML SAML Profile [[SAML4XACML](#saml4xacml)], which this profile carries forward from its predecessor ([Section 5.4.1](#541-decision-request)). Policy administration, attribute retrieval and other parts of the ACAL architecture are not addressed by this version of the profile. Apart from that SAML option, the structures carried in the HTTP messages are the `RequestType` and `ResponseType` objects of [[ACAL-Core-1.0](#acal-core-10)], in the representations defined by [[XACML-Core-4.0](#xacml-core-40)], [[JACAL-Core-1.0](#jacal-core-10)] and [[YACAL-Core-1.0](#yacal-core-10)], unchanged. This profile introduces no new object type and no new schema artifact.

---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

See Section 2 of [[ACAL-Core-1.0](#acal-core-10)]. In addition, the terms *resource* (in the HTTP sense), *representation*, *client*, *server*, *origin server*, *content negotiation*, *safe* and *idempotent* are used as defined in [[RFC9110](#rfc9110)], and *link*, *link context*, *link target* and *link relation type* as defined in [[RFC8288](#rfc8288)].

Where this document says *HTTP resource*, it means a resource in the sense of [[RFC9110](#rfc9110)]: something a server identifies by a URI and offers through HTTP. This is not the same concept as the ACAL resource category of [[ACAL-Core-1.0](#acal-core-10)].

### 2.1.2 Terms Defined in this Document

`ACAL Request`

: A document of an ACAL representation whose root object is a `RequestType` object ([[ACAL-Core-1.0](#acal-core-10)] Section 7.33): in XACML, an XML document whose document element is `Request` in the namespace `urn:oasis:names:tc:xacml:4.0:core:schema`; in JACAL, a JSON object whose single property is `Request`; in YACAL, a YAML mapping whose single key is `Request`. Not the same concept as an HTTP request.

`ACAL Response`

: A document of an ACAL representation whose root object is a `ResponseType` object ([[ACAL-Core-1.0](#acal-core-10)] Section 7.38), in the same three forms with `Response` in place of `Request`. Not the same concept as an HTTP response.

`Home Resource`

: The HTTP resource that a server MAY offer at a documented location, and whose representation links to the PDP Resource and, optionally, to other ACAL-related HTTP resources. See [Section 5.3](#53-home-resource). (Called the *entry point* in [[XACML-REST](#xacml-rest)].)

`PDP Resource`

: The HTTP resource to which a client sends an ACAL Request with the `POST` method, and which returns an ACAL Response; optionally, it also takes a SAML decision query and returns the SAML response ([Section 5.4.1](#541-decision-request)). See [Section 5.4](#54-pdp-resource).

### 2.1.3 Related terms

None.


## 2.2 Abbreviations and Acronyms

`REST`

: Representational State Transfer [[REST](#rest)].

`TLS`

: Transport Layer Security.

---


# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [[RFC2119](#rfc2119)] [[RFC8174](#rfc8174)] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions

HTTP messages in examples are shown in the HTTP/1.1 message syntax of [[RFC9112](#rfc9112)], with a long header field value shown on two lines for readability (in a message it is one line), and with the `Content-Length` header field omitted; the profile itself does not depend on the HTTP version.

Sections and annexes marked non-normative or informational are informative. All other sections are normative.

---


# 4 Introduction (non-normative)


## 4.1 Background

ACAL is commonly deployed with authorization externalized from the application: a PEP inside each application asks a PDP, shared among many applications, for each access decision. Once the PDP is a shared service it is reached over a network, and the decisions that the PEPs need become a steady flow of requests to it. HTTP is the protocol such services are usually built on, and the REST architectural style [[REST](#rest)] — stateless requests, cacheable responses, a uniform interface, and discovery through links — keeps the demands on the client small while letting the service evolve.

This profile fixes the few points on which a PEP and a PDP from different vendors must agree to interoperate over HTTP: which HTTP resource takes a decision request, how a client finds it, how each party says which ACAL representation it is sending and will accept, and what the HTTP status code of the reply does and does not mean. Everything else — the content of the request, how the PDP evaluates it, and the content of the response — is ACAL Core, unchanged, apart from the optional SAML decision query carried forward from the previous version ([Section 5.4.1](#541-decision-request)).

A single HTTP request carries a single ACAL Request (or a single SAML decision query). A Request that asks for several decisions under the ACAL Multiple Decision Profile [[ACAL-Multiple-1.0](#acal-multiple-10)] is still one ACAL Request, and its several `Result` objects are returned in one ACAL Response.

## 4.2 Changes From the Previous Version

This is the first ACAL version of this profile, ported from _XACML REST Profile Version 1.1_, **OASIS Standard, 20 June 2019** [[XACML-REST](#xacml-rest)], which superseded _REST Profile of XACML v3.0 Version 1.0_. (Within this document, `[XACML-REST]` denotes the Version 1.1 OASIS Standard.)

The following substantive changes and decisions apply relative to that source:

- **Identifier namespace.** The three functionality identifiers use the `urn:oasis:names:tc:acal:1.0:` prefix, with the XACML 3.0 identifier recorded as a deprecated equivalent, per the standard ACAL convention ([Section 9.2.1](#921-profile-identifiers)): `urn:oasis:names:tc:xacml:3.0:profile:rest:http` → `urn:oasis:names:tc:acal:1.0:profile:rest:http`, and likewise for `home` and `pdp`.
- **New link relation types, with the XACML ones kept as deprecated.** The link relation types are `https://docs.oasis-open.org/acal/ns/relation/home` and `https://docs.oasis-open.org/acal/ns/relation/pdp` ([Section 5.2](#52-link-relations)), in place of `http://docs.oasis-open.org/xacml/ns/relation/home` and `http://docs.oasis-open.org/xacml/ns/relation/pdp`. Because a link relation type is a string a client compares, not an identifier subject to ACAL identifier equality, [Section 5.2](#52-link-relations) says how a server keeps deployed clients working: it MAY give a link both relation types, and a client SHOULD recognize both.
- **The entry point is renamed the Home Resource.** [[ACAL-Core-1.0](#acal-core-10)] Section 7.48 already calls the policy that a `BundleType` object's `PolicyReference` names "the entry point of evaluation", and Section 8.13 calls that property "the entry-point reference"; and the ACAL RBAC Profile's Section 5.3.5 is titled "The PDP Entry Point". The HTTP resource is renamed the **Home Resource**, which matches the source's own identifier (`…:rest:home`) and link relation (`…/relation/home`). Its requirements are otherwise unchanged.
- **Media types for the three ACAL representations.** [[XACML-REST](#xacml-rest)] §2.3 says that XACML requests and responses SHOULD use media types registered for XACML, and §2.3.3 that "XACML media types MUST support a version parameter". [Section 6.1](#61-media-types) names one media type per ACAL representation, each with a `version` parameter: `application/xacml+xml; version=4.0` for XACML [[RFC7061](#rfc7061)], and two new types, `application/jacal+json; version=1.0` and `application/yacal+yaml; version=1.0`, whose registration templates are in [Annex D](#annex-d-iana-considerations). The source's SHOULD becomes a SHALL for the media type of these three representations, a sender SHOULD include the `version` parameter in `Content-Type`, and a server reads a missing `version` as the latest version it supports; other representations are outside the scope of this profile. No media type registered before this profile identifies a JACAL or YACAL document: `application/vnd.xacml+json` is a vendor-tree registration for the JSON Profile of XACML 3.0, a different format, and no `+yaml` type for XACML or ACAL exists.
- **No representation is mandatory; a server supports at least one.** [[XACML-REST](#xacml-rest)] §2.2.2 says that a server "MUST support `<Request>` from XACML core", although its §2.3 already pointed to other registered representations, such as the JSON Profile of XACML. ACAL's three representations are representations of one model, so [Section 9.2.2](#922-media-types) requires a server to support at least one of XACML 4.0, JACAL 1.0 and YACAL 1.0, and none in particular. A client and a server therefore share a representation only if the server supports one that the client does. The profile does not require a server to disclose which it supports; a client can learn it from the server's documentation, or from an `Accept` header field that a server MAY send with a 415 response ([Section 6.2](#62-content-negotiation)), and otherwise has to know it in advance. The profile also states what the source implied: a server is able to return the ACAL Response in each representation it accepts requests in.
- **The SAML decision query is carried forward unchanged.** [[XACML-REST](#xacml-rest)] §2.2.2 lets a server accept a SAML `XACMLAuthzDecisionQuery` in place of a `<Request>`, three of its test assertions (`pdp:saml:status`, `pdp:saml:body`, `pdp:saml:invalid`) cover that option, and its §3.4 relies on the same profile for non-repudiation. No ACAL version of that profile is part of this work, so [Section 5.4.1](#541-decision-request) and [Section 8.4](#84-integrity-and-non-repudiation) keep the option and the reliance by reference to the XACML 3.0 profile, now cited at its current stage, _XACML SAML Profile Version 2.0_, Committee Specification 02 [[SAML4XACML](#saml4xacml)] (the source cites the 2010 Committee Specification 01, titled _SAML 2.0 Profile of XACML, Version 2.0_). Its query carries an XACML 3.0 request in the namespace `urn:oasis:names:tc:xacml:3.0:core:schema:wd-17`, not an ACAL Request, and is processed as that profile specifies. Three things are added: a server that accepts the query documents the media types of the query and of its response, which the source left unnamed, and labels the response with its documented media type; the query's media type is not one of the ACAL media types, so that [Section 5.4.2](#542-status-codes) can tell the query from an ACAL Request, and the ACAL `version` rules do not apply to either; [Section 5.4.2](#542-status-codes) gives the query its own 400 test, a schema test, with the document element `XACMLAuthzDecisionQuery` in the namespace `urn:oasis:names:tc:xacml:3.0:profile:saml2.0:v2:schema:protocol:wd-14` and no schema construct set aside; and the source's "the request's `ID`" is read as the query's `ID`. [Section 8.4](#84-integrity-and-non-repudiation) carries the source's §3.4, including that the audit trail needs to be at least tamper-evident, and adds that TLS alone gives no evidence a third party can verify later.
- **An invalid request is split by where it fails.** [[XACML-REST](#xacml-rest)]'s test assertion `pdp:xacml:invalid` requires status code 400 for "an invalid XACML request", but no sentence of its body states that rule: the body requires 400 only for a body that "doesn't match the Content-Type" (§2.3.3). ACAL Core, for its part, makes some valid requests syntax errors (for example, several `RequestEntity` objects with the same `Category` at a PDP that does not implement [[ACAL-Multiple-1.0](#acal-multiple-10)], [[ACAL-Core-1.0](#acal-core-10)] Section 7.33), returns `Indeterminate` when the PDP cannot make a decision ([[ACAL-Core-1.0](#acal-core-10)] Section 8.15), and says that the `syntax-error` status code may represent a problem "with the request context" ([[ACAL-Core-1.0](#acal-core-10)] Section 7.44). [Section 5.4.2](#542-status-codes) now states both in the body: 400 when the content cannot be parsed as the indicated representation, has a root other than `Request`, or fails that representation's schema with its assertions, identity constraints and `uniqueItems` set aside, as [Section 5.4.2](#542-status-codes) defines; and 200 with an ACAL Response for every other error, including those constructs and the rules a representation states outside its schema. It also assigns the source's unexplained 415 to a missing `Content-Type`, an unaccepted media type or `version`, or an unsupported `Content-Encoding`, classes a document whose root is not `Request` as 400, sets XML Schema assertions and identity constraints and JSON Schema `uniqueItems` aside from the 400 test, so that, for example, two attributes with the same `(AttributeId, DataType, Issuer)`, which only the XML Schema rejects, get status code 200 in all three representations (a rule that one schema encodes by an assertion and another by `maxItems` can still fall on different sides), and gives the order in which the status codes apply.
- **The test assertions are folded into the body.** [[XACML-REST](#xacml-rest)] §4.2 lists eleven test assertions in the OASIS Test Assertions Model; no other ACAL specification carries test assertions. Each of the eleven is carried, as follows:
  - `pdp:saml:status`, `pdp:saml:body` and `pdp:saml:invalid` (200 with a SAML response for a valid query, 400 for an invalid one) have no sentence in the source's body; [Section 5.4.1](#541-decision-request) and [Section 5.4.2](#542-status-codes) now state them. Their "Normative Source" repeats "valid XACML request" for a target that is a SAML query; the body text speaks of the query.
  - `http:client`, `http:server` and `home:documentation` restate body requirements, which [Section 5.1](#51-network-transport) and [Section 5.3](#53-home-resource) carry.
  - `pdp:xacml:status` and `pdp:xacml:body` (a valid request gets status code 200 and an ACAL Response) have no sentence in the source's body; [Section 5.4.1](#541-decision-request) and [Section 5.4.2](#542-status-codes) now state them.
  - `home:pdp` says the Home Resource representation "SHOULD contain a link to the PDP"; §2.2.1 and §2.3.2 say MUST. The body is followed: [Section 5.3](#53-home-resource) keeps MUST.
  - `home:status` says a `GET` "MUST return status code 200"; no body sentence says so, and §2.2.1 lists the codes 200, 400, 401, 403, 406 and 5xx. [Section 5.3](#53-home-resource) keeps the list and adds no such requirement.
  - `pdp:xacml:invalid` is replaced by the split described in the previous item.
- **The Administration and Delegation Profile is no longer recommended.** [[XACML-REST](#xacml-rest)] §3.3 RECOMMENDS the XACML 3.0 Administration and Delegation Profile for authorizing access to the PDP. That profile has no ACAL version, and [Section 8.3](#83-authorization) does not name one.
- **Two explanations are corrected.** [[XACML-REST](#xacml-rest)] §2.2.2 says that when a `<Request>` is used "the PEP must either use a new TCP/IP session, or wait with sending a request over the current session until the response for the previous request is received". That is a property of HTTP/1.1 without pipelining, not of the profile; HTTP/2 [[RFC9113](#rfc9113)] and HTTP/3 [[RFC9114](#rfc9114)] carry concurrent requests on one connection, and the sentence is removed. §2.2.2 also says that the decision operation "is both idempotent and safe" although `POST` is used, and that cache control headers "make this explicit". [[RFC9110](#rfc9110)] Section 9.3.3 calls `POST` "potentially unsafe" and says a cached `POST` response cannot satisfy a later `POST` request, so a `Cache-Control` header field does not make a `POST` operation safe; and `POST` is not among the idempotent methods of [[RFC9110](#rfc9110)] Section 9.2.2. Both claims are dropped. [Section 5.4.3](#543-use-of-post-and-caching) keeps the recommendation to send a `Cache-Control` header field, now with the directive `no-store`, for the reason [Section 8.1](#81-network-transport) gives: a cache can reuse a `POST` response with explicit freshness for a later `GET`.
- **The Home Resource example uses a current format.** [[XACML-REST](#xacml-rest)] §2.4 shows the entry point as a home document in the XML syntax of the Internet-Draft draft-wilde-home-xml, which has since expired. [Section 7.1](#71-obtaining-an-access-decision) uses the `application/linkset+json` format of [[RFC9264](#rfc9264)]. As in the source, no format is required ([Section 6.4](#64-home-resource-representation)).
- **References are updated.** RFC 7230, RFC 7231 and RFC 7235 → [[RFC9110](#rfc9110)] (and [[RFC9112](#rfc9112)] for HTTP/1.1 message syntax); RFC 7234 → [[RFC9111](#rfc9111)]; RFC 2818 → [[RFC9110](#rfc9110)] Section 4.2.2 for the `https` scheme, with [[RFC9325](#rfc9325)] for TLS practice; RFC 5988 → [[RFC8288](#rfc8288)]. The source's `[WebLink]` entry is labelled "IETF RFC 4287" but titled and linked as RFC 5988; this document cites [[RFC8288](#rfc8288)], which obsoletes RFC 5988. HTTP Basic and Digest authentication are cited from [[RFC7617](#rfc7617)] and [[RFC7616](#rfc7616)]; OpenID Authentication 2.0 is replaced by [[OpenID-Connect](#openid-connect)]. The non-normative references to Mason, Siren, UBER and the NIST and Cloud Security Alliance cloud definitions, which supported text not carried into this version, are removed.
- **Basic authentication stays prohibited.** [[XACML-REST](#xacml-rest)] §3.2 says "Basic authentication MUST NOT be used, since it sends the password in plain text over the network", while TLS is RECOMMENDED, not required. [Section 8.2](#82-authentication) carries the prohibition unchanged, and describes the exposure accurately: the password is protected only by the transport, and is in plain text without TLS.
- **Other changes to requirements.** Content negotiation ([Section 6.2](#62-content-negotiation)) covers the request (identified by `Content-Type`, [[RFC9110](#rfc9110)] Section 8.3, and answered with 415 if not accepted) as well as the response (`Accept`, [[RFC9110](#rfc9110)] Section 12.5.1); the source's statement that a body not matching its `Content-Type` is an error, by a client or a server, is kept, and its 400 now yields to the earlier rules of [Section 5.4.2](#542-status-codes). Links that authorization hides ([Section 8.3](#83-authorization)) include those in a `Link` header field. A server that gives a link in a `Link` header field quotes the relation types, as [[RFC8288](#rfc8288)] Section 3.3 requires for these URIs. The Home Resource's link to the PDP Resource, required in a 200 response as the source required it in the returned representation, may be in its representation or in a `Link` header field ([Section 6.4](#64-home-resource-representation)), as the source's §2.3.1 already allowed for representations that cannot carry links.
- **Profile identifier use.** [Section 9.2.1](#921-profile-identifiers) says that an implementation that supports the functionality identified by a profile identifier SHALL use that identifier to indicate that support, as the other ACAL profiles do.
- **Examples** use HTTP/1.1, the XACML 4.0 namespace, and one representation in full (JACAL), with the same exchange in XACML and YACAL alongside ([Section 7](#7-examples-non-normative)).
- **No new schema artifacts.** Like the other ACAL profiles, this profile defines identifiers and protocol rules, not new object types; `RequestType` and `ResponseType` already exist in each representation's Core schema.

---


# 5 RESTful Services

This section is normative.

## 5.1 Network Transport

The following identifier SHALL be used for the functionality specified in this section:

`urn:oasis:names:tc:acal:1.0:profile:rest:http`

HTTP [[RFC9110](#rfc9110)] MUST be used as the protocol that transports messages between client and server. This profile does not depend on the HTTP version; any version that implements the semantics of [[RFC9110](#rfc9110)] MAY be used.

The use of TLS, through the `https` URI scheme ([[RFC9110](#rfc9110)] Section 4.2.2), is RECOMMENDED. See [Section 8](#8-safety-security-and-data-protection-considerations).

Additional transport protocols MAY be used, but are outside the scope of this profile.

## 5.2 Link Relations

This profile defines two link relation types [[RFC8288](#rfc8288)]. Each is an extension relation type ([[RFC8288](#rfc8288)] Section 2.1.2):

| Link relation type | Link target | Deprecated link relation type |
| :--- | :--- | :--- |
| `https://docs.oasis-open.org/acal/ns/relation/home` | The Home Resource ([Section 5.3](#53-home-resource)) | `http://docs.oasis-open.org/xacml/ns/relation/home` |
| `https://docs.oasis-open.org/acal/ns/relation/pdp` | The PDP Resource ([Section 5.4](#54-pdp-resource)) | `http://docs.oasis-open.org/xacml/ns/relation/pdp` |

A server that gives a link to the Home Resource or to the PDP Resource SHALL give it the link relation type in the first column. It MAY give the same link the deprecated link relation type as well, so that a client of [[XACML-REST](#xacml-rest)] can still follow it; in a `Link` header field, both are values of one `rel` parameter, separated by a space, and the parameter value MUST be quoted ([[RFC8288](#rfc8288)] Section 3.3).

A client SHOULD recognize both link relation types of a row as denoting the same link target. Link relation types are compared as [[RFC8288](#rfc8288)] Section 2.1.2 specifies: as strings, character by character, in a case-insensitive fashion. The `http` and `https` forms are therefore different link relation types.

## 5.3 Home Resource

The following identifier SHALL be used for the functionality specified in this section:

`urn:oasis:names:tc:acal:1.0:profile:rest:home`

| Method | Request content | Response content | Description | Status codes |
| :--- | :--- | :--- | :--- | :--- |
| `GET` | None | Home Resource representation ([Section 6.4](#64-home-resource-representation)) | Discovers the PDP Resource and any other ACAL-related HTTP resources | 200, 400, 401, 403, 406, 5xx |

A server MAY offer a Home Resource at a known location. It is RECOMMENDED that the location of the Home Resource remain fixed as the service evolves, so that older clients continue to work. A server that offers a Home Resource MUST document its location.

The Home Resource MAY be part of a larger RESTful system. In that case its location is discovered from the enclosing system, through a link with the link relation type `https://docs.oasis-open.org/acal/ns/relation/home` ([Section 5.2](#52-link-relations)), and the documentation SHOULD describe how to discover it.

A response with status code 200 to a `GET` on the Home Resource MUST give a link to the PDP Resource, and MAY give links to other ACAL-related HTTP resources ([Section 6.4](#64-home-resource-representation)).

## 5.4 PDP Resource

The following identifier SHALL be used for the functionality specified in this section:

`urn:oasis:names:tc:acal:1.0:profile:rest:pdp`

Links to the PDP Resource use the link relation type `https://docs.oasis-open.org/acal/ns/relation/pdp` ([Section 5.2](#52-link-relations)).

| Method | Request content | Response content | Description | Status codes |
| :--- | :--- | :--- | :--- | :--- |
| `POST` | ACAL Request (or, optionally, a SAML decision query, [Section 5.4.1](#541-decision-request)) | ACAL Response (or the SAML response) | Makes an authorization decision | 200, 400, 401, 403, 406, 415, 5xx |

### 5.4.1 Decision Request

A client requests a decision by sending a `POST` request to the PDP Resource whose content is one ACAL Request, in a representation identified by its `Content-Type` header field ([Section 6.1](#61-media-types)).

A server MUST accept an ACAL Request in at least one of the XACML 4.0, JACAL 1.0 and YACAL 1.0 representations, and MAY accept one in more than one of them ([Section 9.2.2](#922-media-types)). A server that accepts ACAL Requests in a representation SHALL be able to return ACAL Responses in it.

A server MAY additionally accept, in place of an ACAL Request, an `XACMLAuthzDecisionQuery` element in the namespace `urn:oasis:names:tc:xacml:3.0:profile:saml2.0:v2:schema:protocol:wd-14` (a *SAML decision query*) of [[SAML4XACML](#saml4xacml)]. Such a query carries an XACML 3.0 request, not an ACAL Request. A server that accepts it SHALL document the media type that identifies the query in `Content-Type` and the media type of the SAML response, and SHALL identify the SAML response with that documented media type in `Content-Type`. The media type of the query SHALL NOT be one of the media types of [Section 6.1](#61-media-types), and the `version` rules of [Section 6.1](#61-media-types) do not apply to these media types. Except where [Section 5.4.2](#542-status-codes) requires a status code other than 200, the server SHALL process the query as [[SAML4XACML](#saml4xacml)] specifies, and SHALL return the response that [[SAML4XACML](#saml4xacml)] specifies as the content of the HTTP response. The server SHALL NOT answer a SAML decision query with an ACAL Response. The request and response can be correlated by the query's `ID` and the response's `InResponseTo` attributes ([Section 5.4.2](#542-status-codes) gives the status codes).

For an ACAL Request, except where [Section 5.4.2](#542-status-codes) requires a status code other than 200, the server SHALL evaluate the ACAL Request as [[ACAL-Core-1.0](#acal-core-10)] Section 8.15 specifies, and SHALL return the resulting ACAL Response as the content of the HTTP response, in a representation identified by its `Content-Type` header field. A request that asks for several decisions under the ACAL Multiple Decision Profile [[ACAL-Multiple-1.0](#acal-multiple-10)] is one ACAL Request in one `POST` request, and its decisions are returned in one ACAL Response.

### 5.4.2 Status Codes

For a `POST` request to the PDP Resource that the server receives as a complete HTTP message and is able to process, the server SHALL apply the following rules in this order, and SHALL return the status code of the first rule that applies. Errors in the HTTP message itself, and a server failure that prevents this processing (5xx), are handled as [[RFC9110](#rfc9110)] specifies.

1. **401 (Unauthorized)** when the server refuses the request because the client is not authenticated and uses 401 to say so ([Section 8.2](#82-authentication) says that 401 MAY be used, and does not require it). A server whose documented authentication mechanism ([Section 8.2](#82-authentication)) answers such a request in another way, for example with a redirection, SHALL answer it in that way, and SHALL NOT apply the rules below to it.
2. **403 (Forbidden)** when the client is not authorized to ask the PDP for a decision ([Section 8.3](#83-authorization)).
3. **415 (Unsupported Media Type)** ([[RFC9110](#rfc9110)] Section 15.5.16) when any of the following holds:
   - the request has no `Content-Type` header field;
   - its `Content-Type` header field indicates a media type that the server does not accept at the PDP Resource;
   - its `Content-Type` header field indicates one of the media types of [Section 6.1](#61-media-types) with a `version` that the server does not accept;
   - the request has a `Content-Encoding` that the server does not support.
4. **400 (Bad Request)**:
   - for content labelled with a media type of [Section 6.1](#61-media-types), when the content cannot be parsed as the representation that the `Content-Type` header field indicates, is not an ACAL Request (its root is not `Request`), or is not valid against the schema of the representation and version that the request indicates ([Section 6.1](#61-media-types)) with the following constructs set aside: XML Schema assertions (`xs:assert`) and identity constraints (`xs:unique`, `xs:key`, `xs:keyref`), and JSON Schema `uniqueItems`. For the versions this profile defines, the schemas are the XML Schema of [[XACML-Core-4.0](#xacml-core-40)], the JSON Schema of [[JACAL-Core-1.0](#jacal-core-10)] and the structure schema of [[YACAL-Core-1.0](#yacal-core-10)]; every other construct of the schema applies. This includes content that does not match its `Content-Type` ([Section 6.2](#62-content-negotiation)). The constructs set aside, and the rules that a representation specification states outside its schema (Schematron rules, YACAL constraint catalog entries), are not part of this test: content that passes this test but violates one of them is a syntax error in the request, which the server reports as rule 6 specifies. For example, two attributes with the same `(AttributeId, DataType, Issuer)`, which the XML Schema rejects by an assertion and the JACAL and YACAL schemas do not check, yield status code 200 in all three representations;
   - for content labelled with the media type that the server documents for a SAML decision query ([Section 5.4.1](#541-decision-request)), when the content cannot be parsed as XML, its document element is not `XACMLAuthzDecisionQuery` in the namespace `urn:oasis:names:tc:xacml:3.0:profile:saml2.0:v2:schema:protocol:wd-14`, or the query, or the XACML 3.0 request it carries, is not valid against the schemas that [[SAML4XACML](#saml4xacml)] specifies for them. No schema construct is set aside for a SAML decision query. A schema-valid query is processed under rule 6, including one to which [[SAML4XACML](#saml4xacml)] responds with a non-success SAML status.
5. **406 (Not Acceptable)** when the server cannot return the response in a representation that the `Accept` header field allows, and is unwilling to return it in a representation of its choosing as [Section 6.2](#62-content-negotiation) permits ([[RFC9110](#rfc9110)] Section 15.5.7).
6. **200 (OK)** otherwise, with the ACAL Response that results from evaluating the ACAL Request as [[ACAL-Core-1.0](#acal-core-10)] specifies, or, for a SAML decision query, with the response that [[SAML4XACML](#saml4xacml)] specifies. When the content is a valid ACAL Request that [[ACAL-Core-1.0](#acal-core-10)] nevertheless treats as erroneous — for example several `RequestEntity` objects with the same `Category` at a PDP that does not implement [[ACAL-Multiple-1.0](#acal-multiple-10)], which [[ACAL-Core-1.0](#acal-core-10)] Section 7.33 makes a syntax error — the ACAL Response contains the `Result` that [[ACAL-Core-1.0](#acal-core-10)] specifies, with the `Decision` `Indeterminate`. For a syntax error in an ACAL Request that rule 4 leaves to this rule, the ACAL Response contains a `Result` whose `Decision` is `Indeterminate`, with status code `urn:oasis:names:tc:acal:1.0:status:syntax-error`.

The status code reports the outcome of the HTTP exchange, not the authorization decision. Status code 200 does not assert any particular decision: for an ACAL Request, it means that the content is an ACAL Response, each of whose `Result` objects has a `Decision` of `Permit`, `Deny`, `NotApplicable` or `Indeterminate`; for a SAML decision query, it means that the content is the response that [[SAML4XACML](#saml4xacml)] specifies. Likewise, status code 403 does not mean a `Deny` decision: it means that the client is not allowed to ask the PDP for a decision ([Section 8.3](#83-authorization)).

### 5.4.3 Use of POST and Caching

A decision request uses `POST` rather than `GET`, because an ACAL Request may contain sensitive data, which a URI is more likely than message content to expose in logs and histories, and because an ACAL Request may exceed the URI lengths that clients, servers and intermediaries support [[HTTPMethod](#httpmethod)].

The client of a decision request does not request any change of state on the server; in that respect the request has the semantics that [[RFC9110](#rfc9110)] Section 9.2.1 calls safe. `POST` is not a safe method, however, and HTTP caches treat it accordingly: a cached response to a `POST` request is not reused to satisfy a later `POST` request ([[RFC9110](#rfc9110)] Section 9.3.3).

It is RECOMMENDED that a server include the `Cache-Control` header field ([[RFC9111](#rfc9111)] Section 5.2) with the directive `no-store` in every response of the PDP Resource, so that no cache stores a decision ([Section 8.1](#81-network-transport)).

---


# 6 Representations

This section is normative.

## 6.1 Media Types

An ACAL Request or ACAL Response in one of the three representations below SHALL be identified, in the `Content-Type` header field ([[RFC9110](#rfc9110)] Section 8.3), by the media type shown for that representation. The `version` parameter is shown with the value for the version this profile defines:

| Representation | Media type | Specification of the media type |
| :--- | :--- | :--- |
| XACML 4.0 [[XACML-Core-4.0](#xacml-core-40)] | `application/xacml+xml; version=4.0` | [[RFC7061](#rfc7061)]; see [Annex D.3](#d3-the-applicationxacmlxml-media-type) |
| JACAL 1.0 [[JACAL-Core-1.0](#jacal-core-10)] | `application/jacal+json; version=1.0` | [Annex D.1](#d1-the-applicationjacaljson-media-type) |
| YACAL 1.0 [[YACAL-Core-1.0](#yacal-core-10)] | `application/yacal+yaml; version=1.0` | [Annex D.2](#d2-the-applicationyacalyaml-media-type) |

The `version` parameter of each of these media types identifies the version of the representation specification that the content conforms to. A sender SHOULD include it in a `Content-Type` header field. A server that receives content labelled with one of these media types without a `version` parameter SHALL treat the content as the latest version of that representation that the server supports. In an `Accept` header field the parameter MAY be omitted. A parameter name is case-insensitive ([[RFC6838](#rfc6838)] Section 4.3).

An ACAL Request or ACAL Response in another representation, identified by another media type, is outside the scope of this profile.

## 6.2 Content Negotiation

Clients and servers SHOULD use content negotiation ([[RFC9110](#rfc9110)] Section 12) to agree on the representation and version used in their exchanges. A client lists in the `Accept` header field ([[RFC9110](#rfc9110)] Section 12.5.1) the media types, with their `version` parameter, that it accepts for the ACAL Response. Its ACAL Request is identified by `Content-Type` ([Section 6.1](#61-media-types)); a server that does not accept that media type or `version` responds with status code 415 ([Section 5.4.2](#542-status-codes)), and MAY list in an `Accept` header field of that response the media types it accepts ([[RFC9110](#rfc9110)] Section 12.5.1).

Content that does not match the representation that its `Content-Type` header field indicates is an error, whether a client or a server sends it. A server that receives such content in a request MUST respond with status code 400 (Bad Request), as rule 4 of [Section 5.4.2](#542-status-codes) specifies, unless an earlier rule of that section applies. Content that passes rule 4 but violates a construct that rule 4 sets aside, or a rule that its representation specification states outside its schema, does not mismatch its `Content-Type` in this sense (rule 6).

HTTP allows the `Content-Type` of a request and the `Accept` header field of the same request to name different media types, so a client can send an ACAL Request in one representation and ask for the ACAL Response in another. This profile does not define a use case for that, and does not forbid it. A server that is not willing to honor such a request SHOULD either respond with status code 406 (Not Acceptable) or return the ACAL Response in a representation of its choosing; [Section 5.4.2](#542-status-codes) rule 5 applies when it does neither.

## 6.3 Linking

A link to an HTTP resource defined by this profile SHALL use the link relation type that [Section 5.2](#52-link-relations) defines for it. Media types that define a way to express links, such as `application/linkset+json` [[RFC9264](#rfc9264)], let a representation carry its links itself.

Where a link cannot be added to a representation — for instance, because the representation conforms to a schema that does not provide for links, as an ACAL Response does, or because it is binary — the link MUST be sent in the `Link` header field ([[RFC8288](#rfc8288)] Section 3). Where there are several links, the `title` target attribute of the `Link` header field MAY be used to correlate a link with an item in the representation.

## 6.4 Home Resource Representation

A response with status code 200 to a `GET` on the Home Resource MUST give a link to the PDP Resource, and MAY give links to other ACAL-related HTTP resources: in the representation, if its media type can express links, and otherwise in the `Link` header field ([Section 6.3](#63-linking)). This profile does not require a particular media type for the representation. Any media type MAY be used; `application/linkset+json` [[RFC9264](#rfc9264)] is one that can express links.

---


# 7 Examples (non-normative)

The examples use the server `pdp.example.com`. The ACAL Request is the access request of the ACAL RBAC Profile's Section 7.2: a subject holding the `manager` role asks to `read` a timesheet. Evaluated against the policies of that profile's Section 7.1, it yields `Permit`, the decision shown in the responses of [Section 7.1](#71-obtaining-an-access-decision) and [Section 7.2](#72-the-same-exchange-in-xacml-and-yacal).

## 7.1 Obtaining an Access Decision

The client starts at the Home Resource, whose location the server documents ([Section 5.3](#53-home-resource)):

```http
GET /authorization HTTP/1.1
Host: pdp.example.com
Accept: application/linkset+json
```

The server responds with a set of links in the `application/linkset+json` format [[RFC9264](#rfc9264)]. The link to the PDP Resource carries both the ACAL link relation type and the deprecated XACML one ([Section 5.2](#52-link-relations)); in this format each relation type is a separate member naming the same target.

```http
HTTP/1.1 200 OK
Content-Type: application/linkset+json
Cache-Control: max-age=86400

{
  "linkset": [
    {
      "anchor": "https://pdp.example.com/authorization",
      "https://docs.oasis-open.org/acal/ns/relation/pdp": [
        { "href": "https://pdp.example.com/authorization/pdp" }
      ],
      "http://docs.oasis-open.org/xacml/ns/relation/pdp": [
        { "href": "https://pdp.example.com/authorization/pdp" }
      ]
    }
  ]
}
```

The same link could instead be sent in a `Link` header field ([Section 6.3](#63-linking)):

```http
Link: <https://pdp.example.com/authorization/pdp>;
      rel="https://docs.oasis-open.org/acal/ns/relation/pdp http://docs.oasis-open.org/xacml/ns/relation/pdp"
```

The client follows the link with relation type `https://docs.oasis-open.org/acal/ns/relation/pdp` and sends its ACAL Request in JACAL, asking for the ACAL Response in JACAL:

```http
POST /authorization/pdp HTTP/1.1
Host: pdp.example.com
Content-Type: application/jacal+json; version=1.0
Accept: application/jacal+json; version=1.0

{
    "Request": {
        "RequestEntity": [
            {
                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:subject-id",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                      "Value": [ "Alice" ] },
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                      "Value": [ "urn:example:roles:manager" ] }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                      "Value": [ "urn:example:resources:timesheet" ] }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                      "Value": [ "read" ] }
                ]
            }
        ]
    }
}
```

The server evaluates the request and responds with the decision:

```http
HTTP/1.1 200 OK
Content-Type: application/jacal+json; version=1.0
Cache-Control: no-store

{
    "Response": {
        "Result": [
            {
                "Decision": "Permit",
                "Status": {
                    "StatusCode": { "Value": "urn:oasis:names:tc:acal:1.0:status:ok" }
                }
            }
        ]
    }
}
```

## 7.2 The Same Exchange in XACML and YACAL

In XACML 4.0, the decision request and its response are:

```http
POST /authorization/pdp HTTP/1.1
Host: pdp.example.com
Content-Type: application/xacml+xml; version=4.0
Accept: application/xacml+xml; version=4.0

<?xml version="1.0" encoding="UTF-8"?>
<Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:subject:subject-id"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
            <Value>Alice</Value>
        </RequestAttribute>
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>urn:example:roles:manager</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>urn:example:resources:timesheet</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:action">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
            <Value>read</Value>
        </RequestAttribute>
    </RequestEntity>
</Request>
```

```http
HTTP/1.1 200 OK
Content-Type: application/xacml+xml; version=4.0
Cache-Control: no-store

<?xml version="1.0" encoding="UTF-8"?>
<Response xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <Result Decision="Permit">
        <Status>
            <StatusCode Value="urn:oasis:names:tc:acal:1.0:status:ok"/>
        </Status>
    </Result>
</Response>
```

In YACAL 1.0, they are:

```http
POST /authorization/pdp HTTP/1.1
Host: pdp.example.com
Content-Type: application/yacal+yaml; version=1.0
Accept: application/yacal+yaml; version=1.0

Request:
  RequestEntity:
    - Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:subject-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
          Value: [ "Alice" ]
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value: [ "urn:example:roles:manager" ]
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value: [ "urn:example:resources:timesheet" ]
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
          Value: [ "read" ]
```

```http
HTTP/1.1 200 OK
Content-Type: application/yacal+yaml; version=1.0
Cache-Control: no-store

Response:
  Result:
    - Decision: Permit
      Status:
        StatusCode:
          Value: "urn:oasis:names:tc:acal:1.0:status:ok"
```

## 7.3 A Request that Cannot Be Parsed, and a Request that Core Rejects

The content of the following request is not a JSON text (the closing brace of the `Request` object is missing), so the server cannot parse it as JACAL and responds with status code 400, without an ACAL Response ([Section 5.4.2](#542-status-codes)):

```http
POST /authorization/pdp HTTP/1.1
Host: pdp.example.com
Content-Type: application/jacal+json; version=1.0
Accept: application/jacal+json; version=1.0

{ "Request": { "RequestEntity": [ ] }
```

```http
HTTP/1.1 400 Bad Request
Content-Type: text/plain

The request content is not a JSON text.
```

The content of the next request is valid JACAL, but it has two `RequestEntity` objects with the access-subject category, and the PDP does not implement the ACAL Multiple Decision Profile. [[ACAL-Core-1.0](#acal-core-10)] Section 7.33 makes that a syntax error, which the PDP reports in an ACAL Response, so the status code is 200:

```http
POST /authorization/pdp HTTP/1.1
Host: pdp.example.com
Content-Type: application/jacal+json; version=1.0
Accept: application/jacal+json; version=1.0

{
    "Request": {
        "RequestEntity": [
            { "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
              "RequestAttribute": [
                  { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:subject-id",
                    "Value": [ "Alice" ] } ] },
            { "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
              "RequestAttribute": [
                  { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:subject-id",
                    "Value": [ "Bob" ] } ] }
        ]
    }
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/jacal+json; version=1.0
Cache-Control: no-store

{
    "Response": {
        "Result": [
            {
                "Decision": "Indeterminate",
                "Status": {
                    "StatusCode": { "Value": "urn:oasis:names:tc:acal:1.0:status:syntax-error" }
                }
            }
        ]
    }
}
```

---


# 8 Safety, Security, and Data Protection Considerations

Refer to [[ACAL-Core-1.0](#acal-core-10)] Section 10 for the security and privacy considerations of ACAL in general. This section adds the considerations that arise from carrying ACAL Requests and Responses, and SAML decision queries and their responses, over a network, and from the HTTP resources this profile defines.

## 8.1 Network Transport

The use of TLS is RECOMMENDED to protect ACAL Requests and Responses, and SAML decision queries and their responses, as they cross the network ([Section 5.1](#51-network-transport)). An ACAL Request typically describes a subject and what the subject is attempting, and an ACAL Response says what the subject may do; both can be sensitive. [[RFC9325](#rfc9325)] gives recommendations for the secure use of TLS.

A decision response can also be exposed by a cache. A cache does not reuse a response to a `POST` request for a later `POST` request, but it can store a `POST` response that has explicit freshness information and a `Content-Location` header field equal to the request's target URI, and reuse it for a later `GET` or `HEAD` request ([[RFC9110](#rfc9110)] Section 9.3.3). The directive `no-store` ([[RFC9111](#rfc9111)] Section 5.2) tells a cache not to store a response, which is why [Section 5.4.3](#543-use-of-post-and-caching) recommends it for the responses of the PDP Resource.

## 8.2 Authentication

This profile does not specify how the client is authenticated. An implementation MUST document how it handles authentication.

Status code 401 (Unauthorized) MAY be used to indicate that an operation on an HTTP resource of this profile is refused because the client is not authenticated; [[RFC9110](#rfc9110)] Section 15.5.2 requires a server that sends it to include a `WWW-Authenticate` header field.

Basic authentication [[RFC7617](#rfc7617)] MUST NOT be used. Basic authentication sends the password with each request, protected only by the transport; over a connection without TLS, the password is sent in plain text. Digest authentication [[RFC7616](#rfc7616)] MAY be used. Other mechanisms, such as [[OAuth](#oauth)], [[OpenID-Connect](#openid-connect)], [[SAML](#saml)] or [[SASL](#sasl)], MAY be used instead of or in addition to Digest authentication.

## 8.3 Authorization

It is RECOMMENDED that access to the HTTP resources of this profile be authorized using ACAL. An implementation can authorize a request based on the identity of the client, and on any other trusted attribute.

Status code 403 (Forbidden) MUST be used to indicate that an operation on an HTTP resource of this profile is refused because the client is not authorized ([[RFC9110](#rfc9110)] Section 15.5.4). Status code 403 says that the client may not ask the PDP for a decision; it is not a `Deny` decision ([Section 5.4.2](#542-status-codes)).

Authorization SHOULD be used to exclude from a response, in its representation or its `Link` header field, any link to an HTTP resource that the client is not allowed to access.

## 8.4 Integrity and Non-Repudiation

Some deployments need an audit trail of the decisions a PDP made. Such an audit trail needs to be at least tamper-evident. For this purpose, the SAML decision query and response of [[SAML4XACML](#saml4xacml)] ([Section 5.4.1](#541-decision-request)) can be used to sign the request and the response. This profile defines no signature for an ACAL Request or ACAL Response. TLS ([Section 8.1](#81-network-transport)) protects a message in transit only, and does not by itself provide evidence that a third party can verify later.

---


# 9 Conformance

## 9.1 Introduction

This profile defines conformance for a **server**, which offers the HTTP resources of [Section 5](#5-restful-services). A client interoperates with a conforming server by following [Section 5](#5-restful-services) and [Section 6](#6-representations).

## 9.2 Conformance Tables

This section lists the portions of this specification that are relevant to a claim of conformance to this profile. An implementation MUST implement each item marked `M`; support for an item marked `O` is optional.

: Note: "M" means mandatory-to-implement. "O" means optional.

The implementation MUST follow [Section 5](#5-restful-services), [Section 6](#6-representations), [Section 8](#8-safety-security-and-data-protection-considerations) and [Annex C](#annex-c-acal-identifiers) where they apply to implemented items in the following tables.

For an item marked `M` below, an implementation MUST support the ACAL (`urn:oasis:names:tc:acal:1.0:`) form of the identifier. For an item marked `O`, an implementation that implements that item MUST support its ACAL form. An implementation MAY additionally recognize the deprecated XACML 3.0 profile identifier shown beside it in [Section 9.2.1](#921-profile-identifiers) as equivalent to the ACAL one; equality of identifiers is determined after identifier evaluation ([[ACAL-Core-1.0](#acal-core-10)] Section 8.3). A new implementation SHOULD NOT use a deprecated identifier. This is the standard ACAL convention ([[ACAL-Core-1.0](#acal-core-10)] Section 11.2). Media types and link relation types are not identifiers in that sense; [Section 6.1](#61-media-types) and [Section 5.2](#52-link-relations) say how they are compared.

### 9.2.1 Profile Identifiers

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:profile:rest:http | M | urn:oasis:names:tc:xacml:3.0:profile:rest:http |
| urn:oasis:names:tc:acal:1.0:profile:rest:home | O | urn:oasis:names:tc:xacml:3.0:profile:rest:home |
| urn:oasis:names:tc:acal:1.0:profile:rest:pdp | M | urn:oasis:names:tc:xacml:3.0:profile:rest:pdp |

An implementation that supports the functionality identified by a profile identifier SHALL use that identifier to indicate that support.

### 9.2.2 Media Types

A server MUST accept at the PDP Resource an ACAL Request, and be able to return an ACAL Response, in at least one of the following representations, identified by its media type ([Section 6.1](#61-media-types)). Each is marked `O` because no one of them is mandatory; a server that supports a representation MUST do both in that representation.

| Media type | Representation | M/O |
| :--- | :--- | :--- |
| application/xacml+xml; version=4.0 | XACML 4.0 | O |
| application/jacal+json; version=1.0 | JACAL 1.0 | O |
| application/yacal+yaml; version=1.0 | YACAL 1.0 | O |

### 9.2.3 Link Relations

A server that gives a link to the item to which a link relation type points SHALL use that link relation type as [Section 5.2](#52-link-relations) specifies. A server is not required to give a link to the PDP Resource where its location is documented; `M` means that every link to the PDP Resource that a server gives uses the relation type. The deprecated link relation type is not an identifier, and the identifier equality of [[ACAL-Core-1.0](#acal-core-10)] Section 8.18 does not apply to it; [Section 5.2](#52-link-relations) says how a server and a client use it.

| Link relation type | M/O | Deprecated link relation type |
| :--- | :--- | :--- |
| https://docs.oasis-open.org/acal/ns/relation/home | O | http://docs.oasis-open.org/xacml/ns/relation/home |
| https://docs.oasis-open.org/acal/ns/relation/pdp | M | http://docs.oasis-open.org/xacml/ns/relation/pdp |

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

_Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html

###### [ACAL-Multiple-1.0]

_ACAL v1.0 Multiple Decision Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/multiple/v1.0/acal-multiple-v1.0.html

###### [JACAL-Core-1.0]

_JACAL Version 1.0 (JSON Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/jacal/core/v1.0/acal-core-json-v1.0.html

###### [RFC2119]

RFC 2119, *Key Words for Use in RFCs to Indicate Requirement Levels*, BCP 14, RFC 2119, March 1997. [Online]. Available: https://www.rfc-editor.org/info/rfc2119

###### [RFC6838]

Freed, N., Klensin, J., and T. Hansen, *Media Type Specifications and Registration Procedures*, BCP 13, RFC 6838, January 2013. [Online]. Available: https://www.rfc-editor.org/info/rfc6838

###### [RFC6839]

Hansen, T. and A. Melnikov, *Additional Media Type Structured Syntax Suffixes*, RFC 6839, January 2013. [Online]. Available: https://www.rfc-editor.org/info/rfc6839

###### [RFC7061]

Sinnema, R. and E. Wilde, *eXtensible Access Control Markup Language (XACML) XML Media Type*, RFC 7061, November 2013. [Online]. Available: https://www.rfc-editor.org/info/rfc7061

###### [RFC7616]

Shekh-Yusef, R., Ed., Ahrens, D., and S. Bremer, *HTTP Digest Access Authentication*, RFC 7616, September 2015. [Online]. Available: https://www.rfc-editor.org/info/rfc7616

###### [RFC7617]

Reschke, J., *The 'Basic' HTTP Authentication Scheme*, RFC 7617, September 2015. [Online]. Available: https://www.rfc-editor.org/info/rfc7617

###### [RFC8174]

RFC 8174, *Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words*, BCP 14, RFC 8174, May 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8174

###### [RFC8259]

Bray, T., Ed., *The JavaScript Object Notation (JSON) Data Interchange Format*, STD 90, RFC 8259, December 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8259

###### [RFC8288]

Nottingham, M., *Web Linking*, RFC 8288, October 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8288

###### [RFC9110]

Fielding, R., Ed., Nottingham, M., Ed., and J. Reschke, Ed., *HTTP Semantics*, STD 97, RFC 9110, June 2022. [Online]. Available: https://www.rfc-editor.org/info/rfc9110

###### [RFC9111]

Fielding, R., Ed., Nottingham, M., Ed., and J. Reschke, Ed., *HTTP Caching*, STD 98, RFC 9111, June 2022. [Online]. Available: https://www.rfc-editor.org/info/rfc9111

###### [RFC9512]

Polli, R., Wilde, E., and E. Aro, *YAML Media Type*, RFC 9512, February 2024. [Online]. Available: https://www.rfc-editor.org/info/rfc9512

###### [SAML4XACML]

_XACML SAML Profile Version 2.0_. Edited by Erik Rissanen. 19 August 2014. OASIS Committee Specification 02. https://docs.oasis-open.org/xacml/xacml-saml-profile/v2.0/cs02/xacml-saml-profile-v2.0-cs02.html . Latest version: https://docs.oasis-open.org/xacml/xacml-saml-profile/v2.0/xacml-saml-profile-v2.0.html .

###### [XACML-Core-4.0]

_XACML Version 4.0 (eXtensible Access Control Markup Language)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html

###### [YACAL-Core-1.0]

_YACAL Version 1.0 (YAML Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.html

## B.2 Informative References


The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [HTTPMethod]

Jacobs, I., Ed., *URIs, Addressability, and the use of HTTP GET and POST*, W3C TAG Finding, 21 March 2004. [Online]. Available: https://www.w3.org/2001/tag/doc/whenToUseGet.html

###### [OAuth]

Hardt, D., Ed., *The OAuth 2.0 Authorization Framework*, RFC 6749, October 2012. [Online]. Available: https://www.rfc-editor.org/info/rfc6749

###### [OpenID-Connect]

Sakimura, N., Bradley, J., Jones, M., de Medeiros, B., and C. Mortimore, *OpenID Connect Core 1.0*, OpenID Foundation. [Online]. Available: https://openid.net/specs/openid-connect-core-1_0.html

###### [REST]

Fielding, R. T., *Architectural Styles and the Design of Network-based Software Architectures*, Doctoral dissertation, University of California, Irvine, 2000. [Online]. Available: https://www.ics.uci.edu/~fielding/pubs/dissertation/fielding_dissertation.pdf

###### [RFC9112]

Fielding, R., Ed., Nottingham, M., Ed., and J. Reschke, Ed., *HTTP/1.1*, STD 99, RFC 9112, June 2022. [Online]. Available: https://www.rfc-editor.org/info/rfc9112

###### [RFC9113]

Thomson, M., Ed., and C. Benfield, Ed., *HTTP/2*, RFC 9113, June 2022. [Online]. Available: https://www.rfc-editor.org/info/rfc9113

###### [RFC9114]

Bishop, M., Ed., *HTTP/3*, RFC 9114, June 2022. [Online]. Available: https://www.rfc-editor.org/info/rfc9114

###### [RFC9264]

Wilde, E. and H. Van de Sompel, *Linkset: Media Types and a Link Relation Type for Link Sets*, RFC 9264, July 2022. [Online]. Available: https://www.rfc-editor.org/info/rfc9264

###### [RFC9325]

Sheffer, Y., Saint-Andre, P., and T. Fossati, *Recommendations for Secure Use of Transport Layer Security (TLS) and Datagram Transport Layer Security (DTLS)*, BCP 195, RFC 9325, November 2022. [Online]. Available: https://www.rfc-editor.org/info/rfc9325

###### [SAML]

_Assertions and Protocols for the OASIS Security Assertion Markup Language (SAML) V2.0_. OASIS Standard, 15 March 2005. https://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf

###### [SASL]

Melnikov, A., Ed., and K. Zeilenga, Ed., *Simple Authentication and Security Layer (SASL)*, RFC 4422, June 2006. [Online]. Available: https://www.rfc-editor.org/info/rfc4422

###### [XACML-REST]

_XACML REST Profile Version 1.1_. Edited by Rémon Sinnema. 20 June 2019. OASIS Standard. https://docs.oasis-open.org/xacml/xacml-rest/v1.1/os/xacml-rest-v1.1-os.html . Latest version: https://docs.oasis-open.org/xacml/xacml-rest/v1.1/xacml-rest-v1.1.html .

# Annex C ACAL Identifiers


(This annex forms an integral part of this Specification.)

This section defines standard identifiers for commonly used definitions.

## C.1 Profile Identifiers

See [Section 9.2.1](#921-profile-identifiers) for the three profile identifiers this document defines and their deprecated XACML 3.0 equivalents.

## C.2 Link Relation Types

This profile defines the following extension link relation types ([[RFC8288](#rfc8288)] Section 2.1.2), in the namespace `https://docs.oasis-open.org/acal/ns/relation/`:

`https://docs.oasis-open.org/acal/ns/relation/home`

: The link target is the Home Resource ([Section 5.3](#53-home-resource)). Deprecated link relation type: `http://docs.oasis-open.org/xacml/ns/relation/home`.

`https://docs.oasis-open.org/acal/ns/relation/pdp`

: The link target is the PDP Resource ([Section 5.4](#54-pdp-resource)). Deprecated link relation type: `http://docs.oasis-open.org/xacml/ns/relation/pdp`.

---

# Annex D IANA Considerations

(This annex forms an integral part of this Specification.)

This annex gives the information required to register two media types in the standards tree, by OASIS, under the "Specification Required" policy ([[RFC6838](#rfc6838)] Section 3.1), using the template of [[RFC6838](#rfc6838)] Section 5.6. Each type identifies every document of its representation (a policy, a bundle, a request, a response, a short identifier set or a shared variable definition), as the representation specification defines it; this profile uses only requests and responses. This annex also describes how this profile uses the existing `application/xacml+xml` registration.

## D.1 The application/jacal+json Media Type

Type name: application

Subtype name: jacal+json

Required parameters: N/A

Optional parameters: `version`. The version of the JACAL specification that the content conforms to, of the form *x*.*y*, where *x* and *y* are decimal numbers without leading zeros, *x* being positive and *y* non-negative. The only value defined at the time of registration is `1.0`, for [[JACAL-Core-1.0](#jacal-core-10)]. If a client does not specify the parameter in an `Accept` header field, the server is free to return any version.

Encoding considerations: binary; the same as for `application/json` [[RFC8259](#rfc8259)].

Security considerations: Content of this type is an ACAL document (a policy, a bundle, a request, a response, a short identifier set or a shared variable definition) and does not contain executable content. A request or response describes subjects and their access and can be sensitive; a policy determines access and its integrity is important. See [[ACAL-Core-1.0](#acal-core-10)] Section 10 and [[RFC8259](#rfc8259)] Section 12; for requests and responses carried over HTTP, also Section 8 of this document.

Interoperability considerations: The content is a JSON object with a single property, named `Policy`, `Bundle`, `Request`, `Response`, `ShortIdSet` or `SharedVariableDefinition`, as [[JACAL-Core-1.0](#jacal-core-10)] specifies. The same ACAL content can also be represented in XML (`application/xacml+xml`) and YAML (`application/yacal+yaml`).

Published specification: [[JACAL-Core-1.0](#jacal-core-10)], which defines the format. This document carries the registration and specifies the use of the media type in the exchange between a PEP and a PDP.

Applications that use this media type: Policy Enforcement Points, Policy Decision Points and Policy Administration Points that implement ACAL, and applications that exchange ACAL documents, in particular those implementing this profile.

Fragment identifier considerations: N/A. This media type defines no fragment identifier syntax, and none is defined for `application/json`, whose fragment identifier syntax `+json` types follow ([[RFC6839](#rfc6839)] Section 3.1).

Additional information:

- Deprecated alias names for this type: N/A
- Magic number(s): N/A
- File extension(s): N/A
- Macintosh file type code(s): N/A

Person & email address to contact for further information: OASIS TC Administration, tc-admin@oasis-open.org

Intended usage: COMMON

Restrictions on usage: N/A

Author: OASIS ACAL \[XACML\] TC

Change controller: OASIS

Provisional registration? (standards tree only): N/A

## D.2 The application/yacal+yaml Media Type

Type name: application

Subtype name: yacal+yaml

Required parameters: N/A

Optional parameters: `version`. The version of the YACAL specification that the content conforms to, of the form *x*.*y*, where *x* and *y* are decimal numbers without leading zeros, *x* being positive and *y* non-negative. The only value defined at the time of registration is `1.0`, for [[YACAL-Core-1.0](#yacal-core-10)]. If a client does not specify the parameter in an `Accept` header field, the server is free to return any version.

Encoding considerations: binary; the same as for `application/yaml` [[RFC9512](#rfc9512)].

Security considerations: Content of this type is an ACAL document (a policy, a bundle, a request, a response, a short identifier set or a shared variable definition) and does not contain executable content. [[YACAL-Core-1.0](#yacal-core-10)] restricts the YAML features a document may use. A request or response describes subjects and their access and can be sensitive; a policy determines access and its integrity is important. See [[ACAL-Core-1.0](#acal-core-10)] Section 10 and [[RFC9512](#rfc9512)] Section 4; for requests and responses carried over HTTP, also Section 8 of this document.

Interoperability considerations: The content is a YAML document whose root is a mapping with a single key, as [[YACAL-Core-1.0](#yacal-core-10)] specifies. The same ACAL content can also be represented in XML (`application/xacml+xml`) and JSON (`application/jacal+json`).

Published specification: [[YACAL-Core-1.0](#yacal-core-10)], which defines the format. This document carries the registration and specifies the use of the media type in the exchange between a PEP and a PDP.

Applications that use this media type: Policy Enforcement Points, Policy Decision Points and Policy Administration Points that implement ACAL, and applications that exchange ACAL documents, in particular those implementing this profile.

Fragment identifier considerations: N/A. This media type defines no fragment identifier syntax; the fragment identifiers of `application/yaml` do not apply ([[RFC9512](#rfc9512)] Section 2.2).

Additional information:

- Deprecated alias names for this type: N/A
- Magic number(s): N/A
- File extension(s): N/A
- Macintosh file type code(s): N/A

Person & email address to contact for further information: OASIS TC Administration, tc-admin@oasis-open.org

Intended usage: COMMON

Restrictions on usage: N/A

Author: OASIS ACAL \[XACML\] TC

Change controller: OASIS

Provisional registration? (standards tree only): N/A

## D.3 The application/xacml+xml Media Type

The `application/xacml+xml` media type is registered by [[RFC7061](#rfc7061)], whose `version` parameter "indicates the version of the XACML specification", with a range that is "the range of published XACML versions". This profile uses it, with `version=4.0`, for the XACML 4.0 representation [[XACML-Core-4.0](#xacml-core-40)], whose namespace for policies, requests and responses is `urn:oasis:names:tc:xacml:4.0:core:schema`. The registration's `version` range is "the range of published XACML versions", with future identifiers following the OASIS pattern; `4.0` is the identifier this profile uses for [[XACML-Core-4.0](#xacml-core-40)] once that version is published. The registration's interoperability and magic number information lists the namespaces and document elements only up to XACML 3.0, and does not include that namespace or the XACML 4.0 document elements `Bundle`, `ShortIdSet` and `SharedVariableDefinition`. [[RFC7061](#rfc7061)] names OASIS and the XACML TC as change controller, so OASIS can update that information; this document does not.

---

# Annex E How to generate HTML and PDF versions

(This annex does not form an integral part of this Specification and is informational.)

## Online generation

HTML/PDF versions are generated automatically online via GitHub Actions after each update pushed to the main branch of [OASIS ACAL \[XACML\] TC GitHub repository](https://github.com/oasis-tcs/acal-spec/). Go to GitHub Actions on the GitHub repository, then go to the latest workflow run, and, if the run succeeded, the summary should display the links to the generated HTML/PDF documents.

## Offline generation

### Prerequisites

The following tools are required:
- [Pandoc](https://pandoc.org/) **v3.2.1 or later** ( [latest release](https://github.com/jgm/pandoc/releases/latest) );
- [Pandoc-include filter](https://github.com/DCsunset/pandoc-include).

Install them on your system.

Git clone or get a local copy of [OASIS ACAL \[XACML\] TC GitHub repository](https://github.com/oasis-tcs/acal-spec/), open a terminal and **change your working directory to the root directory of your local copy of the repository**.

### CSS stylesheet

The generation command uses the CSS stylesheet file `pandoc/styles/markdown-styles-v1.7.3b.css` (with `-c` argument) based on the [v1.7.3a](https://docs.oasis-open.org/templates/css/markdown-styles-v1.7.3a.css) provided by OASIS.

### HTML generation

Run the following command line to generate the HTML from this markdown file (input file specified as last argument):

```console
$ pandoc/mkdocs.sh --output /tmp acal-rest-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

This document has no `{.numberLines}` code fences, so the `--number-lines` option is not needed.

The publication date is automatically set to the current date by default (using Lua filter `pandoc/meta_vars.lua`). However, you may set a specific date of your choice instead, by adding the argument `--metadata date="My date in the form DD Month YYYY"` at the end of the command.

### PDF generation

For PDF output, add the `--pdf` option as follows:

```console
$ pandoc/mkdocs.sh --pdf --output /tmp acal-rest-v%version%.md
```

The HTML file is generated like the previous command and, in addition, a PDF file is generated with the same name as the input file except the `.md` extension is replaced with `.pdf` in this case.

Beware that **the result PDF - the embedded fonts in particular - may differ depending on the system/machine** where you run this command. Mainly, it depends on which fonts are actually installed on the system, as the HTML-to-PDF converter (Chrome / Chromium in this case) selects available fonts according to the prioritized lists defined by `font-family` properties in the CSS.

**For official TC publications**, add the `--official` argument to avoid this issue and produce a system-independent output:

```console
$ pandoc/mkdocs.sh --pdf --official --output /tmp acal-rest-v%version%.md
```

In this case, the generation will use a public Linux container image (`ghcr.io/oasis-tcs/chrome-headless`) with a fixed installed set of fonts to generate the PDF.

---



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

This profile is ported from _XACML REST Profile Version 1.1_, edited by Rémon Sinnema.


---


# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)

This is the first version of this profile. See [Section 4.2](#42-changes-from-the-previous-version) for the changes relative to its XACML 3.0 predecessor.

## Revision History

Latest revision history can be obtained from [OASIS ACAL \[XACML\] TC's GitHub repository](https://github.com/oasis-tcs/acal-spec/blob/v%version%-%stage_revision%/acal-rest-v%version%-%stage_revision%.md).

<!-- The following centered line represents the end of the document -->
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
