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
- a request can ask "does this subject have the privileges of role R?" without naming a resource or action that the role's permissions cover (the queried role is a resource attribute).

The profile does this with two policy roles — a **Role Policy** and a **Permission Policy** — both of which are ordinary ACAL `PolicyType` objects. There are no new UML classes, no new XSD types, no new JSON Schema definitions. If you are looking for them, you will not find any: this profile is identifiers plus normative prose over constructs ACAL Core already has, the same pattern the ACAL Hierarchical Resource and Multiple Decision Profiles follow.

---

## XACML 3.0 to ACAL: Key Changes

### `<PolicySet>` is gone — Role and Permission Policies become `PolicyType` objects

XACML 3.0 RBAC defines its Role and Permission policies as two kinds of `<PolicySet>`. ACAL Core merged `<Policy>` and `<PolicySet>` into one recursive `PolicyType`, and merged `<PolicyIdReference>` and `<PolicySetIdReference>` into one `PolicyReference`. So a Role `<PolicySet>` becomes a **Role Policy**, a Permission `<PolicySet>` becomes a **Permission Policy**, and every `<PolicySetIdReference>` becomes a `PolicyReference`.

**What to check as a reviewer:** the XACML 3.0 rule that a Role `<PolicySet>` "SHALL NOT contain any other `<Policy>`, `<PolicySet>`, `<PolicyIdReference>` or `<PolicySetIdReference>`" is written against the four-way element distinction. ACAL has one reference construct. Confirm that the ACAL restatement in [RBAC-ACAL] §5.3.1 constraint 2 ("exactly one `PolicyReference` … and no other `PolicyReference`, no nested `Policy`, and no `Rule`") captures the same intent — it should, because both `<PolicyIdReference>` and `<PolicySetIdReference>` resolve to "evaluate the referenced policy," and RBAC never used the distinction for anything.

### CS02 is the *simplified* RBAC profile

If you remember the XACML 2.0 RBAC profile, or an early XACML 3.0 draft, you may be looking for a Role Assignment `<PolicySet>` and an `enableRole` action. **XACML 3.0 RBAC CS02 (23 October 2014) dropped both.** It also explicitly excludes dynamic role enablement and Separation of Duty (CS02 §1.7). This profile ports CS02, so those are out of scope here for the same reason — see [RBAC-ACAL] §5.2 and the scope box in §4.3. This profile has **no dependency on the ACAL administration and delegation profile**.

### Two changes to ACAL Core — one substantive, one cosmetic

RBAC is the first ACAL profile to lean directly on how the PDP's policy set and policy-reference resolution are specified, and it needed two Core text changes, carried on this branch:

1. **`acal-core-v1.0.md` §8.13 (PolicyReference Evaluation) + §7.8** — §8.13 now specifies how a reference is resolved against the policies that define the PDP: by `PolicyId` and version, within the `BundleType` object's `Policy` set, for any reference in a policy's `CombinerInput`; the entry-point reference must resolve within that set (§7.48), and URL retrieval is a fallback only for non-entry-point references to policies not in the set. §7.8's blanket "the mechanism … is outside the scope of this specification" is narrowed to cover only locating a policy that is *not* among those that define the PDP by a mechanism other than the optional URL retrieval §8.13 specifies. **This is a resolution-model change, not a pure editorial tidy** — reviewers should read it against §7.8, §7.48, §8.15, and §7.4's "MAY be resolvable" allowance, and decide whether it belongs in the RBAC PR or as its own Core issue. It changes no evaluation outcome for a policy set whose `CombinerInput` references all resolve within the PDP's policy set, but it removes latitude an implementation previously had about *where* it resolved from.
2. **`acal-core-v1.0.md` §8.10** now points its phrase "the top level policy" at the definition in §8.15. Cosmetic; RBAC does not actually depend on it.

### The role attribute Target rule is now a constraint on the expression, not the structure

XACML 3.0 RBAC says a Role `<PolicySet>`'s `<Target>` makes it "applicable only to Subjects having the [role]" and "SHALL NOT restrict the Resource, Action, or Environment." The first half is one-directional (applicable *only if* the role is present — it does not forbid additional subject predicates); the second is a structural statement about XACML's `<AnyOf>`/`<AllOf>`/`<Match>` Target. ACAL's `Target` is a single boolean expression, with no category structure. [RBAC-ACAL] §5.3.1 constraint 1 restates both halves: the expression is `true` **only if** the role is present (the one-directional applicability rule — kept one-directional so a multi-role Target, §5.4, or an extra subject predicate stays valid), and it **references only subject-category attributes** (the checkable proxy for "does not restrict R/A/E"). **What to check:** that the constraint is one-directional (an earlier draft had an "if and only if" that would have broken §5.4); that "references only subject-category attributes" is checkable by walking the expression's designator/selector categories after variable expansion; and that it does not forbid a legitimate Role Policy Target.

