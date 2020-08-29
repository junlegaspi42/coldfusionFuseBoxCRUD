<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: home --->
<!--- fuseaction: main --->
<cftry>
<cfset myFusebox.thisPhase = "appinit">
<cfset myFusebox.thisCircuit = "home">
<cfset myFusebox.thisFuseaction = "main">
<cfif myFusebox.applicationStart or
		not myFusebox.getApplication().applicationStarted>
	<cflock name="#application.ApplicationName#_fusebox_#FUSEBOX_APPLICATION_KEY#_appinit" type="exclusive" timeout="30">
		<cfif not myFusebox.getApplication().applicationStarted>
			<cfset myFusebox.getApplication().applicationStarted = true />
		</cfif>
	</cflock>
</cfif>
<!--- do action="vhome.main" --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "vhome">
<cfsavecontent variable="body">
<cftry>
<cfoutput><cfinclude template="../view/home/dsp_main.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 12 and right(cfcatch.MissingFileName,12) is "dsp_main.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_main.cfm in circuit vhome which does not exist (from fuseaction vhome.main).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
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

