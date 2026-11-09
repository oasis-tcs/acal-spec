# ACAL Core and Hierarchical RBAC Profile: A Reviewer's Guide

## Purpose

This document is a companion guide for anyone reviewing the ACAL Core and Hierarchical Role Based Access Control (RBAC) Profile (`acal-rbac-v1.0.md`, cited here as [RBAC-ACAL]) who knows ACAL but has not necessarily followed the XACML 3.0 RBAC Profile or the analysis that shaped this port.

It is intended to be useful to:

1. TC reviewers checking this profile against the XACML 3.0 source it ports
2. Implementers deciding whether, and how, to support RBAC
3. Anyone who wants to understand why this port needed only two changes to ACAL Core (one of which, §8.13, deserves its own look) and no new object types or schemas

This guide is explanatory and informative. It does not replace [RBAC-ACAL] itself, which is the normative document.

---

## What This Profile Adds to ACAL Core

ACAL Core lets a policy test any attribute of a subject. A *role* is just an attribute, so ACAL Core can already express "permit if the subject's `role` attribute contains `manager`" with no profile at all. What RBAC adds is not a new capability — it is a **discipline for organizing policies around roles** so that the properties that make RBAC valuable actually hold:

- each seniority edge lives in exactly one place (the senior role's Permission Policy), so adding a junior edge is a one-line change and never copies a rule;
- a senior role automatically gains every permission of its junior roles;
- a request can ask "does this subject have the privileges of role R?" without naming a resource.

The profile does this with two policy roles — a **Role Policy** and a **Permission Policy** — both of which are ordinary ACAL `PolicyType` objects. There are no new UML classes, no new XSD types, no new JSON Schema definitions. If you are looking for them, you will not find any: this profile is identifiers plus normative prose over constructs ACAL Core already has, the same pattern the ACAL Hierarchical Resource and Multiple Decision Profiles follow.

---

## XACML 3.0 to ACAL: Key Changes

### `<PolicySet>` is gone — and nothing depended on it

XACML 3.0 RBAC is written entirely in terms of two kinds of `<PolicySet>`. ACAL Core merged `<Policy>` and `<PolicySet>` into one recursive `PolicyType`, and merged `<PolicyIdReference>` and `<PolicySetIdReference>` into one `PolicyReference`. So a Role `<PolicySet>` becomes a **Role Policy**, a Permission `<PolicySet>` becomes a **Permission Policy**, and every `<PolicySetIdReference>` becomes a `PolicyReference`.

**What to check as a reviewer:** the XACML 3.0 rule that a Role `<PolicySet>` "SHALL NOT contain any other `<Policy>`, `<PolicySet>`, `<PolicyIdReference>` or `<PolicySetIdReference>`" is written against the four-way element distinction. ACAL has one reference construct. Confirm that the ACAL restatement in [RBAC-ACAL] §5.3.1 constraint 2 ("exactly one `PolicyReference` … and no other `PolicyReference`, no nested `Policy`, and no `Rule`") captures the same intent — it should, because both `<PolicyIdReference>` and `<PolicySetIdReference>` resolve to "evaluate the referenced policy," and RBAC never used the distinction for anything.

### CS02 is the *simplified* RBAC profile

If you remember the XACML 2.0 RBAC profile, or an early XACML 3.0 draft, you may be looking for a Role Assignment `<PolicySet>` and an `enableRole` action. **XACML 3.0 RBAC CS02 (23 October 2014) dropped both.** It also explicitly excludes dynamic role enablement and Separation of Duty (CS02 §1.7). This profile ports CS02, so those are out of scope here for the same reason — see [RBAC-ACAL] §5.2 and the scope box in §4.3. This profile has **no dependency on the ACAL administration and delegation profile**.

### Two changes to ACAL Core — one substantive, one cosmetic

RBAC is the first ACAL profile to lean directly on how the PDP's policy set and policy-reference resolution are specified, and it needed two Core text changes, carried on this branch:

1. **`acal-core-v1.0.md` §8.13 (PolicyReference Evaluation) + §7.8** — §8.13 now specifies how a reference is resolved against the policies that define the PDP: by `PolicyId` and version, within the `BundleType` object's `Policy` set, for any reference in a policy's `CombinerInput`; the entry-point reference must resolve within that set (§7.46), and URL retrieval is a fallback only for non-entry-point references to policies not in the set. §7.8's blanket "the mechanism … is outside the scope of this specification" is narrowed to cover only locating a policy that is *not* among those that define the PDP. **This is a resolution-model change, not a pure editorial tidy** — reviewers should read it against §7.8, §7.46, §8.15, and §7.4's "MAY be resolvable" allowance, and decide whether it belongs in the RBAC PR or as its own Core issue. It changes no evaluation outcome for a well-formed policy set (every reference already had to resolve *somehow*), but it removes latitude an implementation previously had about *where* it resolved from.
2. **`acal-core-v1.0.md` §8.10** now points its phrase "the top level policy" at the definition in §8.15. Cosmetic; RBAC does not actually depend on it.

### The role attribute Target rule is now a constraint on the expression, not the structure

XACML 3.0 RBAC says a Role `<PolicySet>`'s `<Target>` makes it "applicable only to Subjects having the [role]" and "SHALL NOT restrict the Resource, Action, or Environment." The first half is one-directional (applicable *only if* the role is present — it does not forbid additional subject predicates); the second is a structural statement about XACML's `<AnyOf>`/`<AllOf>`/`<Match>` Target. ACAL's `Target` is a single boolean expression, with no category structure. [RBAC-ACAL] §5.3.1 constraint 1 restates both halves: the expression is `true` **only if** the role is present (the one-directional applicability rule — kept one-directional so a multi-role Target, §5.4, or an extra subject predicate stays valid), and it **references only subject-category attributes** (the checkable proxy for "does not restrict R/A/E"). **What to check:** that the constraint is one-directional (an earlier draft had an "if and only if" that would have broken §5.4); that "references only subject-category attributes" is checkable by walking the expression's designator/selector categories after variable expansion; and that it does not forbid a legitimate Role Policy Target.

### Identifier respellings

Per the standard ACAL convention (`acal-core-v1.0.md` §11.2 preamble — new `urn:oasis:names:tc:acal:1.0:` identifier is mandatory to support, the XACML identifier MAY be recognized as a deprecated equivalent):

| Purpose | ACAL | Deprecated (XACML) |
|---|---|---|
| Profile identifier | `urn:oasis:names:tc:acal:1.0:profile:rbac` | `urn:oasis:names:tc:xacml:3.0:profiles:rbac:core-hierarchical` |
| Role attribute | `urn:oasis:names:tc:acal:1.0:subject:role` | `urn:oasis:names:tc:xacml:2.0:subject:role` |
| HasPrivilegesOfRole action value | `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role` | `urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole` |

The role attribute identifier is `O` (optional) in the conformance table because CS02 itself only RECOMMENDS it — a deployment may use other identifiers for roles.

### Combining algorithm: one is mandated, and every rule is a `Permit`

CS02 §5.3 and §6 mandate no combining algorithm; its §2 examples use `permit-overrides` illustratively. [RBAC-ACAL] §5.3 **does** mandate one, and this is the most substantial departure from CS02 in the profile: every `Rule` beneath a Permission Policy has an `Effect` of `Permit`, and every Role Policy, Permission Policy, and policy nested within or referenced from a Permission Policy uses `permit-overrides` or `ordered-permit-overrides`.

**Check the stated reason, not just the rule.** It is *not* that other algorithms would break inheritance: with Permit-only rules, `deny-overrides` fed `Permit`/`NotApplicable`/`Indeterminate{P}` reaches the same decisions as `permit-overrides` (Core Annex E.2 vs E.4 — the steps preferring `Deny` have no `Deny` to act on). The real reasons are that the *synthesizing* algorithms (`permit-unless-deny`, `deny-unless-permit`) must be excluded, and that one algorithm throughout keeps a hierarchy re-parentable. An earlier draft gave the false reason; if you see it anywhere still, flag it.

The consequence worth checking is stated: with no `Deny` rule beneath it, a Permission Policy returns `Permit`, `NotApplicable`, or `Indeterminate{P}` — never `Deny`. An RBAC policy set therefore cannot deny an access that a policy evaluated alongside it intends to permit, which is what makes it composable. A prohibition is expressed outside the RBAC policy set, not as a `Deny` rule inside a Permission Policy.

**What to check:** that §5.3 states *both* constraints (Permit-only rules and the algorithm), that both reach policies **nested within or referenced from** a Permission Policy rather than only the Permission Policy itself, that §4.3 discloses the mandate as new relative to CS02, and that §9's hazard list matches the constraints rather than describing algorithms the profile no longer permits. §6.1 (non-normative) covers the consequences and where a prohibition goes instead.

---

## The Two-Policy Construction at a Glance

| | Role Policy (RP) | Permission Policy (PP) |
|---|---|---|
| One per | role | role |
| `Target` | a subject-only expression, true only when the required role (or, for a composite role, roles) is present | none (or nothing that restricts the subject) |
| `CombinerInput` | exactly one `PolicyReference`, to this role's PP | `PolicyReference` to each *immediately* junior role's PP; the role's `Rule`/nested `Policy` permissions — directly, or (where HasPrivilegesOfRole is supported) inside one nested `Policy` excluding the reserved action; a HasPrivilegesOfRole `Rule`, where supported |
| Named as the PDP entry point? | not as such — the entry point is the policy that combines the RPs | **never** |
| Reached by a reference from | unconstrained — §5.3.1 has no inbound-reference rule | **only** its own RP, or a senior PP (hierarchy) |

The PDP evaluates a `BundleType` object's `PolicyReference` — the entry point ([RBAC-ACAL] §5.3.5). For RBAC that entry point combines the Role Policies; each Role Policy gates access to its Permission Policy by the role test; each Permission Policy carries the permissions and reaches junior roles by reference. A Permission Policy reached any other way would grant its role's permissions to a subject that does not hold the role — which is why "never the entry point, reachable only through its Role Policy" is a normative constraint, not just advice.

**What to check:** [RBAC-ACAL] §5.3.5 **constraints 2, 3 and 4 together** are the graph invariant — constraint 2 stops the `BundleType` object's `PolicyReference` naming a Permission Policy, constraint 3 stops a PP being nested, and constraint 4 restricts which policies may reference one; §5.3.2 constraint 3 is its per-policy restatement (§5.3.1 carries no inbound-reference rule); §9 lists the mistake as the most serious the profile guards against. An earlier draft of §5.3.5 only forbade the *immediate* bundle reference from naming a PP — confirm the current text closes the whole graph, not just that one edge. It is a fact about which policies are Permission Policies — a deployment-design fact, enforced by the PAP/deployment, not by schema validation.

### Role hierarchy is one `PolicyReference` per edge

A senior role's Permission Policy contains a `PolicyReference` to the PP of each role *immediately* junior to it; because inheritance is transitive through those references, every further junior role is reached as well (a reference to a non-immediate junior is permitted, but redundant). Cycles are rejected by ordinary ACAL policy-reference evaluation (`acal-core-v1.0.md` §8.13). Each seniority edge lives in exactly one place — the senior role's PP — so making one role junior to another is a single added `PolicyReference` and touches no rule; removing or moving a role changes the `PolicyReference` objects in its former and new senior roles' PPs (references move, rules do not). **What to check:** [RBAC-ACAL] §5.3.3, and that the worked example in §7.1 shows exactly this (the `manager` PP's single `PolicyReference` to the `employee` PP is the whole hierarchy).

