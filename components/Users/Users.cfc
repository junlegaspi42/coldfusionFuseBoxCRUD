<cfcomponent displayname="Users">  

<cffunction name="Init" access="public" returntype="Users" output="false" displayname="" hint="">
        <cfreturn this />
    </cffunction>


<!--- Register user --->
<cffunction name="registerUser" returntype="void">
    <cfargument name="name" type="string" required="yes" default="" />
    <cfargument name="username" type="string" required="yes" default="" />
    <cfargument name="password" type="string" required="yes" default="" />
    <cfargument name="birthdate" type="date" required="yes" default="" />
    <cfargument name="email" type="string" required="no" default="" />

    <cfstoredproc procedure="dbo.registerUser" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@name" null="no" value="#arguments.name#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@username" null="no" value="#arguments.username#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@password" null="no" value="#arguments.password#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@email" null="no" value="#arguments.email#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_DATE" dbvarname="@birthdate" null="no" value="#arguments.birthdate#" />
    </cfstoredproc>

</cffunction>


<!--- login user --->
<cffunction name="loginUser" returntype="query">
    <cfargument name="username" type="string" required="yes" default="" />
    <cfargument name="password" type="string" required="yes" default="" />

    <cfstoredproc procedure="dbo.loginUser" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@username" null="no" value="#arguments.username#" />
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@password" null="no" value="#arguments.password#" />
        <cfprocresult name="log_user">
    </cfstoredproc>

    <cfreturn log_user>
</cffunction>

<cffunction name="getAllUsers" returntype="query">

    <cfstoredproc procedure="dbo.getAllUsers" datasource="basic">
        <cfprocresult name="get_all_users">
    </cfstoredproc>

    <cfreturn get_all_users>
</cffunction>

<cffunction name="getUsersByEmail" returntype="query">

<cfargument name="email" type="string" required="yes" default="" />
    <cfstoredproc procedure="dbo.getUsersByEmail" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@email" null="no" value="#arguments.email#" />
        <cfprocresult name="get_users_by_email">
    </cfstoredproc>

    <cfreturn get_users_by_email>
</cffunction>


<cffunction name="getUsersByUsername" returntype="query">

<cfargument name="username" type="string" required="yes" default="" />
    <cfstoredproc procedure="dbo.getUsersByUsername" datasource="basic">
        <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" dbvarname="@username" null="no" value="#arguments.username#" />
        <cfprocresult name="get_users_by_username">
    </cfstoredproc>

    <cfreturn get_users_by_username>
</cffunction>


</cfcomponent>