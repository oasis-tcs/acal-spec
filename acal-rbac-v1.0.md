---
# Document metadata processed by Pandoc:
logo: |
  ![OASIS](images/OASISLogo-v3.0.png)
# Original logo: http://docs.oasis-open.org/templates/OASISLogo-v3.0.png
title: ACAL v1.0 Core and Hierarchical Role Based Access Control (RBAC) Profile Version 1.0
subtitle: Committee Specification Draft 02
version: "1.0"
stage_revision: csd02 # [stage-abbrev][revisionNumber] as defined in https://docs.oasis-open.org/specGuidelines/ndr/namingDirectives.html
lang: en
keywords: ["access", "authorization", "ABAC", "RBAC", "role", "policylanguage", "standard"]
# date metadata is set automatically to current date, unless specified on pandoc commandline: --metadata date="..."

# If metadata 'x' is a string, any placeholder %x% will be replaced with the value of metadata 'x' (using meta_vars.lua filter), e.g. %version% will be replaced with the version metadata value.
---

### This version

- https://docs.oasis-open.org/acal/acal/profiles/rbac/v%version%/%stage_revision%/acal-rbac-v%version%-%stage_revision%.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/rbac/v%version%/%stage_revision%/acal-rbac-v%version%-%stage_revision%.pdf
- https://docs.oasis-open.org/acal/acal/profiles/rbac/v%version%/%stage_revision%/acal-rbac-v%version%-%stage_revision%.md


### Previous version


N/A

### Latest version


- https://docs.oasis-open.org/acal/acal/profiles/rbac/v1.0/acal-rbac-v1.0.html (Authoritative)
- https://docs.oasis-open.org/acal/acal/profiles/rbac/v1.0/acal-rbac-v1.0.pdf
- https://docs.oasis-open.org/acal/acal/profiles/rbac/v1.0/acal-rbac-v1.0.md


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


This specification is a profile of ACAL that defines how to express core and hierarchical role based access control (RBAC) policies: how a role is carried as a subject attribute, how a Role Policy binds holders of a role to the permissions of that role, how a Permission Policy carries those permissions and inherits from junior roles, and how a request may ask whether a subject has the privileges of a given role.


### Citation Format


When referencing this document, the following citation format should be used:

**[ACAL-RBAC-1.0]**
_%title%_.
Edited by Steven Legg, Cyril Dangerville and Bill Parducci. %date%. OASIS %subtitle%. https://docs.oasis-open.org/acal/acal/profiles/rbac/v%version%/%stage_revision%/acal-rbac-v%version%-%stage_revision%.html . Latest version: https://docs.oasis-open.org/acal/acal/profiles/rbac/v1.0/acal-rbac-v1.0.html .


### Related Work

This document is related to:

