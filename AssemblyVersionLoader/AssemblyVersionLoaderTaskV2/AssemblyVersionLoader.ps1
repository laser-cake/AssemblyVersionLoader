  
[CmdletBinding()]
param()

## Load for $/Development/DwCms.Base/bin/release/DwCms.Base.dll

## Write all params to the console.
#Write-Host ("Search Pattern: " + $searchPattern)
#Write-Host ("Variables Prefix: " + $variablesPrefix)

function SetBuildVariable([string]$varName, [string]$varValue)
{
    Write-Host ("Setting variable " + $variablesPrefix + $varName + " to '" + $varValue + "'")
    Write-Output ("##vso[task.setvariable variable=" + $variablesPrefix + $varName + ";]" +  $varValue )
}

function SetAssemblyVariables($file)
{
    Write-Host ("Loading assembly file '" + $file + "'...")
    $assemblyName = [System.Reflection.AssemblyName]([System.Reflection.AssemblyName]::GetAssemblyName($file))
    Write-Host ("Loaded assembly file '" + $assemblyName + "'")
    $assemblyVersion = [Version](([Reflection.AssemblyName]$assemblyName)).Version
    $fileVersion = [Version]([System.Diagnostics.FileVersionInfo]::GetVersionInfo($file)).FileVersion
    $productVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($file).ProductVersion
    
    $propertyName = "AssemblyInfo"
    #SetBuildVariable "$prefix$propertyName.Description" $assemblyName.Description
    SetBuildVariable "$prefix$propertyName.Name" $assemblyName.Name

    #$fileInfo = [System.IO.File]::$fileInfo($file)
    #SetBuildVariable "$prefix$propertyName.Build" $fileInfo

    $propertyName = "AssemblyInfo.AssemblyVersion"
    SetBuildVariable "$prefix$propertyName" $assemblyVersion
    SetBuildVariable "$prefix$propertyName.Major" $assemblyVersion.Major
    SetBuildVariable "$prefix$propertyName.Minor" $assemblyVersion.Minor
    SetBuildVariable "$prefix$propertyName.Build" $assemblyVersion.Build
    SetBuildVariable "$prefix$propertyName.Revision" $assemblyVersion.Revision

    $propertyName = "AssemblyInfo.FileVersion"
    SetBuildVariable "$prefix$propertyName" $fileVersion
    SetBuildVariable "$prefix$propertyName.Major" $fileVersion.Major
    SetBuildVariable "$prefix$propertyName.Minor" $fileVersion.Minor
    SetBuildVariable "$prefix$propertyName.Build" $fileVersion.Build
    SetBuildVariable "$prefix$propertyName.Revision" $fileVersion.Revision

    $propertyName = "AssemblyInfo.ProductVersion"
    SetBuildVariable "$prefix$propertyName" $productVersion
}


$file = Get-VstsInput -Name 'sourceFileName' -Require
$variablesPrefix = Get-VstsInput -Name 'variablesPrefix'

Write-Host("Input DLL " + $file)
Write-Host("Prefix " + $variablesPrefix)

SetAssemblyVariables($file)
