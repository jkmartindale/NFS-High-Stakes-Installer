Need For Speed 4 Modern Patch v0.1.0 [2016/05/11]
(C) Evgeny Vrublevsky <me@veg.by>
http://veg.by/en/projects/nfs4/

------------------------------------------------------------------------------------------------------------------------
  How To Install
------------------------------------------------------------------------------------------------------------------------

1. Copy DATA and SAVEDATA directories from the NFS4 CD to a new empty directory.
2. Extract contents of this archive into that directory with replacement of files.
3. Done!

------------------------------------------------------------------------------------------------------------------------
  What's new in v0.1.0 [2016/05/11]
------------------------------------------------------------------------------------------------------------------------

Changes in the nfs4.exe:
- Based on the version 4.50 of the nfshs.exe.
- Fix for the "PatchRestart" problem (command line parser didn't initialize a local variable).
- Fix for "Your hard drive has less than 1MB free space" error.
- The game reads system settings from ini file now. No more registry!
- At first, the game tries to find the ini file with the same name as a executable file name (e.g. nfshs.ini for nfshs.exe). If it is not found, nfs4.ini will be used.
- Internal heap memory limit was extended from 26 to 64 MiB. It have to solve “Out of memory” problem on some rare cases. Also you can control it by OwnHeapLimitMb ini setting (it may be from 32 to 512).
- No more "Render_GetTm() raM out of raN" error for high poly cars. Corresponding buffer is increased from 2 MiB to 8 MiB.
- Suppressing of displaying Windows Error Reporting dialog on fatal errors is disabled by default. So if something go wrong you will know about it. But you can enable suppressing of error reporting via NoErrorReporting setting in the ini file.
- Don't change state of Num Lock/Scroll Lock/Caps Lock.
- Fixes for hardware detection function. Original game by mistake tries to simplify intro video graphics for modern computers because internal benchmark thinks that it is 166MHz processor (signed integer, result of benchmark too big and it is treated as negative). This benchmark was replaced to cpuid which sees processor family (i586/i686 or newer), support of MMX/SSE/SSE2, and in result calculates class of processor which is used by game for choosing default settings and deciding which level of video quality user will see.
- Compact cop's speeds table. Now it looks like the standard opponents list.
- Structure of files of renderers was changed. All renderers are stored in the “drivers” directory, each renderer in the own subdirectory, the name of which is used as a value for the ThrashDriver ini setting. This subdirectory have to contain DLL file of the renderer and thrash.ini file with information about this renderer (File and Type are required fields, type may be d3d, voodoo, or software). This change allows to save several different Glide API emulators to neighbour subdirectories and use them when needed without file replacement.
- The game doesn't try to make own window active permanently. It is very useful for the nGlide's windowed mode.
- NoMovies ini setting which allows to disable intro movie and demo movies.
- SingleProcAffinity setting which allows to bind the process of the game to one core of your CPU. Temporary solution for the problems with the deadlocks.
- All renderers can use any DLL wrappers from the own subdirectories on the Windows XP SP1+.

Changes in the menu files:
- The “NFS4 website” button was replaced by the options button.
- “Download car” buttons were removed (they don't work for a long time).

Changes in the dx6a.dll renderer:
- Based on the original d3da.dll from the NFS4 (uses DirectX 6).
- Fixed a crash when system supports too many texture formats. (Thanks Dege.)
- Restored fog support on the modern systems.
- Resolutions count limit was extended up to 100.
- Dithering is disabled by default in the 16 bit modes.

Changes in the dx7a.dll renderer:
- Based on the dx7z.dll from the Motor City Online.
- Dithering is disabled by default.
- Resolutions under 640×480 are hidden.

Changes in the voodoo2a.dll renderer:
- Based on the original voodoo2a.dll from the NFS4 (uses Glide3x).
- Loads glide3x.dll from the own subdirectory.
- Resolutions are sorted in order.

Changes in the softtria.dll renderer:
- Based on the original softtria.dll from the NFS4.

------------------------------------------------------------------------------------------------------------------------