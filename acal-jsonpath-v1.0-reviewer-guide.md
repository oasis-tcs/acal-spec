# ACAL JSONPath Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL JSONPath Profile (`acal-jsonpath-v1.0.md`, cited here as [JSONPath-ACAL]) who knows ACAL but has not necessarily worked with JSONPath (RFC 9535), or who is comparing this profile against the more complete ACAL XPath Profile and wants to understand where the two genuinely diverge in scope rather than just in path language.

It is intended to be useful to:

1. TC reviewers checking this profile for completeness against the pattern the XPath Profile establishes
2. Implementers deciding whether, and how, to support JSONPath-based attribute extraction from JSON `Content`
3. Anyone who read the ACAL Hierarchical Resource Profile's or Multiple Decision Profile's disclosed "no JSON-content counterpart yet" gap and wants to understand exactly what is, and is not, available in this profile to build that counterpart on

This guide is explanatory and informative. It does not replace [JSONPath-ACAL] itself, which is the normative document.

---

## What This Profile Adds to ACAL Core — and What It Doesn't

Like the XPath Profile, this profile makes ACAL Core's abstract `AttributeSelectorType`/`EntityAttributeSelectorType` concrete — this time for JSON `Content`, using JSONPath ([RFC 9535](acal-jsonpath-v1.0.md#rfc9535)) expressions. It defines `JSONPathAttributeSelectorType` and `JSONPathEntityAttributeSelectorType` ([Section 5.2](acal-jsonpath-v1.0.md#acal-extensions)) and a full attribute-selector evaluation model ([Section 6](acal-jsonpath-v1.0.md#attribute-selector-evaluation)) that converts a JSONPath nodelist into ACAL values, data type by data type.

That is where the parallel with the XPath Profile ends. **This profile is substantially smaller in scope than the XPath Profile it is nominally the JSON counterpart to**, and the gap is not cosmetic:

