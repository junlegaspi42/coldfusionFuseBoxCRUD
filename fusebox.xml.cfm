<fusebox>

	<circuits>
        <circuit alias="home" path="controller/home/" parent="" />
        <circuit alias="vhome" path="view/home/" parent="" />
        <circuit alias="layout" path="view/layout/" parent="" />
        <circuit alias="m_model" path="model/users/" parent="" />
    </circuits>

	<parameters>
		<parameter name="defaultFuseaction" value="home.main" />
        <parameter name="fuseactionVariable" value="action" />
        <!-- possible values: development-circuit-load, development-full-load or production: -->
        <parameter name="mode" value="development-full-load" />
        <parameter name="conditionalParse" value="true" />
        <!-- change this to something more secure: -->
        <parameter name="password" value="skeleton" />
        <parameter name="strictMode" value="true" />
        <parameter name="debug" value="false" />
        <!-- we use the core file error templates -->
        <parameter name="errortemplatesPath" value="/fusebox5/errortemplates/" />

        <!--
            These are all default values that can be overridden:
        <parameter name="fuseactionVariable" value="fuseaction" />
        <parameter name="precedenceFormOrUrl" value="form" />
        <parameter name="scriptFileDelimiter" value="cfm" />
        <parameter name="maskedFileDelimiters" value="htm,cfm,cfml,php,php4,asp,aspx" />
        <parameter name="characterEncoding" value="utf-8" />
        <parameter name="strictMode" value="false" />
        <parameter name="allowImplicitCircuits" value="false" />
        -->
	</parameters>

	<globalfuseactions>
        <appinit>
        </appinit>

        <preprocess>
        </preprocess>

        <postprocess>

        </postprocess>
	</globalfuseactions>

    <plugins>
        <phase name="preProcess">
        </phase>
        <phase name="preFuseaction">
        </phase>
        <phase name="postFuseaction">
        </phase>
        <phase name="fuseactionException">
        </phase>
        <phase name="postProcess">
        </phase>
        <phase name="processError">
        </phase>
    </plugins>

</fusebox>
