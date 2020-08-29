<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: home --->
<!--- fuseaction: delete_user --->
<cftry>
<cfset myFusebox.thisPhase = "appinit">
<cfset myFusebox.thisCircuit = "home">
<cfset myFusebox.thisFuseaction = "delete_user">
<cfif myFusebox.applicationStart or
		not myFusebox.getApplication().applicationStarted>
	<cflock name="#application.ApplicationName#_fusebox_#FUSEBOX_APPLICATION_KEY#_appinit" type="exclusive" timeout="30">
		<cfif not myFusebox.getApplication().applicationStarted>
			<cfset myFusebox.getApplication().applicationStarted = true />
		</cfif>
	</cflock>
</cfif>
<!--- do action="m_model.delete_user" --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "m_model">
<cftry>
<cfoutput><cfinclude template="../model/users/act_delete_user.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 19 and right(cfcatch.MissingFileName,19) is "act_delete_user.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse act_delete_user.cfm in circuit m_model which does not exist (from fuseaction m_model.delete_user).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfset myFusebox.thisCircuit = "home">
<cflocation url="index.cfm?action=home.main" addtoken="false">
<cfabort>
<!--- do action="layout.mainLayout" --->
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "mainLayout">
<cftry>
<cfoutput><cfinclude template="../view/layout/mainLayout.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 14 and right(cfcatch.MissingFileName,14) is "mainLayout.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse mainLayout.cfm in circuit layout which does not exist (from fuseaction layout.mainLayout).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

