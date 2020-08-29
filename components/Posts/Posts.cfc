<cfcomponent displayname="Posts">  

<!--- This function gets all the users and their  data from the DB --->  

<cffunction name="Init" access="public" returntype="Posts" output="false" displayname="" hint="">
        <cfreturn this />
</cffunction>

<cffunction name="getAllPost" returntype="query">
        <cfstoredproc procedure="dbo.getAllPost" datasource="basic">
            <cfprocresult name="posts" />
        </cfstoredproc>
        <cfreturn posts />
</cffunction>


<!--- Get user posts --->

<cffunction name="getSomePost" returntype="query">
    <cfargument name="user_id" type="numeric" required="yes" />
    <cfstoredproc procedure="dbo.getSomePost" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@user_id" null="no" value="#arguments.user_id#" />
        <cfprocresult name="post" />
    </cfstoredproc>
    <cfreturn post />


</cffunction>


<!--- Delete users Posts --->

<cffunction name="deletePost" hint="Delete some post in the database" returntype="void">
    <cfargument name="post_id" type="numeric" required="false" default="" />
    <cfstoredproc procedure="dbo.deletePost" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@post_id" null="no" value="#arguments.post_id#" />
    </cfstoredproc>
</cffunction>  


<!--- View users specific posts --->
<cffunction name="viewSpecPost" hint="view specific post in the database" returntype="query">
    <cfargument name="post_id" type="numeric" required="false" default="" />

    <cfstoredproc procedure="dbo.getSinglePost" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@post_id" null="no" value="#arguments.post_id#" />
        <cfprocresult name="view_post" />
    </cfstoredproc>
    
    <cfreturn view_post>
</cffunction>  

<!--- Edit Specific Post --->

<cffunction name="editSpecPost" hint="edit specific post in the database" returntype="query">
    <cfargument name="post_id" type="numeric" required="false" default="" />

    <cfstoredproc procedure="dbo.getSinglePost" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@post_id" null="no" value="#arguments.post_id#" />
        <cfprocresult name="edit_post" />
    </cfstoredproc>
    <!--- <cfquery name="edit_some" datasource="basic">

        Select * FROM posts WHERE id = #arguments.post_id#

    </cfquery> --->
    <cfreturn edit_post>
</cffunction>  

<!--- Update Specific post --->

<cffunction name="updateSpecPost" hint="Update specific post in the database" returntype="void">
    <cfargument name="title" type="string" required="false" default="" />
    <cfargument name="body" type="string" required="false" default="" />
    <cfargument name="category_id" type="numeric" required="false" default="" />
    <cfargument name="updated_at" type="date" required="false" default="" />
    <cfargument name="post_id" type="numeric" required="false" default="" />

    <cfstoredproc procedure="dbo.updatePost" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@title" null="no" value="#arguments.title#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_LONGVARCHAR" dbvarname="@body" null="no" value="#arguments.body#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@category_id" null="no" value="#arguments.category_id#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@updated_at" null="no" value="#arguments.updated_at#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@post_id" null="no" value="#arguments.post_id#" />
    </cfstoredproc>
    
</cffunction>  

<!--- ADD post --->

<cffunction name="addPost" hint="Add specific post in the database" returntype="void">
    <cfargument name="title" type="string" required="false" default="" />
    <cfargument name="body" type="string" required="false" default="" />
    <cfargument name="created_at" type="date" required="false" default="" />
    <cfargument name="user_id" type="numeric" required="false" default="" />
    <cfargument name="category_id" type="numeric" required="false" default="" />
     <cfstoredproc procedure="dbo.addPost" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@title" null="no" value="#arguments.title#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_LONGVARCHAR" dbvarname="@body" null="no" value="#arguments.body#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_TIMESTAMP" dbvarname="@created_at" null="no" value="#arguments.created_at#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@user_id" null="no" value="#arguments.user_id#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_INTEGER" dbvarname="@category_id" null="no" value="#arguments.category_id#" />
    </cfstoredproc>
</cffunction>  



</cfcomponent>