### Identifier respellings

Per [RBAC-ACAL] §10.2, an implementation MUST support the `urn:oasis:names:tc:acal:1.0:` form of an item marked `M`, and of an item marked `O` that it implements, and MAY recognize the deprecated XACML 3.0 identifier as equivalent. The HasPrivilegesOfRole action value in the last row is an attribute value, not an identifier: it is not covered by that equivalence, and a request translated from XACML 3.0 substitutes the ACAL value.

| Purpose | ACAL | Deprecated (XACML) |
|---|---|---|
| Profile identifier | `urn:oasis:names:tc:acal:1.0:profile:rbac` | `urn:oasis:names:tc:xacml:3.0:profiles:rbac:core-hierarchical` |
| Role attribute | `urn:oasis:names:tc:acal:1.0:subject:role` | `urn:oasis:names:tc:xacml:2.0:subject:role` |
| HasPrivilegesOfRole action value | `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role` | `urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole` |

The role attribute identifier is `O` (optional) in the conformance table because CS02 itself only RECOMMENDS it — a deployment may use other identifiers for roles.

### Combining algorithm: one is mandated, and every rule is a `Permit`

CS02 §5.3 and §6 mandate no combining algorithm; its §2 examples use `permit-overrides` illustratively. [RBAC-ACAL] §5.3 **does** mandate one, and this is the most substantial departure from CS02 in the profile: every `Rule` beneath a Permission Policy has an `Effect` of `Permit`, and every Role Policy, Permission Policy, and policy nested within or referenced from a Permission Policy uses `permit-overrides` or `ordered-permit-overrides`.

**Check the stated reason, not just the rule.** It is *not* that every other algorithm would break inheritance: with Permit-only rules, `deny-overrides` fed `Permit`/`NotApplicable`/`Indeterminate{P}` reaches the same decisions as `permit-overrides` (Core Annex E.2 vs E.4 — the steps preferring `Deny` have no `Deny` to act on). `first-applicable` does differ: it stops on an earlier `Indeterminate{P}` and can withhold a later inherited grant ([RBAC-ACAL] §5.3). The other reasons are that the *synthesizing* algorithms (`permit-unless-deny`, `deny-unless-permit`) must be excluded, and that one algorithm throughout keeps a hierarchy re-parentable. An earlier draft gave the false reason; if you see it anywhere still, flag it.

The consequence worth checking is stated: with no `Deny` rule beneath it, and when evaluation completes without error, a Permission Policy returns `Permit`, `NotApplicable`, or `Indeterminate{P}` — never `Deny`; an evaluation error yields plain `Indeterminate` (profile Section 5.3). This no-`Deny` property is the Permission Policy's; what the PDP returns also depends on the policy above the Role Policies (Section 5.3.5). A prohibition is expressed outside the RBAC policy set, not as a `Deny` rule inside a Permission Policy.

**What to check:** that §5.3 states *both* constraints (Permit-only rules and the algorithm), that both reach policies **nested within or referenced from** a Permission Policy rather than only the Permission Policy itself, that §4.3 discloses the mandate as new relative to CS02, and that §9's hazard list matches the constraints rather than describing algorithms the profile no longer permits. §6.1 (non-normative) covers the consequences and where a prohibition goes instead.

---

## The Two-Policy Construction at a Glance

| | Role Policy (RP) | Permission Policy (PP) |
|---|---|---|
| One per | role | role |
| `Target` | a subject-only expression, true only when the required role (or, for a composite role, roles) is present | none (or nothing that restricts the subject) |
| `CombinerInput` | exactly one `PolicyReference`, to this role's PP | `PolicyReference` to each *immediately* junior role's PP; the role's `Rule`/nested `Policy` permissions — directly, or (where the deployment offers HasPrivilegesOfRole queries) inside one nested `Policy` excluding the reserved action; a HasPrivilegesOfRole `Rule`, where the deployment offers the queries |
| Named as the PDP entry point? | permitted; in an RBAC-only PDP the recommended entry point is the policy that combines the RPs (§5.3.5) | **never** (§5.3.5 constraint 2) |
| Reached by a reference from | never from a Permission Policy (§5.3.2 constraint 1); §5.3.1 has no other inbound-reference rule | **only** its own RP, or a senior PP (hierarchy) |

