# ACAL REST Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL REST Profile (`acal-rest-v1.0.md`, cited here as [REST-ACAL]) who knows ACAL but has not necessarily followed the XACML REST Profile or the analysis that shaped this port.

It is intended to be useful to:

1. TC reviewers checking this profile against the XACML REST Profile Version 1.1 it ports
2. Implementers of a PEP or PDP who need the two to interoperate over HTTP
3. Anyone who wants to know which of the profile's choices are new, and why

This guide is explanatory and informative. It does not replace [REST-ACAL] itself, which is the normative document.

---

## What This Profile Adds to ACAL Core

ACAL Core defines what a PDP decides and what a request and a response contain. It says nothing about how a request reaches a PDP. [REST-ACAL] fills that gap for HTTP, and only for the PEP-to-PDP exchange. It defines:

- **two HTTP resources**: an optional *Home Resource*, from which a client discovers the PDP, and the *PDP Resource*, to which a client `POST`s an ACAL Request and from which it receives an ACAL Response;
- **two link relation types**, by which a client finds those resources;
- **one media type per ACAL representation**, so that client and server can say which representation they send and accept;
- **the meaning of the HTTP status codes**, and in particular what they do *not* mean: 200 is not `Permit`, and 403 is not `Deny`.

There are no new object types, no new UML classes and no new schema artifacts. The content of every request and response is an unchanged `RequestType` or `ResponseType` object in XACML 4.0, JACAL or YACAL, except under the optional SAML decision query carried forward from the source (below).

---

## XACML REST Profile to ACAL: Key Changes

The source is _XACML REST Profile Version 1.1_, **OASIS Standard, 20 June 2019**, which superseded the Version 1.0 Committee Specification. [REST-ACAL] §4.2 lists the changes; this section explains the ones a reviewer is most likely to want to check.

### Media types: one per representation, two of them new

The XACML profile names no media type of its own: it says requests and responses SHOULD use media types registered for XACML. At the time, there was one, `application/xacml+xml` (RFC 7061). ACAL has three representations, and only one of them has a registered type:

| Representation | Media type | Status |
|---|---|---|
| XACML 4.0 | `application/xacml+xml; version=4.0` | Registered (RFC 7061). Its `version` parameter covers "the range of published XACML versions". |
| JACAL 1.0 | `application/jacal+json; version=1.0` | **New.** Registration template in [REST-ACAL] Annex D.1. |
| YACAL 1.0 | `application/yacal+yaml; version=1.0` | **New.** Registration template in [REST-ACAL] Annex D.2. |

**Why not reuse an existing type?** The only JSON type in the IANA registry for XACML is `application/vnd.xacml+json`, a vendor-tree registration for the JSON Profile of XACML 3.0. That is a different format from JACAL, and its `version` parameter is the XACML version. (The JSON Profile of XACML itself specifies `application/xacml+json`, but no such type is in the IANA registry.) No YAML type for XACML or ACAL exists. RFC 9512 (2024) registered the `+yaml` structured syntax suffix, so a `+yaml` type can now be registered.

**Who registers them?** OASIS, in the IANA standards tree, under the "Specification Required" policy of RFC 6838 §3.1. OASIS has done this before (`stix+json`, `taxii+json`, `sarif+json`). OASIS files them once the templates are final and the addresses they cite are live, that is, once the package is published; this is an action for OASIS TC Administration, not for this document.

**What to check:** that each template in Annex D follows the RFC 6838 §5.6 field list; that "Encoding considerations: binary" matches `application/json` (RFC 8259) and `application/yaml` (RFC 9512); and that the fragment identifier fields say what RFC 6839 and RFC 9512 require for `+json` and `+yaml` types.

### No representation is mandatory

The source says a server "MUST support `<Request>` from XACML core", while its §2.3 already pointed to other registered representations, such as the JSON Profile of XACML. [REST-ACAL] §9.2.2 requires a server to support at least one of XACML 4.0, JACAL and YACAL, and none in particular, because the three are representations of one ACAL model. The cost is that a conforming server and a client that follows the profile need not share a representation: a JACAL-only client cannot talk to an XACML-only server. The profile does not require a server to disclose what it accepts; a client can learn it from the server's documentation, or from an `Accept` header field that the server MAY send with a 415, and otherwise has to know it in advance. The profile defines no client conformance class.

### New link relation types, old ones still usable

