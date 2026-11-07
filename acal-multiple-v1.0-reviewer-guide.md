# ACAL Multiple Decision Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL Multiple Decision Profile (`acal-multiple-v1.0.md`, cited here as [MDP-ACAL]) who knows ACAL but hasn't necessarily followed the XACML 3.0 Multiple Decision Profile, issue #59's history, or how this profile relates to the Hierarchical Resource Profile it was blocked behind.

It is intended to be useful to:

1. TC reviewers checking this profile against the XACML 3.0 source it ports
2. Implementers deciding whether, and how, to support multiple-decision requests
3. Anyone reviewing issue #59 who wants to understand why the actual scope is bigger than the issue's own title suggests

This guide is explanatory and informative. It does not replace [MDP-ACAL] itself, which is the normative document.

---

## What This Profile Adds to ACAL Core

ACAL Core already carries the *syntax* this profile gives *meaning* to. `RequestType.MultiRequests`, `RequestReferenceType`, and the rule that repeated `RequestEntityType` categories are a syntax error "unless the PDP implements the multiple decision profile" all already exist in `acal-core-v1.0.md` — this profile is what makes those structures actually mean something, plus two schemes (`scope`, XPath-expression) that expand a single request into several without any special request structure at all. Like the Hierarchical Resource Profile, this profile introduces no new object types — it's entirely attribute identifiers and normative prose over structures Core already defines.

---

## Issue #59 Understated Its Own Scope