The PDP evaluates the policy named by a `BundleType` object's `PolicyReference` — the entry point ([RBAC-ACAL] §5.3.5). In an RBAC-only PDP that entry point is recommended to be a policy that combines the Role Policies (§5.3.5); each Role Policy gates access to its Permission Policy by the role test; each Permission Policy carries the permissions and reaches junior roles by reference. A Permission Policy reached any other way would grant its role's permissions to a subject that does not hold the role — which is why "never the entry point, reachable only through its own Role Policy or through the hierarchy" is a normative constraint, not just advice.

**What to check:** [RBAC-ACAL] §5.3.5 **constraints 2, 3 and 4 together** are the graph invariant — constraint 2 stops the `BundleType` object's `PolicyReference` naming a Permission Policy, constraint 3 stops a PP being nested, and constraint 4 restricts which policies may reference one; §5.3.2 constraint 3 is its per-policy restatement (§5.3.1 carries no inbound-reference rule); §9 lists the mistake as the most serious the profile guards against. An earlier draft of §5.3.5 only forbade the *immediate* bundle reference from naming a PP — confirm the current text closes the whole graph, not just that one edge. It is a fact about which policies are Permission Policies — a deployment-design fact, the policy author's responsibility, not something schema validation enforces.

### Role hierarchy is one `PolicyReference` per edge

A senior role's Permission Policy contains a `PolicyReference` to the PP of each role *immediately* junior to it; because inheritance is transitive through those references, every further junior role is reached as well (a reference to a non-immediate junior is permitted, but redundant). A cycle detected during evaluation makes the reference `Indeterminate` with `processing-error` (`acal-core-v1.0.md` §8.13); a deployment that wants it rejected outright relies on load-time detection (profile Section 5.3.3). Each seniority edge lives in exactly one place — the senior role's PP — so making one role junior to another is a single added `PolicyReference` and touches no rule; removing or moving a role changes the `PolicyReference` objects in its former and new senior roles' PPs (references move, rules do not). **What to check:** [RBAC-ACAL] §5.3.3, and that the worked example in §7.1 shows exactly this (the `manager` PP's single `PolicyReference` to the `employee` PP is the whole hierarchy).

### HasPrivilegesOfRole is a `Rule`, and carries the role as a *resource* attribute