The source's link relation types are `http://docs.oasis-open.org/xacml/ns/relation/home` and `…/pdp`. [REST-ACAL] §5.2 defines `https://docs.oasis-open.org/acal/ns/relation/home` and `…/pdp`, in the base namespace pattern of the OASIS Naming Directives (`https://docs.oasis-open.org/[tc-shortname]/ns/…`). The Directives say the name "should incorporate a versioning subcomponent"; this one deliberately has none, because a client compares a link relation type as a literal string, and a version in it would break clients at every revision (the XACML names had none either).

A link relation type is a string that the client compares, not an ACAL identifier. RFC 8288 §2.1.2 compares extension relation types as strings, case-insensitively, so the `http` and `https` forms are different relation types, and the identifier equality of ACAL Core §8.18 does not apply. Without a transition rule, a deployed client of the XACML profile would no longer find the PDP. [REST-ACAL] §5.2 therefore lets a server give a link both relation types (RFC 8288 §3.3: one `rel` parameter can hold several), and asks a client to recognize both.

**What to check:** the namespace `https://docs.oasis-open.org/acal/ns/relation/` needs a namespace document, which OASIS TC Administration sets up when the profile is published.

### The *entry point* is now the *Home Resource*

ACAL Core already uses *entry point* for something else: the policy a `BundleType` object's `PolicyReference` names (Core §7.48, §8.13), and the ACAL RBAC Profile's §5.3.5 is "The PDP Entry Point". Keeping the source's term would have given *entry point* two meanings in one specification family. The new name matches the source's own identifiers (`…:rest:home`, `…/relation/home`). The requirements are the same as the source's, apart from the link relation type.

### The SAML decision query is carried forward

The source lets a server accept a SAML `XACMLAuthzDecisionQuery`, and points its non-repudiation section at the SAML profile of XACML. No ACAL version of that profile is part of this work, and the XACML 3.0 one remains valid, so [REST-ACAL] keeps both by reference to it, at its current stage: _XACML SAML Profile Version 2.0_, Committee Specification 02 (2014). The source cites its 2010 Committee Specification 01.

**What to check:** the query carries an XACML 3.0 request (namespace `urn:oasis:names:tc:xacml:3.0:core:schema:wd-17`), not an ACAL Request. A server that offers the option therefore processes XACML 3.0 content for it, as that profile specifies; the option is a MAY and has no conformance table entry, as in the source. A server that offers it documents the media types of the query and of the SAML response. The status codes of §5.4.2 apply to it, with its own 400 test: the content does not parse, its document element is not `XACMLAuthzDecisionQuery` in the namespace `urn:oasis:names:tc:xacml:3.0:profile:saml2.0:v2:schema:protocol:wd-14`, or it is not valid against the SAML profile's schemas, with no schema construct set aside. The query's media type is not one of the three ACAL media types, and the ACAL `version` rules do not apply to it.

### An invalid request: 400 or 200?

This is the change most likely to matter to implementers. The source's test assertion `pdp:xacml:invalid` says an invalid request gets 400, but no sentence in the source's body says so: the body requires 400 only when the content does not match its `Content-Type`. ACAL Core, meanwhile, makes some valid requests syntax errors (Core §7.33), returns `Indeterminate` when the PDP cannot make a decision (Core §8.15), and says the `syntax-error` status may represent a problem with the request context (Core §7.44). The two can disagree about the same request.

[REST-ACAL] §5.4.2 settles it by where the request fails:

| The content … | Status | Content of the response |
|---|---|---|
| has no `Content-Type`; has a media type the server does not accept; has one of the profile's media types with a `version` the server does not accept; or has an unsupported `Content-Encoding` | 415 | Not specified by the profile |
| cannot be parsed as the indicated representation, has a root other than `Request`, or fails its schema (the XACML 4.0 XML Schema, the JACAL JSON Schema, or the YACAL structure schema) with assertions, identity constraints and `uniqueItems` set aside | 400 | Not specified by the profile |
| is a valid ACAL Request that ACAL Core treats as erroneous (for example, two `RequestEntity` objects with the same `Category` at a PDP without the Multiple Decision Profile, Core §7.33) | 200 | An ACAL Response whose `Result` has the `Decision` `Indeterminate` |

