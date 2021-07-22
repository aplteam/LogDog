; This script is best executed by LogDog's "Make" utility.

#define MyAppVersion "3.0.1+62"
#define MyAppName "LogDog"
#define MyAppPublisher "APL Team Ltd"
#define MyAppURL "https://github.com/aplteam/LogDog"
#define MyAppIcoName "LogDog.ico"
#define MyBlank " "
#define TargetDir "Dist\"
#define AppId="{{A80D3DD9-EFFC-4DE8-98A0-EC3569AD9607}"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
AppId={#AppID}

AppName="{#MyAppName}"
AppVersion={#MyAppVersion}
AppVerName={#MyAppName}{#MyBlank}{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={commonpf32}\{#MyAppPublisher}\{#MyAppName}
DefaultGroupName={#MyAppPublisher}\{#MyAppName}
AllowNoIcons=yes
OutputDir=C:/Users/kai/AppData/Local/Temp/InnoTempDir/{#AppID}
OutputBaseFilename="SetUp_{#MyAppName}_{#MyAppVersion}"
Compression=lzma
SolidCompression=yes
SetupIconFile={#MyAppIcoName}
UninstallDisplayIcon={app}\{#MyAppIcoName}


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"; LicenseFile: "License";

[Registry]

[Dirs]
Name: "{commonappdata}\{#MyAppName}"; Permissions: users-modify

[Files]
Source: "{#TargetDir}{#MyAppName}.exe"; DestDir: "{app}"
Source: "{#TargetDir}help\*"; DestDir: "{app}\Help"; Flags: recursesubdirs 
Source: "{#TargetDir}ReadMe.html"; DestDir: "{app}";
Source: "{#TargetDir}LogDog.ico"; DestDir: "{app}";
Source: {#MyAppIcoName}; DestDir: "{app}";
Source: "C:\Windows\Fonts\apl385.ttf"; DestDir: "{fonts}"; FontInstall: "APL385 Unicode"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "LICENSE"; DestDir: "{app}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


; ----------- During beta phase only (needed for a Ride):
;Source: "Conga30_32.dll"; DestDir: "{app}";
;Source: "Conga30ssl32.dll"; DestDir: "{app}";
; -----------

[Icons]
Name: "{group}\Start LogDog"; Filename: "{app}\{#MyAppName}.exe"; WorkingDir: "{app}\";  IconFilename: "{app}\{#MyAppIcoName}" 
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppName}.exe"; IconFilename: "{app}\{#MyAppIcoName}"; Tasks: desktopicon

[Run]
Filename: "{app}\ReadMe.html"; Description: "View the README file"; Flags: postinstall shellexec skipifsilent
Filename: "{app}\{#MyAppName}.exe"; Description: "Launch LogDog"; Flags: postinstall skipifsilent nowait

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Code]
