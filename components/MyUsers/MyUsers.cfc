<cfcomponent displayname="MyUsers">  

    <cffunction name="Init" access="public" returntype="MyUsers" output="false" displayname="" hint="">
            <cfreturn this />
        </cffunction>
    
 
    <!--- Register user --->
    <cffunction name="InsertUser">
        <cfargument name="form" type="struct" required="yes"> 
        <cfquery name="AddUser" result="result" datasource="MyDB">

            INSERT INTO user_table(
                name, 
                email , 
                password, 
                created_at)

            VALUES (
                '#arguments.form['name']#', 
                '#arguments.form['email']#', 
                '#arguments.form['password']#', 
                #Now()#)
          
        </cfquery>          
        <cfreturn result />
    </cffunction>

    <!--- Remove user --->
    <cffunction name="DeleteUser">
        <cfargument name="form" type="struct" required="yes"> 
        <cfquery name="DeleteUser" result="result" datasource="MyDB">

                DELETE FROM user_table
                WHERE id = #arguments.form['id']# 
          
        </cfquery>          
        <cfreturn result />
    </cffunction>

    <!--- Update user --->
    <cffunction name="UpdateUser">
        <cfargument name="form" type="struct" required="yes"> 
        <cfquery name="UpdateUser" result="result" datasource="MyDB">

                UPDATE user_table
                SET name = '#arguments.form['name']#',
                    email = '#arguments.form['email']#',
                    password = '#arguments.form['password']#',
                    updated_at = #Now()#
                WHERE id = '#arguments.form['id']#'
            
        </cfquery>          
        <cfreturn result />
    </cffunction>

</cfcomponent>