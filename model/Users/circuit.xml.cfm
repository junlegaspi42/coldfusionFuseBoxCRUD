<circuit access="internal">

    <!-- Add new user model -->
    <fuseaction name="add_user">
        <include template="act_add_user.cfm"/>
    </fuseaction> 

    <!-- Remove user model -->
    <fuseaction name="delete_user">
        <include template="act_delete_user.cfm"/>
    </fuseaction> 

    <!-- Update user model -->
    <fuseaction name="update_user">
        <include template="act_update_user.cfm"/>
    </fuseaction> 

</circuit>