**CS02 wraps the HasPrivilegesOfRole rule in a `<Policy>`** only because an XACML Permission `<PolicySet>` cannot hold a `<Rule>` directly (and CS02 §2.5's example uses the wrapper `<Target>` for nothing). An ACAL `PolicyType` object's `CombinerInput` holds `Rule` objects freely, so [RBAC-ACAL] §5.3.4 drops the wrapper: the HasPrivilegesOfRole Rule sits directly in the Permission Policy. A `Rule` has no `Target` and no `CombiningAlgId`, so the whole test (action `has-privileges-of-role` **and** queried role) is in the `Rule`'s `Condition`, exactly as CS02 §2.5 writes it, and there is no combining algorithm to make safe. **What to check:** that [RBAC-ACAL] §5.3.4 defines a `Rule`, not a nested `PolicyType`; that §4.3 records this as the ACAL-native form of the CS02 `<Policy>`; that no residual "constraint 4" about the wrapper's `CombiningAlgId` remains.

In an ordinary request the role is a subject attribute. In a HasPrivilegesOfRole request the action is `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role` and the role being asked about rides as a **resource** attribute, using the same `AttributeId`. The same `AttributeId` then legitimately appears in both the subject entity and the resource entity of one request — which is well-formed because ACAL's attribute-uniqueness constraint (`acal-core-v1.0.md` §7.35, issue #120) is scoped **per `RequestEntityType` object**. **What to check:** confirm §7.35 actually keys uniqueness on `Sequence{AttributeId, DataType, Issuer}` within one `RequestEntityType` — the §7.35.1 worked example even uses `urn:example:role` as its illustration. If that constraint were global, the HasPrivilegesOfRole request shape would be invalid.

**A Permission Policy in a deployment that offers HasPrivilegesOfRole queries isolates ordinary rules from it.** [RBAC-ACAL] §5.3.2 constraint 4 requires every ordinary `Rule` and nested `Policy` to sit inside one nested `Policy` whose `Target` excludes the reserved action — otherwise an ordinary rule that happens to evaluate to `Permit` for a `has-privileges-of-role` request is indistinguishable from a `Permit` the HasPrivilegesOfRole Rule itself produced. This constraint applies only when the deployment offers HasPrivilegesOfRole queries; where it does not, the constraint imposes nothing — an author may still group permissions under a nested policy, as constraint 1 has always allowed, but nothing requires it. **What to check:** that the `CombinerInput` of every Permission Policy of a deployment that offers HasPrivilegesOfRole queries holds directly only its HasPrivilegesOfRole Rule, `PolicyReference`s to junior roles' Permission Policies (one for each immediately junior role, and any reference to a non-immediate junior that §5.3.3 permits), and at most one excluding wrapper, which holds every ordinary rule and nested policy (§5.3.2 constraint 4). A Permission Policy with no permissions of its own has no wrapper, and one whose role has no junior role has no junior-role reference. Check too that the wrapper's `Target` tests the reserved action value itself rather than enumerating "most" ordinary actions, and that it cannot go `Indeterminate` when `action-id` is absent — a `MustBePresent` designator there turns every ordinary inherited grant into an error.

**HasPrivilegesOfRole cardinality is now constrained, and a query names one role.** [RBAC-ACAL] §5.3.4 constraint 1 makes the Rule's `Condition` true only where (a) the request's `action-id` contains exactly one value, the reserved one (for a request mixing it with an ordinary action the `Condition` is `false`), and (b) the values of the resource role attribute are, as a set, exactly the Permission Policy's role, or a composite role's constituent roles; constraint 2 requires a request answered as such a query to carry that resource role attribute. For `anyURI` role values, §6.2 tests (b) with `anyURI-set-equals`. Several values name one composite role; a question about several roles is asked in several requests. Roles are carried as attribute values only: the identifier-per-role form, in which an attribute's presence indicates a role, is not defined (§4.3, §5.1). **What to check:** a query carrying a role together with another role in the same role attribute gets no `Permit` from the singular role's rule (the resource entity of a query carries values of only one role attribute, and a composite role's constituents are values of one role attribute, §5.3.4 and §5.4; a deployment defines no two composite roles with the same constituent set in one role attribute, §5.4); the policies of §7.1, when executed, return `Deny` for a manager asking about employee and manager together, and `Permit` for each role asked alone. A test suite should exercise a composite-role query as well, since the worked example has no composite role.

---

## Worked Example

[RBAC-ACAL] §7 runs one hierarchy — `employee`, and `manager` senior to it — end to end, in all three representations (XACML/XML, JACAL/JSON, YACAL/YAML), followed by an access request and a HasPrivilegesOfRole request with their expected decisions. Every construct in it is ACAL Core; the example is carried inside a single `BundleType` object so the whole set — five top-level policies, plus the nested ordinary-permissions policy inside each Permission Policy — and its entry point are visible at once.

**What to check:** the example is non-normative but it is where a subtle error is most likely to hide. Spot-check that (a) each Role Policy's `Target` references only the `access-subject` role attribute, (b) no Permission Policy has a subject-restricting `Target`, (c) the Bundle's `PolicyReference` names `urn:example:rbac:entry-point`, never a `pp:` policy, and (d) the two request evaluations reach `Permit` for the stated reason.

---

## Published Artifact Set

This profile introduces no new schema files. The complete artifact set for this version is:

- `acal-rbac-v1.0.md` — this profile (normative)
- `acal-rbac-v1.0-reviewer-guide.md` — this guide (informative)

Plus two edits to `acal-core-v1.0.md` (§8.13 + §7.8, and §8.10), carried on the same branch — see "Two changes to ACAL Core" above.

---

## Conformance in One Paragraph

An implementation conforms **as a policy author** if the Role Policies and Permission Policies it produces, and the Bundle that holds them, satisfy the constraints of [RBAC-ACAL] §5, including hierarchy and the reachability graph (§5.3.5); the PDP checks none of this. It conforms **as an RBAC request generator** if it produces requests carrying role attributes per §5.1 and, where it produces HasPrivilegesOfRole requests, those requests per §5.3.4. Offering HasPrivilegesOfRole queries is optional. There is one profile identifier, one recommended role attribute identifier, and one action value — all in [RBAC-ACAL] §10.2 and Annex C.
