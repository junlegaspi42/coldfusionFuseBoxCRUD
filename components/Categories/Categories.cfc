<cfcomponent displayname="Categories">
	<!--- get comments --->

 	<cffunction name="Init" access="public" returntype="Categories" output="false" displayname="" hint="">
        <cfreturn this />
    </cffunction>


	<cffunction name="getCategories" hint="Get categories in the database" returntype="query">

		<cfstoredproc procedure="dbo.getCategories" datasource="basic">
			<cfprocresult name="get_category">
			</cfprocresult>
		</cfstoredproc>
	   	<cfreturn get_category>
	</cffunction> 

</cfcomponent>