The profile draws the line by schema construct, so that it can be tested mechanically: the 400 test is the representation's schema with its assertions (`xs:assert`), identity constraints (`xs:unique`, `xs:key`, `xs:keyref`) and `uniqueItems` set aside. Those constructs, and the rules the representations state outside their schemas (Schematron, the YACAL constraint catalog), are where the representations encode ACAL Core rules unevenly: two attributes with the same `(AttributeId, DataType, Issuer)` fail an XSD 1.1 assertion, but pass the JACAL JSON Schema, which leaves that check "outside JSON Schema validation", and the YACAL structure schema. With the constructs set aside, that request gets 200 with a `syntax-error` Result in all three. This was executed against the three schemas, together with an unknown-property case that gets 400 in all three. It is not a guarantee for every rule: a rule that one schema encodes by an assertion (for example a `count(x) le 1` cardinality check) and another by `maxItems` falls on different sides of the line. Authentication and authorization (401, 403) are checked before either, and §5.4.2 gives the full order. [REST-ACAL] §7.3 shows a 400 and a 200.

### The test assertions are folded into the body

The source carries eleven test assertions in the OASIS Test Assertions Model. No other ACAL specification does. Three (`http:client`, `http:server`, `home:documentation`) restate body requirements; five (`pdp:xacml:status`, `pdp:xacml:body` and the three `pdp:saml:*`) had no body sentence, and the body now states them; and three disagreed with the body:

- `home:pdp` said SHOULD link to the PDP, and the body says MUST. MUST is kept.
- `home:status` required 200 with no body sentence behind it. It is not carried.
- `pdp:xacml:invalid` is replaced by the split above.

### Two explanations corrected

- The source says a PEP using `<Request>` "must either use a new TCP/IP session, or wait" for the previous response. That is true of HTTP/1.1 without pipelining, but not of HTTP/2 or HTTP/3, so the sentence is removed.
- The source says the decision `POST` "is both idempotent and safe" and that cache control headers "make this explicit". RFC 9110 §9.3.3 calls `POST` "potentially unsafe" and says that a cached `POST` response cannot satisfy a later `POST`, so `Cache-Control` does not make the operation safe. The source also calls it idempotent, which RFC 9110 §9.2.2 does not say of `POST`. Both claims are dropped. [REST-ACAL] §5.4.3 keeps the RECOMMENDED `Cache-Control` header field, now with `no-store`, and §8.1 explains why: a `POST` response with explicit freshness and a matching `Content-Location` can be reused for a later `GET` (RFC 9110 §9.3.3).

### Kept on purpose

- **Basic authentication MUST NOT be used, even over TLS.** The requirement is carried unchanged from the source: a limitation of the previous version carries forward. The exposure is described accurately: Basic sends the password protected only by the transport, so in plain text without TLS.
- **TLS is RECOMMENDED, not required**, as in the source.
- **The Home Resource is optional**, and its representation format is not prescribed. The example uses `application/linkset+json` (RFC 9264) in place of the source's XML home document, an Internet-Draft that has expired.

### Identifier respellings

Per [REST-ACAL] §9.2, an implementation MUST support the `urn:oasis:names:tc:acal:1.0:` form of an item it implements, and MAY recognize the deprecated XACML 3.0 identifier as equivalent.

| Purpose | ACAL | Deprecated (XACML) |
|---|---|---|
| HTTP transport | `urn:oasis:names:tc:acal:1.0:profile:rest:http` | `urn:oasis:names:tc:xacml:3.0:profile:rest:http` |
| Home Resource | `urn:oasis:names:tc:acal:1.0:profile:rest:home` | `urn:oasis:names:tc:xacml:3.0:profile:rest:home` |
| PDP Resource | `urn:oasis:names:tc:acal:1.0:profile:rest:pdp` | `urn:oasis:names:tc:xacml:3.0:profile:rest:pdp` |
| Link to the Home Resource | `https://docs.oasis-open.org/acal/ns/relation/home` | `http://docs.oasis-open.org/xacml/ns/relation/home` (a string, not an identifier; see §5.2) |
| Link to the PDP Resource | `https://docs.oasis-open.org/acal/ns/relation/pdp` | `http://docs.oasis-open.org/xacml/ns/relation/pdp` (a string, not an identifier; see §5.2) |

### References brought up to date