- **No `ContextSelectorId` property, and no `Namespaces` property.** `JSONPathAttributeSelectorType` and `JSONPathEntityAttributeSelectorType` add nothing to their Core supertypes at all — compare the UML in [Section 5.2.1](acal-jsonpath-v1.0.md#attributeselectortype-extension---jsonpathattributeselectortype) against the XPath Profile's equivalent, which adds `ContextSelectorId` and (in JACAL/YACAL, as of issue #134) an optional `Namespaces` property carrying the selector's own namespace-prefix bindings. There is no `content-selector`-equivalent mechanism for JSON content, and no way to select a sub-node of a JSON document as the context for a further JSONPath expression the way the XPath Profile's `ContextSelectorId` does for XML — and, since JSON has no namespace concept at all, no analog to `Namespaces` is meaningful here either.
- **No defaults types.** The XPath Profile's `XPathPolicyDefaultsType` and `XPathRequestDefaultsType` (each pinning a default XPath version — for selectors, and for `xpathExpression` values that do not carry their own) have no counterpart here. JSONPath's RFC 9535 is a single fixed standard with no version to select, so this may be a legitimate difference rather than an oversight — but it means there is no place in this profile's model to pin *which* JSONPath dialect or extension functions an implementation may rely on, if that ever becomes necessary.
- **No `jsonPathExpression` data type.** The XPath Profile defines `xpathExpression` as a first-class ACAL data type ([Annex C.2.1](acal-xpath-v1.0.md#c21-xpath-expression) of that profile) so an XPath expression can itself be carried as an attribute value — which is exactly how `content-selector` works. This profile defines no equivalent, which is consistent with having no `ContextSelectorId`/`content-selector` mechanism to carry a value for in the first place — but it also forecloses building one without a follow-on version of this profile.
- **No worked examples anywhere.** The XPath Profile's Section 4.4 (medical-record document, request context, three rules, in both XML and JSON) has no counterpart in this profile at all — [Section 4](acal-jsonpath-v1.0.md#introduction-non-normative) stops after "Changes From the Previous Version." There is no example JSONPath policy, request, or JSON document anywhere in this document.
- **A thinner Conformance section — consistently, not just incompletely.** [Section 8.2](acal-jsonpath-v1.0.md#conformance-tables) has only an Object Types table (`JSONPathAttributeSelectorType`, `JSONPathEntityAttributeSelectorType`); the XPath Profile's equivalent section additionally has Data Types, Functions, and Attributes tables. That asymmetry is consistent with the scope gaps above, not a separate omission: the XPath Profile's Data Types table lists `xpathExpression`, a data type *that profile itself defines* ([Annex C.2.1](acal-xpath-v1.0.md#c21-xpath-expression) of that profile); this profile defines no data type of its own — its evaluation model ([Section 6](acal-jsonpath-v1.0.md#attribute-selector-evaluation)) only converts JSONPath results into ACAL Core's *pre-existing* data types (string, integer, boolean, and so on), which have nothing to newly conform to here. The missing Functions and Attributes tables follow the same logic: no new functions, no `content-selector`-equivalent attribute, nothing to table.

**What to check as a reviewer:** none of this is necessarily wrong — RFC 9535 genuinely doesn't need a version-defaults type the way XPath's 2.0/3.0/3.1 split does, and JSON genuinely has no namespace problem to solve. But the *absence of a worked example* and the *absence of any selector-scoping mechanism* are not explained anywhere in the document as deliberate scope decisions, the way, for instance, the Hierarchical Resource Profile explains its XML-only scoping. If you are reviewing this profile for completeness, treat these as open questions to raise, not confirmed non-issues.

---

## A Cross-Reference Bug Found (and Fixed) While Writing This Guide

[Section 8.2](acal-jsonpath-v1.0.md#conformance-tables)'s conformance introduction used to say the implementation MUST follow "Annex D" for identifiers — but the link target and the actual content (a single namespace identifier) is [Annex C](acal-jsonpath-v1.0.md#annex-c-acal-identifiers) ("ACAL Identifiers"); Annex D in this document is "How to generate HTML and PDF Versions," an unrelated build-instructions annex. This read as a copy-paste artifact from the XPath Profile, where "ACAL Identifiers" genuinely is Annex D (that document has an extra Annex C, for Data Types and Functions, that this one doesn't). It has been corrected to cite Annex C. **What to check:** confirm the correction is still in place — a normative MUST-clause pointing at the wrong section, even one this easy to resolve from context, is worth catching in review.

---

## Published Artifact Set

- `acal-jsonpath-v1.0.md` — the normative specification (this guide's subject)
- `acal-jsonpath-v1.0-reviewer-guide.md` — this document
- `acal-jsonpath-xml-v4.0-schema.xsd`, `acal-jsonpath-json-v1.0-schema.json`, `acal-jsonpath-yaml-v1.0-structure.schema.yaml` — schema for `JSONPathAttributeSelectorType`/`JSONPathEntityAttributeSelectorType` in each representation

**Unlike the XPath Profile, there are no identifier reference artifacts** (`acal-jsonpath-*-identifiers.*`) — because, per [Annex C](acal-jsonpath-v1.0.md#annex-c-acal-identifiers) above, this profile defines exactly one identifier (its own namespace URI) and nothing else worth enumerating in a separate file.

---

## Review Guidance for ACAL Reviewers New to This Profile

- **Don't assume this profile mirrors the XPath Profile's scope just because it mirrors its structure.** Section numbers and section titles line up closely between the two documents, which makes it easy to skim this profile and assume it has everything the XPath Profile has, just for JSON. It does not — see the gaps above.
- **Ask, don't assume, whether the missing context-scoping mechanism is deliberate.** If a future profile (or a future version of this one) needs to select a sub-node of a JSON document as a further JSONPath evaluation context — the JSON equivalent of the XML-document scheme's `content-selector` — this profile's current model has nowhere to put that.
- **Verify the Annex D/Annex C conformance cross-reference fix is still in place** (see above) — it is small, but it is exactly the kind of defect that's easy to wave through in review because the intended meaning is obvious from context.
- **Don't expect a worked example to check syntax against.** Any correctness check of this profile's `JSONPathAttributeSelectorType` usage has to be done directly against the schema files and Section 6's evaluation model, since there is no example in the specification itself to compare against.
- **If you are the one who will eventually build the JSON-content counterpart to HRP's XML-document scheme or MDP's XPath-expression scheme**, read this profile's gaps list first — the missing context-selector mechanism is very likely the first piece of missing infrastructure you will need, matching what those two profiles' own Reviewer's Guides already flag as a known dependency.

---

## Bottom Line

This profile makes ACAL Core's attribute-selector mechanism concrete for JSON `Content`, using JSONPath (RFC 9535), and does that part correctly and completely. But it is a substantially thinner profile than its XPath counterpart: no context-selector mechanism, no expression data type, no defaults type, no worked examples, and a conformance section missing tables its sibling profile has. This is very likely why the Hierarchical Resource Profile and Multiple Decision Profile both deliberately deferred their JSON-content schemes rather than building on this profile as-is — the infrastructure those schemes would need (an equivalent of `content-selector` and `xpathExpression`) does not exist here yet. One real defect, unrelated to scope, was found and fixed while writing this guide: Section 8.2's conformance clause cited "Annex D" when it meant Annex C.