### HasPrivilegesOfRole is a `Rule`, and carries the role as a *resource* attribute

**CS02 wraps the HasPrivilegesOfRole rule in a `<Policy>`** only because an XACML Permission `<PolicySet>` cannot hold a `<Rule>` directly (and CS02 §2.5's example uses the wrapper `<Target>` for nothing). An ACAL `PolicyType` object's `CombinerInput` holds `Rule` objects freely, so [RBAC-ACAL] §5.3.4 drops the wrapper: the HasPrivilegesOfRole Rule sits directly in the Permission Policy. A `Rule` has no `Target` and no `CombiningAlgId`, so the whole test (action `has-privileges-of-role` **and** queried role) is in the `Rule`'s `Condition`, exactly as CS02 §2.5 writes it, and there is no combining algorithm to make safe. **What to check:** that [RBAC-ACAL] §5.3.4 defines a `Rule`, not a nested `PolicyType`; that §4.3 records this as the ACAL-native form of the CS02 `<Policy>`; that no residual "constraint 4" about the wrapper's `CombiningAlgId` remains.

In an ordinary request the role is a subject attribute. In a HasPrivilegesOfRole request the action is `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role` and the role being asked about rides as a **resource** attribute, using the same `AttributeId`. The same `AttributeId` then legitimately appears in both the subject entity and the resource entity of one request — which is well-formed because ACAL's attribute-uniqueness constraint (`acal-core-v1.0.md` §7.33, issue #120) is scoped **per `RequestEntityType` object**. **What to check:** confirm §7.33 actually keys uniqueness on `Sequence{AttributeId, DataType, Issuer}` within one `RequestEntityType` — the §7.33.1 worked example even uses `urn:example:role` as its illustration. If that constraint were global, the HasPrivilegesOfRole request shape would be invalid.

**A Permission Policy that supports HasPrivilegesOfRole isolates ordinary rules from it.** [RBAC-ACAL] §5.3.2 constraint 4 requires every ordinary `Rule` and nested `Policy` to sit inside one nested `Policy` whose `Target` excludes the reserved action — otherwise an ordinary rule that happens to evaluate to `Permit` for a `has-privileges-of-role` request is indistinguishable from a `Permit` the HasPrivilegesOfRole Rule itself produced. This constraint applies only when the PDP supports HasPrivilegesOfRole; where it does not, the constraint imposes nothing — an author may still group permissions under a nested policy, as constraint 1 has always allowed, but nothing requires it. **What to check:** that every Permission Policy in a HasPrivilegesOfRole-supporting policy set has this two-tier `CombinerInput` shape — HasPrivilegesOfRole Rule and junior-role `PolicyReference`s as direct siblings, every ordinary rule and nested policy under the one excluding wrapper, and nothing else directly in the `CombinerInput`. A Permission Policy that grants nothing of its own and only inherits correctly has no wrapper at all; that is the one permitted variation. Check too that the wrapper's `Target` tests the reserved action value itself rather than enumerating "most" ordinary actions, and that it cannot go `Indeterminate` when `action-id` is absent — a `MustBePresent` designator there turns every ordinary inherited grant into an error.

**HasPrivilegesOfRole cardinality is now constrained, and a query names one role.** [RBAC-ACAL] §5.3.4 constraint 1 requires the request's `action-id` to carry exactly the reserved value (a request mixing it with an ordinary action gets no defined HasPrivilegesOfRole answer), and constraint 1(b) requires the values of the resource role attribute to be, as a set, exactly the Permission Policy's role, or a composite role's constituent roles (`anyURI-set-equals`, §6.2). Several values name one composite role; a question about several roles is asked in several requests. Roles are carried as attribute values only: the identifier-per-role form, in which an attribute's presence indicates a role, is not defined (§4.3, §5.1). **What to check:** a query carrying a role together with another role in the same role attribute gets no `Permit` from the singular role's rule (the resource entity of a query carries values of only one role attribute, and a composite role's constituents are values of one role attribute, §5.3.4 and §5.4; a deployment defines no two composite roles with the same constituent set in one role attribute, §5.4); the policies of §7.1, when executed, return `Deny` for a manager asking about employee and manager together, and `Permit` for each role asked alone. A test suite should exercise a composite-role query as well, since the worked example has no composite role.

