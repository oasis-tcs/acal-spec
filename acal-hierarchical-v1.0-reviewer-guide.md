# ACAL Hierarchical Resource Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL Hierarchical Resource Profile (`acal-hierarchical-v1.0.md`, cited here as [HRP-ACAL]) who knows ACAL but has not necessarily followed the XACML 3.0 Hierarchical Resource Profile or the GitHub history (issues #118, #119, #120) that shaped this port.

It is intended to be useful to:

1. TC reviewers checking this profile against the XACML 3.0 source it ports
2. Implementers deciding whether, and how, to support hierarchical-resource addressing
3. Anyone who remembers the mixed-datatype ancestor-attribute concern that was originally raised against this port, and wants to understand why it is no longer a breaking change

This guide is explanatory and informative. It does not replace [HRP-ACAL] itself, which is the normative document.

---

## What This Profile Adds to ACAL Core

ACAL Core defines a flat resource model: a `RequestEntityType` object carries a `Category` and a set of attributes describing the resource being accessed. Core has nothing to say about a resource's position relative to other resources — whether a document is inside a folder, whether an organizational unit sits beneath another, whether a record is a child of another record.

This profile adds three independently optional ways to say that: a node's location inside an XML document, a node's location expressed as a URI, and a node's ancestors expressed as attributes. All three are ports of the equivalent XACML 3.0 Hierarchical Resource Profile (HRP) schemes; none introduces a new ACAL object type. If you are looking for new UML classes, XSD types, or JSON Schema definitions, you will not find any — this profile is entirely attribute identifiers and normative prose over `RequestEntityType`, the same pattern the ACAL Multiple Decision Profile is expected to follow.

---

## XACML 3.0 to ACAL: Key Changes

### The headline that turned out not to apply

When this port was first analyzed (2026-07-26), the leading concern was a real one: XACML 3.0 HRP §2.3 explicitly permits a node's ancestors to be represented using different data types — "There is no requirement that different nodes use the same XACML datatype or that nodes in the same hierarchy use the same datatype" — but ACAL's `RequestEntityType.RequestAttribute` uniqueness constraint at the time keyed only on `AttributeId`, which made two `resource-ancestor` attributes of different data types unrepresentable. The original analysis proposed narrowing HRP to one data type per ancestor attribute per request as a documented breaking change.

That concern was resolved before this profile was drafted, not by this profile. Issue #120 relaxed the `RequestAttribute`/`Attribute` uniqueness constraint on `RequestEntityType`, `ResultEntityType` and `EntityType` from `isUnique(AttributeId)` to `isUnique(Sequence{AttributeId, DataType, Issuer})` — a fix motivated independently, by a contradiction with ACAL Core's own attribute-designator matching rule (§7.17), and confirmed on the GitHub issue to resolve this profile's blocker as a side effect. **If you remember the mixed-datatype concern from an earlier discussion, it is resolved — no narrowing survives in this profile.** [Section 4.3](acal-hierarchical-v1.0.md#43-changes-from-the-previous-version) and [Section 7.3](acal-hierarchical-v1.0.md#73-nodes-identified-by-ancestor-attributes) of [HRP-ACAL] both say so explicitly, and the latter includes a worked example with two `resource-parent` attributes of different data types coexisting.

**What to check as a reviewer:** confirm `acal-core-v1.0.md` Section 7.33 actually states `isUnique(Sequence{AttributeId, DataType, Issuer})`, not `isUnique(AttributeId)`. If it doesn't, this profile's central claim is false and everything built on it needs to be revisited.

### The published CS02 source has five errata

XACML 3.0 HRP, Committee Specification 02 (18 May 2014), contradicts itself in five places — between its own normative body and its §6 identifier summary, and in two cases the identifiers are simply malformed (a doubled colon, a datatype URN with a stray `http://` prefix glued on). [HRP-ACAL] Section 4.3 lists each and states how it was resolved, rather than silently transcribing the OASIS document's own defects. **What to check:** each resolution's citation is a specific CS02 section number; spot-check at least one against the published document at `https://docs.oasis-open.org/xacml/3.0/hierarchical/v1.0/xacml-3.0-hierarchical-v1.0.html`.

### One scheme was dropped

XACML 3.0 HRP §2.2.1 defines an alternative `xpointer(…)` URI-reference representation for nodes in XML documents. It has no conformance clause in the published document (absent from both §6 and §7) and duplicates the capability of the XML-document scheme this profile does define. It is not ported. If an implementer needs it, it can be added in a later version — see [HRP-ACAL] Section 4.3.

