<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
 <title>A Schematron for validating XACML documents in combination with XSD 1.0 schema (alternative to XSD 1.1 assertions)</title>
	<!--
 	<xsl:import-schema xmlns:xsl="http://www.w3.org/1999/XSL/Transform" schema-location="acal-core-xml-v4.0-schema.xsd"/>
       -->
 <ns prefix="xacml" uri="urn:oasis:names:tc:xacml:4.0:core:schema"/>
 <ns prefix="xpath" uri="urn:oasis:names:tc:xacml:4.0:xpath:schema"/>

 <!-- Uncomment the let elements below if you wishes to use the pattern 'IdentifierType_advanced_validation': -->
 <!--
 <let name="URI_CHAR_PATTERN" value="'[!#-;=?-\[\]_a-z~]'"/>
 <let name="URI_CHARS_ANCHORED_PATTERN" value="concat('^', $URI_CHAR_PATTERN, '*$')"/>
 <let name="ABSOLUTE_URI_PATTERN" value="concat('^[A-Za-z][A-Za-z0-9+\-.]*:', $URI_CHAR_PATTERN, '+$')"/>
 <let name="SHORTNAME_PATTERN" value="'[A-Za-z][0-9A-Za-z]*(-[0-9A-Za-z]+)*'"/>
 <let name="SHORTNAME_ANCHORED_PATTERN" value="concat('^', $SHORTNAME_PATTERN, '$')"/>
 <let name="SHORTNAME_BRACKETED_PATTERN" value="concat('\{', $SHORTNAME_PATTERN, '\}')"/>
 -->
 <!-- Uncomment the pattern below if you want stricter syntax validation of IdentifierType values.
 However, if your ACAL implementation is parsing such values properly while validating them against the same regular expressions, your implementation-specific validation is probably more optimal, in which case you may consider this for information / guidance only. -->
 <!--
 <pattern id="IdentifierType_advanced_validation">
	<title>IdentifierType advanced validation</title>
	-->
	<!--
	If you have a schema-aware Schematron/XSLT processor (e.g. Saxon-EE), the rule's context (XPath) expression below can be simplified to: context="attribute(*, xacml:IdentifierType)"
	in which case, you need to pass the XACML core schema - acal-core-xml-v4.0-schema.xsd - as XSD argument to the processor.
	-->
	<!--
	<rule context="@Category|@AttributeId|@DataType|@CombiningAlgId|xacml:Function/@Id|@FunctionId|xacml:Notice/@Id|xacml:NoticeExpression/@Id|xacml:StatusCode/@Value">
		<assert test="matches(., $SHORTNAME_ANCHORED_PATTERN) or matches(., $ABSOLUTE_URI_PATTERN) or ( let $tokens := tokenize(., $SHORTNAME_BRACKETED_PATTERN) return count($tokens) > 1 and (every $token in $tokens satisfies matches($token, $URI_CHARS_ANCHORED_PATTERN)) )">Invalid IdentifierType value</assert>
	</rule>
 </pattern>
 -->

 <pattern id="ACAL_constraint_on_RequestDefaults_property">
 	<title>ACAL constraint on RequestDefaults property: {OCL} self-gt;isUnique(oclType())</title>	
	<rule context="xacml:Request">
		<!-- 
		WARNING: collect al the QNames of the elements in RequestDefaults substitution group (of type xacml:DefaultsType) from the ACAL Profiles supported by your implementation (e.g. XPath Profile), i.e. ns1:SomeDefaults1, ns2:SomeDefaults2, etc. and use an assertion as follows:

		<assert test="count(ns1:SomeDefaults1) le 1 and count(ns2:SomeDefaults2) le 1 and...">Duplicate RequestDefaults element</assert>
		
		Make sure the namespaces ns1, ns2, etc. have been declared at the beginning with <ns prefix="nsX" uri="namespaceX"/>.
		
		Here is an example when the XPath profile is supported: (you may comment this if this is not the case):
		-->
		<assert test="count(xpath:XPathRequestDefaults) le 1">Duplicate RequestDefaults element</assert>
		<!--
		If your implementations supports schema-aware Schematron/XSLT processing (e.g. SAXON and likely Xalan XSLT 3.0 branch), then you may use the more generic XPath expression below:
		-->
		<!-- 
		<assert test="every $elt in element(*, xacml:DefaultsType) satisfies (every $following in $elt/following-sibling::element(*, xacml:DefaultsType) satisfies $elt/name() != $following/name())">Duplicate RequestDefaults element</assert>
		-->
		<!--
		AND uncomment the  <xsl:import-schema schema-location="acal-core-xml-v4.0-schema.xsd" .../> at the beginning of this schema.
		-->
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_PolicyDefaults_property">
	<title>ACAL constraint on PolicyDefaults property: {OCL} self-gt;isUnique(oclType())</title>
	<rule context="xacml:Policy">
		<!-- 
		WARNING: collect al the QNames of the elements in PolicyDefaults substitution group (of type xacml:DefaultsType) from the ACAL Profiles supported by your implementation (e.g. XPath Profile), i.e. ns1:SomeDefaults1, ns2:SomeDefaults2, etc. and use an assertion as follows:

		<assert test="count(ns1:SomeDefaults1) le 1 and count(ns2:SomeDefaults2) le 1 and...">Duplicate PolicyDefaults element</assert>
		
		Make sure the namespaces ns1, ns2, etc. have been declared at the beginning with <ns prefix="nsX" uri="namespaceX"/>.
		
		Here is an example when the XPath profile is supported: (you may comment this if this is not the case):
		-->
		<assert test="count(xpath:XPathPolicyDefaults) le 1">Duplicate PolicyDefaults element</assert>
		<!--
		If your implementations supports schema-aware Schematron/XSLT processing (e.g. SAXON and likely Xalan XSLT 3.0 branch), then you may use the more generic XPath expression below:
		-->
		<!-- 
		<assert test="every $elt in element(*, xacml:DefaultsType) satisfies (every $following in $elt/following-sibling::element(*, xacml:DefaultsType) satisfies $elt/name() != $following/name())">Duplicate PolicyDefaults element</assert>
		-->
		<!--
		AND uncomment the  <xsl:import-schema schema-location="acal-core-xml-v4.0-schema.xsd" .../> at the beginning of this schema.
		-->
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_AttributeType_Value_property">
    <title>ACAL constraint (textual) on AttributeType's Value property (DataType already specified as AttributeType's property)</title>
	<rule context="xacml:Attribute|xacml:RequestAttribute|xacml:AttributeAssignment">
	  <assert test="not(xacml:Value/@DataType)"></assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_ParameterType_Expression_property">
	<title>ACAL constraint (textual) on ParameterType's Expression property (DataType already specified as ParameterType's property)</title>
	<rule context="xacml:Parameter">
	  <assert test="not(xacml:Value/@DataType)"></assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_PolicyReferenceType_Expression_property">
	<title>ACAL constraint (textual) on PolicyReference's Expression property (DataType already specified in the corresponding Parameter of the referenced element SHALL NOT be redefined)</title>
	<rule context="xacml:PolicyReference">
	  <assert test="not(xacml:Value/@DataType)"></assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_SharedVariableReferenceType_Expression_property">
	<title>ACAL constraint (textual) on SharedVariableReference's Expression property (DataType already specified in the corresponding Parameter of the referenced element SHALL NOT be redefined)</title>
	<rule context="xacml:SharedVariableReference">
	  <assert test="not(xacml:Value/@DataType)"></assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_MissingAttributeDetailType_Value_property">
	<title>ACAL constraint (textual) on MissingAttributeDetailType's Value property (DataType already specified as MissingAttributeDetail's property)</title>
	<rule context="xacml:MissingAttributeDetail">
	  <assert test="not(xacml:Value/@DataType)"></assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_EntityType">
	<title>ACAL constraint on EntityType: {OCL} Content &lt;&gt; null or Attribute-&lt;notEmpty()</title>
	<rule context="xacml:PolicyIssuer">
	<!-- If your implementation uses a XSD-aware Schematron/XSLT processor, you should use the following more generic context instead of the previous one: -->
	<!-- <rule context="element(*, xacml:EntityType)"> -->
	  <assert test="xacml:Content or xacml:Attribute"></assert>
	</rule>
 </pattern>
 <!-- The three patterns below complement the corresponding xs:unique constraints in
 acal-core-xml-v4.0-schema.xsd (which cannot catch a duplicate AttributeId/DataType pair when
 Issuer is absent from both compared Attribute/RequestAttribute elements), for XSD 1.0-only
 consumers. Neither these patterns nor xs:unique can perform the Section 8.3 short-identifier
 expansion that identifier equality depends on, so AttributeId/DataType duplicates that differ
 only by short-id-vs-URI spelling are not caught by any schema-level check.
 Note that the implementation may choose to implement a mechanism (e.g. preliminary XSLT processing) to perform the short-identifier expansion prior to the Schematron schema validation step, making the rule enforcement fully effective.
 -->
 <pattern id="ACAL_constraint_on_ResultEntityType_Attribute_property">
	<title>ACAL constraint on ResultEntityType property: {OCL} self-&gt;isUnique(Sequence{AttributeId, DataType, Issuer})</title>
	<rule context="xacml:ResultEntity">
	  <assert test="every $elt in xacml:Attribute satisfies (every $following in $elt/following-sibling::xacml:Attribute satisfies not(
			$elt/@AttributeId = $following/@AttributeId
			and ($elt/@DataType, 'urn:oasis:names:tc:acal:1.0:data-type:string')[1] = ($following/@DataType, 'urn:oasis:names:tc:acal:1.0:data-type:string')[1]
			and ((not($elt/@Issuer) and not($following/@Issuer)) or $elt/@Issuer = $following/@Issuer)
		))">Duplicate Attribute (AttributeId, DataType, Issuer)</assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_RequestEntityType_RequestAttribute_property">
	<title>ACAL constraint on RequestEntityType property: {OCL} self-&gt;isUnique(Sequence{AttributeId, DataType, Issuer})</title>
	<rule context="xacml:RequestEntity">
	  <assert test="every $elt in xacml:RequestAttribute satisfies (every $following in $elt/following-sibling::xacml:RequestAttribute satisfies not(
			$elt/@AttributeId = $following/@AttributeId
			and ($elt/@DataType, 'urn:oasis:names:tc:acal:1.0:data-type:string')[1] = ($following/@DataType, 'urn:oasis:names:tc:acal:1.0:data-type:string')[1]
			and ((not($elt/@Issuer) and not($following/@Issuer)) or $elt/@Issuer = $following/@Issuer)
		))">Duplicate RequestAttribute (AttributeId, DataType, Issuer)</assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_PolicyIssuer_Attribute_property">
	<title>ACAL constraint on EntityType property: {OCL} self-&gt;isUnique(Sequence{AttributeId, DataType, Issuer})</title>
	<rule context="xacml:PolicyIssuer">
	<!-- If your implementation uses a XSD-aware Schematron/XSLT processor, you should use the following more generic context instead of the previous one, so that this pattern also applies to any future element of type EntityType, not just PolicyIssuer: -->
	<!-- <rule context="element(*, xacml:EntityType)"> -->
	  <assert test="every $elt in xacml:Attribute satisfies (every $following in $elt/following-sibling::xacml:Attribute satisfies not(
			$elt/@AttributeId = $following/@AttributeId
			and ($elt/@DataType, 'urn:oasis:names:tc:acal:1.0:data-type:string')[1] = ($following/@DataType, 'urn:oasis:names:tc:acal:1.0:data-type:string')[1]
			and ((not($elt/@Issuer) and not($following/@Issuer)) or $elt/@Issuer = $following/@Issuer)
		))">Duplicate Attribute (AttributeId, DataType, Issuer)</assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_BundleType">
 	<title>ACAL constraint on BundleType: {OCL} PolicyReference = null or Policy-&gt;notEmpty()</title>
	<rule context="xacml:Bundle"> 
	  <assert test="not(xacml:PolicyReference) or xacml:Policy"></assert>
	</rule>
 </pattern>
 <pattern id="ACAL_constraint_on_RequestReference_property">
 	<title>ACAL constraint on RequestReference property: {OCL} self-&gt;isUnique(RequestEntityReference-&gt;asSet())</title>
	<rule context="xacml:MultiRequests">
		<!--
		XSD assertion: for every RequestReference element $elt and every following sibling $following, either the number of RequestEntityReferences in $elt and $following differ or there is some $id in $elt/xacml:RequestEntityReference that is not in $following/xacml:RequestEntityReference.
		Reminder: in XPath, Seq1 = Seq2 is true if and only if at least one value from Seq1 is equal to a value in Seq2 -->
	  <assert test="every $elt in xacml:RequestReference satisfies (every $following in $elt/following-sibling::xacml:RequestReference satisfies count($elt/xacml:RequestEntityReference) != count($following/xacml:RequestEntityReference) or (some $id in $elt/xacml:RequestEntityReference satisfies not($id = $following/xacml:RequestEntityReference)))"></assert>
	</rule>
 </pattern>
 <!-- The patterns that enforced (AttributeId, Category) uniqueness on
 NoticeExpression/AttributeAssignmentExpression and Notice/AttributeAssignment have been removed.
 Those pairs are no longer required to be unique; whether a notice accepts repeated attribute
 assignments, and how they combine, is left to the definition of the individual obligation or
 advice, as it was in XACML 3.0.
 -->
</schema>