The source cites the 2014 HTTP RFCs (7230, 7231, 7234, 7235), which RFC 9110, 9111 and 9112 obsoleted in 2022, and RFC 5988, which RFC 8288 obsoleted. Its `[WebLink]` entry is labelled "RFC 4287", which is Atom, but titled and linked as RFC 5988. [REST-ACAL] cites the current documents throughout, by section.

---

## For Implementers

### A PEP (client)

1. Find the PDP Resource: use the documented URL, or `GET` the Home Resource and follow the link whose relation type is `https://docs.oasis-open.org/acal/ns/relation/pdp`. To interoperate with servers of the XACML profile, also accept `http://docs.oasis-open.org/xacml/ns/relation/pdp`.
2. `POST` one ACAL Request, with `Content-Type` set to the representation's media type, including `version` (RECOMMENDED; a server reads a missing `version` as the latest it supports), and an `Accept` header field listing what you can read.
3. On 200, read the `Decision` from the ACAL Response (or, for the SAML option, from the XACML response in the SAML response). **Do not treat 200 as `Permit`.** A 400 under §5.4.2 means that the content could not be parsed as the representation you named, was not a `Request`, or failed its schema with the constructs listed in §5.4.2 rule 4 set aside; for a SAML query, that it did not parse, was not `XACMLAuthzDecisionQuery` in the SAML profile's XACML 3.0 protocol namespace, or failed the SAML profile's schemas (HTTP also uses 400 for malformed messages). On 415, the request had no `Content-Type`, or the server does not accept its media type, its `version` or its `Content-Encoding`. On 403, you may not ask this PDP.

### A PDP (server)

1. Accept at least one of XACML 4.0, JACAL and YACAL at the PDP Resource, and be able to answer in each one you accept. The profile does not require you to document which, but doing so helps clients choose; consider also listing them in an `Accept` header field on a 415.
2. Apply §5.4.2 in order: 401; 403; 415 for a missing `Content-Type`, a media type or `version` you do not accept, or an unsupported `Content-Encoding` (for one of the three ACAL media types, read a missing `version` as the latest you support; the ACAL `version` rules do not apply to the SAML media types); 400 for content that does not parse, is not a `Request`, or fails its schema with assertions, identity constraints and `uniqueItems` set aside (for a SAML query: does not parse, is not `XACMLAuthzDecisionQuery` in `urn:oasis:names:tc:xacml:3.0:profile:saml2.0:v2:schema:protocol:wd-14`, or fails the SAML profile's schemas, nothing set aside); 406 if you cannot answer in a representation the client accepts and are unwilling, as §6.2 allows, to answer in one of your choosing. Answer a request you evaluate with 200 and the ACAL Response that ACAL Core specifies, including an `Indeterminate` decision; answer a SAML query with 200 and the response the SAML profile specifies, labelled with its documented media type, and never with an ACAL Response. If you accept SAML queries, document the media types of the query and of the response, and do not use an ACAL media type for the query. Send `Cache-Control: no-store` on PDP responses (RECOMMENDED).
3. Document the Home Resource's location if you offer one, and document how clients authenticate. Do not use Basic authentication.

---

## Summary

| Area | Change |
|---|---|
| Object types and schemas | None. Requests and responses are unchanged ACAL Core objects. |
| Media types | One per representation; a server supports at least one, none mandatory. `application/jacal+json` and `application/yacal+yaml` are new and need IANA registration by OASIS. |
| Link relation types | New `https://docs.oasis-open.org/acal/ns/relation/*`, unversioned on purpose. The XACML ones stay usable. They need an OASIS namespace document. |
| Terminology | *Entry point* becomes *Home Resource*. |
| SAML | The `XACMLAuthzDecisionQuery` option and the non-repudiation pointer are carried forward, by reference to the XACML SAML Profile Version 2.0 CS02 (XACML 3.0 content). |
| Invalid requests | 415 for a missing `Content-Type`, or an unaccepted media type, `version` or `Content-Encoding`; 400 for ACAL content that does not parse, is not a `Request`, or fails its schema with assertions, identity constraints and `uniqueItems` set aside, or for a SAML query that fails the SAML 400 test; otherwise 200 with the ACAL Response that ACAL Core specifies (`syntax-error` for what rule 4 sets aside), or the SAML response for the SAML option. |
| Test assertions | Folded into the body; three source contradictions resolved in favour of the body. |
| References | HTTP RFCs 9110/9111/9112, RFC 8288, RFC 7616/7617, RFC 9264, RFC 9325. |