### This version's XML-only constraint is about the resource's content, not the request's serialization

[Section 5.1](acal-hierarchical-v1.0.md#51-nodes-in-xml-documents) (nodes in XML documents) applies only when the resource's `Content.Body` is itself an XML document — a JSON *document* addressed by a node-selecting expression is not supported by this scheme in this version. That is a narrower gap than it first sounds: it does **not** mean the *request carrying* that scheme must be XML. [Section 7.1](acal-hierarchical-v1.0.md#71-nodes-in-xml-documents)'s worked example shows the identical XML-content request in all three of XACML, JACAL and YACAL — only `Content.Body`'s own encoding changes (literal elements, an escaped JSON string, a YAML block scalar), per [[ACAL-Core-1.0](acal-core-v1.0.md#acal-core-10)] Section 5.3.

A JSONPath counterpart (i.e., support for a JSON *content document*) was considered and deliberately deferred — the ACAL JSONPath Profile does not yet define the identifier and conformance apparatus a counterpart would depend on. Concretely, per the ACAL JSONPath Profile's own Reviewer's Guide: no `ContextSelectorId`-equivalent property, no `jsonPathExpression` data type, and consequently 3 of its 4 conformance tables (Data Types, Functions, Attributes) are absent — only its Object Types table exists. Building that out was judged separate work from this profile. This is disclosed, not silent — see [HRP-ACAL] Section 4.3 — and the ACAL Multiple Decision Profile's own XPath-expression scheme is expected to make the same choice for the same reason, so the two profiles stay consistent with each other.

**What to check:** if you are reviewing this profile specifically because you need addressing into a JSON *content document*, that need is not met by this version — but addressing into an XML content document from a JSON or YAML *request* already works today. Confirm you're not conflating the two before raising this as a gap.

### Renames and identifier namespace

Consistent with every other ACAL port: `<Attributes>` → `RequestEntityType`, `<Attribute>` → `RequestAttributeType`, `<Resource>` → gone entirely (it was an XACML 2.0 leftover even in the XACML 3.0 source — see the errata above). All new identifiers use the `urn:oasis:names:tc:acal:1.0:` prefix, with the XACML 3.0 identifiers recorded as deprecated equivalents.

### `content-selector` is defined elsewhere, on purpose

`urn:oasis:names:tc:acal:1.0:content-selector` — the attribute the XML-document scheme uses to name a node within `Content` — is defined in the ACAL XPath Profile, not in this profile, even though XACML 3.0 defines its equivalent in HRP. This is a deliberate inversion: the identifier is consumed by the XPath Profile's `ContextSelectorId` mechanism and isn't specific to hierarchical resources, so ACAL defines it beside the mechanism that consumes it (issue #118, resolved 2026-07-28). This profile references that definition rather than restating it. If you are looking for `content-selector`'s definition inside this document and not finding it, that's expected — follow the cross-reference to the XPath Profile's Annex D.3.

### A function argument order trap

XACML 3.0 HRP §4.3's non-normative policy-authoring example uses `regexp-uri-match`, whose arguments are `(URI, regex)`. ACAL's equivalent, `urn:oasis:names:tc:acal:1.0:function:anyURI-regexp-match`, takes them in the opposite order, `(regex, URI)`, to match ACAL's other `*-regexp-match` functions. This is not new to this profile — it was already true of the ACAL Core function — but it is exactly the kind of thing that bites someone porting an XACML 3.0 HRP policy example verbatim. [HRP-ACAL] Section 6.3 flags it explicitly.

---

## The Three Node-Identity Schemes

| Scheme | Identifies a node by | Ancestor attributes allowed? | Depends on |
|---|---|---|---|
| Nodes in XML Documents ([5.1](acal-hierarchical-v1.0.md#51-nodes-in-xml-documents)) | An XPath expression into `Content` | Not addressed by this scheme | ACAL XPath Profile |
| Nodes Identified by URI ([5.2](acal-hierarchical-v1.0.md#52-nodes-identified-by-uri)) | A fully-resolved hierarchical URI of a path to the node (required); URIs of the node's other paths (optional) | **No** — explicitly forbidden, the URIs already encode position | ACAL Core only |
| Nodes Identified by Ancestor Attributes ([5.3](acal-hierarchical-v1.0.md#53-nodes-identified-by-ancestor-attributes)) | `resource-parent`/`resource-ancestor`/`resource-ancestor-or-self` attributes | Yes — this **is** the scheme | ACAL Core only |

All three are independently optional; an implementation can support any combination, including none, one, or all three. They are not layered on each other — a single request uses exactly one scheme for a given resource, per the "parent and ancestor attributes SHALL NOT be provided" rule in the URI scheme and the general shape of the XACML 3.0 source.

---

## Published Artifact Set

Unlike the XPath and JSONPath Profiles, this profile introduces no new schema files. The complete artifact set for this version is:

- `acal-hierarchical-v1.0.md` — the normative specification (this guide's subject)
- `acal-hierarchical-v1.0-reviewer-guide.md` — this document

There is no profile-specific XSD, JSON Schema, or YAML constraint catalog — the profile's identifiers and rules are enforced the same way ACAL Core's own resource-attribute identifiers are: by convention and by the same `RequestAttribute` uniqueness machinery ACAL Core already provides (issue #120), not by profile-specific schema artifacts.

---

## Worked Example Walkthrough

[HRP-ACAL] Section 7 gives one example per scheme, and each example is now shown in **all three** representations — XACML v4.0 (XML), JACAL v1.0 (JSON), and YACAL v1.0 (YAML) — rather than rotating one format per scheme, following the same "Cross-Language Examples" template used in the ACAL Core Reviewer's Guide. [Section 7.1](acal-hierarchical-v1.0.md#71-nodes-in-xml-documents) (nodes in XML documents) is the one to check first if you're verifying the XML-only-constraint clarification above: its JSON and YAML variants carry the identical `content-selector` attribute and XPath expression, with `Content.Body`'s own encoding changing as usual (literal XML elements, an escaped JSON string, a YAML block scalar) and the `xpathExpression` value's own shape changing too (issue #134): in JACAL/YACAL the value carries a `Namespaces` mapping; in XML the namespace prefixes resolve from ordinary in-scope namespaces (an ancestor `xmlns:md` is fine, unchanged from XACML 3.0). The value also carries its own `XPathVersion` here — in all three representations — because these are bare `RequestEntity` fragments with no `Request` and hence no `XPathRequestDefaults` to default the version from; in a full request it could be omitted.

[Section 7.3](acal-hierarchical-v1.0.md#73-nodes-identified-by-ancestor-attributes) (ancestor attributes) is the one worth reading closely if you want to see the "no narrowing" claim in concrete form, in any of the three formats: a `resource-id` of `"Project Falcon"` — deliberately an opaque `string` name, not a hierarchy-encoding URI, so the example can't be mistaken for one the [Section 5.2](acal-hierarchical-v1.0.md#52-nodes-identified-by-uri) URI scheme could express on its own — whose immediate parent (`resource-parent`) is *separately* represented twice: once as a `string` display name (`"Platform Engineering Team"`) and once as an `anyURI` alias (`acme:org/platform-team`), both sharing the `AttributeId` `urn:oasis:names:tc:acal:1.0:resource:resource-parent`. Under the pre-#120 constraint this would have been an illegal duplicate. Under the current constraint it is two distinct, valid objects, because they differ in `DataType`. A policy that only understands the `anyURI` representation can simply ignore the `string` one.

The same example also shows the case a first draft of this profile got wrong, caught by red-team review: the three `resource-ancestor-or-self` values (the node's own name plus two ancestors, all `string`) are **one** `RequestAttributeType` object with three values in its `Value` bag, not three separate objects. Three separate objects sharing the same `AttributeId`, `DataType` and (absent) `Issuer` would themselves violate Section 7.33's uniqueness rule — the rule that made the mixed-datatype case above legal is the same rule that makes same-datatype repetition illegal *as separate objects*. If you are checking this profile's internal consistency, this is the exact place to look: multiple values of one representation belong in one object's bag; only a genuinely different representation earns a new object.

**What to check:** with three representations per example instead of one, don't assume they're mechanically identical translations — parse and, ideally, schema-validate each independently. All eight JSON blocks across [HRP-ACAL] validate against `acal-core-json-v1.0-schema.json` (with the ACAL XPath Profile's schema extensions enabled, for [Section 7.1](acal-hierarchical-v1.0.md#71-nodes-in-xml-documents)'s `xpathExpression` value); every YAML block is structurally identical to its JACAL counterpart once parsed.

---

## The New Representation Considerations Section

[Section 8](acal-hierarchical-v1.0.md#8-representation-considerations) is new: it states, for XML, JSON and YAML in turn, what each format's own schema tooling actually enforces of the `(AttributeId, DataType, Issuer)` uniqueness rule this profile's ancestor-attribute scheme exercises (the same rule [Section 7.3](acal-hierarchical-v1.0.md#73-nodes-identified-by-ancestor-attributes)'s two `resource-parent` objects above are a live instance of). This is not a new constraint — it is [[ACAL-Core-1.0](acal-core-v1.0.md#acal-core-10)]'s own Section 7.33, applying to attributes this profile happens to define — but this profile is the first place in the document set where the same `AttributeId` legitimately repeats with a different `DataType` in an ordinary, non-degenerate worked example, which is exactly the case JSON Schema and (to a lesser extent) XSD cannot fully enforce on their own.

**What to check:** confirm the section's XSD key name (`RequestEntity_RequestAttribute_AttributeId-DataType-Issuer`) actually exists in `acal-core-xml-v4.0-schema.xsd`, and that the JSON/YAML paragraphs' claims about enforcement gaps match [[ACAL-Core-1.0](acal-core-v1.0.md#acal-core-10)]'s own XML/JSON/YAML representation documents (Sections 5.2.6.3, 5.2.4, and 5.12.2 respectively) rather than restating them loosely. This section makes no new normative claim about *what* must be enforced — only about *how* — so it should not introduce any requirement absent from Core.

---

## Review Guidance for ACAL Reviewers New to This Profile

- **Verify the "no narrowing" claim independently.** Don't take Section 4.3's word for it — check `acal-core-v1.0.md` Section 7.33 directly, and check that the worked example in Section 7.3 would actually validate against that rule. Specifically, check that any multiple ancestors *sharing* a data type and issuer appear as multiple values inside one `RequestAttributeType` object's `Value` bag, not as multiple objects — the same uniqueness rule that permits mixed-datatype ancestors as separate objects forbids same-datatype ancestors from being separate objects.
- **Check the errata resolutions against the published CS02**, not against this profile's own summary of them. The five errata are real defects in an OASIS Committee Specification; this profile's job is to resolve them, and a reviewer's job is to confirm the resolution is faithful to the *intended* meaning (usually the body's spelling, not the contradicting summary section), not just internally consistent.
- **Treat the JSON-content gap as a scope decision, not a defect**, unless you specifically need to address a node inside a *JSON* content document — in which case, say so, since it's tracked as deliberate follow-up work rather than assumed to be complete. Don't confuse it with the request's own serialization, which is unrestricted in every scheme, including [Section 5.1](acal-hierarchical-v1.0.md#51-nodes-in-xml-documents).
- **Confirm cross-references into the ACAL XPath Profile resolve.** This profile takes a normative dependency on `content-selector`'s definition there (Annex D.3) rather than restating it; if that annex ever moves or is renamed, this profile's Section 5.1 breaks silently unless the cross-reference is checked.
- **If you are the one who originally raised the mixed-datatype concern** (or are reviewing on behalf of someone who did): the resolution is real and it is upstream of this profile, in ACAL Core itself via issue #120 — not a local workaround inside this document. This profile carries the XACML 3.0 HRP ancestor-attribute scheme forward genuinely unchanged.
- **Verify all three representations of every example, not just the XML one.** Each of Sections 7.1-7.3 now shows XACML, JACAL and YACAL side by side, and they are the profile's evidence that all three schemes are genuinely representation-agnostic (subject to the JSON-content-document gap above), not XML with a format-agnostic claim attached. Parse each one and, ideally, schema-validate the resulting data structure against `acal-core-json-v1.0-schema.json` — the same schema applies to parsed YAML as to JSON, since YACAL mirrors JACAL's property names exactly, but the YAML text itself must be parsed into that structure first, not fed to a JSON validator as text. Don't just read the examples as prose illustrations.
- **Check the new [Section 8](acal-hierarchical-v1.0.md#8-representation-considerations) states enforcement facts, not new requirements.** It should read as "here is what XSD/JSON Schema/the YAML constraint catalog do and don't catch," cross-referencing ACAL Core's own equivalent statements, not as a place introducing behavior Core doesn't already require.

---

## Bottom Line

This profile ports three independently optional ways to address a node in a hierarchical resource, introduces no new schema artifacts, resolves five published errata in its XACML 3.0 source rather than transcribing them, and — after an earlier analysis had proposed a breaking change to accommodate ACAL's attribute-uniqueness constraint — ends up needing no such change at all, because that constraint was independently corrected first. Every worked example is now shown in all three ACAL representations, and a new Representation Considerations section states what each representation's own schema tooling does and doesn't catch for this profile's ancestor-attribute uniqueness case. The one genuine, disclosed gap in this version is addressing into a *JSON content document*, deferred pending further work on the ACAL JSONPath Profile — a narrower gap than "JSON support" might suggest, since JSON and YAML requests already work today wherever the resource's own content is XML.
