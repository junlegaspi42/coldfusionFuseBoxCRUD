<cfsilent>

<!--- Global XFA --->
    <!--- <cfset xfa.viewuserposts = "posts.viewuserposts" />
    <cfset xfa.viewpost = "posts.viewpost" />
    <cfset xfa.editpost = "posts.editpost" />
    <cfset xfa.deletepost = "posts.deletepost" />
    <cfset xfa.addpost = "posts.addpost" />
    <cfset xfa.postcomment = "comments.postcomment" />
    <cfset xfa.deletecomment = "comments.deletecomment" />
    <cfset xfa.updatecomment = "comments.updatecomment" />

<!--- Initialize applicaiton manager components. --->
 --->
    <cfparam name="url.appReload" type="string" default="false"/>
    <cfif not structKeyExists(application, 'appInitialized') or url.appReload>
        <cflock name="appInitBlock" type="exclusive" timeout="10">
            <cfif not structKeyExists(application, 'appInitialized') or url.appReload>
               <!--- <cfset application.usersmanager = createObject('component', 'fb_basiccrud.components.Users.Users').init()/> 
                <cfset application.commentsmanager = createObject('component', 'fb_basiccrud.components.Comments.Comments').init()/>
                <cfset application.postsmanager = createObject('component', 'fb_basiccrud.components.Posts.Posts').init()/>
                <cfset application.categoriesmanager = createObject('component', 'fb_basiccrud.components.Categories.Categories').init()/>
               --->
                <cfset application.myusermanager = createObject('component', 'FuseBox.components.MyUsers.MyUsers').init()/>
                <cfset application.appInitialized = true/>
            </cfif>
        </cflock>
        <cfset structClear(session)/>
    </cfif>

<!--- Set app constants. --->
    <cfset self = "index.cfm">
    <cfset mySelf = "#urlSessionFormat('#self#')#"/>

    <cfif findNoCase('index.cfm;', mySelf)>
        <cfset mySelf = replace(mySelf, 'index.cfm;', 'index.cfm?')/>
    </cfif>

    <cfif right(mySelf, 9) eq "index.cfm">
        <cfset mySelf = mySelf & "?"/>
        <cfelse>
        <cfset mySelf = mySelf & "&"/>
    </cfif>

    <cfset mySelf = mySelf & "#application.fusebox.fuseactionVariable#="/>

</cfsilent>
