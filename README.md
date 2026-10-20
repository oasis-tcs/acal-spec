# README

Members of the <a href="https://www.oasis-open.org/committees/acal/">OASIS ACAL \[XACML\] TC</a> create and manage technical content in this TC GitHub repository ( <a href="https://github.com/oasis-tcs/acal-spec">https://github.com/oasis-tcs/acal-spec</a> ) as part of the TC's chartered work (the program of work and deliverables described in its <a href="https://www.oasis-open.org/committees/acal/charter.php">charter</a>).

OASIS TC GitHub repositories, as described in <a href="https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work">GitHub Repositories for OASIS TC Members' Chartered Work</a>, are governed by the OASIS <a href="https://www.oasis-open.org/policies-guidelines/tc-process">TC Process</a>, <a href="https://www.oasis-open.org/policies-guidelines/ipr">IPR Policy</a>, and other policies, similar to TC Wikis, TC issues tracking instances, etc.  While they make use of public GitHub repositories, these TC GitHub repositories are distinct from <a href="https://www.oasis-open.org/resources/open-repositories">OASIS Open Repositories</a>, which are used for development of open source <a href="https://www.oasis-open.org/resources/open-repositories/licenses">licensed</a> content.

## Description

The OASIS ACAL \[XACML\] TC is developing ACAL (Attribute-Centric Authorization Language) v1.0, the successor to XACML 3.0. ACAL separates policy semantics from serialization syntax, enabling the same authorization policies to be expressed in XML (XACML v4.0), JSON (JACAL v1.0), or YAML (YACAL v1.0). New representation formats can be more easily added on the same model. This repository contains the specifications, schemas, and supplementary artifacts for all three representations. Requests for modification can be made via <a href="https://github.com/oasis-tcs/acal-spec/issues">GitHub Issues</a>.

### Specification Family

| Specification | Short name | Role |
|---|---|---|
| ACAL Core v1.0 | ACAL | Format-agnostic abstract model, processing rules, conformance |
| ACAL Core – XML Representation Profile v4.0 | XACML v4.0 | XML serialization of ACAL |
| ACAL Core – JSON Representation Profile v1.0 | JACAL v1.0 | JSON serialization of ACAL |
| ACAL Core – YAML Representation Profile v1.0 | YACAL v1.0 | YAML serialization of ACAL |

### Key Changes from XACML 3.0

- **New data representation formats (JSON, YAML)** sharing a common (XML-agnostic) abstract model (ACAL), which facilitates **extensibility to other formats** via ACAL Profiles.
- **Model / Structure simplifications** including:
  - **Target simplification**: the `AnyOf / AllOf / Match` structure is replaced by a plain boolean `Apply` expression — the same language as `Condition`
  - **Policy absorbs PolicySet**: nested policies use a single `Policy` type with a `CombinerInput` sequence; `PolicySet` is eliminated
  - **NoticeExpression**: `ObligationExpression` and `AdviceExpression` are unified into a single `NoticeExpression` type with an `IsObligation` flag
  - **XPath moved to a profile**: XPath-based `AttributeSelector` and functions are in the separate ACAL XPath Profile; a new JSONPath Profile is also defined

- **Attribute DataType**: `DataType` is declared once per `Attribute`, not per value, preventing mixed-type bags
- **Short identifiers (ShortIdSet)**: user-defined URI aliases reduce verbosity; a standard ACAL identifier set covers all built-ins
- **QuantifiedExpression**: `ForAny`, `ForAll`, `Map`, and `Select` enable iteration over attribute value bags
- **Bundle**: portable container for policies, shared variable definitions, and identifier sets
- **Identifier namespace**: standard identifiers move from `urn:oasis:names:tc:xacml:` to `urn:oasis:names:tc:acal:`
- **New functions**: conditional/ternary operator, min, max, etc.


For a complete description of changes with worked examples in all three representations, see the [ACAL Adoption and Implementation Guide](acal-adoption-guide.md).

## Contributions
As stated in this repository's <a href="https://github.com/oasis-tcs/acal-spec/blob/main/CONTRIBUTING.md">CONTRIBUTING file</a>, contributors to this repository are expected to be Members of the OASIS ACAL \[XACML\] TC, for any substantive change requests. Anyone wishing to contribute to this GitHub project and <a href="https://www.oasis-open.org/join/participation-instructions">participate</a> in the TC's technical activity is invited to join as an OASIS TC Member.  Public feedback is also accepted, subject to the terms of the <a href="https://www.oasis-open.org/policies-guidelines/ipr#appendixa">OASIS Feedback License</a>, as noted in the <a href="https://github.com/oasis-tcs/acal-spec/blob/main/LICENSE.md">LICENSE</a> file.  

### Open-source Community Contributions
A separate [GitHub public organization](https://github.com/acal-community/) (ACAL Open Source Community) was created at the initiative of the OASIS ACAL \[XACML\] TC to support development of open source resources related to the TC work and the ACAL/XACML standard in general.

While this Github organization remains associated with the sponsor TC, its development priorities, leadership, intellectual property terms, participation rules, and other matters of governance are [separate and distinct](https://github.com/oasis-open/acal-community/blob/master/CONTRIBUTING.md#governance-distinct-from-oasis-tc-process) from the OASIS TC Process and related policies.


## Licensing
Please see the <a href="https://github.com/oasis-tcs/acal-spec/blob/main/LICENSE.md">LICENSE</a> file for description of the license terms and OASIS policies applicable to the TC's work in this GitHub project. Content in this repository is intended to be part of the OASIS ACAL \[XACML\] TC's permanent record of activity, visible and freely available for all to use, subject to applicable OASIS policies, as presented in the repository <a href="https://github.com/oasis-tcs/acal-spec/blob/main/LICENSE.md">LICENSE</a> file.

## Further Description of this Repository

See this repository's <a href="https://github.com/oasis-tcs/acal-spec/blob/main/CONTRIBUTING.md">CONTRIBUTING file</a> for information on how to participate in the TC's work.

## Contact
Please send questions or comments about <a href="https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work">OASIS TC GitHub repositories</a> to <a href="mailto:project-administration@oasis-open.org">Project Administration</a>.  For questions about content in this repository, please contact the TC Chair or Co-Chairs as listed on the the OASIS ACAL \[XACML\] TC's <a href="https://www.oasis-open.org/committees/acal/">home page</a>.

## Repository content description

- ACAL Core (agnostic model) artifacts:
  - [ACAL Core Specification](acal-core-v1.0.md)
  - ACAL Core - JSON Representation Profile (JACAL) artifacts:
     - [Specification](acal-core-json-v1.0.md);
     - [JSON schema](acal-core-json-v1.0-schema.json);
     - [Reference ShortIdSet (short identifiers)](acal-core-json-v1.0-identifiers.json) provided as an example.
   - ACAL Core - XML Representation Profile (XACML) artifacts:
     - [Specification](acal-core-xml-v4.0.md);
     - [XML schema](acal-core-xml-v4.0-schema.xsd) using W3C XML Schema 1.1 standard;
     - [Schematron schema](acal-core-xml-v4.0-schematron.sch) to be combined with a XML-Schema-1.0 version of the above XML schema, which may be generated by the *XSD 1.1-to-1.0 conversion XSLT* stylesheet mentioned later below;
     - [Reference ShortIdSet (short identifiers)](acal-core-xml-v4.0-identifiers.xml) provided as an example.
       
- ACAL JSONPath Profile artifacts:
  - [Specification](acal-jsonpath-v1.0.md);
  - ACAL JSONPath - JSON Representation (JACAL) artifact(s):
    - [JSON schema](acal-jsonpath-json-v1.0-schema.json).
  - ACAL JSONPath - XML Representation Profile (XACML) artifact(s):
    - [XML schema](acal-jsonpath-xml-v4.0-schema.xsd);
 
- ACAL XPath Profile artifacts:
  - [Specification](acal-xpath-v1.0.md);
  - ACAL XPath - JSON Representation (JACAL) artifact(s):
    - [JSON schema](acal-xpath-json-v1.0-schema.json).
    - [Reference ShortIdSet (short identifiers)](acal-xpath-json-v1.0-identifiers.json) provided as an example.
  - ACAL XPath - XML Representation Profile (XACML) artifact(s):
    - [XML schema](acal-xpath-xml-v4.0-schema.xsd);
    - [Reference ShortIdSet (short identifiers)](acal-xpath-xml-v4.0-identifiers.xml) provided as an example.

- [XSD 1.1-to-1.0 conversion XSLT](xsd1.1-to-1.0.xsl): XSLT stylesheet for creating an XML schema 1.0 version of an XML-schema-1.1-defined XSD (removing the XML-Schema-1.1-specific elements). 
- [pandoc](pandoc) directory: files specifically used for HTML/PDF generation with Pandoc (CSS stylesheets, pandoc templates, Lua filters, scripts, etc.);
- [published](published) directory: latest published (to OASIS) documents and related files (e.g. XML/JSON schemas), as part of the last release.

- Supplementary documents:
  - [ACAL Adoption and Implementation Guide](acal-adoption-guide.md): informative guide covering the changes from XACML 3.0, cross-representation examples, migration checklist, and conformance overview.

## FAQ (Frequently Asked Questions)

### How to validate XACML documents with the XACML schemas
#### Case 1: your implementation supports the latest XML Schema standard 1.1

Since XACML 4.0, XACML schemas exist in [XSD version 1.1](https://www.w3.org/TR/xmlschema11-1/) to provide more advanced validation and especially an equivalence for the UML constraints (OCL) defined in ACAL agnostic model, in form of XSD 1.1 assertions (`xs:assert`). One way to validate against a XSD 1.1 schema is to use [Apache Xerces2 Java XML Parser](https://xerces.apache.org/xerces2-j/), more specifically its [binary distribution](https://xerces.apache.org/mirrors.cgi#binary) called _**Xerces2 Java 2.12.2 (XML Schema 1.1)**_. 

Download the binary distribution zip or tar.gz depending on your OS, then unzip it to a folder, say `xerces-2_12_2-xml-schema-1.1`.

Then (based on Apache [Xerces2 Java XML Parser's issue 1726](https://issues.apache.org/jira/browse/XERCESJ-1726?page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel&focusedCommentId=17191197)), change your working directory to the root of this repository where the XACML schemas are located.

In order to validate a XACML document, say `MyPolicy.xml`, run the following command line (you may omit `-a ./acal-xpath-xml-v4.0-schema.xsd` (resp. `a ./acal-jsonpath-xml-v4.0-schema.xsd`) if your XACML document does not use the XPath (resp. JSONPath) Profile):

```console
# Tested with Java 21 LTS
$ java -cp "xerces-2_12_2-xml-schema-1.1/*" jaxp.SourceValidator -i MyPolicy.xml -a ./acal-core-xml-v4.0-schema.xsd -a ./acal-xpath-xml-v4.0-schema.xsd -a ./acal-jsonpath-xml-v4.0-schema.xsd -f -fx -xsd11
```

#### Case 2: your implementation supports only XML Schema 1.0

As an alternative to the XSD 1.1 core schema (with XSD 1.1 assertions) previously mentioned, implementers that only support XSD 1.0 may use an XSD 1.0 version of the core schema - obtained by filtering out all the schema elements with attribute `vc:minVersion="1.1"` according to the [XML Schema Versioning standard](https://www.w3.org/2007/XMLSchema-versioning/) (e.g. using a [XSLT](https://www.w3.org/TR/xslt20/) stylesheet) - in combination with the core [Schematron](https://www.iso.org/standard/85625.html) [schema](acal-core-xml-v4.0-schematron.sch), which provides an equivalent for XSD 1.1 assertions.

Here is an example of how to do that with the **XML schema 1.0-only version of Xerces2 Java 2.12.2** (instead of the *XML Schema 1.1* one) for the XML schema 1.0 validation and **[Schxslt2](https://codeberg.org/SchXslt/schxslt2/)** for the Schematron validation.

1. Download and unzip the XML schema 1.0 version of Xerces2, then download Schxslt2's XSLT stylesheet:
   ```console
   $ wget https://dlcdn.apache.org//xerces/j/binaries/Xerces-J-bin.2.12.2.tar.gz -P /tmp
   $ pushd tmp; tar xvzf Xerces-J-bin.2.12.2.tar.gz; popd
   $ wget https://codeberg.org/SchXslt/schxslt2/raw/branch/main/src/main/resources/content/transpile.xsl -P /tmp
   ```

2. Generate (once and for all validations) the XSD 1.0 version of the core schema using the XSLT stylesheet `xsd1.1-to-1.0.xsl` with [Saxon HE](https://www.saxonica.com/html/download/java.html) (tested with v12.5) as the XSLT engine:
   ```console
   # Tested with Java 21 LTS
   $ java -jar saxon-he-12.5.jar -xsl:xsd1.1-to-1.0.xsl -s:acal-core-xml-v4.0-schema.xsd -o:/tmp/acal-core-xml-v4.0-schema-xsd1.0.xsd
   ```

3. Generate (once and for all validations) - from the Schematron schema - the XSLT stylesheet that will be processed by the XSLT engine to do the actual Schematron validation of XML documents. Here is an example of generation with [Schxslt2](https://codeberg.org/SchXslt/schxslt2/):

    ```console
    # Tested with Java 21 LTS
    $ java -jar saxon-he-12.5.jar -xsl:/tmp/transpile.xsl -s:acal-core-xml-v4.0-schematron.sch -o:/tmp/acal-core-xml-v4.0-schematron.xsl
    ```

4. In order to validate a XACML document, say `MyPolicy.xml`, against both the XSD 1.0 and Schematron schemas, run the following command lines:

    ```console
    # Tested with Java 21 LTS
    $ java -cp "/tmp/xerces-2_12_2/*" jaxp.SourceValidator -a /tmp/acal-core-xml-v4.0-schema-xsd1.0.xsd -a acal-xpath-xml-v4.0-schema.xsd -a acal-jsonpath-xml-v4.0-schema.xsd -f -i MyPolicy.xml
    $ java -jar saxon-he-12.5.jar -xsl:/tmp/acal-core-xml-v4.0-schematron.xsl MyPolicy.xml
    ```

    This last command will output a [Schematron Validation Report (SVRL)](https://schematron.com/document/3427.html).


### How to validate JACAL (JSON) documents with the JACAL schemas ?

JACAL is the JSON representation of ACAL, in other words the JSON variant of XACML. JACAL core model is defined by the Core JSON schema, corresponding to ACAL core model. Certain structures of the core model (ACAL structured Datatypes) are extensible and may have standard extensions already defined in ACAL *Profiles*, e.g. the JSONPath and XPath Profiles which extend the `AttributeSelectorType` among others. Depending on whether your ACAL implementation supports such Profiles or not, the way to validate JACAL documents properly against the JSON schema(s) differs. Let us go other the different cases. For each case, we'll show an example of command-line to validate a JACAL (JSON) document using [Sourcemeta's open source JSON schema CLI](https://github.com/sourcemeta/jsonschema).

**Case 1: the implementation does not support any Profile or extension to ACAL model, only the core model:**

In this case, you simply use [JACAL core schema](acal-core-json-v1.0-schema.json) for validation. Here is an example of [jsonschema validate command](https://github.com/sourcemeta/jsonschema/blob/main/docs/validate.markdown) that validates a JACAL document in a file `policy.json`:
```console
$ jsonschema validate acal-core-json-v1.0-schema.json policy.json
```

**Case 2: the implementation supports one or more Profiles extending the ACAL core model (i.e. extending JACAL core schema):**

Each extensible type *FooType* has a JSON subschema *FooTypeTree* defined in the core schema as follows (using the special keyword `$dynamicRef` introduced in JSON schema Draft 2020-12 specification):

*Core schema:*
```json
"FooTypeTree": { "$dynamicRef": "#FooTypeExtensions" }
```
This enables you to extend *FooType* with the concrete subtypes from the JACAL Profiles you want to support, by defining a matching `$dynamicAnchor` in your implementation-specific schema (the core schema must be imported last):

*New schema for a particular implementation supporting two ACAL Profiles extending FooType:*
```json
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": "urn:my:implementation:specific:combining:schema",
    "$defs": {
        "SupportedFooTypeExtensions": {
            "$dynamicAnchor": "FooTypeExtensions",
            "anyOf": [
                {
                    "$ref": "urn:some:profile:schema#/$defs/SomeFooSubTypeTree"
                },
                {
                    "$ref": "urn:some:other:profile:schema#/$defs/SomeOtherFooSubTypeTree"
                }
            ]
        },
        ...
    },
    "$ref": "urn:oasis:names:tc:jacal:1.0:core:schema"
}
```
This schema is also called a *combining schema* as it combines the core schema with the specific Profiles' to be supported by your implementation.

We provide two concrete examples of combining schemas on this Github repository to illustrate this case and get you started using JACAL Profiles:

1. **Example 1:** let's say you want to support JSONPath-based AttributeSelectors, i.e. the `AttributeSelectorType` extensions from the JSONPath Profile's. In this case, you may use the example of [combining schema for JSONPath Profile support](examples/acal-core-json/jacal-root-schema-example-using-jsonpath-profile-only.json) for your implementation. This schema makes a reference (`$ref`) to the [core schema](acal-core-json-v1.0-schema.json) and [JSONPath Profile's schema](acal-jsonpath-json-v1.0-schema.json).

   To use this schema, the previous JSON schema validation command is modified as follows:
   ```console
   $ jsonschema validate --resolve acal-core-json-v1.0-schema.json --resolve acal-jsonpath-json-v1.0-schema.json examples/acal-core-json/jacal-root-schema-example-using-jsonpath-profile-only.json policy.json
   ```
   
2. **Example 2:** you want to support both JSONPath and XPath based AttributeSelectors, i.e. JSONPath and XPath Profiles, then you may use the example of [combining schema for JSONPath and XPath Profile support](examples/acal-core-json/jacal-root-schema-example-using-xpath-and-jsonpath-profiles.json). This schema makes a reference (`$ref`) to the [core schema](acal-core-json-v1.0-schema.json), [JSONPath Profile's schema](acal-jsonpath-json-v1.0-schema.json) and [XPath Profile's schema](acal-xpath-json-v1.0-schema.json).

   To use this schema, the previous JSON schema validation command is modified as follows:
   ```console
   $ jsonschema validate --resolve acal-core-json-v1.0-schema.json --resolve acal-jsonpath-json-v1.0-schema.json --resolve acal-xpath-json-v1.0-schema.json examples/acal-core-json/jacal-root-schema-example-using-xpath-and-jsonpath-profiles.json policy.json
   ```

### How to validate YACAL (YAML) documents with the YACAL schemas?

YACAL is the YAML representation of ACAL. Validation requires two steps: structural validation using the YACAL structural schema (a JSON Schema Draft 2020-12 document serialized in YAML), and higher-order constraint checking using the YACAL constraint catalog.

**Step 1: Structural validation**

Use any YAML 1.2 parser combined with a JSON Schema Draft 2020-12 validator. Parse the YACAL document to a YAML data model, then validate against the structural schema. For implementations that support only one ACAL Core Profile, use the core-only structural schema directly:

```console
$ <your-yaml-json-schema-validator> acal-core-yaml-v1.0-structure.schema.yaml policy.yaml
```

For implementations that support profiles (XPath, JSONPath), use the corresponding composition example schema as the root schema, referencing the core and profile schemas:

```console
$ <your-yaml-json-schema-validator> \
    yacal-root-structure-example-using-xpath-and-jsonpath-profiles.schema.yaml \
    policy.yaml
```

The composition example schemas in this repository (`yacal-root-structure-example-*.schema.yaml`) illustrate how to combine the core schema with one or more profile schemas for common deployment scenarios.

**Step 2: Constraint validation**

Apply the constraint catalog (`acal-core-yaml-v1.0-constraints.yaml`) using a constraint processor compatible with the catalog's format. The constraint catalog captures higher-order rules (uniqueness, scoped references, cycle detection) that are normative in ACAL Core but are not expressible purely in JSON Schema.

### How to convert a JACAL document to XACML 4.0?

By the time that ACAL 1.0 is officially released as OASIS standard, it is the intention of the OASIS ACAL \[XACML\] TC to provide an example of JACAL-to-XACML conversion tool as a reference, on the [ACAL Community tools repository](https://github.com/acal-community/tools/). 
In the meantime, you may apply the following mapping rules:

*For each JSON property *P* with value *V* in the JACAL document,*
1. If and only if *P* is defined in the JACAL (JSON) schema as single-valued (not a JSON array), then
   1. If *P*'s type is a primitive type **other than** the *unrestricted* `string` type, map to an XML attribute `P="escaped_V"` where *escaped_V* is *V* possibly modified after escaping XML special characters. (*Unrestricted  String* means it is defined as `"type": "string"` only, without any further restriction, e.g. no `"format"` or `"pattern"` assertion in particular.)
   1. Else if *P*'s type is simply (unrestricted) `string`, map to an XML element `<P>escaped_V</P>` defined in the XACML 4.0 namespace. (In JACAL core schema, only the `Description` and `StatusMessage` properties are single-valued unrestricted Strings.)
   1. Else if *P*'s type is `object` (JSON object), map to the XML element `<P>` and, for each sub-property *P<sub>n</sub>* of the object, re-apply these same mapping rules (recursively) to *P<sub>n</sub>* and add the result XML attribute/element to `<P>` as a child node. The order of child elements must match the order defined in the XACML schema.
2. Else (*P* is a JSON array) for each JSON value *V<sub>n</sub>* (n=0, 1,...) of *P*, create an XML element `<P>` with the following XML attributes and/or child nodes:
   1. If *V<sub>n</sub>* is primitive, the only child node is a text node whose content is *V<sub>n</sub>* possibly modified after applying XML character escaping rules. No XML attribute. 
   1. Else if *V<sub>n</sub>* is a JSON object, the attributes and child elements are the results of re-applying the full mapping rules to each property *P<sub>n</sub>* of this object. The order of child elements must match the order defined in the XACML schema for the corresponding `<P>` element.
   1. Else (*V<sub>n</sub>* is a JSON array) reject as invalid (JSON arrays of arrays are not allowed).
  
### If I just need to implement a PEP (Policy Enforcement Point) or whatever to make access requests to a PDP, do I have to support the full XACML/JACAL schema(s)?

Rest assured, you don't. Whether you want to use XACML, JACAL or other ACAL representation format, you only need to support the `Request` and `Response` objects and all their dependencies, which is only a subset of the full XACML/JACAL schema. This is referred to as the `PDP API` package in the ACAL UML model (Annex G of ACAL core specification)). The [ACAL Community Tools repository](https://github.com/acal-community/tools) provides you with [simple tools](https://github.com/acal-community/tools#minimal-pdp-api-schema-generation-tools-for-peps) to help you generate the minimal PDP API schema in XACML/JACAL for your PEP implementation.