- _Attribute-Centric Authorization Language (ACAL) Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/core/v1.0/acal-core-v1.0.html
- _ACAL v1.0 Hierarchical Resource Profile Version 1.0_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/acal/profiles/hierarchical/v1.0/acal-hierarchical-v1.0.html


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
  - [4.2 The Core and Hierarchical RBAC Model](#42-the-core-and-hierarchical-rbac-model)
  - [4.3 Changes From the Previous Version](#43-changes-from-the-previous-version)
- [5 Profile](#5-profile)
  - [5.1 Roles and Role Attributes](#51-roles-and-role-attributes)
  - [5.2 Role Assignment and Enablement](#52-role-assignment-and-enablement)
  - [5.3 Access Control](#53-access-control)
    - [5.3.1 Role Policy](#531-role-policy)
    - [5.3.2 Permission Policy](#532-permission-policy)
    - [5.3.3 Role Hierarchy](#533-role-hierarchy)
    - [5.3.4 HasPrivilegesOfRole Rule](#534-hasprivilegesofrole-rule)
    - [5.3.5 The PDP Entry Point](#535-the-pdp-entry-point)
    - [5.3.6 Notices](#536-notices)
  - [5.4 Multi-Role Permissions](#54-multi-role-permissions)
- [6 Policy Authoring Guidance (non-normative)](#6-policy-authoring-guidance-non-normative)
  - [6.1 Combining Algorithms](#61-combining-algorithms)
  - [6.2 Matching Role Attributes in a Target](#62-matching-role-attributes-in-a-target)
  - [6.3 Structuring a Role Hierarchy](#63-structuring-a-role-hierarchy)
- [7 Examples (non-normative)](#7-examples-non-normative)
  - [7.1 Role and Permission Policies](#71-role-and-permission-policies)
  - [7.2 An Access Request](#72-an-access-request)
  - [7.3 A HasPrivilegesOfRole Request](#73-a-hasprivilegesofrole-request)
- [8 Representation Considerations](#8-representation-considerations)
  - [8.1 XML](#81-xml)
  - [8.2 JSON](#82-json)
  - [8.3 YAML](#83-yaml)
- [9 Safety, Security, and Data Protection Considerations](#9-safety-security-and-data-protection-considerations)
- [10 Conformance](#10-conformance)
  - [10.1 Introduction](#101-introduction)
  - [10.2 Conformance Tables](#102-conformance-tables)
    - [10.2.1 Profile Identifier](#1021-profile-identifier)
    - [10.2.2 Attributes](#1022-attributes)
    - [10.2.3 Action Attribute Values](#1023-action-attribute-values)
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
  - [C.4 Action Attribute Values](#c4-action-attribute-values)
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

This ACAL profile defines how to express core and hierarchical role based access control (RBAC) using ACAL policies. It defines:

- how a role is carried in a request, as a subject attribute ([Section 5.1](#51-roles-and-role-attributes));
- the **Role Policy** and **Permission Policy** constructs, how a Role Policy makes the permissions of a role applicable only to holders of that role, and the structural constraints on each ([Section 5.3](#53-access-control));
- how a role inherits the permissions of one or more junior roles ([Section 5.3.3](#533-role-hierarchy));
- the optional **HasPrivilegesOfRole Rule**, by which a request may ask whether a subject has the privileges associated with a given role ([Section 5.3.4](#534-hasprivilegesofrole-rule));
- how multi-role permissions — permissions that require a subject to hold several roles at once — are expressed ([Section 5.4](#54-multi-role-permissions));
- the identifiers this profile introduces ([Annex C](#annex-c-acal-identifiers)).

RBAC is expressed entirely with ACAL Core constructs: this profile introduces no new object type, and no new schema artifact. It does not define how roles are assigned to, or enabled for, a subject — that is the responsibility of a Role Enablement Authority outside the PDP, and is out of scope ([Section 5.2](#52-role-assignment-and-enablement)). Concrete representations (data formats) for the policy and request/response structures used here are those of the ACAL XML, JSON and YAML representation specifications, unchanged.

---


# 2 Definitions and Acronyms


## 2.1 Definitions


### 2.1.1 Terms Defined Elsewhere


This document uses the following terms defined elsewhere:

See Section 2 of [[ACAL-Core-1.0](#acal-core-10)].

### 2.1.2 Terms Defined in this Document

`Role`

: A named collection of permissions. In this profile a role is carried in a request by a subject attribute — by its value, or, in an identifier-per-role deployment, by its presence; see [Section 5.1](#51-roles-and-role-attributes).

`Role Policy`

: A `PolicyType` object whose `Target` makes it applicable only to subjects holding a given role, and whose only content is a reference to the Permission Policy for that role. See [Section 5.3.1](#531-role-policy). Abbreviated **RP**. (Called a Role `<PolicySet>` in [[RBAC](#rbac)].)

`Permission Policy`

: A `PolicyType` object that carries the permissions of a given role — the resources and actions its holders may access — and, for a role that is senior in a hierarchy, references to the Permission Policies of its junior roles. See [Section 5.3.2](#532-permission-policy). Abbreviated **PP**. (Called a Permission `<PolicySet>` in [[RBAC](#rbac)].)

`HasPrivilegesOfRole Rule`

: An optional `Rule`, directly in a Permission Policy's `CombinerInput`, that permits a request asking whether a subject has the privileges of the role. See [Section 5.3.4](#534-hasprivilegesofrole-rule).

`Role Enablement Authority`

: An entity, outside the PDP, that assigns roles to subjects and enables roles within a subject's session. Its form is not prescribed by this profile. See [Section 5.2](#52-role-assignment-and-enablement).

`junior role` / `senior role`

: In a role hierarchy, a role B is *junior* to a role A (equivalently, A is *senior* to B) when the holders of A are entitled to every permission of B in addition to their own. See [Section 5.3.3](#533-role-hierarchy).

### 2.1.3 Related terms

None.


## 2.2 Abbreviations and Acronyms

`RBAC`

: Role Based Access Control.

`RP`

: Role Policy.

`PP`

: Permission Policy.

---


# 3 Document Conventions


## 3.1 Key Words


The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this document are to be interpreted as described in BCP 14 [[RFC2119](#rfc2119)] [[RFC8174](#rfc8174)] when, and only when, they appear in all capitals, as shown here.


## 3.2 Typographical Conventions

None.

---


# 4 Introduction (non-normative)


## 4.1 Background

Role based access control lets a policy be written in terms of the roles a subject holds rather than the identity of the subject. A hospital policy can say "an attending physician may read a patient record" once, and every subject who holds the `physician` role gets that access, without the policy naming any of them. When a subject changes jobs, the set of roles enabled for that subject changes, and the permissions follow automatically — the policies do not need to be rewritten. This is the property that makes RBAC scale.

ACAL is attribute-centric, and a role is just an attribute: this profile carries a role by a subject attribute in the request context — by the attribute's value or, in an identifier-per-role deployment, by its presence. What the profile adds is a disciplined way to *organize* policies around roles so that the RBAC properties hold — in particular, so that adding, removing, or re-parenting a role changes `PolicyReference` objects rather than rule content, and touches only the policies of that role and of its immediate seniors ([Section 5.3.3](#533-role-hierarchy)).

The two questions an RBAC policy written to this profile answers are:

1. Given that a subject has roles R₁, R₂, … Rₙ enabled, may that subject perform a given action on a given resource?
2. Given that a subject has roles R₁, R₂, … Rₙ enabled, does that subject have the permissions associated with some role R′? (See [Section 5.3.4](#534-hasprivilegesofrole-rule).)

It does **not** answer "which roles does subject X hold?". That is a question for a Role Enablement Authority, not for the PDP — see [Section 5.2](#52-role-assignment-and-enablement). This profile also does not address dynamic role enablement or Separation of Duty; those are out of scope here exactly as they are in [[RBAC](#rbac)] §1.7.

## 4.2 The Core and Hierarchical RBAC Model

The ANSI/INCITS RBAC model [[ANSI-RBAC](#ansi-rbac)] names five data elements. This profile maps them onto ACAL as follows:

| RBAC element | ACAL |
|---|---|
| User | A subject — a `RequestEntityType` object in a subject category. |
| Role | A subject attribute: its value, or, in an identifier-per-role deployment, its presence ([Section 5.1](#51-roles-and-role-attributes)). |
| Object | A resource — a `RequestEntityType` object in the resource category. |
| Operation | An action — carried by the `urn:oasis:names:tc:acal:1.0:action:action-id` attribute. |
| Permission | An (object, operation) pair a role's holders may exercise, expressed as a `RuleType` or nested `PolicyType` object within that role's Permission Policy ([Section 5.3.2](#532-permission-policy)). |

*Hierarchical* RBAC adds inheritance between roles: a senior role's holders receive every permission of its junior roles. This profile implements inheritance by reference — a senior role's Permission Policy contains a `PolicyReference` to each junior role's Permission Policy ([Section 5.3.3](#533-role-hierarchy)). Because inheritance lives in the senior role's own policy, a role can be given a new junior role at any time without editing any other role's policies.

A policy set built this way need not be the whole of a PDP's policy, and in practice often is not. The construction is meant to be evaluated alongside policies that are not role-based, so that role-derived permissions and other authorization decisions combine in a single policy set. [Section 5.3](#53-access-control)'s requirement that no Permission Policy return `Deny` is what makes that combination safe: the RBAC policies contribute grants, and never withhold a grant another policy makes. How the two are combined — and what the PDP entry point is in such an arrangement — is a deployment decision this profile does not make ([Section 5.3.5](#535-the-pdp-entry-point)).

## 4.3 Changes From the Previous Version

This is the first ACAL version of this profile, ported from _XACML v3.0 Core and Hierarchical Role Based Access Control (RBAC) Profile Version 1.0_, **Committee Specification 02, 23 October 2014** [[RBAC](#rbac)]. (Within this document, `[RBAC]` denotes that OASIS profile. ACAL Core's own `[RBAC]` bibliography entry is a different, unrelated reference — the 1992 Ferraiolo/Kuhn conference paper, cited from ACAL Core §4.5 as the academic origin of role based access control — and is not affected by this profile.)

The following substantive changes and decisions apply relative to the XACML 3.0 source:

- **`<PolicySet>` is gone.** ACAL Core merged XACML's `<Policy>` and `<PolicySet>` into a single `PolicyType` object that may contain rules, nested policies, and policy references. Both of [[RBAC](#rbac)]'s policy kinds are `PolicyType` objects in ACAL: a **Role Policy** in place of a Role `<PolicySet>`, a **Permission Policy** in place of a Permission `<PolicySet>`. Every `<PolicySetIdReference>` becomes a `PolicyReference` — ACAL has one reference construct, not a `<PolicyIdReference>`/`<PolicySetIdReference>` pair, and the RBAC constructs never depended on the distinction.
- **No Role Assignment PolicySet, no `enableRole`.** [[RBAC](#rbac)] CS02 already dropped the XACML 2.0 RBAC profile's Role Assignment `<PolicySet>` and `enableRole` action; [Section 5.2](#52-role-assignment-and-enablement) is out of scope here for the same reason it is there. This profile therefore has no dependency on the ACAL administration and delegation profile.
- **Identifier namespace.** All identifiers this profile uses in place of an XACML 3.0 RBAC identifier use the `urn:oasis:names:tc:acal:1.0:` prefix, with the XACML identifier recorded as a deprecated equivalent, per the standard ACAL convention ([Section 10.2](#102-conformance-tables)): the profile identifier `urn:oasis:names:tc:xacml:3.0:profiles:rbac:core-hierarchical` → `urn:oasis:names:tc:acal:1.0:profile:rbac`; the role attribute `urn:oasis:names:tc:xacml:2.0:subject:role` → `urn:oasis:names:tc:acal:1.0:subject:role`. The HasPrivilegesOfRole action value is not an identifier: `urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole` is recorded as the deprecated form of the value `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role`, not as an equivalent identifier ([Section 10.2.3](#1023-action-attribute-values)).
- **The role attribute's use stays RECOMMENDED, not required** — a deployment MAY use one or more other attribute identifiers for roles, exactly as [[RBAC](#rbac)] §5.1 allows. See [Section 5.1](#51-roles-and-role-attributes).
- **The "initial policy" constraint is expressed against the ACAL PDP model, and its "reachable only through the Role PolicySet" half is written as a normative rule.** [[RBAC](#rbac)] §5.3 requires that "the PDP can never use a Permission `<PolicySet>` as the PDP's initial policy" and §1.9 adds that a Permission `<PolicySet>` be "reachable only through the corresponding Role `<PolicySet>`". ACAL Core defines the PDP's entry point precisely — the policy named by the `PolicyReference` of the `BundleType` object that defines the PDP ([[ACAL-Core-1.0](#acal-core-10)] Section 8.15). [Section 5.3.5](#535-the-pdp-entry-point) constraints 2, 3 and 4, together with [Section 5.3.2](#532-permission-policy) constraint 3, state both halves as one graph invariant: on every evaluation path from the entry point, a Permission Policy is reached only through its own Role Policy or through the hierarchy.
- **A single combining algorithm and Permit-only rules.** [[RBAC](#rbac)] §5.3 and §6 mandate no combining algorithm (the examples in [[RBAC](#rbac)] §2 use permit-overrides for illustration only). This profile does mandate one, in [Section 5.3](#53-access-control): every `Rule` beneath a Permission Policy has an `Effect` of `Permit`, and every Role Policy, Permission Policy, and policy nested within or referenced from a Permission Policy uses `permit-overrides` or `ordered-permit-overrides`. This is new relative to [[RBAC](#rbac)], which does not address the question. The reason is not that every other algorithm would break inheritance — given the Permit-only rule, `deny-overrides`, fed only `Permit`, `NotApplicable` and `Indeterminate{P}`, reaches the same decisions as `permit-overrides`, although `first-applicable` can return an earlier `Indeterminate{P}` where a later child would grant. It is that the algorithms which *synthesize* a decision where nothing applied (`permit-unless-deny`, `deny-unless-permit`) must be excluded, and that naming a single algorithm keeps a role hierarchy re-parentable without re-examining the combining behaviour of the policies involved. The rules also make an RBAC policy set composable with non-RBAC policies: with no `Deny` rule beneath it, a Permission Policy never returns `Deny`, so it cannot deny an access that a policy evaluated alongside it intends to permit. A prohibition is expressed outside the RBAC policy set ([Section 6.1](#61-combining-algorithms)).
- **Role Policy Target restated as an expression constraint.** A Role Policy's `Target` is an ACAL `BooleanExpressionType` — one boolean expression — not XACML's `<AnyOf>`/`<AllOf>`/`<Match>` structure. [[RBAC](#rbac)] §5.3's "applicable only to Subjects having the [role]; the `<Target>` … SHALL NOT restrict the Resource, Action, or Environment" is restated in [Section 5.3.1](#531-role-policy) as: the expression is true only if the role is present, and it references only subject-category attributes. The direction of the applicability rule is preserved (only-if, not iff) so that a Role Policy Target testing several roles at once ([Section 5.4](#54-multi-role-permissions)) or an additional subject predicate remains valid. This matches the ACAL Hierarchical Resource and Multiple Decision Profiles, whose example policies also use the boolean `Apply` form.
- **HasPrivilegesOfRole is a `Rule`, not a wrapped `<Policy>`.** [[RBAC](#rbac)] §5.3 defines the feature as a HasPrivilegesOfRole `<Policy>` — a `<Policy>` wrapping one Permit `<Rule>` — inside the Permission `<PolicySet>`, and [[RBAC](#rbac)] §2.5's example carries the whole test (action *and* queried role) in that `<Rule>`'s `<Condition>`. XACML needs the wrapper only because a `<PolicySet>` cannot contain a `<Rule>` directly. An ACAL `PolicyType` object's `CombinerInput` holds `Rule` objects freely, so this profile drops the wrapper: the HasPrivilegesOfRole Rule sits directly in the Permission Policy ([Section 5.3.4](#534-hasprivilegesofrole-rule)). A `Rule` has no `Target` and no `CombiningAlgId`, so the action test is necessarily in its `Condition` and there is no combining algorithm to constrain.
- **A composite-role Permission Policy is inheritable, matching [[RBAC](#rbac)].** [[RBAC](#rbac)] §1.10 expressly permits a senior role to inherit a multi-role `<PolicySet>`'s permissions; [Section 5.4](#54-multi-role-permissions) preserves that. The judgment involved — is the senior role a suitable guarantor of the permission set a composite role's required roles, held together, represent — is the same kind of judgment already relied on for every other inheritance edge in the hierarchy, not a distinct risk this profile singles out; see [Section 6.3](#63-structuring-a-role-hierarchy).
- **HasPrivilegesOfRole is isolated from ordinary permission rules, where supported.** [[RBAC](#rbac)] does not address whether an ordinary permission rule may itself answer a HasPrivilegesOfRole query; nothing in a naive port of CS02's structure prevents one from doing so by accident, which makes a HasPrivilegesOfRole `Permit` indistinguishable from an ordinary `Permit` that merely happened to match. [Section 5.3.2](#532-permission-policy) constraint 4 requires that, where a PDP supports HasPrivilegesOfRole, every ordinary `Rule` and nested `Policy` in a Permission Policy sit inside one nested `Policy` whose `Target` excludes the reserved action, leaving the HasPrivilegesOfRole Rule and the junior-role hierarchy as the only children able to answer such a query. This is new relative to [[RBAC](#rbac)]. A PDP that does not support HasPrivilegesOfRole is not subject to this constraint.
- **HasPrivilegesOfRole action and resource-role cardinality are now constrained, and its role test now covers both role-attribute schemes.** [[RBAC](#rbac)] does not say whether the reserved action or the queried role may be multi-valued. [Section 5.3.4](#534-hasprivilegesofrole-rule) constraint 1 now requires the `action-id` attribute to carry exactly the reserved value and no other, and treats a resource carrying evidence of more than one role existentially — `Permit` if the subject has the privileges of any one of them. Constraint 1(b) is also corrected to test an identifier-per-role deployment's resource attribute the same way [Section 5.3.1](#531-role-policy) constraint 1 already tests one on the subject side (presence, not value) — an oversight in the original port that carried forward the shared-role-attribute scheme's phrasing as if it were the only one [Section 5.1](#51-roles-and-role-attributes) allows. This is new relative to [[RBAC](#rbac)].
- **The subject-restriction ban applies only to the Permission Policy's own `Target`.** [[RBAC](#rbac)] §5.3 forbids a subject restriction in the `<Target>` of the Permission `<PolicySet>` *and* of every `<PolicySet>`, `<Policy>` and `<Rule>` it includes or references. [Section 5.3.2](#532-permission-policy) constraint 2 keeps the ban only on the Permission Policy's own `Target` — the construct that alone gates the whole policy's applicability, and therefore inheritance. The XACML-wide `<Target>` ban was in any case porous: an ACAL `RuleType` object has no `Target`, and an ordinary `Rule`'s `Condition` MAY reference subject attributes. A subject predicate deeper in the policy — a nested `PolicyType` object's `Target`, or an ordinary `Rule`'s `Condition` — is permitted but still narrows the access beneath it ([Section 9](#9-safety-security-and-data-protection-considerations)). (A HasPrivilegesOfRole Rule is the exception: [Section 5.3.4](#534-hasprivilegesofrole-rule) constraint 3 forbids a subject test in *its* `Condition`.)
- **Two clarifications to ACAL Core** accompany this profile, because RBAC is the first ACAL profile to lean on the PDP's policy-set and reference-resolution model directly:
  - [[ACAL-Core-1.0](#acal-core-10)] Section 8.13 now specifies how a policy reference is resolved against the policies that define the PDP — by `PolicyId` and version, for any reference in a policy's `CombinerInput`; the entry-point reference must resolve within that set ([[ACAL-Core-1.0](#acal-core-10)] Sections 7.46 and 8.13). [[ACAL-Core-1.0](#acal-core-10)] Section 7.8's "outside the scope" sentence is narrowed to cover only locating a policy that is *not* among those that define the PDP by a mechanism other than the optional retrieval from a URL that [[ACAL-Core-1.0](#acal-core-10)] Section 8.13 specifies (for example an external repository). This is a resolution-model clarification, not a change of any evaluation outcome for a policy set whose `CombinerInput` references all resolve within the PDP's policy set; reviewers should read it against [[ACAL-Core-1.0](#acal-core-10)] Sections 7.8, 7.46 and 8.15.
  - [[ACAL-Core-1.0](#acal-core-10)] Section 8.10's phrase "the top level policy" now points at its definition in [[ACAL-Core-1.0](#acal-core-10)] Section 8.15.

- **No new schema artifacts.** Like the ACAL Hierarchical Resource and Multiple Decision Profiles, this profile defines identifiers and policy-authoring rules, not new object types; `PolicyType`, `PolicyReferenceType`, `RuleType` and `BundleType` already exist in ACAL Core's XSD, JSON Schema and YAML structure/constraint artifacts.
- **Renames**, consistent with ACAL Core: `<PolicySet>` → `PolicyType` (a *policy*); `<PolicySetIdReference>` → `PolicyReference`; `<Policy>` → nested `PolicyType`; `<Rule>` → `RuleType`; `<AttributeValue>` → `Value`; `<AnyOf>`/`<AllOf>`/`<Match>` → a boolean `Apply` expression.

---


# 5 Profile

This section is normative. It defines the role attribute, and the Role Policy / Permission Policy construction by which an ACAL PDP implements core and hierarchical RBAC.

## 5.1 Roles and Role Attributes

A role that a subject holds SHALL be carried in a request by a subject attribute — a `RequestAttributeType` object within a `RequestEntityType` object whose `Category` is a subject category (for example `urn:oasis:names:tc:acal:1.0:subject-category:access-subject`) — either as the attribute's value or, in an identifier-per-role deployment (below), by the attribute's presence. A subject MAY hold more than one role at once, carried as multiple values of one shared role attribute or, in an identifier-per-role deployment, by the presence of several role attributes. A role attribute MAY appear in any subject category involved in the request.

Each deployment using this profile SHALL define, or agree upon, the attribute identifier or identifiers it uses for roles. Use of the identifier

`urn:oasis:names:tc:acal:1.0:subject:role`

for every role attribute is RECOMMENDED; where it is used, the corresponding attribute values SHOULD be of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI`. A deployment MAY instead use distinct attribute identifiers for distinct roles (for example `urn:example:attributes:officer-role`), in which case the presence of the attribute, rather than its value, indicates the role.

There is one place where a role is carried other than as a subject attribute: in a request answered by a HasPrivilegesOfRole Rule, the role being asked about is carried as a **resource** attribute — see [Section 5.3.4](#534-hasprivilegesofrole-rule).

## 5.2 Role Assignment and Enablement

The assignment of roles to subjects, and the enabling of roles within a subject's session, are outside the scope of the ACAL PDP and of this profile. This profile assumes that a role attribute present in the request context for a given subject is a valid assignment at the time the decision is requested.

One or more entities outside the PDP, here called Role Enablement Authorities, are responsible for those functions. This profile prescribes no form for a Role Enablement Authority: it may be an identity-management service, a session manager, an attribute authority, or any other component, and it MAY itself use ACAL policies to decide which roles a subject may enable. Such policies are not defined by this profile.

## 5.3 Access Control

An ACAL PDP implements RBAC using two kinds of policy: a **Role Policy** and a **Permission Policy**. For each role, there SHALL be exactly one Role Policy and exactly one Permission Policy. A permission set that requires several roles held at once is treated, for the purposes of this section, as its own (composite) role with its own Role Policy and Permission Policy — see [Section 5.4](#54-multi-role-permissions).

This profile describes one way to implement RBAC in ACAL, not the only one. Rather than admit every policy shape that could be made to work, it fixes a single scheme:

1. Every `RuleType` object in a Permission Policy, or in any `PolicyType` object reachable from it — nested or referenced, at any depth — SHALL have an `Effect` of `Permit`.
2. The `CombiningAlgId` of a Role Policy, of a Permission Policy, and of every `PolicyType` object reachable from a Permission Policy — nested within it or referenced from it, at any depth, and including policies reached in turn from those — SHALL be `urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides` or `urn:oasis:names:tc:acal:1.0:combining-algorithm:ordered-permit-overrides`.

Constraint 1 is what makes a Permission Policy contribute grants only. With no `Deny` beneath it, the algorithms ACAL Core defines that *synthesize* a decision where none of a policy's children applied — `permit-unless-deny`, which yields `Permit`, and `deny-unless-permit`, which yields `Deny` — would change a Permission Policy's contribution, and constraint 2 excludes both.

Constraint 2 is a choice of one algorithm rather than a set. Given constraint 1, several of Core's algorithms would behave identically here: fed only `Permit`, `NotApplicable` and `Indeterminate{P}`, `deny-overrides` ([[ACAL-Core-1.0](#acal-core-10)] Annex E.2) reaches the same decision as `permit-overrides` ([[ACAL-Core-1.0](#acal-core-10)] Annex E.4), because the steps by which it would prefer a `Deny` have no `Deny` to act on. `first-applicable` ([[ACAL-Core-1.0](#acal-core-10)] Annex E.8) does not: it returns an earlier child's `Indeterminate{P}` even where a later child, such as an inherited junior Permission Policy, would return `Permit`. The reason for naming one is not only that such an algorithm can withhold an inherited grant, but also that a role hierarchy is rearranged as an organization changes, and a policy set in which Permission Policies used different algorithms would have to be re-examined each time a role was re-parented. One algorithm throughout keeps re-parenting a change to `PolicyReference` objects alone ([Section 5.3.3](#533-role-hierarchy)). `permit-overrides` is the one named because it states the intent directly: any grant reached from this policy is a grant.

These two constraints are necessary for the role hierarchy to behave as RBAC requires, but they are not on their own sufficient. A senior role's holders receive every permission of its junior roles only when the seniority references are present ([Section 5.3.3](#533-role-hierarchy)), when no Permission Policy restricts the subjects to which it applies ([Section 5.3.2](#532-permission-policy) constraint 2), when a Permission Policy is reached only through its own Role Policy or the hierarchy ([Section 5.3.5](#535-the-pdp-entry-point)), and when no notice on the path turns a grant into an error ([Section 5.3.6](#536-notices)). Each of those is stated separately because each can fail separately.

They also keep an RBAC policy set composable. When every policy reachable from a Permission Policy evaluates without error, the Permission Policy evaluates to `Permit`, `NotApplicable`, or `Indeterminate{P}`, and never to `Deny` — its rules can only permit, and the policy truth table ([[ACAL-Core-1.0](#acal-core-10)] Section 8.12, Table 3) carries no `Deny` upward from children that produced none. This does not hold when an evaluation error intervenes: an unresolvable or circular `PolicyReference` ([[ACAL-Core-1.0](#acal-core-10)] Section 8.13), a notice whose condition or assignment is `Indeterminate` ([[ACAL-Core-1.0](#acal-core-10)] Section 8.16, and see [Section 5.3.6](#536-notices)), or a processing error ([[ACAL-Core-1.0](#acal-core-10)] Section 8.17) yields a plain `Indeterminate`, which an enclosing combining algorithm treats as `Indeterminate{DP}` ([[ACAL-Core-1.0](#acal-core-10)] Annex E.1). A Permission Policy therefore contributes a grant, silence, or an error — never a deliberate denial. Pure RBAC grants permissions; it does not prohibit. A Permission Policy able to return `Deny` would deny an access that a policy evaluated alongside this policy set intends to permit, and a `Deny` synthesized where the role's own rules simply did not match is indistinguishable from a deliberate prohibition. A prohibition that is to hold regardless of the roles a subject holds is therefore expressed outside the RBAC policy set — see [Section 6.1](#61-combining-algorithms).


### 5.3.1 Role Policy

A Role Policy for a role is a `PolicyType` object that:

1. SHALL have a `Target`. The `Target` expression SHALL evaluate to `true` for a request only if the request context contains, in a subject category, the role attribute and value (or, for an identifier-per-role deployment, the role attribute) for this role, or, for a composite role ([Section 5.4](#54-multi-role-permissions)), each of its constituent roles. The `Target` expression SHALL reference only subject-category attributes — every `AttributeDesignator` or `AttributeSelector` in the expression, including those reached through a `VariableReference`, SHALL name a subject category; it SHALL NOT reference a resource, action or environment attribute. (This is the ACAL form of [[RBAC](#rbac)] §5.3's rule that a Role `<PolicySet>`'s `<Target>` makes it applicable only to the subject and SHALL NOT restrict the Resource, Action, or Environment.)
2. SHALL contain, in its `CombinerInput`, exactly one `PolicyReference` — to the Permission Policy for this role ([Section 5.3.2](#532-permission-policy)) — and SHALL NOT contain any other `PolicyReference`, any nested `Policy`, or any `Rule`.

Because a Role Policy's `Target` is the only thing that gates a subject's access to a role's permissions, a `Target` that is stricter than "the role is present" silently withholds permissions rather than causing an error. See [Section 6.2](#62-matching-role-attributes-in-a-target).

### 5.3.2 Permission Policy

A Permission Policy for a role is a `PolicyType` object that:

1. SHALL contain, in its `CombinerInput`, only the following, in any combination: `Rule` objects and nested `Policy` objects describing the resources and actions the holders of this role may access, optionally including a HasPrivilegesOfRole Rule ([Section 5.3.4](#534-hasprivilegesofrole-rule)); and a `PolicyReference` to the Permission Policy of a role junior to this one ([Section 5.3.3](#533-role-hierarchy) requires one for each *immediately* junior role, and permits others). It SHALL NOT contain a `PolicyReference` to a Role Policy — role inheritance is expressed only between Permission Policies.
2. SHALL NOT restrict, in its own `Target`, the subjects to which it applies. ([[RBAC](#rbac)] §5.3 requires that "the `<Target>` of the `<PolicySet>` and its included or referenced `<PolicySet>`, `<Policy>`, and `<Rule>` elements SHALL NOT limit the Subjects". This profile keeps the ban only on the Permission Policy's own `Target`: an ACAL `RuleType` object has no `Target`, and an ordinary `Rule`'s `Condition` MAY reference subject attributes — for example to permit access only to a subject who owns the requested resource — so a subject predicate on a nested `PolicyType` object's `Target` has no greater effect and is likewise permitted. A HasPrivilegesOfRole Rule is the exception — [Section 5.3.4](#534-hasprivilegesofrole-rule) constraint 3 forbids a subject test in its `Condition`.) What is forbidden is gating a Permission Policy's *applicability* on the subject: a Permission Policy is made applicable to a subject solely by being referenced from that role's Role Policy, and a subject restriction in its own `Target` would break inheritance, because a senior role's holders — who do not necessarily hold the junior role's attribute — reach the junior Permission Policy by reference.
3. SHALL be reached only through its own Role Policy or through the hierarchy, per [Section 5.3.5](#535-the-pdp-entry-point) constraints 2, 3 and 4: it SHALL be the target of a `PolicyReference` only from this role's Role Policy ([Section 5.3.1](#531-role-policy)) or from the Permission Policy of a role senior to it ([Section 5.3.3](#533-role-hierarchy)), SHALL NOT be named by the `PolicyReference` of a `BundleType` object, and SHALL NOT be nested as a `Policy` in any policy. 
   (This is what makes a Permission Policy "reachable only through the corresponding Role `<PolicySet>`" ([[RBAC](#rbac)] §1.9) in ACAL terms.)
4. If the PDP supports HasPrivilegesOfRole ([Section 5.3.4](#534-hasprivilegesofrole-rule)), the Permission Policy's `CombinerInput` SHALL contain only: its HasPrivilegesOfRole Rule; the `PolicyReference` objects constraint 1 permits; and at most one nested `Policy` object, which SHALL hold every `Rule` and nested `Policy` object describing the resources and actions the holders of this role may access. Those rules and policies keep whatever structure they would otherwise have had; only their common parent is new. A Permission Policy that has no permissions of its own — one that only inherits — has no such nested `Policy`.

That nested `Policy`'s `Target` SHALL evaluate to `false` whenever the request's `urn:oasis:names:tc:acal:1.0:action:action-id` attribute contains the value `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role`, and SHALL evaluate to `true` or `false` — never `Indeterminate` — for every other request. A `Target` that is `Indeterminate` where the `action-id` attribute is absent (a designator with `MustBePresent` `true`, for instance) turns an inherited grant into an error, the failure [Section 5.3.6](#536-notices) guards against for notice expressions on the same path.

   A PDP that does not support HasPrivilegesOfRole is not subject to this constraint; its Permission Policies hold their `Rule` and nested `Policy` objects as constraint 1 describes.

   Without this separation, an ordinary `Rule` or nested `Policy` that happens to evaluate to `Permit` for a HasPrivilegesOfRole query — nothing about constraint 1 requires it not to — is indistinguishable in the response from a `Permit` produced by the HasPrivilegesOfRole Rule itself: the query stops being about the queried role and starts being about whatever else in the Permission Policy happened to match, silently, with no status code or marker. The exclusion isolates the HasPrivilegesOfRole Rule (and, through the junior-role `PolicyReference`s left outside it, the hierarchy's own HasPrivilegesOfRole Rules) as the only children able to answer such a query. [Section 5.3.4](#534-hasprivilegesofrole-rule) constraint 3 establishes that a matching Rule yields a `Permit`; this constraint establishes the converse, which nothing else in this profile secures: that a `Permit` from a Permission Policy on this action means the HasPrivilegesOfRole Rule for some reachable role actually matched.

### 5.3.3 Role Hierarchy

A role A is *senior* to a role B when A's holders are entitled to every permission of B. This is expressed by placing, in A's Permission Policy, a `PolicyReference` to B's Permission Policy. A's Permission Policy SHALL include a `PolicyReference` to the Permission Policy of each role *immediately* junior to A. Because inheritance is transitive through these references, the permissions of every role junior to A — immediately or otherwise — are thereby reached; a `PolicyReference` to a role that is junior to A but not immediately junior is permitted, but redundant.

Inheritance is resolved by ordinary ACAL policy-reference evaluation ([[ACAL-Core-1.0](#acal-core-10)] Section 8.13). A cycle in these references would mean two roles were each senior to the other; Core requires a PDP to detect circular references either when policies are loaded or during evaluation, and a cycle detected during evaluation makes the reference `Indeterminate` with status `urn:oasis:names:tc:acal:1.0:status:processing-error` rather than being reported as an invalid policy set. A deployment that wants a cyclic hierarchy rejected outright relies on load-time detection. Making role B junior to role A is a single `PolicyReference` added to A's Permission Policy; the Permission Policies of B and of every other role are unchanged. (Removing a role, or moving it to a different point in the hierarchy, changes the `PolicyReference` objects in the Permission Policies of its former and new senior roles — those references, but no rule content, move.)

### 5.3.4 HasPrivilegesOfRole Rule

Support for requests asking whether a subject has the privileges of a role is OPTIONAL. A PDP that supports them SHALL include a HasPrivilegesOfRole Rule in **every** Permission Policy; a PDP that does not support them SHALL NOT include one in any Permission Policy. Partial support — the Rule in some Permission Policies but not others — is not conformant: a query about a role whose Permission Policy carries no such Rule is answered as though the subject lacked the role's privileges, which is indistinguishable from a correct negative answer. (This is [[RBAC](#rbac)] §1.9's rule that "if this type of request is to be supported, then a HasPrivilegesOfRole `<Policy>` must be included in each Permission `<PolicySet>`", restated for the ACAL form of the construct; §2.5 states it the same way.)

A HasPrivilegesOfRole Rule is a `Rule` with `Effect` `Permit`, directly in the Permission Policy's `CombinerInput`, that lets a request ask whether a subject has the privileges of this role without naming any resource or action of it. ([[RBAC](#rbac)] §5.3 defines the feature as a HasPrivilegesOfRole `<Policy>` — a `<Policy>` wrapping one Permit `<Rule>` — inside the Permission `<PolicySet>`. XACML needs the wrapper because a `<PolicySet>` cannot contain a `<Rule>`; an ACAL `PolicyType` object can, so this profile places the rule directly. [[RBAC](#rbac)] §2.5's example already carries the whole test in the `<Rule>`'s `<Condition>`. See [Section 4.3](#43-changes-from-the-previous-version).)

A HasPrivilegesOfRole Rule:

1. SHALL have a `Condition` that evaluates to `true` where both (a) the request's `urn:oasis:names:tc:acal:1.0:action:action-id` attribute contains exactly one value, `urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role`, and (b) the resource carries evidence of this Permission Policy's role among its resource-category attributes: for the shared role attribute ([Section 5.1](#51-roles-and-role-attributes)), that attribute contains this Permission Policy's role among however many role values it carries; for an identifier-per-role deployment, this Permission Policy's own role attribute is present, whatever value or values it carries — its presence, not its value, is what a HasPrivilegesOfRole query tests, exactly as it is what a Role Policy `Target` tests ([Section 5.3.1](#531-role-policy) constraint 1). The `Condition` SHALL evaluate to `false` for every other request and SHALL NOT evaluate to `Indeterminate` for such a request. (A cardinality test written with `urn:oasis:names:tc:acal:1.0:function:string-one-and-only` would not satisfy this: that function is `Indeterminate`, not `false`, where the attribute does not carry exactly one value. A `string-bag-size` comparison is determinate and does.) Test (a) makes the rule `NotApplicable` — and so without effect — for every request that is not a HasPrivilegesOfRole query, including a request whose `action-id` attribute carries the reserved value alongside any other action value: mixing the reserved action with an ordinary one does not yield a defined HasPrivilegesOfRole answer, and this profile does not give it one. A resource carrying evidence of more than one role — several values of the shared role attribute, or several distinct per-role attributes present at once — is answered existentially: this Permission Policy's own role need only be one of them, so a query naming several roles at once asks whether the subject has the privileges of at least one.
2. SHALL be answered by a request that carries a `RequestAttributeType` object, in the resource category, whose `AttributeId` is the identifier this Permission Policy's role uses per [Section 5.1](#51-roles-and-role-attributes) — the shared role attribute's identifier, or, for an identifier-per-role deployment, this role's own attribute identifier. That object SHALL be in the resource `RequestEntityType`; an occurrence of the same `AttributeId` in a subject `RequestEntityType` SHALL NOT by itself satisfy this constraint. (The two occurrences are independently legal in one request — ACAL's attribute-uniqueness constraint is scoped per `RequestEntityType` — [[ACAL-Core-1.0](#acal-core-10)] Section 7.33 — but only the resource one is what a HasPrivilegesOfRole Rule's `Condition` tests.)
3. SHALL NOT test any subject attribute in its `Condition`, including through a `VariableReference` — [[RBAC](#rbac)] §5.3 requires the rule to "permit any Subject" to make the query. With constraint 1, the rule then returns `Permit` for every matching query, whichever subject makes it, once evaluation reaches this Permission Policy — through this role's Role Policy, or through a senior role's Permission Policy in the hierarchy. (That `Permit` is the Permission Policy's overall result: [Section 5.3](#53-access-control) constraint 2 requires `permit-overrides` or `ordered-permit-overrides`, under which any `Permit` among the combined children decides the policy.)

A request MAY carry resource attributes other than the role attribute or attributes being asked about; a HasPrivilegesOfRole Rule's `Condition` does not reference them, and this profile places no requirement on them. A PEP constructing a HasPrivilegesOfRole request SHOULD NOT include a resource attribute other than the role attribute or attributes carrying the role or roles being queried, so that the request cannot be read as also asking an ordinary access question.

Because the HasPrivilegesOfRole Rule sits inside a Permission Policy, a senior role's holders correctly test as having the privileges of any junior role, through the same inheritance references as ordinary permissions.

### 5.3.5 The PDP Entry Point

An ACAL PDP is defined by a `BundleType` object, and evaluates every request by evaluating the policy named by that object's `PolicyReference` — the entry point ([[ACAL-Core-1.0](#acal-core-10)] Section 8.15). For a PDP implementing this profile:

1. The `BundleType` object's `Policy` property SHALL contain every Role Policy and every Permission Policy, each with a distinct `PolicyId`.
2. The `BundleType` object's `PolicyReference` SHALL NOT name a Permission Policy.
3. A Permission Policy SHALL NOT be nested as a `Policy` in another policy.
4. A Permission Policy SHALL NOT be referenced by another policy except by (a) that Permission Policy's own Role Policy ([Section 5.3.1](#531-role-policy) constraint 2) or (b) the Permission Policy of a role senior to it ([Section 5.3.3](#533-role-hierarchy)). Equivalently: on every evaluation path from the entry point, the only way to reach a Permission Policy is through its Role Policy or through the hierarchy.

These constraints are all this profile places on what lies above a Role Policy. Two arrangements are worth distinguishing.

In an **RBAC-only** PDP — one that evaluates no policies other than this profile's Role Policies and Permission Policies, the policies nested within or referenced from those Permission Policies, and the policy that combines the Role Policies — the policy named by the `BundleType` object's `PolicyReference` SHOULD also be the policy that combines the Role Policies: a `PolicyType` object whose `CombinerInput` is a `PolicyReference` to each Role Policy the PDP is to consider, even where there is only one. Its `CombiningAlgId` SHOULD be `deny-unless-permit`, so that a request matching no role yields a definite `Deny` rather than `NotApplicable` ([Section 6.1](#61-combining-algorithms)). A deployment whose PEPs are uniformly deny-biased may prefer to leave that request `NotApplicable` and let the PEP supply the denial; the recommendation assumes nothing about the PEP.

A PDP that evaluates these policies **alongside policies that are not part of this profile** — combining role-based and attribute-based authorization in one policy set — is out of scope. How the Role Policies are combined with those other policies, which policy is the PDP entry point in that arrangement, and which combining algorithm it uses are deployment decisions this profile does not constrain. Beyond constraints 1 to 4 above, this profile is silent on what lies above a Role Policy. What it guarantees is accordingly a property of the Role Policies and of the policies beneath them: on an evaluation path that reaches a Role Policy, a subject obtains a role's permissions only by holding that role or a role senior to it, and a permission a junior role's Permission Policy grants is not withheld from a senior role's holders, except by a subject predicate below that Permission Policy's own `Target` ([Section 9](#9-safety-security-and-data-protection-considerations)). What a PDP finally returns depends also on the policy that combines the Role Policies and on whatever else that policy combines them with. A policy set in which a request matching no Role Policy nonetheless yields `Permit` is not excluded by this profile; the RBAC-only shape recommended above does not produce one, and a deployment that arranges the policies otherwise is responsible for that property itself. A deployment MAY, for example, combine the Role Policies and non-RBAC policies in a single policy under a deny-biased algorithm, so that the grants of both take effect while a global prohibition overrides them.

Constraints 2, 3 and 4 are the ACAL form of [[RBAC](#rbac)] §5.3's "the PDP can never use a Permission `<PolicySet>` as the PDP's initial policy" and §1.9's "reachable only through the corresponding Role `<PolicySet>`". A Permission Policy reached other than through its Role Policy is evaluated without the role-membership test its Role Policy `Target` performs, so its grants become available to subjects who do not hold the role — to all of them, unless some `Rule` `Condition` or nested `Target` beneath it happens to narrow the set further.

### 5.3.6 Notices

A Role Policy, a Permission Policy, or a policy reachable from one MAY carry notice expressions; this profile defines no notice of its own.

A notice expression whose `AppliesTo` property matches the result, and whose condition or any of whose attribute assignment expressions evaluates to `Indeterminate`, makes the whole enclosing rule or policy `Indeterminate` ([[ACAL-Core-1.0](#acal-core-10)] Section 8.16). In an RBAC policy set that turns a grant into an error, and where the policy carrying the notice lies on an inheritance path it withholds from a senior role a permission the junior role granted — the `Permit` never reaches the senior role's Permission Policy to be combined.

A notice expression carried by a Role Policy, by a Permission Policy, or by any policy reachable from a Permission Policy SHALL therefore be written so that neither its condition nor any of its attribute assignment expressions can evaluate to `Indeterminate` for a request that reaches it. An attribute designator used in such an expression SHALL either leave `MustBePresent` at its default of `false` — so that an absent attribute yields an empty bag rather than `Indeterminate` ([[ACAL-Core-1.0](#acal-core-10)] Section 7.17) — or be reached only when the condition has already established that the attribute is present.

This constraint is on the notice expression, not on the decision: a notice that is simply not applicable, or whose condition evaluates to `false`, has no effect on the result and is unaffected by this rule.

## 5.4 Multi-Role Permissions

A permission set that a subject may exercise only while holding several roles *simultaneously* is treated as a single *composite role* with its own Role Policy and Permission Policy ([Section 5.3](#53-access-control)). The composite role's Role Policy has a `Target` that evaluates to `true` only when the request context contains every required role — every required value of the shared role attribute or, in an identifier-per-role deployment, every required role attribute — for example a boolean `and` of one role test per required role, still referencing only subject-category attributes ([Section 5.3.1](#531-role-policy)).

The composite role's Permission Policy MAY reference the Permission Policies of junior roles for inheritance, exactly as in [Section 5.3.3](#533-role-hierarchy), and MAY itself be the target of a `PolicyReference` from another role's Permission Policy, exactly as any other Permission Policy ([Section 5.3.3](#533-role-hierarchy)). A senior role that inherits a composite role's permissions this way extends its own holders the same guarantee the composite role's own definition already rests on: that its required roles, held together, are a suitable basis for the permission set. Whether a given senior role is itself a suitable guarantor of that same permission set — for example, whether every holder of the senior role can be trusted with what would otherwise require holding every one of the composite's roles at once — is a judgment for whoever designs the hierarchy, the same judgment already relied on for every other inheritance edge in it; see [Section 6.3](#63-structuring-a-role-hierarchy).

---


# 6 Policy Authoring Guidance (non-normative)

## 6.1 Combining Algorithms

[Section 5.3](#53-access-control) fixes the combining algorithm rather than leaving it to the author: a Role Policy, a Permission Policy, and every policy nested within or referenced from a Permission Policy use `permit-overrides` or `ordered-permit-overrides`, and every `Rule` beneath a Permission Policy has an `Effect` of `Permit`. Three consequences are worth making explicit for an author:

- A subject is permitted an access if *any* rule, nested policy, or inherited junior Permission Policy permits it. This is what lets a senior role's holders exercise every permission of their junior roles, and it is why the algorithm is fixed rather than chosen.
- Within a Role Policy the choice is not a real one: a Role Policy's `CombinerInput` is a single `PolicyReference` ([Section 5.3.1](#531-role-policy) constraint 2), so any permission-preserving algorithm takes the value of that one child. `permit-overrides` is required there for uniformity across the policy set, not because an alternative would evaluate differently.
- `permit-overrides` and `ordered-permit-overrides` differ only in evaluation order, which determines which notices are collected, not which decision is reached.

Above the Role Policies this profile constrains nothing ([Section 5.3.5](#535-the-pdp-entry-point)). For an RBAC-only PDP it recommends one shape: a single policy that is both the PDP entry point and the policy combining the Role Policies, using `deny-unless-permit`, so the final decision is `Permit` if and only if at least one Role Policy returns `Permit`. A subject holding several roles is thereby permitted an access that any one of their roles permits. Where these policies are evaluated alongside non-RBAC policies, that arrangement is a deployment decision the profile does not make.

Where HasPrivilegesOfRole is supported, a deployment relying on it should extend the reserved-action exclusion that [Section 5.3.2](#532-permission-policy) constraint 4 requires inside a Permission Policy to every policy that combines Role Policies with anything else, up to the PDP's entry point. The exclusion goes on the *other* inputs, not on the combining policy itself: group the non-RBAC children under a policy whose `Target` is `false` whenever `action-id` contains the reserved value, and leave the `PolicyReference`s to the Role Policies outside that group, exactly as constraint 4 leaves the HasPrivilegesOfRole Rule and the junior-role references outside the Permission Policy's wrapper. Putting the exclusion on the combining policy itself would make the Role Policies `NotApplicable` too, and the feature would never answer at all.

The reason to do this above the Role Policies is narrower than it may look. Within the RBAC policy set constraint 4 is sufficient: a Role Policy can return `Permit` for a reserved-action request only because a HasPrivilegesOfRole Rule reachable from it matched, so a subject holding several roles gets a correct existential answer, not a spurious one. The residual risk is a non-RBAC policy combined alongside the Role Policies, which this profile does not constrain and which may return `Permit` for the reserved action for reasons of its own. That matters because `deny-unless-permit`, like `permit-overrides`, returns on the first `Permit` among its children ([[ACAL-Core-1.0](#acal-core-10)] Annexes E.4 and E.6) and its children may be processed in any order, so such a policy can decide the request without the Role Policy that would have answered it ever being evaluated. This is guidance, not a constraint this profile enforces — everything above the Role Policies is a deployment decision, per [Section 5.3.5](#535-the-pdp-entry-point).

**Prohibitions.** A prohibition cannot be expressed inside the RBAC policy set: [Section 5.3](#53-access-control) requires every `Rule` beneath a Permission Policy to have an `Effect` of `Permit`, so a `Deny` rule there is not conformant. A deployment that needs a `Deny` to override a `Permit` from any role — for example a prohibition that is to hold regardless of which roles a subject holds — expresses it in a policy outside the RBAC policy set, and combines that policy with the Role Policies under a deny-biased algorithm (`deny-overrides`, or `ordered-deny-overrides` where order matters). Such an algorithm is consistent with `permit-overrides` as far as the Role Policies themselves are concerned — none of them can return `Deny` — while still letting the prohibition override every role's grant. The prohibition policy references no Permission Policy, so [Section 5.3.5](#535-the-pdp-entry-point) constraints 2, 3 and 4 still hold.

## 6.2 Matching Role Attributes in a Target

A Role Policy's `Target` ([Section 5.3.1](#531-role-policy)) typically tests a role carried as an `anyURI` value with `urn:oasis:names:tc:acal:1.0:function:anyURI-is-in`: the role value as the first argument, an `AttributeDesignator` for the role attribute as the second. For an identifier-per-role deployment, a bag-non-empty test on the role attribute's designator is used instead.

Keep the `Target` expression to exactly the role test. Anything more — a resource check, an action check, a time-of-day check — belongs in the Permission Policy's rules, not the Role Policy's `Target`: a `Target` that fails to match withholds *all* of the role's permissions silently, whereas a rule that fails to match simply does not grant that one permission.

The same two forms test the queried role in a HasPrivilegesOfRole Rule's `Condition` ([Section 5.3.4](#534-hasprivilegesofrole-rule) constraint 1(b)), against the resource-category role attribute rather than the subject-category one: `anyURI-is-in` for the shared role attribute, a bag-non-empty test on this Permission Policy's own role attribute's designator for an identifier-per-role deployment. An identifier-per-role attribute's values are semantically irrelevant ([Section 5.1](#51-roles-and-role-attributes)) and carry no required data type, so the test SHOULD NOT presume one: `urn:oasis:names:tc:acal:1.0:function:is-not-empty`, where an implementation supports it (optional), applies to a bag of any type and states the test directly. Where it is not supported, use the `*-bag-size` function matching the attribute's own declared data type — not necessarily `anyURI-bag-size` — with an `integer-greater-than` (or `not(integer-equal(..., 0))`) comparison; both functions are mandatory.

## 6.3 Structuring a Role Hierarchy

Give each role its own Role Policy and Permission Policy, and express seniority only as `PolicyReference` objects from the senior Permission Policy to each immediately-junior Permission Policy. Do not flatten a hierarchy by copying a junior role's rules into a senior role's Permission Policy — the copy has to be maintained in two places, and the point of the by-reference structure is that each seniority edge lives in exactly one place (the senior role's Permission Policy), so making one role junior to another is a single added `PolicyReference` and never touches a rule.

A composite role's Permission Policy ([Section 5.4](#54-multi-role-permissions)) can be the target of an inheritance reference like any other, but the judgment behind that reference is sharper: inheriting an ordinary junior role's permissions relies on the senior role being a suitable guarantor of that one role's permissions, while inheriting a composite role's permissions relies on the senior role being a suitable guarantor of the *combination* its required roles represent — for example, a `(doctor, staff)` role inheriting from a `(nurse, staff)` role's permissions is a defensible design because a staff doctor is a reasonable guarantor of what a staff nurse is trusted with, not because `doctor` happens to satisfy the individual attributes `nurse` and `staff` would have. That is a judgment made once, at the point the `PolicyReference` is added, exactly like every other seniority edge in the hierarchy — not a distinct kind of constraint this profile enforces.

---


# 7 Examples (non-normative)

This section works one small hierarchy end to end: an `employee` role and a `manager` role, with `manager` senior to `employee`. An employee may `read` a timesheet; a manager may additionally `read` and `approve` expense reports, and — by inheritance — do anything an employee may do. Each Permission Policy also carries a HasPrivilegesOfRole Rule for its own role — this PDP supports those queries, so every Permission Policy has one ([Section 5.3.4](#534-hasprivilegesofrole-rule)), and each Permission Policy's ordinary permissions accordingly sit inside a nested `Policy` excluding the reserved action, per [Section 5.3.2](#532-permission-policy) constraint 4. (A real deployment would narrow "read a timesheet" to the subject's *own* timesheet with a `Condition` comparing a subject attribute to a resource attribute — permitted by [Section 5.3.2](#532-permission-policy) constraint 2, which forbids subject gating only in a Permission Policy's `Target`, not in a `Rule`'s `Condition` — but that is elided here to keep the example focused on the RBAC structure.)

Role attribute values are `urn:example:roles:employee` and `urn:example:roles:manager`. Identifiers are shown in full; a real deployment would use a short identifier set ([[ACAL-Core-1.0](#acal-core-10)] Section 7.2) to abbreviate them.

## 7.1 Role and Permission Policies

Five top-level policies: one that is both the PDP entry point and the policy combining the two Role Policies ([Section 5.3.5](#535-the-pdp-entry-point) — this is an RBAC-only PDP); a Role Policy and a Permission Policy for each role. Each Permission Policy in turn holds one nested `Policy` object for its ordinary permissions ([Section 5.3.2](#532-permission-policy) constraint 4), so the example contains seven `PolicyType` objects in all. The entry point is the policy a `BundleType` object's `PolicyReference` names ([Section 5.3.5](#535-the-pdp-entry-point)); the five top-level policies appear in that object's `Policy` property. Within `Bundle.Policy` they are ordered so that each policy precedes the policy whose `PolicyReference` names it — each Permission Policy before its Role Policy, a junior role's policies before a senior role's, the entry point last. ACAL does not require this order; it is used here only to keep the set readable.

**XACML v4.0 (XML)**

```xml
<Bundle xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <Policy PolicyId="urn:example:rbac:pp:employee" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>Permission Policy: employee.</Description>
        <Rule Id="employee-has-privileges" Effect="Permit">
            <Description>HasPrivilegesOfRole: employee.</Description>
            <Condition>
                <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:integer-equal">
                            <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-bag-size">
                                <AttributeDesignator
                                    Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                    AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                                    DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                            </Apply>
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:integer">1</Value>
                        </Apply>
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role</Value>
                            <AttributeDesignator
                                Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                                DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                        </Apply>
                    </Apply>
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:roles:employee</Value>
                        <AttributeDesignator
                            Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
                    </Apply>
                </Apply>
            </Condition>
        </Rule>
        <Policy PolicyId="urn:example:rbac:pp:employee-ordinary" Version="1.0"
                CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
            <Description>Ordinary permissions: employee. Excluded from HasPrivilegesOfRole queries — Section 5.3.2 constraint 4.</Description>
            <Target>
                <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:not">
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role</Value>
                        <AttributeDesignator
                            Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                            AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                            DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                    </Apply>
                </Apply>
            </Target>
            <Rule Id="employee-timesheet" Effect="Permit">
                <Description>An employee may read a timesheet.</Description>
                <Condition>
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:resources:timesheet</Value>
                            <AttributeDesignator
                                Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                                AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
                                DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
                        </Apply>
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">read</Value>
                            <AttributeDesignator
                                Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                                DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                        </Apply>
                    </Apply>
                </Condition>
            </Rule>
        </Policy>
    </Policy>

    <Policy PolicyId="urn:example:rbac:rp:employee" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>Role Policy: employee.</Description>
        <Target>
            <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:roles:employee</Value>
                <AttributeDesignator
                    Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                    AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                    DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
            </Apply>
        </Target>
        <PolicyReference Id="urn:example:rbac:pp:employee"/>
    </Policy>

    <Policy PolicyId="urn:example:rbac:pp:manager" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>Permission Policy: manager. Inherits employee.</Description>
        <Rule Id="manager-has-privileges" Effect="Permit">
            <Description>HasPrivilegesOfRole: manager.</Description>
            <Condition>
                <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:integer-equal">
                            <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-bag-size">
                                <AttributeDesignator
                                    Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                    AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                                    DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                            </Apply>
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:integer">1</Value>
                        </Apply>
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role</Value>
                            <AttributeDesignator
                                Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                                DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                        </Apply>
                    </Apply>
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:roles:manager</Value>
                        <AttributeDesignator
                            Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                            DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
                    </Apply>
                </Apply>
            </Condition>
        </Rule>
        <Policy PolicyId="urn:example:rbac:pp:manager-ordinary" Version="1.0"
                CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
            <Description>Ordinary permissions: manager. Excluded from HasPrivilegesOfRole queries — Section 5.3.2 constraint 4.</Description>
            <Target>
                <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:not">
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-is-in">
                        <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role</Value>
                        <AttributeDesignator
                            Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                            AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                            DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                    </Apply>
                </Apply>
            </Target>
            <Rule Id="manager-expense-report" Effect="Permit">
                <Description>A manager may read and approve expense reports.</Description>
                <Condition>
                    <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:and">
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                            <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:resources:expense-report</Value>
                            <AttributeDesignator
                                Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                                AttributeId="urn:oasis:names:tc:acal:1.0:resource:resource-id"
                                DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
                        </Apply>
                        <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-at-least-one-member-of">
                            <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:string-bag">
                                <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">read</Value>
                                <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:string">approve</Value>
                            </Apply>
                            <AttributeDesignator
                                Category="urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                                DataType="urn:oasis:names:tc:acal:1.0:data-type:string"/>
                        </Apply>
                    </Apply>
                </Condition>
            </Rule>
        </Policy>
        <PolicyReference Id="urn:example:rbac:pp:employee"/>
    </Policy>

    <Policy PolicyId="urn:example:rbac:rp:manager" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides">
        <Description>Role Policy: manager.</Description>
        <Target>
            <Apply FunctionId="urn:oasis:names:tc:acal:1.0:function:anyURI-is-in">
                <Value DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">urn:example:roles:manager</Value>
                <AttributeDesignator
                    Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                    AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                    DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI"/>
            </Apply>
        </Target>
        <PolicyReference Id="urn:example:rbac:pp:manager"/>
    </Policy>

    <Policy PolicyId="urn:example:rbac:entry-point" Version="1.0"
            CombiningAlgId="urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit">
        <Description>RBAC entry point: combine the Role Policies.</Description>
        <PolicyReference Id="urn:example:rbac:rp:manager"/>
        <PolicyReference Id="urn:example:rbac:rp:employee"/>
    </Policy>

    <PolicyReference Id="urn:example:rbac:entry-point"/>
</Bundle>
```

**JACAL v1.0 (JSON)**

```json
{
    "Bundle": {
        "PolicyReference": { "Id": "urn:example:rbac:entry-point" },
        "Policy": [
            {
                "PolicyId": "urn:example:rbac:pp:employee",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "Permission Policy: employee.",
                "CombinerInput": [
                    {
                        "Rule": {
                            "Id": "employee-has-privileges",
                            "Effect": "Permit",
                            "Description": "HasPrivilegesOfRole: employee.",
                            "Condition": {
                                "Apply": {
                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
                                    "Argument": [
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
                                            "Argument": [
                                                { "Apply": {
                                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:integer-equal",
                                                    "Argument": [
                                                        { "Apply": {
                                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-bag-size",
                                                            "Argument": [
                                                                { "AttributeDesignator": {
                                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                                            ] } },
                                                        { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:integer", "Value": "1" } }
                                                    ] } },
                                                { "Apply": {
                                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                                    "Argument": [
                                                        { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" } },
                                                        { "AttributeDesignator": {
                                                            "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                            "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                            "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                                    ] } }
                                            ] } },
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                                            "Argument": [
                                                { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:roles:employee" } },
                                                { "AttributeDesignator": {
                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                                            ] } }
                                    ]
                                }
                            }
                        }
                    },
                    {
                        "Policy": {
                            "PolicyId": "urn:example:rbac:pp:employee-ordinary",
                            "Version": "1.0",
                            "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                            "Description": "Ordinary permissions: employee. Excluded from HasPrivilegesOfRole queries — Section 5.3.2 constraint 4.",
                            "Target": {
                                "Apply": {
                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:not",
                                    "Argument": [
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                            "Argument": [
                                                { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" } },
                                                { "AttributeDesignator": {
                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                            ] } }
                                    ]
                                }
                            },
                            "CombinerInput": [
                                {
                                    "Rule": {
                                        "Id": "employee-timesheet",
                                        "Effect": "Permit",
                                        "Description": "An employee may read a timesheet.",
                                        "Condition": {
                                            "Apply": {
                                                "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
                                                "Argument": [
                                                    { "Apply": {
                                                        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                                                        "Argument": [
                                                            { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:resources:timesheet" } },
                                                            { "AttributeDesignator": {
                                                                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                                                                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                                                                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                                                        ] } },
                                                    { "Apply": {
                                                        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                                        "Argument": [
                                                            { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "read" } },
                                                            { "AttributeDesignator": {
                                                                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                                "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                                        ] } }
                                                ]
                                            }
                                        }
                                    }
                                }
                            ]
                        }
                    }
                ]
            },
            {
                "PolicyId": "urn:example:rbac:rp:employee",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "Role Policy: employee.",
                "Target": {
                    "Apply": {
                        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                        "Argument": [
                            { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:roles:employee" } },
                            { "AttributeDesignator": {
                                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                                "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                        ]
                    }
                },
                "CombinerInput": [ { "PolicyReference": { "Id": "urn:example:rbac:pp:employee" } } ]
            },
            {
                "PolicyId": "urn:example:rbac:pp:manager",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "Permission Policy: manager. Inherits employee.",
                "CombinerInput": [
                    {
                        "Rule": {
                            "Id": "manager-has-privileges",
                            "Effect": "Permit",
                            "Description": "HasPrivilegesOfRole: manager.",
                            "Condition": {
                                "Apply": {
                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
                                    "Argument": [
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
                                            "Argument": [
                                                { "Apply": {
                                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:integer-equal",
                                                    "Argument": [
                                                        { "Apply": {
                                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-bag-size",
                                                            "Argument": [
                                                                { "AttributeDesignator": {
                                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                                            ] } },
                                                        { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:integer", "Value": "1" } }
                                                    ] } },
                                                { "Apply": {
                                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                                    "Argument": [
                                                        { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" } },
                                                        { "AttributeDesignator": {
                                                            "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                            "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                            "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                                    ] } }
                                            ] } },
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                                            "Argument": [
                                                { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:roles:manager" } },
                                                { "AttributeDesignator": {
                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                                            ] } }
                                    ]
                                }
                            }
                        }
                    },
                    {
                        "Policy": {
                            "PolicyId": "urn:example:rbac:pp:manager-ordinary",
                            "Version": "1.0",
                            "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                            "Description": "Ordinary permissions: manager. Excluded from HasPrivilegesOfRole queries — Section 5.3.2 constraint 4.",
                            "Target": {
                                "Apply": {
                                    "FunctionId": "urn:oasis:names:tc:acal:1.0:function:not",
                                    "Argument": [
                                        { "Apply": {
                                            "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-is-in",
                                            "Argument": [
                                                { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" } },
                                                { "AttributeDesignator": {
                                                    "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                    "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                    "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                            ] } }
                                    ]
                                }
                            },
                            "CombinerInput": [
                                {
                                    "Rule": {
                                        "Id": "manager-expense-report",
                                        "Effect": "Permit",
                                        "Description": "A manager may read and approve expense reports.",
                                        "Condition": {
                                            "Apply": {
                                                "FunctionId": "urn:oasis:names:tc:acal:1.0:function:and",
                                                "Argument": [
                                                    { "Apply": {
                                                        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                                                        "Argument": [
                                                            { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:resources:expense-report" } },
                                                            { "AttributeDesignator": {
                                                                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                                                                "AttributeId": "urn:oasis:names:tc:acal:1.0:resource:resource-id",
                                                                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                                                        ] } },
                                                    { "Apply": {
                                                        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-at-least-one-member-of",
                                                        "Argument": [
                                                            { "Apply": {
                                                                "FunctionId": "urn:oasis:names:tc:acal:1.0:function:string-bag",
                                                                "Argument": [
                                                                    { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "read" } },
                                                                    { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string", "Value": "approve" } }
                                                                ] } },
                                                            { "AttributeDesignator": {
                                                                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                                                                "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                                                                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string" } }
                                                        ] } }
                                                ]
                                            }
                                        }
                                    }
                                }
                            ]
                        }
                    },
                    { "PolicyReference": { "Id": "urn:example:rbac:pp:employee" } }
                ]
            },
            {
                "PolicyId": "urn:example:rbac:rp:manager",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides",
                "Description": "Role Policy: manager.",
                "Target": {
                    "Apply": {
                        "FunctionId": "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in",
                        "Argument": [
                            { "Value": { "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI", "Value": "urn:example:roles:manager" } },
                            { "AttributeDesignator": {
                                "Category": "urn:oasis:names:tc:acal:1.0:subject-category:access-subject",
                                "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                                "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI" } }
                        ]
                    }
                },
                "CombinerInput": [ { "PolicyReference": { "Id": "urn:example:rbac:pp:manager" } } ]
            },
            {
                "PolicyId": "urn:example:rbac:entry-point",
                "Version": "1.0",
                "CombiningAlgId": "urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit",
                "Description": "RBAC entry point: combine the Role Policies.",
                "CombinerInput": [
                    { "PolicyReference": { "Id": "urn:example:rbac:rp:manager" } },
                    { "PolicyReference": { "Id": "urn:example:rbac:rp:employee" } }
                ]
            }
        ]
    }
}
```

**YACAL v1.0 (YAML)**

```yaml
Bundle:
  PolicyReference:
    Id: "urn:example:rbac:entry-point"
  Policy:
    - PolicyId: "urn:example:rbac:pp:employee"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "Permission Policy: employee."
      CombinerInput:
        - Rule:
            Id: "employee-has-privileges"
            Effect: "Permit"
            Description: "HasPrivilegesOfRole: employee."
            Condition:
              Apply:
                FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
                Argument:
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
                      Argument:
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:integer-equal"
                            Argument:
                              - Apply:
                                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-bag-size"
                                  Argument:
                                    - AttributeDesignator:
                                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                                        DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:integer", Value: "1" }
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                            Argument:
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" }
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                                  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
                      Argument:
                        - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:roles:employee" }
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
                            DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
        - Policy:
            PolicyId: "urn:example:rbac:pp:employee-ordinary"
            Version: "1.0"
            CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
            Description: "Ordinary permissions: employee. Excluded from HasPrivilegesOfRole queries — Section 5.3.2 constraint 4."
            Target:
              Apply:
                FunctionId: "urn:oasis:names:tc:acal:1.0:function:not"
                Argument:
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                      Argument:
                        - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" }
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                            DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
            CombinerInput:
              - Rule:
                  Id: "employee-timesheet"
                  Effect: "Permit"
                  Description: "An employee may read a timesheet."
                  Condition:
                    Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
                      Argument:
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
                            Argument:
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:resources:timesheet" }
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
                                  DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                            Argument:
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "read" }
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                                  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"

    - PolicyId: "urn:example:rbac:rp:employee"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "Role Policy: employee."
      Target:
        Apply:
          FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
          Argument:
            - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:roles:employee" }
            - AttributeDesignator:
                Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
                DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
      CombinerInput:
        - PolicyReference: { Id: "urn:example:rbac:pp:employee" }

    - PolicyId: "urn:example:rbac:pp:manager"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "Permission Policy: manager. Inherits employee."
      CombinerInput:
        - Rule:
            Id: "manager-has-privileges"
            Effect: "Permit"
            Description: "HasPrivilegesOfRole: manager."
            Condition:
              Apply:
                FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
                Argument:
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
                      Argument:
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:integer-equal"
                            Argument:
                              - Apply:
                                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-bag-size"
                                  Argument:
                                    - AttributeDesignator:
                                        Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                        AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                                        DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:integer", Value: "1" }
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                            Argument:
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" }
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                                  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
                      Argument:
                        - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:roles:manager" }
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
                            DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
        - Policy:
            PolicyId: "urn:example:rbac:pp:manager-ordinary"
            Version: "1.0"
            CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
            Description: "Ordinary permissions: manager. Excluded from HasPrivilegesOfRole queries — Section 5.3.2 constraint 4."
            Target:
              Apply:
                FunctionId: "urn:oasis:names:tc:acal:1.0:function:not"
                Argument:
                  - Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-is-in"
                      Argument:
                        - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" }
                        - AttributeDesignator:
                            Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                            AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                            DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
            CombinerInput:
              - Rule:
                  Id: "manager-expense-report"
                  Effect: "Permit"
                  Description: "A manager may read and approve expense reports."
                  Condition:
                    Apply:
                      FunctionId: "urn:oasis:names:tc:acal:1.0:function:and"
                      Argument:
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
                            Argument:
                              - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:resources:expense-report" }
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:resource:resource-id"
                                  DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
                        - Apply:
                            FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-at-least-one-member-of"
                            Argument:
                              - Apply:
                                  FunctionId: "urn:oasis:names:tc:acal:1.0:function:string-bag"
                                  Argument:
                                    - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "read" }
                                    - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:string", Value: "approve" }
                              - AttributeDesignator:
                                  Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
                                  AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
                                  DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
        - PolicyReference: { Id: "urn:example:rbac:pp:employee" }

    - PolicyId: "urn:example:rbac:rp:manager"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:permit-overrides"
      Description: "Role Policy: manager."
      Target:
        Apply:
          FunctionId: "urn:oasis:names:tc:acal:1.0:function:anyURI-is-in"
          Argument:
            - Value: { DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI", Value: "urn:example:roles:manager" }
            - AttributeDesignator:
                Category: "urn:oasis:names:tc:acal:1.0:subject-category:access-subject"
                AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
                DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
      CombinerInput:
        - PolicyReference: { Id: "urn:example:rbac:pp:manager" }

    - PolicyId: "urn:example:rbac:entry-point"
      Version: "1.0"
      CombiningAlgId: "urn:oasis:names:tc:acal:1.0:combining-algorithm:deny-unless-permit"
      Description: "RBAC entry point: combine the Role Policies."
      CombinerInput:
        - PolicyReference: { Id: "urn:example:rbac:rp:manager" }
        - PolicyReference: { Id: "urn:example:rbac:rp:employee" }
```

**What this shows**

- All five top-level policies are carried in a single `BundleType` object — a `<Bundle>` element in XML, a `Bundle` object in JACAL/YACAL — whose `PolicyReference` names the **PDP entry point** (`urn:example:rbac:entry-point`), which here is also the policy combining the Role Policies — an ordinary `PolicyType` object whose `CombinerInput` is exactly the two Role Policies, referenced ([Section 5.3.5](#535-the-pdp-entry-point)). Trace any path from here: it reaches a Permission Policy only through that role's Role Policy (`rp:*` → `pp:*`) or through the hierarchy (`pp:manager` → `pp:employee`) — the reachability invariant of [Section 5.3.5](#535-the-pdp-entry-point) (constraints 2, 3 and 4). A deployment need not physically build a `BundleType` object ([[ACAL-Core-1.0](#acal-core-10)] Section 7.46) — the PDP configuration may hold the policies and the starting reference in any form — but it is the clearest way to show the whole set at once. The entry point uses `deny-unless-permit` so a request that matches no role yields a definite `Deny` — the shape [Section 5.3.5](#535-the-pdp-entry-point) recommends for an RBAC-only PDP; every other policy here uses `permit-overrides` ([Section 6.1](#61-combining-algorithms)).
- Each **Role Policy** carries the role test in its `Target` and nothing else, and a single `PolicyReference` to its Permission Policy ([Section 5.3.1](#531-role-policy)). The `Target` references only the `access-subject` role attribute.
- The **manager Permission Policy** grants its own permission (expense reports), by way of the nested `pp:manager-ordinary` policy described next, and then `PolicyReference`s the employee Permission Policy — that one line is the entire role hierarchy ([Section 5.3.3](#533-role-hierarchy)). A request from a manager to `read` a `timesheet` is permitted through this reference.
- Each Permission Policy's **ordinary permissions** sit inside one nested `Policy` (`pp:employee-ordinary`, `pp:manager-ordinary`) whose `Target` is `false` whenever the request's `action-id` carries the reserved HasPrivilegesOfRole value — [Section 5.3.2](#532-permission-policy) constraint 4, required because this PDP supports HasPrivilegesOfRole. `employee-timesheet` and `manager-expense-report` sit inside their role's wrapper; the `PolicyReference` to a junior role's Permission Policy stays outside it, so inherited HasPrivilegesOfRole Rules stay reachable.
- A **HasPrivilegesOfRole Rule** sits directly in each Permission Policy's `CombinerInput`, as a sibling of that nested wrapper rather than inside it. Its `Condition` tests the `has-privileges-of-role` action and the queried role carried as a **resource** attribute ([Section 5.3.4](#534-hasprivilegesofrole-rule)) — the Rule itself has no `Target` and no `CombiningAlgId`. Each rule names **its own** role, which is why every Permission Policy carries one: a manager asking about the `employee` role reaches the employee Permission Policy's rule through the inheritance reference, and a manager asking about the `manager` role is answered by the manager Permission Policy's own rule. A PDP either supports these queries and carries the Rule in every Permission Policy, or supports none of them ([Section 5.3.4](#534-hasprivilegesofrole-rule)).
- No construct here is specific to this profile: `PolicyType`, `PolicyReferenceType`, `RuleType`, `BooleanExpressionType` and `BundleType` are all ACAL Core.

## 7.2 An Access Request

A manager asks to `read` a timesheet. The manager holds only the `manager` role. Expected decision: `Permit` — via the manager Permission Policy's inheritance reference to the employee Permission Policy.

**XACML v4.0 (XML)**

```xml
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

**JACAL v1.0 (JSON)**

```json
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

**YACAL v1.0 (YAML)**

```yaml
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

**Evaluation.** The entry point combines the two Role Policies. The `manager` Role Policy's `Target` matches (the subject holds `urn:example:roles:manager`); the `employee` Role Policy's `Target` does not. The `manager` Role Policy references the `manager` Permission Policy: its nested `pp:manager-ordinary` policy is applicable (`action-id` is `read`, not the reserved value), but its own `manager-expense-report` rule does not match (`timesheet` ≠ `expense-report`); the `manager` Permission Policy's `PolicyReference` to the `employee` Permission Policy does, though — the `employee-timesheet` rule, inside `pp:employee-ordinary`, matches `read` on `timesheet` and yields `Permit`. Under `permit-overrides` the `manager` Role Policy therefore yields `Permit`, and the entry point — `deny-unless-permit` — yields **`Permit`**.

## 7.3 A HasPrivilegesOfRole Request

The same manager asks whether they have the privileges of the `employee` role. The action is `has-privileges-of-role`; the role in question rides as a **resource** attribute. Expected decision: `Permit`.

**XACML v4.0 (XML)**

```xml
<Request xmlns="urn:oasis:names:tc:xacml:4.0:core:schema">
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:subject-category:access-subject">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>urn:example:roles:manager</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:resource">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:subject:role"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:anyURI">
            <Value>urn:example:roles:employee</Value>
        </RequestAttribute>
    </RequestEntity>
    <RequestEntity Category="urn:oasis:names:tc:acal:1.0:attribute-category:action">
        <RequestAttribute AttributeId="urn:oasis:names:tc:acal:1.0:action:action-id"
                          DataType="urn:oasis:names:tc:acal:1.0:data-type:string">
            <Value>urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role</Value>
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
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                      "Value": [ "urn:example:roles:manager" ] }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:resource",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:subject:role",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:anyURI",
                      "Value": [ "urn:example:roles:employee" ] }
                ]
            },
            {
                "Category": "urn:oasis:names:tc:acal:1.0:attribute-category:action",
                "RequestAttribute": [
                    { "AttributeId": "urn:oasis:names:tc:acal:1.0:action:action-id",
                      "DataType": "urn:oasis:names:tc:acal:1.0:data-type:string",
                      "Value": [ "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" ] }
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
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value: [ "urn:example:roles:manager" ]
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:resource"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:subject:role"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:anyURI"
          Value: [ "urn:example:roles:employee" ]
    - Category: "urn:oasis:names:tc:acal:1.0:attribute-category:action"
      RequestAttribute:
        - AttributeId: "urn:oasis:names:tc:acal:1.0:action:action-id"
          DataType: "urn:oasis:names:tc:acal:1.0:data-type:string"
          Value: [ "urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role" ]
```

**Evaluation.** The `manager` Role Policy's `Target` matches. In the `manager` Permission Policy the nested `pp:manager-ordinary` policy is `NotApplicable` — its `Target` is `false` because `action-id` carries the reserved value — and the `manager-has-privileges` Rule does not match the queried role, so neither answers. The `PolicyReference` to the `employee` Permission Policy, which sits outside that wrapper, is what carries the query onward: there `pp:employee-ordinary` is likewise `NotApplicable`, and the `employee-has-privileges` Rule has a `Condition` — `action-id` carries exactly the one value `has-privileges-of-role`, and the resource role attribute contains `urn:example:roles:employee` — that is `true`. Decision: **`Permit`**. Note that the same `urn:oasis:names:tc:acal:1.0:subject:role` `AttributeId` appears in both the subject entity and the resource entity of this one request, which is well-formed because ACAL scopes attribute uniqueness per `RequestEntityType` ([[ACAL-Core-1.0](#acal-core-10)] Section 7.33). Had the same subject asked about `urn:example:roles:manager` instead, the `manager` Permission Policy's own HasPrivilegesOfRole Rule would answer `Permit` directly, without the inheritance reference being involved.

---


# 8 Representation Considerations

[Section 4.3](#43-changes-from-the-previous-version) states that this profile needs no new schema artifacts: Role Policies and Permission Policies are `PolicyType` objects, a HasPrivilegesOfRole Rule is a `RuleType` object, their references are `PolicyReferenceType` objects, and the PDP's policy set is a `BundleType` object — all defined by [[ACAL-Core-1.0](#acal-core-10)] and present in each representation's Core schema. There is therefore nothing for this profile's structures that the Core XSD, JSON Schema, or YAML structure/constraint artifacts do not already cover.

The profile's constraints on how policies are shaped and connected are, by their nature, not expressible in a Core schema. They are requirements on the policy set itself, stated in [Section 5](#5-profile); no Core XSD, JSON Schema, or YAML artifact detects a violation of any of them, so a policy set's conformance to them is established by the process that authors and administers it rather than by schema validation. They include, but are not limited to:

- **A Role Policy contains exactly one `PolicyReference` and no other combiner input** ([Section 5.3.1](#531-role-policy) constraint 2) — `CombinerInput` is a general list in every representation.
- **A Role Policy's `Target` references only subject-category attributes** ([Section 5.3.1](#531-role-policy) constraint 1) — checkable by walking the expression's `AttributeDesignator`/`AttributeSelector` categories, after variable expansion; not a schema check.
- **A Permission Policy does not restrict subjects in its `Target`** ([Section 5.3.2](#532-permission-policy) constraint 2).
- **The reachability graph** ([Section 5.3.5](#535-the-pdp-entry-point) constraints 2, 3 and 4): the `BundleType` object's `PolicyReference` does not name a Permission Policy, and a Permission Policy is reached only through its Role Policy or the hierarchy. Which policies are Permission Policies is a fact about the deployment's RBAC design, not the document structure.
- **The combining-algorithm safety rule** ([Section 5.3](#53-access-control)) and the **HasPrivilegesOfRole Rule shape** ([Section 5.3.4](#534-hasprivilegesofrole-rule)).
- **Ordinary permissions are isolated from HasPrivilegesOfRole, where supported** ([Section 5.3.2](#532-permission-policy) constraint 4) — that the nested `Policy` holding a Permission Policy's ordinary `Rule`s and nested `Policy` objects has a `Target` excluding the reserved action is a property of that `Target` expression's evaluation, not its shape.

Core schema validation checks object *shapes* (a `Policy` has a `CombiningAlgId`, a `CombinerInput` entry is one of `Policy`/`Rule`/`PolicyReference`, and so on); it does not check any of the above.

## 8.1 XML

The `<Bundle>` of [Section 7.1](#71-role-and-permission-policies) uses only the *Core XML Schema*'s `Bundle` element ([[XACML-Core-4.0](#xacml-core-40)]) and, within it, ordinary `Policy` elements: `PolicyReference` and nested `Policy` are among a `Policy`'s permitted children, and `Bundle` permits any number of `Policy` elements followed by one `PolicyReference`. A deployment that does not build a `Bundle` document holds the same policies and the same starting `PolicyReference` in whatever form its PDP configuration takes.

## 8.2 JSON

The `Bundle` object of [Section 7.1](#71-role-and-permission-policies) validates against the *JACAL Core JSON Schema*; `CombinerInput` entries are the standard one-key objects (`Policy`, `PolicyReference` or `Rule`) [[JACAL-Core-1.0](#jacal-core-10)] defines. The uniqueness of `PolicyId` within `Bundle.Policy` is subject to the same `uniqueItems`/keyed-comparison limitation [[JACAL-Core-1.0](#jacal-core-10)] notes for keyed lists generally; an implementation enforcing it does so outside JSON Schema validation.

## 8.3 YAML

The `Bundle` object validates against the *YACAL Core structure schema* [[YACAL-Core-1.0](#yacal-core-10)]; the `acal-core-yaml-v1.0-constraints.yaml` catalog's policy-identifier-uniqueness rule applies to `Bundle.Policy` unchanged. As with JSON, the profile-level constraints above are outside any structural check.

---


# 9 Safety, Security, and Data Protection Considerations

Refer to [[ACAL-Core-1.0](#acal-core-10)] Section 10.

The correctness of every decision made under this profile depends on the role attributes in the request context being a true reflection of the roles assigned to, and enabled for, the subject at the time of the request. This profile does not verify that; it is the responsibility of the Role Enablement Authority and the PEP ([Section 5.2](#52-role-assignment-and-enablement)). A PEP that accepts role attributes from an untrusted source, or that fails to bind them to the authenticated subject, defeats the profile.

Several structural mistakes change access silently — no error, just a wrong answer — and are worth checking for explicitly, because none is caught by schema validation ([Section 8](#8-representation-considerations)):

- A **Permission Policy reachable other than through its Role Policy** ([Section 5.3.5](#535-the-pdp-entry-point) constraints 2, 3 and 4 forbid it) — named by the `BundleType` object's `PolicyReference`, referenced by any policy other than its own Role Policy or a senior role's Permission Policy, or nested inside another policy — makes that role's permissions available without the role being tested at all. Whether every subject then obtains them depends only on what the Permission Policy's own rules happen to condition on, which is not a control the profile relies on. **This is the most serious mistake the profile guards against.**
- A **combining algorithm other than `permit-overrides` or `ordered-permit-overrides`** on a Role Policy, a Permission Policy, or any policy nested within or referenced from a Permission Policy ([Section 5.3](#53-access-control) constraint 2 requires one of those two). Other algorithms Core defines can be actively dangerous rather than merely non-conformant: `permit-unless-deny` turns "no permission applied" into `Permit` — and, where the Permission Policy carries a HasPrivilegesOfRole Rule, turns "role not held" into a spurious `Permit` for a `has-privileges-of-role` query; `deny-unless-permit` makes the policy return `Deny` where the role's rules simply did not match, which both suppresses a sibling junior role's `Permit` under a deny-biased parent and denies accesses that policies evaluated alongside the RBAC policy set intend to permit; `first-applicable` can return an earlier child's `Indeterminate{P}` and so withhold a later child's `Permit`, including an inherited junior Permission Policy's grant ([Section 5.3](#53-access-control)). `deny-overrides` and `ordered-deny-overrides` reach the same decisions as `permit-overrides` only while no child returns a plain `Indeterminate`: an evaluation error (for example an unresolvable `PolicyReference`) becomes `Indeterminate{DP}`, which those algorithms prefer to a sibling's `Permit` ([[ACAL-Core-1.0](#acal-core-10)] Annexes E.1 to E.3), so they too can withhold an inherited grant.
- A **subject restriction in a Permission Policy's own `Target`** ([Section 5.3.2](#532-permission-policy) constraint 2 forbids it) does not cause an error; it makes the whole Permission Policy `NotApplicable` for a senior role's holders, breaking inheritance — the failure here *narrows* access, but silently, and a policy set with it is not conformant.
- A **subject predicate below that `Target`** — in the `Target` of a nested `PolicyType` object, or in an ordinary `Rule`'s `Condition` — is conformant but silently withholds the permission beneath it from a senior role's holders who do not carry the tested attribute. A permission meant to be inherited unconditionally should not be gated on the junior role's own attribute. (A subject test in a HasPrivilegesOfRole Rule's `Condition` would do the same to the "has privileges" answer, and is forbidden — [Section 5.3.4](#534-hasprivilegesofrole-rule) constraint 3.)
- A **`Deny` rule beneath a Permission Policy** at any depth ([Section 5.3](#53-access-control) constraint 1 forbids it) makes that Permission Policy able to return `Deny`. A prohibition written this way is unreliable as well as non-conformant: whether the `Deny` decides the outcome depends on the combining algorithm of every policy above it, so it holds in some role hierarchies and not others, and it denies accesses that policies evaluated alongside the RBAC policy set intend to permit. A prohibition that is to hold regardless of role belongs outside the RBAC policy set — see [Section 6.1](#61-combining-algorithms).
- An **ordinary `Rule` or nested `Policy` left outside the reserved-action-excluding wrapper**, in a Permission Policy that supports HasPrivilegesOfRole ([Section 5.3.2](#532-permission-policy) constraint 4 requires the wrapper) can itself evaluate to `Permit` for a `has-privileges-of-role` query it was never written to answer — a `Permit` indistinguishable in the response from one produced by the HasPrivilegesOfRole Rule, with no status code or marker showing which rule actually matched.

Finally, a HasPrivilegesOfRole Rule answers "does this subject have the privileges associated with role R?" (which a senior role's holder does, without holding R) without the subject attempting any resource access — an information channel that is deliberate but that a deployment should be aware it exposes.

---


# 10 Conformance

## 10.1 Introduction

This profile defines one profile identifier, one recommended role attribute identifier, and one action attribute value, together with the Role Policy / Permission Policy construction of [Section 5](#5-profile). An implementation conforms to this profile as a **policy processor** if it evaluates policies structured per [Section 5](#5-profile) as described there and in [[ACAL-Core-1.0](#acal-core-10)], and as an **RBAC request generator** if it produces requests carrying role attributes per [Section 5.1](#51-roles-and-role-attributes) and, where it supports the HasPrivilegesOfRole Rule, HasPrivilegesOfRole requests per [Section 5.3.4](#534-hasprivilegesofrole-rule).

## 10.2 Conformance Tables

This section lists those portions of the specification that MUST be included in an implementation of a PDP, PAP or PEP that claims to conform to this profile.

: Note: "M" means mandatory-to-implement. "O" means optional.

The implementation MUST follow [Section 5](#5-profile) and [Annex C](#annex-c-acal-identifiers) where they apply to implemented items in the following tables.

For an item marked `M` below, an implementation MUST support the ACAL (`urn:oasis:names:tc:acal:1.0:`) form. For an item marked `O`, an implementation that implements that item MUST support its ACAL form. An implementation MAY additionally recognize the deprecated XACML 3.0 *identifier* shown beside it as equivalent to the ACAL one; equality of identifiers is determined after identifier evaluation ([[ACAL-Core-1.0](#acal-core-10)] Section 8.3). The deprecated *action attribute value* in [Section 10.2.3](#1023-action-attribute-values) is an attribute value rather than an identifier and is not covered by that equivalence: a HasPrivilegesOfRole Rule tests for the ACAL value ([Section 5.3.4](#534-hasprivilegesofrole-rule) constraint 1), and a request translated from XACML 3.0 substitutes it. It is RECOMMENDED that the deprecated forms not be used in new policies or requests. This is the standard ACAL convention ([[ACAL-Core-1.0](#acal-core-10)] Section 11.2). A new policy or request SHOULD NOT use the deprecated action attribute value.

### 10.2.1 Profile Identifier

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:profile:rbac | M | urn:oasis:names:tc:xacml:3.0:profiles:rbac:core-hierarchical |

An implementation claiming conformance to this profile MUST support the Role Policy / Permission Policy construction of [Section 5.3](#53-access-control), including role hierarchy ([Section 5.3.3](#533-role-hierarchy)) and the entry-point constraint ([Section 5.3.5](#535-the-pdp-entry-point)). Support for HasPrivilegesOfRole queries ([Section 5.3.4](#534-hasprivilegesofrole-rule)) is OPTIONAL; an implementation that supports them MUST require a HasPrivilegesOfRole Rule in every Permission Policy it evaluates, and MUST require those Permission Policies to isolate their ordinary permissions as [Section 5.3.2](#532-permission-policy) constraint 4 specifies. The two go together: without the isolation, an ordinary rule can answer a HasPrivilegesOfRole query in place of the Rule.

### 10.2.2 Attributes

The implementation MUST use the attribute associated with the following identifier in the way this profile has defined (see [Annex C.3](#c3-attributes)) when that identifier is used for a role. This requirement pertains primarily to implementations of a PAP or PEP, since the semantics of the attribute are transparent to the PDP.

| Identifier | M/O | Deprecated Identifier |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:subject:role | O | urn:oasis:names:tc:xacml:2.0:subject:role |

Note: `O` because [Section 5.1](#51-roles-and-role-attributes) RECOMMENDS but does not require this identifier — a deployment MAY use others for roles. An implementation that supports this profile SHOULD recognize this identifier.

### 10.2.3 Action Attribute Values

The implementation MUST use the following action attribute value as this profile has defined ([Section 5.3.4](#534-hasprivilegesofrole-rule)) where it supports the HasPrivilegesOfRole Rule.

| Value | M/O | Deprecated Value |
| :--- | :--- | :--- |
| urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role | O | urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole |

Note: `O` because support for HasPrivilegesOfRole queries is itself optional ([Section 5.3.4](#534-hasprivilegesofrole-rule)); an implementation that supports them MUST use this value.

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

###### [RFC2119]

RFC 2119, *Key Words for Use in RFCs to Indicate Requirement Levels*, BCP 14, RFC 2119, March 1997. [Online]. Available: https://www.rfc-editor.org/info/rfc2119

###### [RFC8174]

RFC 8174, *Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words*, BCP 14, RFC 8174, May 2017. [Online]. Available: https://www.rfc-editor.org/info/rfc8174

## B.2 Informative References


The following referenced documents are not required for the application of this document but may assist the reader with regard to a particular subject area.

###### [ANSI-RBAC]

INCITS 359-2004, *Information Technology — Role Based Access Control*, American National Standards Institute / International Committee for Information Technology Standards, 2004.

###### [RBAC]

XACML v3.0 Core and Hierarchical Role Based Access Control (RBAC) Profile Version 1.0. Edited by Erik Rissanen. 23 October 2014. OASIS Committee Specification 02. https://docs.oasis-open.org/xacml/3.0/rbac/v1.0/cs02/xacml-3.0-rbac-v1.0-cs02.html . Latest stage: https://docs.oasis-open.org/xacml/3.0/rbac/v1.0/xacml-3.0-rbac-v1.0.html .

###### [XACML-Core-4.0]

_XACML Version 4.0 (eXtensible Access Control Markup Language)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/xacml/core/v4.0/acal-core-xml-v4.0.html

###### [JACAL-Core-1.0]

_JACAL Version 1.0 (JSON Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/jacal/core/v1.0/acal-core-json-v1.0.html

###### [YACAL-Core-1.0]

_YACAL Version 1.0 (YAML Representation of ACAL)_. Edited by Steven Legg, Cyril Dangerville and Bill Parducci. https://docs.oasis-open.org/acal/yacal/core/v1.0/acal-core-yaml-v1.0.html

# Annex C ACAL Identifiers


(This annex forms an integral part of this Specification.)

This section defines standard identifiers for commonly used definitions.

## C.1 ACAL Namespaces

This ACAL Profile is defined using this identifier.

`urn:oasis:names:tc:acal:1.0:rbac:schema`

## C.2 Profile Identifiers

See [Section 10.2.1](#1021-profile-identifier) for the single profile identifier this document defines and its deprecated XACML 3.0 equivalent.

## C.3 Attributes

This profile defines the following ACAL attribute identifier — for a `RequestAttributeType` object carrying a role — as the ACAL form of the XACML 3.0 RBAC profile's role attribute. It introduces no new attribute *object type* and no new schema artifact.

`urn:oasis:names:tc:acal:1.0:subject:role`

: RECOMMENDED as the `AttributeId` for every role attribute ([Section 5.1](#51-roles-and-role-attributes)). Corresponding attribute values SHOULD be of data type `urn:oasis:names:tc:acal:1.0:data-type:anyURI`. Ordinarily carried in a subject `RequestEntityType` object; carried in the resource `RequestEntityType` object in a request answered by a HasPrivilegesOfRole Rule ([Section 5.3.4](#534-hasprivilegesofrole-rule)). Deprecated identifier: `urn:oasis:names:tc:xacml:2.0:subject:role`.

## C.4 Action Attribute Values

This profile defines one standard value for the `urn:oasis:names:tc:acal:1.0:action:action-id` attribute:

`urn:oasis:names:tc:acal:1.0:action:has-privileges-of-role`

: The value of the `action-id` attribute in a request asking whether a subject has the privileges of a role ([Section 5.3.4](#534-hasprivilegesofrole-rule)). Deprecated value: `urn:oasis:names:tc:xacml:2.0:actions:hasPrivilegesOfRole`.

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
$ pandoc/mkdocs.sh --output /tmp acal-rbac-v%version%.md
```
The `--output` option sets the output directory, and the output filename is the same as the input file (last argument) except `.md` extension is replaced with `.html`.

This document has no `{.numberLines}` code fences, so the `--number-lines` option is not needed.

The publication date is automatically set to the current date by default (using Lua filter `pandoc/meta_vars.lua`). However, you may set a specific date of your choice instead, by adding the argument `--metadata date="My date in the form DD Month YYYY"` at the end of the command.

### PDF generation

For PDF output, add the `--pdf` option as follows:

```console
$ pandoc/mkdocs.sh --pdf --output /tmp acal-rbac-v%version%.md
```

The HTML file is generated like the previous command and, in addition, a PDF file is generated with the same name as the input file except the `.md` extension is replaced with `.pdf` in this case.

Beware that **the result PDF - the embedded fonts in particular - may differ depending on the system/machine** where you run this command. Mainly, it depends on which fonts are actually installed on the system, as the HTML-to-PDF converter (Chrome / Chromium in this case) selects available fonts according to the prioritized lists defined by `font-family` properties in the CSS.

**For official TC publications**, add the `--official` argument to avoid this issue and produce a system-independent output:

```console
$ pandoc/mkdocs.sh --pdf --official --output /tmp acal-rbac-v%version%.md
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


---


# Appendix 2 Changes From Previous Version


(This appendix does not form an integral part of this Specification and is informational.)

This is the first version of this profile. See [Section 4.3](#43-changes-from-the-previous-version) for the changes relative to its XACML 3.0 predecessor.

## Revision History

Latest revision history can be obtained from [OASIS ACAL \[XACML\] TC's github repository](https://github.com/oasis-tcs/acal-spec/blob/v%version%-%stage_revision%/acal-rbac-v%version%-%stage_revision%.md).

<!-- The following centered line represents the end of the document -->
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
