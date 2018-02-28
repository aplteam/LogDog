; This script is best executed by LogDog's "Make" utility.

#define MyAppVersion "2.1.0"
#define MyAppName "LogDog"
#define MyAppExeName "LogDog.exe"
#define MyAppPublisher "APL Team Ltd"
#define MyAppURL "http://github.com/aplteam/LogDog"
#define MyAppIcoName "LogDog.ico"
#define MyBlank " "
#define TargetDir "Dest\"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
AppId={{A80D3DD9-EFFC-4DE8-98A0-EC3569AD9607}

AppName="{#MyAppName}"
AppVersion={#MyAppVersion}
AppVerName={#MyAppName}{#MyBlank}{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf32}\{#MyAppPublisher}\{#MyAppName}
DefaultGroupName={#MyAppPublisher}\{#MyAppName}
AllowNoIcons=yes
OutputDir={#TargetDir}
OutputBaseFilename="SetUp_{#MyAppName}"
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
Source: "{#MyAppExeName}"; DestDir: "{app}";
Source: "ReadMe.html"; DestDir: "{app}";
Source: "LogDog.ico"; DestDir: "{app}";
Source: {#MyAppIcoName}; DestDir: "{app}";
Source: "C:\Windows\Fonts\apl385.ttf"; DestDir: "{fonts}"; FontInstall: "APL385 Unicode"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "LICENSE"; DestDir: "{app}"
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


; ----------- During beta phase only:
;Source: "Conga30_32.dll"; DestDir: "{app}";
;Source: "Conga30ssl32.dll"; DestDir: "{app}";
; -----------

[Icons]
Name: "{group}\Start LogDog"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}\";  IconFilename: "{app}\{#MyAppIcoName}" 
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\{#MyAppIcoName}"; Tasks: desktopicon

[Run]
Filename: "{app}\ReadMe.html"; Description: "View the README file"; Flags: postinstall shellexec skipifsilent
Filename: "{app}\{#MyAppExeName}"; Description: "Launch LogDog"; Flags: postinstall skipifsilent nowait

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Code]