The issue as filed names two renames (`Attributes`→`RequestCategory`, `AttributesReference`→`RequestCategoryReference`) as the reason this profile needs updating. Neither name is even right — the actual rename produced `RequestEntity`/`RequestEntityReference`, and a later issue (#101) changed the reference's shape again, removing its `Id` property entirely so the reference *is* a bare value now. But the deeper issue is that **those renames only touch one of this profile's five schemes** (reference, [Section 5.4](acal-multiple-v1.0.md#54-reference)). The other four — repeated categories, combined decision, scope, and XPath expression — all need rework for reasons the issue doesn't mention at all: the `RequestEntity` rename generally, the `Notice` merge (issue #6) rewriting the combined-decision rules, and a normative dependency on the Hierarchical Resource Profile for two of the five schemes.

**What to check as a reviewer**: don't review this PR against issue #59's stated scope — review it against [Section 4.2](acal-multiple-v1.0.md#42-changes-from-the-previous-version)'s actual accounting, which is considerably longer.

---

## The Dependency on HRP, and Why It Doesn't Show Up as a Diff Against HRP's Content

Two of this profile's five schemes needed the Hierarchical Resource Profile (#119) before they could be drafted:

- **`scope`**'s `Children`/`Descendants` values need a definition of what a child or descendant *is*. This profile defines `Child`/`Descendant` itself ([Section 2.1.2](acal-multiple-v1.0.md#212-terms-defined-in-this-document)), but builds them directly on top of HRP's `Node`/`Hierarchy`/`Ancestor` vocabulary ([Section 2.1.2](acal-hierarchical-v1.0.md#212-terms-defined-in-this-document) of that document) rather than duplicating it.
- **XPath expression**'s attribute rewriting depends on the plain `content-selector` identifier, which — since issue #118 — is actually defined in the ACAL XPath Profile, not in HRP itself. HRP references it the same way this profile does. Neither profile redefines it.

**What to check**: this profile does not *modify* HRP or the XPath Profile — it only references terms and identifiers those documents already define. If you're checking whether this profile genuinely needed HRP drafted first, the answer is yes for `scope`'s vocabulary, but the dependency is conceptual (borrowed terms), not a shared code path that could drift silently.

---

## This Version's XML-Only Constraint Is About Content, Not the Request — Same Reasoning as HRP

[Section 5.2](acal-multiple-v1.0.md#52-nodes-identified-by-xpath-expression) (XPath expression) only applies when the resource's `Content` is itself an XML document, for the identical reason HRP's XML-document scheme is scoped that way: the ACAL JSONPath Profile doesn't yet have the identifier/conformance infrastructure a JSON-*content* counterpart would need. This is the same decision, made the same way, disclosed the same way — see [Section 4.2](acal-multiple-v1.0.md#42-changes-from-the-previous-version). As with HRP, this does **not** mean the *request* carrying the scheme is XML-only — [Section 8.2](acal-multiple-v1.0.md#82-nodes-identified-by-xpath-expression)'s worked example shows the identical XML-content request in XACML, JACAL and YACAL. If you already reviewed HRP's version of this reasoning, this is not a new gap to evaluate independently; it's the same one, applied consistently, including the same request-vs-content distinction.

---

## The Dangling-Reference Layering Question

XACML 3.0 MDP says a dangling `RequestEntityReference` produces `Indeterminate` with a `syntax-error` status *at evaluation time*. ACAL Core's own XML schema (`xs:keyref`) already catches the same defect *at validation time*, before evaluation would even begin — a layer XACML 3.0 didn't have. [Section 5.4](acal-multiple-v1.0.md#54-reference) resolves the apparent conflict by saying both layers are normative: a validating implementation catches it earlier, a non-validating one must still catch it at evaluation time, so the guarantee holds either way. **What to check**: this is exactly the kind of layering question this repo's diary flags as needing an explicit "which layer is normative" answer rather than silence — confirm the profile actually gives one (it does, in the paragraph above).

**The new [Section 9](acal-multiple-v1.0.md#9-representation-considerations) is why both layers matter in practice, not just in theory.** The `xs:keyref` enforcement above is XML-only: JSON Schema has no equivalent keyword at all, and the *Core JSON Schema* itself marks the corresponding sibling-uniqueness constraint an open `TODO` in a `$comment`. The YAML constraint catalog documents both rules declaratively but doesn't mechanically enforce either. **What to check:** confirm the `$comment`/`TODO` claim against `acal-core-json-v1.0-schema.json` directly — if it has since been resolved, this section's JSON paragraph is stale and should be revised rather than left describing a gap that's already closed.

---

## The Five Schemes at a Glance

| Scheme | Expands one request into... | Needs |
|---|---|---|
| Repeated Categories ([5.3](acal-multiple-v1.0.md#53-repeated-categories)) | Cross product of repeated same-`Category` entities | ACAL Core only |
| Reference ([5.4](acal-multiple-v1.0.md#54-reference)) | One request per `RequestReference` | ACAL Core only |
| Scope ([5.1](acal-multiple-v1.0.md#51-nodes-identified-by-scope)) | One request per child/descendant node | ACAL Hierarchical Resource Profile (vocabulary only) |
| XPath Expression ([5.2](acal-multiple-v1.0.md#52-nodes-identified-by-xpath-expression)) | One request per XPath-selected node; an invalid expression, or one that does not return a sequence of one or more nodes, gives one `Indeterminate` result | ACAL XPath Profile (`content-selector`) |
| Combined Decision ([6](acal-multiple-v1.0.md#6-combined-decision)) | *Merges* several decisions back into one | None of the above — orthogonal, can combine with any of them |

All four request-construction schemes plus combined decision are independently optional. [Section 7](acal-multiple-v1.0.md#7-conceptual-model-for-resolving-multiple-decision-requests) (conceptual model) is the one mandatory section, but its *mandatoriness* is conditional — it binds an implementation only once it claims support for at least one of the other five.

---

## Published Artifact Set

No new schema files, same as HRP: no XSD, JSON Schema, or YAML constraint catalog. `acal-multiple-v1.0.md` and this guide are the complete deliverable for this version.

---

## Worked Example Walkthrough

[MDP-ACAL] Section 8 now gives one example for **every** scheme, including the two ([Section 5.1](acal-multiple-v1.0.md#51-nodes-identified-by-scope) scope and [Section 5.2](acal-multiple-v1.0.md#52-nodes-identified-by-xpath-expression) XPath expression) that previously had none, and every example is shown in **all three** ACAL representations — XACML v4.0 (XML), JACAL v1.0 (JSON), and YACAL v1.0 (YAML) — following the ACAL Core Reviewer's Guide's "Cross-Language Examples" template. The section is ordered to match [Section 5](acal-multiple-v1.0.md#5-request-construction-schemes) itself:

- [Section 8.1](acal-multiple-v1.0.md#81-nodes-identified-by-scope) (Scope) shows a single folder request with `scope: Children`; the walkthrough is explicit that *which* nodes are children is resolved externally (e.g. by the Hierarchical Resource Profile), not by anything the request itself states — there is no "expanded" request to show.
- [Section 8.2](acal-multiple-v1.0.md#82-nodes-identified-by-xpath-expression) (XPath Expression) shows a batch medical-records document with a `multiple:content-selector` XPath expression selecting every `<md:patient>` node. This is the scheme with the XML-*content* restriction discussed above — check that all three representations still appear here. `Content.Body`'s own encoding differs across the three as usual, and so does the `xpathExpression` value's own shape (issue #134): JACAL/YACAL carry a `Namespaces` mapping on the value; XML resolves the namespace prefixes from ordinary in-scope namespaces (an ancestor `xmlns:md` is fine, unchanged from XACML 3.0). The value carries its own `XPathVersion` in all three here only because this is a bare `RequestEntity` fragment with no `XPathRequestDefaults` to default it from; in a full request it could be omitted.
- [Section 8.3](acal-multiple-v1.0.md#83-repeated-categories) (Repeated Categories), [Section 8.4](acal-multiple-v1.0.md#84-reference) (Reference), and [Section 8.5](acal-multiple-v1.0.md#85-combined-decision) (Combined Decision) are the same underlying two-resource, one-subject, one-action scenario carried through three different schemes — Reference names the same entities in 8.3 by `RequestEntityReference` instead of repeating the category, and Combined Decision reuses 8.3's request again with `CombinedDecision` set to `true`.

**What to check as a reviewer:** Sections 8.3-8.5 are not independent scenarios — confirm they genuinely describe the same subject/resources/action, just via a different scheme, in every one of the three formats. For 8.1 and 8.2 (the two schemes that had no worked example before this revision), confirm the example actually demonstrates the scheme's own request-resolution rule from [Section 5](acal-multiple-v1.0.md#5-request-construction-schemes), not just a plausible-looking request. If you are checking that this profile is genuinely format-agnostic (not merely format-agnostic in its normative prose while its worked examples lean XML), confirming that every JSON example parses and validates against `acal-core-json-v1.0-schema.json` (with the ACAL XPath Profile's schema extensions enabled, for [Section 8.2](acal-multiple-v1.0.md#82-nodes-identified-by-xpath-expression)'s `xpathExpression` value) and that every YAML example is structurally identical to its JACAL counterpart once parsed, is the concrete way to do that, rather than taking the representation-agnostic claim on faith.

---

## Review Guidance for ACAL Reviewers New to This Profile

- **Don't grade this PR against issue #59's stated scope** — grade it against Section 4.2's actual accounting, which is considerably larger than two renames.
- **Verify the `Child`/`Descendant` definitions genuinely build on HRP's vocabulary** rather than silently duplicating or contradicting it — check Section 2.1.2 of both documents side by side.
- **Confirm the combined-decision `Notice` rule** (Section 6, rule 3) actually covers both obligations and advice, not just one — this is a deliberate broadening from XACML 3.0's "obligations or advice" wording collapsing onto ACAL's single `Notice`/`IsObligation` model.
- **Check the dangling-reference layering paragraph is actually there and says something concrete** (Section 5.4) — a profile that mentions a layering conflict exists without resolving it would be worse than not mentioning it at all.
- **Treat the JSON-content-document scoping the same way you treated HRP's** — same decision, same reasoning, not a fresh judgment call each time it appears in a new document. Don't conflate it with the request's own serialization, which [Section 8.2](acal-multiple-v1.0.md#82-nodes-identified-by-xpath-expression)'s example shows is unrestricted.
- **Verify all three representations of every example, not just the XML one** — every subsection of Section 8 now shows XACML, JACAL and YACAL, and they are the profile's evidence that its schemes are genuinely representation-agnostic, not XML with a format-agnostic claim attached. Parse and, ideally, schema-validate them rather than reading them as prose illustrations.
- **Confirm Section 9's enforcement claims against the actual schema artifacts**, not against this guide's or the profile's summary of them — particularly the JSON Schema `$comment`/`TODO` claim, which could go stale if that gap is ever closed.

---

## Bottom Line

This profile ports four independently optional ways to expand one ACAL request into several, plus a combined-decision scheme to merge results back, introduces no new schema artifacts, and needed the Hierarchical Resource Profile only for two schemes' vocabulary and one shared attribute identifier — not for any shared code path that could drift. The scope issue #59 actually represents is considerably larger than its own filed text suggests, and this profile addresses the full scope rather than just the two renames named in the issue. Every scheme now has a worked example in all three ACAL representations, including the two (scope, XPath expression) that previously had none, and a new Representation Considerations section states what each representation's own schema tooling does and doesn't catch for this profile's dangling-reference and sibling-uniqueness rules.
