<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: home --->
<!--- fuseaction: profile --->
<cftry>
<cfset myFusebox.thisPhase = "appinit">
<cfset myFusebox.thisCircuit = "home">
<cfset myFusebox.thisFuseaction = "profile">
<cfif myFusebox.applicationStart or
		not myFusebox.getApplication().applicationStarted>
	<cflock name="#application.ApplicationName#_fusebox_#FUSEBOX_APPLICATION_KEY#_appinit" type="exclusive" timeout="30">
		<cfif not myFusebox.getApplication().applicationStarted>
			<cfset myFusebox.getApplication().applicationStarted = true />
		</cfif>
	</cflock>
</cfif>
<!--- do action="vhome.profile" --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "vhome">
<cftry>
<cfoutput><cfinclude template="../view/home/dsp_profile.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 15 and right(cfcatch.MissingFileName,15) is "dsp_profile.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_profile.cfm in circuit vhome which does not exist (from fuseaction vhome.profile).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

