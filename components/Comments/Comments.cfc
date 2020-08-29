<cfcomponent displayname="Comments">
	<!--- get comments --->

	<cffunction name="Init" access="public" returntype="Comments" output="false" displayname="" hint="">
        <cfreturn this />
    </cffunction>


	<cffunction name="getComments" hint="Get comments in the database" returntype="query">

		<cfargument name="post_id" type="numeric" required="false" default="" />


		<cfstoredproc procedure="dbo.getComments" datasource="basic">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@post_id" null="no" value="#arguments.post_id#" />
			<cfprocresult name="get_comments">
			</cfprocresult>
		</cfstoredproc>
	   	<cfreturn get_comments>
	</cffunction> 

	<cffunction name="postComment" returntype="void">
		<cfargument name="post_id" type="numeric" required="false" default="" />
		<cfargument name="user_id" type="numeric" required="false" default="" />
		<cfargument name="comment" type="string" required="false" default="" />

		<cfset dtNow = now()>
		<cfstoredproc procedure="dbo.addComment" datasource="basic">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@post_id" null="no" value="#arguments.post_id#" />
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@user_id" null="no" value="#arguments.user_id#" />
			<cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@comment" null="no" value="#arguments.comment#" />
			<cfprocparam type="in" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@created_at" null="no" value="#dtNow#" />
		</cfstoredproc>

	</cffunction> 


	<cffunction name="deleteComment" returntype="void">
		<cfargument name="comment_id" type="numeric" required="yes" default="">
		<cfstoredproc procedure="dbo.deleteComment" datasource="basic">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@comment_id" null="no" value="#arguments.comment_id#" />
		</cfstoredproc>
	</cffunction>

	<cffunction name="updateComment" returntype="void">
		<cfargument name="comment_id" type="numeric" required="yes" default="">
		<cfargument name="comment" type="string" required="yes" default="">
		<cfstoredproc procedure="dbo.updateComment" datasource="basic">
			<cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@comment_id" null="no" value="#arguments.comment_id#" />
			<cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@comment" null="no" value="#arguments.comment#" />
		</cfstoredproc>
	</cffunction>

</cfcomponent>