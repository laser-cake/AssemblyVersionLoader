# Assembly version loader

A build task that reads the assembly file attributes from a compiled assembly file and makes them available as build variables. This extension was created from the need to have a full assembly version places into nuspec files. This extension will extract the required version data from your compiled DLL file(s).

### Arguments
##### Source assembly file
The .dll file to load and make available as variables.

##### Variables Prefix
The value entered here will be prefixed to each variable name generated.  This can be useful when using this task multiple times during a build and pointing each task to different assembly files.

Example: 
```
$([YourPrefix]AssemblyInfo.AssemblyVersion.Major)
```

### Generated Variables
For each assembly attribute in the .dll, a build variable will be created in the format of:

Example: 
```
$(AssemblyInfo.AssemblyVersion.Major)
``` 

| Variable | Description |
|----------|-------------|
| AssemblyInfo.AssemblyVersion | The full assembly version. |
| AssemblyInfo.AssemblyVersion.Major | Major digit from the assembly version. |
| AssemblyInfo.AssemblyVersion.Minor | Minor digit from the assembly version. |
| AssemblyInfo.AssemblyVersion.Build | Build digit from the assembly version. |
| AssemblyInfo.AssemblyVersion.Revision | Revision digit from the assembly version. |
| AssemblyInfo.FileVersion | The full file version. |
| AssemblyInfo.FileVersion.Major | Major digit from the file version. |
| AssemblyInfo.FileVersion.Minor | Minor digit from the file version. |
| AssemblyInfo.FileVersion.Build | Build digit from the file version. |
| AssemblyInfo.FileVersion.Revision | Revision digit from the file version. |

# Credits
This extension was created out of inspiration of (and derived from):
 - [Nuget version synchronizer by Cdiscount Alm](https://marketplace.visualstudio.com/items?itemName=CdiscountAlm.vsts-nugetversionsynchronizer-tasks)
 - [Assembly Info Reader by Kyle Herzog](https://marketplace.visualstudio.com/items?itemName=kherzog.AssemblyInfoReader)

 #About Paul
 A software developer for over 15 years, currently employed at Dazzleware B.V. We build custom tailored software that integrate with the core businesses of our customers. Making them more empowered in their field of expertise. 