---

## Worked Example

[RBAC-ACAL] §7 runs one hierarchy — `employee`, and `manager` senior to it — end to end, in all three representations (XACML/XML, JACAL/JSON, YACAL/YAML), followed by an access request and a HasPrivilegesOfRole request with their expected decisions. Every construct in it is ACAL Core; the example is carried inside a single `BundleType` object so the whole set — five top-level policies, plus the nested ordinary-permissions policy inside each Permission Policy — and its entry point are visible at once.

**What to check:** the example is non-normative but it is where a subtle error is most likely to hide. Spot-check that (a) each Role Policy's `Target` references only the `access-subject` role attribute, (b) no Permission Policy has a subject-restricting `Target`, (c) the entry point is a `PolicyReference` to `urn:example:rbac:entry-point`, never to a `pp:` policy, and (d) the two request evaluations reach `Permit` for the stated reason.

---

## Published Artifact Set

This profile introduces no new schema files. The complete artifact set for this version is:

- `acal-rbac-v1.0.md` — this profile (normative)
- `acal-rbac-v1.0-reviewer-guide.md` — this guide (informative)

Plus two edits to `acal-core-v1.0.md` (§8.13 + §7.8, and §8.10), carried on the same branch — see "Two changes to ACAL Core" above.

---

## Conformance in One Paragraph

An implementation conforms **as a policy processor** if it evaluates Role Policy / Permission Policy structures as [RBAC-ACAL] §5 and ACAL Core describe, including hierarchy and the reachability graph (§5.3.5); **as an RBAC request generator** if it produces requests carrying role attributes per §5.1 and, where it supports HasPrivilegesOfRole, those requests per §5.3.4. Support for the HasPrivilegesOfRole Rule itself is optional. There is one profile identifier, one recommended role attribute identifier, and one action value — all in [RBAC-ACAL] §10.2 and Annex C.
