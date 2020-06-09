; This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, you can obtain one at https://mozilla.org/MPL/2.0/.

#define AppIcon "NFSHS.ICO"
#define DisplayName "Need For Speed: High Stakes"
#define DisplayNamePathSafe "Need For Speed High Stakes"
#define SetupVersion "0.1.1"
#define Version "4.50"

; Create a "CD Files" directory to make an all-in-one installer
; Otherwise a CD-dependent installer will be created
#if DirExists("CD Files")
    #define UseCD 0
#else
    #define UseCD 1
#endif

; Represents original program files from the CD
#if UseCD
    #define CDFile(str Source, str DestDir, int Size) \
        'Source: "{code:CD}' + Source + '"; DestDir: "' + DestDir + '"; Components: base; ExternalSize: ' + Str(Size) + '; Flags: external '
#else
    #define CDFile(str Source, str DestDir, int Size) \
        'Source: "CD Files\' + Source + '"; DestDir: "' + DestDir + '"; Components: base; Flags: '
#endif

[Setup]
AppName={#DisplayName}
AppVersion={#Version}
AppVerName={#DisplayName} {#Version} (Patched)
; Output
#if UseCD
    OutputBaseFilename="{#DisplayNamePathSafe} {#Version} (Install Requires CD)"
#else
    OutputBaseFilename="{#DisplayNamePathSafe} {#Version} (Patched)"
#endif
OutputDir=.
; Common
SolidCompression=yes
VersionInfoCompany=James Martindale
#if UseCD
    ; Leave no-CD installer at the default "AppName Setup"
    VersionInfoDescription={#DisplayName} Setup (Install Requires a CD or ISO file)
#endif
VersionInfoVersion={#SetupVersion}
WizardImageFile=left-sidebar.bmp
WizardSmallImageFile=corner-icon.bmp
; Install
AllowNoIcons=yes
AllowRootDirectory=yes
AlwaysShowDirOnReadyPage=yes
AlwaysShowGroupOnReadyPage=yes
ChangesAssociations=yes
DefaultDirName="{autopf}\{#DisplayNamePathSafe}"
DefaultGroupName={#DisplayNamePathSafe}
DisableWelcomePage=no
InfoBeforeFile=infobefore.rtf
SetupIconFile={#AppIcon}
; Uninstall
AppCopyright=Copyright ©1998,1999 Electronic Arts, Inc.
AppPublisher=Electronic Arts, Inc.
AppPublisherURL=https://www.ea.com/
AppReadmeFile="{app}\readme.txt"
AppSupportURL=https://help.ea.com/
; Mutexes
AppMutex=NfsHsMutex
SetupMutex=NfsHsSetupMutex

[Types]
Name: "everything"; Description: "Everything"
Name: "custom"; Description: "Custom"; Flags: iscustom

[Components]
Name: "base"; Description: "Base Game (No CD Patch)"; Types: everything custom; Flags: fixed
Name: "modern"; Description: "Modern Patch 0.1.0 by VEG"; Types: everything
Name: "cars"; Description: "Extra Cars (Official)"; Types: everything
Name: "lensflare"; Description: "Improved Lens Flare Iris by JMK (John Kahler)"; Types: everything;
Name: "fshtool"; Description: "FSHTool 1.22 Game Graphics Converter by Denis Auroux"; Types: everything

[Tasks]
Name: "desktop"; Description: "Create a desktop icon"; GroupDescription: "Additional icons:"; Flags: unchecked
Name: "desktop\user"; Description: "For the current user only"; GroupDescription: "Additional icons:"; Flags: exclusive unchecked
Name: "desktop\common"; Description: "For all users"; GroupDescription: "Additional icons:"; Flags: exclusive unchecked
Name: "quicklaunch"; Description: "Create a Quick Launch icon"; GroupDescription: "Additional icons:"; Flags: unchecked
Name: "novideo"; Description: "Skip intro videos"; GroupDescription: "Other tasks:"; Components: modern; Flags: unchecked
Name: "associate"; Description: "Associate .fsh and .qfs files with FSHTool"; GroupDescription: "Other tasks:"; Components: fshtool

[Files]
; Original program files
#emit CDFile("3DSETUP\3DDATA.DAT", "{app}\3dSetup", 534)
#emit CDFile("3DSETUP\D3DTEST.DLL", "{app}\3dSetup", 212992)
#emit CDFile("Eacsnd.dll", "{app}", 47616)
#emit CDFile("softtria.dll", "{app}", 277504)
#emit CDFile("DATA\*", "{app}\Data", 547235200) + " recursesubdirs sortfilesbyextension"
; Removal is handled by [Code] and not Inno Setup
#emit CDFile("SAVEDATA\RECORDS.DAT", "{app}\SaveData", 468620) + " uninsneveruninstall"
Source: "Base Modifications\*"; DestDir: "{app}"; Components: base; Flags: ignoreversion recursesubdirs sortfilesbyextension
Source: "Base Modifications\readme.txt"; DestDir: "{app}"; Components: base; Flags: isreadme
; Optional components
Source: "Modern Patch\*"; DestDir: "{app}"; Components: modern; Flags: ignoreversion recursesubdirs sortfilesbyextension
Source: "Custom Cars\*"; DestDir: "{app}\SaveData\CARS"; Components: cars; Flags: recursesubdirs sortfilesbyextension
Source: "Stock Cars\*"; DestDir: "{app}\Data"; Components: cars; Flags: recursesubdirs sortfilesbyextension
Source: "Lens Flare Fix\SFX.FSH"; DestDir: "{app}\Data\GameArt"; Components: lensflare; Flags: ignoreversion
Source: "FSHTool\*"; DestDir: "{app}\FSHTool"; Components: fshtool;
; Windows 8.1 is the first version to add custom desktop icon tiles
Source: "Tile\*"; DestDir: "{app}"; Components: base; MinVersion: 6.3

[Icons]
; Start
Name: "{group}\Classic NFS on Telegram"; Filename: "https://t.me/classicnfs"; Flags: excludefromshowinnewinstall
Name: "{group}\Help Guide"; Filename: "{app}\Eahelp.chm"; WorkingDir: "{app}"; Flags: excludefromshowinnewinstall
Name: "{group}\IPLounge"; Filename: "http://www.iplounge.net/"; Flags: excludefromshowinnewinstall
Name: "{group}\Manual"; Filename: "{app}\Manual.pdf"; WorkingDir: "{app}"; Flags: excludefromshowinnewinstall
Name: "{group}\{#DisplayNamePathSafe}"; Filename: "{app}\nfshs.exe"; WorkingDir: "{app}"
Name: "{group}\NFSCars"; Filename: "https://www.nfscars.net/"; Flags: excludefromshowinnewinstall
Name: "{group}\Reference Card"; Filename: "{app}\Reference Card.pdf"; Flags: excludefromshowinnewinstall
Name: "{group}\Reference Card Addendum"; Filename: "{app}\readme.txt"; Flags: excludefromshowinnewinstall
Name: "{group}\FSHTool"; Filename: "{app}\FSHTool"; Components: fshtool; Check: not WizardNoIcons
; Desktop
Name: "{commondesktop}\{#DisplayNamePathSafe}"; Filename: "{app}\nfshs.exe"; WorkingDir: "{app}"; Tasks: desktop\common
Name: "{userdesktop}\{#DisplayNamePathSafe}"; Filename: "{app}\nfshs.exe"; WorkingDir: "{app}"; Tasks: desktop\user
; Quick Launch
Name: "{autoappdata}\{#DisplayNamePathSafe}"; Filename: "{app}\nfshs.exe"; WorkingDir: "{app}"; Tasks: quicklaunch

[INI]
Filename: "{app}\nfs4.ini"; Section: "NFS4"; Key: "NoMovies"; String: "1"; Tasks: novideo

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "3D Card"; ValueType: String; ValueData: "Software Renderer";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "3D Device Description"; ValueType: String; ValueData: "Software Renderer";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "D3D Device"; ValueType: Dword; ValueData: "$0";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "Group"; ValueType: String; ValueData: "Software";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "Hardware Acceleration"; ValueType: Dword; ValueData: "$0";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "InstallPath"; ValueType: String; ValueData: "{app}";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "Thrash Driver"; ValueType: String; ValueData: "softtri";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "Thrash Resolution"; ValueType: String; ValueData: "640x480";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "Triple Buffer"; ValueType: Dword; ValueData: "$0";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes"; ValueName: "Version"; ValueType: String; ValueData: "4.00";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes\1.0";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes\1.0"; ValueName: "InstLev"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes\1.0"; ValueName: "Language"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\Need For Speed High Stakes\1.0"; ValueName: "Variant"; ValueType: Dword; ValueData: "$1";
; Prevents a corruption error
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\NfsHs.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletekey
; File associations
Root: HKLM; Subkey: "Software\Classes\.fsh"; ValueType: string; ValueName: ""; ValueData: "EA.NeedForSpeed.fsh"; Tasks: associate; Flags: uninsdeletevalue
Root: HKLM; Subkey: "Software\Classes\EA.NeedForSpeed.fsh"; ValueType: string; ValueName: ""; ValueData: "Need for Speed Bitmap Image"; Tasks: associate; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Classes\EA.NeedForSpeed.fsh\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\nfshs.exe,0"; Tasks: associate;
Root: HKLM; Subkey: "Software\Classes\EA.NeedForSpeed.fsh\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\FSHTool\fshtool.exe"" ""%1"""; Tasks: associate
Root: HKLM; Subkey: "Software\Classes\.qfs"; ValueType: string; ValueName: ""; ValueData: "EA.NeedForSpeed.qfs"; Tasks: associate; Flags: uninsdeletevalue
Root: HKLM; Subkey: "Software\Classes\EA.NeedForSpeed.qfs"; ValueType: string; ValueName: ""; ValueData: "Need for Speed Compressed Bitmap Image"; Tasks: associate; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Classes\EA.NeedForSpeed.qfs\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\nfshs.exe,0"; Tasks: associate
Root: HKLM; Subkey: "Software\Classes\EA.NeedForSpeed.qfs\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\FSHTool\fshtool.exe"" ""%1"""; Tasks: associate
; Unfortunately I can't delete these on uninstall because they could be used by other Need For Speed games
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "1"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "2"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "3"; ValueType: Dword; ValueData: "$4";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "4"; ValueType: Dword; ValueData: "$5";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "5"; ValueType: Dword; ValueData: "$7";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "6"; ValueType: Dword; ValueData: "$9";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "7"; ValueType: Dword; ValueData: "$A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "8"; ValueType: Dword; ValueData: "$B";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "9"; ValueType: Dword; ValueData: "$C";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "10"; ValueType: Dword; ValueData: "$D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "11"; ValueType: Dword; ValueData: "$8";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "12"; ValueType: Dword; ValueData: "$3";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "13"; ValueType: Dword; ValueData: "$6";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "14"; ValueType: Dword; ValueData: "$E";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "15"; ValueType: Dword; ValueData: "$F";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "16"; ValueType: Dword; ValueData: "$10";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "17"; ValueType: Dword; ValueData: "$11";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "18"; ValueType: Dword; ValueData: "$12";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "19"; ValueType: Dword; ValueData: "$13";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "20"; ValueType: Dword; ValueData: "$14";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "21"; ValueType: Dword; ValueData: "$15";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "Cards"; ValueType: Dword; ValueData: "$15";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data"; ValueName: "Version"; ValueType: Dword; ValueData: "$16";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card1"; ValueName: "Group"; ValueType: String; ValueData: "Software";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card1"; ValueName: "Module"; ValueType: String; ValueData: "softtri";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card1"; ValueName: "Name"; ValueType: String; ValueData: "Software Renderer";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card1"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card1\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$0";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card1\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$0";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card2"; ValueName: "Group"; ValueType: String; ValueData: "3Dfx";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card2"; ValueName: "Module"; ValueType: String; ValueData: "voodoo2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card2"; ValueName: "Name"; ValueType: String; ValueData: "3Dfx Voodoo2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card2"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card2\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card2\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$121A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card3"; ValueName: "Group"; ValueType: String; ValueData: "3Dfx";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card3"; ValueName: "Module"; ValueType: String; ValueData: "voodoo2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card3"; ValueName: "Name"; ValueType: String; ValueData: "3Dfx Banshee";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card3"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card3\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$3";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card3\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$121A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card4"; ValueName: "Group"; ValueType: String; ValueData: "3Dfx";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card4"; ValueName: "Module"; ValueType: String; ValueData: "voodoo";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card4"; ValueName: "Name"; ValueType: String; ValueData: "3Dfx Voodoo";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card4"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card4\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card4\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$121A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5"; ValueName: "Group"; ValueType: String; ValueData: "3Dfx";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5"; ValueName: "Module"; ValueType: String; ValueData: "voodoo";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5"; ValueName: "Name"; ValueType: String; ValueData: "3Dfx Voodoo Rush";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5"; ValueName: "Types"; ValueType: Dword; ValueData: "$3";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$643D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1142";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5\Type2"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$8626";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5\Type2"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$121A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5\Type3"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$8626";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card5\Type3"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$10D9";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card6"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card6"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card6"; ValueName: "Name"; ValueType: String; ValueData: "Matrox G200";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card6"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card6\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$521";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card6\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$102B";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card7"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card7"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card7"; ValueName: "Name"; ValueType: String; ValueData: "NVidia RIVA 128";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card7"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card7\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$18";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card7\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$12D2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card8"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card8"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card8"; ValueName: "Name"; ValueType: String; ValueData: "Intel i740";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card8"; ValueName: "Types"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card8\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$7800";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card8\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$8086";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card8\Type2"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$D1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card8\Type2"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card9"; ValueName: "Group"; ValueType: String; ValueData: "NEC";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card9"; ValueName: "Module"; ValueType: String; ValueData: "powervr";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card9"; ValueName: "Name"; ValueType: String; ValueData: "PowerVR";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card9"; ValueName: "Types"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card9\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$2A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card9\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1033";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card9\Type2"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$46";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card9\Type2"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1033";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card10"; ValueName: "Group"; ValueType: String; ValueData: "Rendition";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card10"; ValueName: "Module"; ValueType: String; ValueData: "verite";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card10"; ValueName: "Name"; ValueType: String; ValueData: "Rendition V2100/V2200";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card10"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card10\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$2000";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card10\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1163";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card11"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card11"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card11"; ValueName: "Name"; ValueType: String; ValueData: "Chromatic Mpact 2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card11"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card11\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card11\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$110B";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12"; ValueName: "Group"; ValueType: String; ValueData: "ATI";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12"; ValueName: "Module"; ValueType: String; ValueData: "rage";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12"; ValueName: "Name"; ValueType: String; ValueData: "ATI Rage Pro";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12"; ValueName: "Types"; ValueType: Dword; ValueData: "$8";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4742";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type2"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4750";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type2"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type3"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4744";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type3"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type4"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4749";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type4"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type5"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4C42";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type5"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type6"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4C47";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type6"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type7"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4C49";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type7"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type8"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4C50";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card12\Type8"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card13"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card13"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card13"; ValueName: "Name"; ValueType: String; ValueData: "3DLabs Permedia 2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card13"; ValueName: "Types"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card13\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$3D07";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card13\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$104C";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card13\Type2"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$9";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card13\Type2"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$3D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card14"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card14"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card14"; ValueName: "Name"; ValueType: String; ValueData: "S3 Savage 3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card14"; ValueName: "Types"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card14\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$8A20";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card14\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$5333";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card14\Type2"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$8A21";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card14\Type2"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$5333";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card15"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card15"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card15"; ValueName: "Name"; ValueType: String; ValueData: "S3 Virge VX";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card15"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card15\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$883D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card15\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$5333";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card16"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card16"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card16"; ValueName: "Name"; ValueType: String; ValueData: "S3 Virge DX/GX";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card16"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card16\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$8A01";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card16\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$5333";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card17"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card17"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card17"; ValueName: "Name"; ValueType: String; ValueData: "S3 Virge";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card17"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card17\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$5631";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card17\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$5333";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card18"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card18"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card18"; ValueName: "Name"; ValueType: String; ValueData: "NVidia TNT";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card18"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card18\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$20";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card18\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$10DE";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card19"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card19"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card19"; ValueName: "Name"; ValueType: String; ValueData: "SiS 6326";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card19"; ValueName: "Types"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card19\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$6326";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card19\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1039";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card20"; ValueName: "Group"; ValueType: String; ValueData: "D3D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card20"; ValueName: "Module"; ValueType: String; ValueData: "d3d";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card20"; ValueName: "Name"; ValueType: String; ValueData: "ATI Rage 128";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card20"; ValueName: "Types"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card20\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$5245";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card20\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card20\Type2"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$5246";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card20\Type2"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$1002";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card21"; ValueName: "Group"; ValueType: String; ValueData: "3Dfx";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card21"; ValueName: "Module"; ValueType: String; ValueData: "voodoo2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card21"; ValueName: "Name"; ValueType: String; ValueData: "3Dfx Voodoo3";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card21"; ValueName: "Types"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card21\Type1"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$4";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card21\Type1"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$121A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card21\Type2"; ValueName: "DeviceID"; ValueType: Dword; ValueData: "$5";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Card21\Type2"; ValueName: "VendorID"; ValueType: Dword; ValueData: "$121A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "1"; ValueType: Dword; ValueData: "$1";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "2"; ValueType: Dword; ValueData: "$15";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "3"; ValueType: Dword; ValueData: "$2";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "4"; ValueType: Dword; ValueData: "$3";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "5"; ValueType: Dword; ValueData: "$12";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "6"; ValueType: Dword; ValueData: "$6";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "7"; ValueType: Dword; ValueData: "$4";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "8"; ValueType: Dword; ValueData: "$5";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "9"; ValueType: Dword; ValueData: "$14";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "10"; ValueType: Dword; ValueData: "$7";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "11"; ValueType: Dword; ValueData: "$E";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "12"; ValueType: Dword; ValueData: "$8";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "13"; ValueType: Dword; ValueData: "$9";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "14"; ValueType: Dword; ValueData: "$A";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "15"; ValueType: Dword; ValueData: "$B";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "16"; ValueType: Dword; ValueData: "$D";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "17"; ValueType: Dword; ValueData: "$C";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "18"; ValueType: Dword; ValueData: "$13";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "19"; ValueType: Dword; ValueData: "$F";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "20"; ValueType: Dword; ValueData: "$10";
Root: HKLM; Subkey: "SOFTWARE\Electronic Arts\3D Data\Sort Order"; ValueName: "21"; ValueType: Dword; ValueData: "$11";

[Code]
var
    // Cache
    CDDriveLetter: string;

// Mostly not my code
#include "FindDisc.pas"

// Hook that to cache CDDriveLetter at the beginning
procedure InitializeWizard();
begin
    #if UseCD
        CDDriveLetter := GetSourceCdDrive();
    #endif
end;

// Scripted constants require a function and can't directly access a global variable
function CD(Param: string): string;
begin
    Result := CDDriveLetter;
end;

// Get the VirtualStore filepath based on {app}
function VirtualStorePath(Path: string): string;
var
    Drive: string;
begin
    Drive := ExtractFileDrive(Path);
    Result := ExpandConstant('{localappdata}\VirtualStore') + Copy(Path, Length(Drive) + 1, Length(Path) - Length(Drive));
end;

// Hook that runs right after uninstall to optionally delete save data
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
    ProgramFiles, SaveData, VirtualStore: string;
begin
    if CurUninstallStep = usPostUninstall then
    begin
        // Sanity check, mainly for debugging
        SaveData := ExpandConstant('{app}\SaveData');
        if DirExists(SaveData) then
            if MsgBox('Do you want to delete your saved cars and records?', mbConfirmation, MB_YESNO) = IDYES then
            begin
                DelTree(SaveData, True, True, true);
                ProgramFiles := ExpandConstant('{app}');
                RemoveDir(ProgramFiles); // Only works if directory is empty

                VirtualStore := VirtualStorePath(ProgramFiles);
                DelTree(VirtualStore + '\SaveData', True, True, true);
                RemoveDir(VirtualStore);
            end;
    end;
end;
