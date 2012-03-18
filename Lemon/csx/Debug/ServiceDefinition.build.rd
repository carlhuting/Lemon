<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="Lemon" generation="1" functional="0" release="0" Id="0b6bd7aa-82d9-4a6f-b9d6-57f642f1cffd" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="LemonGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="MvcWebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/Lemon/LemonGroup/LB:MvcWebRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="MvcWebRole:DataConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/Lemon/LemonGroup/MapMvcWebRole:DataConnectionString" />
          </maps>
        </aCS>
        <aCS name="MvcWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/Lemon/LemonGroup/MapMvcWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="MvcWebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/Lemon/LemonGroup/MapMvcWebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:MvcWebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/Lemon/LemonGroup/MvcWebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapMvcWebRole:DataConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/Lemon/LemonGroup/MvcWebRole/DataConnectionString" />
          </setting>
        </map>
        <map name="MapMvcWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/Lemon/LemonGroup/MvcWebRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapMvcWebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/Lemon/LemonGroup/MvcWebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="MvcWebRole" generation="1" functional="0" release="0" software="E:\ProgramD\C#\Lemon\Lemon\csx\Debug\roles\MvcWebRole" entryPoint="base\x86\WaHostBootstrapper.exe" parameters="base\x86\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="8080" />
            </componentports>
            <settings>
              <aCS name="DataConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;MvcWebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;MvcWebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/Lemon/LemonGroup/MvcWebRoleInstances" />
            <sCSPolicyFaultDomainMoniker name="/Lemon/LemonGroup/MvcWebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="MvcWebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="MvcWebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="339ac787-3ea2-44aa-bc1c-27279b969094" ref="Microsoft.RedDog.Contract\ServiceContract\LemonContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="248dc2be-dd90-4f5c-b8f1-41d6f48bd004" ref="Microsoft.RedDog.Contract\Interface\MvcWebRole:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/Lemon/LemonGroup/MvcWebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>