			 Electronic Arts(TM) presents
		     NEED FOR SPEED(TM): HIGH STAKES


		     MANUAL AND REFERENCE CARD ADDENDUM



WHAT THIS FILE IS
=================
This file contains information which became available after the
Manual and Reference Card were printed. If you are experiencing
problems not covered in the Reference Card or in this README,
please contact EA Customer Support (see contact methods in the
Reference Card).


***********************************************************************

				ADDENDUM

***********************************************************************

EJECTING THE GAME CD
====================
Never eject the game CD when the game is running without having been
prompted by the game to do so.


CD AUDIO FEATURE
================
This feature should only be used with normal audio CDs, no "enhanced"
CDs, Playstation CDs, etc.
Do not run an external CD player program to play your audio CD.  Let
the game play the CD.


CREATIVE LABS SBLIVE EAX REVERB
===============================
For optimal gameplay use the following to set SBLive EAX levels:
-Go to your SBLive popup and select Audio HQ.  Then select Env. Audio.  
-Select the MASTER tab and set Reverb effect amount to 0% (we also
 suggest setting Chorus Effect to 0%). 
-Select the SOURCE tab and select CD audio from the "Select Source"
 drop-down list. Select Reverb Effect and set Amount to 0% (we also
 suggest setting Chorus Effect to 0%). 
-Select the SOURCE tab and select Wave/DirectSound from the "Select
 Source" drop-down list. Select Reverb Effect and set Amount to 100%
 (we also suggest setting Chorus Effect to 100%).  


POWER MANAGEMENT SUSPEND/SLEEP MODES
====================================
Systems (i.e. laptops or other portables) that automatically power down
into "sleep" or "suspended" modes can cause NFS:HS to lose control of
the screen and keyboard, possibly causing a crash.  We strongly
recommend that you disable these features before running NFS:HS.


AUDIO CDs NOT ALLOWED IN MULTIPLAYER GAMES
==========================================
If an audio CD is playing and you try to connect players, a dialog
will come up stating that you cannot have CD audio in network play
and will ask you for the game CD.  Also, if you go to the audio option
screen while in a network setup, the CD audio music type will not be
available in the music type menu.


MULTIPLAYER DROP-OUT
====================
If your system is unable to communicate fast enough with the rest of
the players in a multiplayer game using "Controller Updates", you
will be dropped from the game as it is about to begin.  To play over
slow/congested lines (through a slow ISP in particular), host the game 
with the "Positional Updates" option selected.  Positional update games
will allow users to play with high average latencies (anything over
20 ms latencies will start to degrade "Controller Update" games),
and up to 10-15 second peak, communication blackouts.


OPPONENT CAMERA VIEWS
=====================
During a race, left-clicking the mouse on either the opponent list
or the opponent dots on the track map display will shift the point
of view to that opponent's car.  Right-clicking the mouse anywhere
will return the game to your point of view.


DARK CARS
=========
If the cars appear too dark in the game, try turning Car Shading off
(from the Main menu select Options, then Graphics, and then
Car Shading).


3D DEVICE SETUP
===============
For systems equipped with 3D video accelerators, it is highly
recommended that the latest versions of all video drivers be obtained
and installed.  A software renderer is provided for those without 3D
accelerators.

A configuration utility called "3D Device Setup" is installed with
NFS:HS.  This utility controls how NFS:HS will draw to your system's
video hardware.  When you install NFS:HS, "3D Device Setup" automatically
makes a default selection, and normally users will find this selection
satisfactory.  It is recommended that this default choice NOT be
altered.

"3D Device Setup" is provided for the following unusual cases:
  - You install or remove video devices
  - You have more than one supported 3D accelerator installed
  - The default rendering interface fails

Whenever you install or remove video devices, do not run NFS:HS again
without first running "3D Device Setup" from the Start Menu.
By default, the "3D Device Setup" shortcut is located in the
"Start Menu\Programs\Electronic Arts\Need For Speed: High Stakes" folder.

Immediately, "3D Device Setup" will test your system for the presence
of supported video devices (this may be accompanied by a black screen
flash on your monitor).  When "3D Device Setup" comes up, press the
"Use Defaults" button to automatically select the best video device
for NFS:HS. Press the "OK" button to quit the utility.

NFS:HS should now function correctly.


DIRECT3D SUPPORT
================
Although Direct3D is supported, this support is only officially
extended to certain 3D accelerator devices.  Among these are
Riva 128, Intel i740 and ATI Rage Pro.

While Direct3D supports a wider variety of 3D accelerator devices, and
the "3D Device Setup" utility allows you to force the game to run using
these unsupported devices, the behavior of NFS:HS cannot be predicted in
these situations.  In extreme cases, running NFS:HS with a Direct3D
device that is not officially supported can lead to program crashes
and/or system crashes.

* If the "3D Device Setup" utility (described above) indicates that your
* selected device is "Direct3D Device n" (where n is a number, such as 1),
* it means that you are running the game on a device that is not officially
* supported.

Under Direct3D, the performance of NFS:HS (in both graphics AND audio)
is influenced greatly by the Direct3D driver versions that are
installed.  It is highly recommended that the latest versions of all
video drivers be obtained and installed.  Please consult your card
manufacturer for their newest drivers. Also, keep in mind that video
chip manufacterers sometimes provide drivers in addition to the card
manufacturer.  For instance, 3Dfx Interactive, Inc. (www.3dfx.com)
provides drivers that can be used effectively with the Diamond Monster
3D card, Creative 3D Blaster Voodoo2 card, and other cards using the
3Dfx chipset.


CONFIGURING PROGRAMMABLE CONTROLLERS
====================================
Some controller devices allow you to program them to produce output that
is customized for a particular game.  If you use a device with NFS:HS that
is custom programmed for another game, you may see unexpected results
when setting the controller configuration in NFS:HS.
For example, if button "A" on a joystick has been programmed to behave
as if it were the "H" key on the keyboard, and you try to assign the
Accelerate function to this button in the NFS:HS CONTROLLERS screen, the 
button will be interpreted by NFS:HS as "Keyboard H" instead of 
"Joystick Button A".  This would cause a conflict only if you tried
to assign some other function to the actual keyboard "H".


ARROW KEYS AND THE NUMERIC KEYPAD
=================================
The arrow keys and the 2, 4, 6 and 8 keys on the numeric keypad are
treated the same by NFS:HS.  This means that for the following pairs
of keys, only one key in the pair can be assigned a function:
  The up arrow and the 8 key.
  The down arrow and the 2 key.
  The right arrow and the 6 key.
  The left arrow and the 4 key. 


FORCE FEEDBACK SUPPORT
======================
Ensure all cables are properly attached and your Force Feedback device
is configured properly under Windows, and run NFS:HS.  From the Main menu,
select OPTIONS, then CONTROLLERS, and then FORCE FEEDBACK.  If the
FORCE FEEDBACK option is grayed-out, your device was not detected;
double-check that your device configuration in Windows is correct, and
try again.  If your device configuration appears to be correct, your
device drivers may need to be updated; contact the manufacturer of your
device to obtain the latest drivers.

If the device is detected, the Force Feedback sensitivity menu will
appear.  Use your mouse to select the various force levels you desire;
maximum force is exerted when a bar is all the way to the right, and
all force is disabled when a bar is all the way to the left (select
this level for all forces if you want to use your force feedback
controller as a normal device without any forces).
NOTE: Some forces are mutually exclusive (i.e., body roll and road
grip).


CONTROLLER CONFIGURATION
========================
If you attempt to configure your controller (i.e., joystick, wheel,
pedals) on the CONTROLLERS screen, it is important that you keep the
joystick or wheel centered and not depress the pedals; doing so can
cause the controller to perform in a reverse manner.

Make sure that you have the pedals in the full up position (off gas)
when you select to map a pedal as a control (i.e., ACCELERATE or BRAKE).
If you have the pedal depressed when you try to map it as either
ACCELERATE or BRAKE and then release the pedal to map it, then the
pedal will have a reverse effect in gameplay: releasing the pedal with
your foot will act as acceleration, and depressing the pedal will let
off the gas.

Make sure that you have the steering wheel in the center position when
you select STEER LEFT on the CONTROLLERS screen, and then move the
steering wheel to the left to map it correctly.  If you are holding the
steering wheel to the left when you click on the STEER LEFT selection
and then release the steering wheel, this will result in your steering
wheel being mapped backwards in gameplay: steering left with the
steering wheel in gameplay will result in your car steering more to the
right.


THRUSTMASTER T1 AND T2 WHEEL CONFIGURATION
==========================================
Some joysticks/wheels may have centering problems when calibrated in
Windows 95 and Windows 98.  ThrustMaster (www.ThrustMaster.com) has a
utility called "ProPanel" that fixes calibration problems with
ThrustMaster devices, and it may also fix the problem for other
device brands.


***********************************************************************

			       TROUBLESHOOTING

***********************************************************************

NFS:HS CD MUST BE PRESENT TO LAUNCH GAME
========================================
The NFS:HS disk must be in the CD-ROM drive when you start the game.
If your system has more than one CD-ROM drive, be sure the game disk
is in the same drive you installed the game from.


CD AUTOPLAY FEATURE
===================
Inserting the game CD into your CD-ROM drive and then immediately
running the game either from the Windows Start menu or by
double-clicking the game's Desktop icon may cause a conflict with
the CD-ROM's AutoPlay feature.
The easiest way to avoid this potential conflict is to always wait a
few moments after inserting the CD to allow the AutoPlay feature to 
complete before running the game.


BACKGROUND PROGRAMS
===================
Avoid running other programs in the background.

Programs starting up automatically can cause NFS:HS to lose control of
the screen and keyboard, possibly causing a crash.  We strongly
recommend that you shut down or suspend applications that start up
automatically or programs that automatically run other applications
at specified times before running NFS:HS.  These include, but are not
limited to:
	- Windows System Agent
  	- Windows Task Scheduler
	- Windows 98 "Disk Cleanup" utility

Similarly, message boxes and dialog boxes from other programs or from
Windows itself can also cause NFS:HS to lose control of the screen and
keyboard, possibly causing a crash. We strongly recommend that you shut 
down all other applications before running NFS:HS.  These include, but
are not limited to:
  	- Email programs
	- Calendar, appointment, or contact applications
	- Network or Internet chat programs


SWITCHING FOCUS AWAY FROM THE GAME
==================================
If you do have other applications running at the same time as the game,
avoid switching focus away from the game (with ALT+TAB, for example).
You may not be able to get back to the game successfully.


PROPRIETARY KEYBOARDS, MICE, AND OTHER INPUT DEVICES
====================================================
Some systems or peripherals provide additional shortcut keys or
hotkeys that automatically launch applications.  The launching of
other programs can cause NFS:HS to lose control of the screen and
keyboard and possibly crash.  
We strongly recommend that you either not use or disable these special
keys while running NFS:HS.  These include but are not limited to:
	- Certain models of Compaq systems and keyboards
	- Certain models of Logitech mice

  
VIDEO & GRAPHICS PROBLEMS
=========================
OpenGL cards and 3Dfx cards may conflict with each other.
Please remove the OpenGL card from your computer to play NFS:HS with
your 3Dfx video card.

The default drivers that Windows 98 uses when it detects a 3Dfx Voodoo
card (such as the Diamond Monster 3D) will not work with the game.
When you click on the NFS:HS icon, the mouse pointer momentarily changes
to an hourglass, then back to a pointer and nothing happens.
The way to fix this is to install the drivers that came with your
Voodoo card.

If your are seeing blurred fonts or graphical glitches, and your
video card/driver supports setting of the D3D texel origin, make sure
the origin is set to the upper left corner.
An example of a card that allows this is the Riva TNT.  You must have
the "TNT Detonator" drivers (available from the "Resource Center" at
www.nvidia.com) in order to be able to change the setting.
-From the "Start" menu, select "Settings" \ "Control Panel".
-Run the "Display" shortcut from the "Control Panel".
-Select the "Riva TNT" tab from the "Display Properties" Dialog.
-Select the "Additional Properties" button (This brings up the
 "Additional Properties" dialog).
-Select the "Direct3D Settings" tab.
-Select the "Advanced" button.
-Make sure the "Texel Alignment" is set to "Upper Left Corner". 


UPDATING 3DFX GLIDE DRIVERS
===========================
NFS:HS requires the installation of the latest version of the 3Dfx Glide
drivers.  During installation, your current drivers will be checked and if
necessary, you will be notified that they must be upgraded.  Glide drivers for
each type of Voodoo board are supplied on the game CD in the \3Dfx directory.

To install the latest Glide drivers, run the driver install kit which you are
directed to when you install NFS:HS.  Follow the directions provided by 3Dfx
in the README.TXT file in the driver kit.

Under some circumstances, when you re-run the NFS:HS installation after
updating Glide, you may be notified that the drivers are still out of date.
If you have successfully updated the drivers (and rebooted your system) and
still receive this message, you may safely ignore it and proceed to install
NFS:HS.  The game should function properly after installation is complete.

If you have problems running NFS:HS after updating Glide, it is likely that
the Glide installation was incomplete.  To ensure that the installation of the
drivers is complete, it is recommended that you delete your Voodoo card from
the Windows device manager and the INF files corresponding to your Voodoo card
from C:\Windows\INF and C:\Windows\INF\Other.  (Usually there are two INF
files, one called VOODOO2.INF or similar, and one named after the brand of
card you have, i.e. MNSTR2.INF for the Diamond Monster II.  If you are unsure
that you have the proper file, you can open it and look. Most INF files have
a header detailing which device they apply to.)

After removing the card and deleting the INF files, re-install it using "Add
New Hardware" in the Windows Control Panel.  When you are prompted for the
location of the drivers, specify the directory into which you unpacked the
driver kit (C:\Windows\Temp by default).  After you have completed this and
rebooted your system, NFS:HS should run properly on your Voodoo card.


AUDIO PROBLEMS
==============
If you have a 3D sound card and are experiencing sound problems
in the game, first contact your sound card manufacturer to make
sure you have the latest drivers for your card.  If you have the
latest drivers and are still experiencing problems, go to the audio
options menu and select an audio mode other than "D3D/EAX" (from
the Main menu select Options, then Audio, and then Audio Mode).

In some cases, sound problems are caused by video drivers.  Make sure
you have the latest video drivers for your video card.


FORCE FEEDBACK PROBLEMS
=======================
Microsoft Force Feedback products: 
  SideWinder Force Feedback devices traditionally connect through
  the game port.  Both joystick position information and force commands
  are transferred through this port.  In order to handle the amount of
  data being transferred across the game port, Microsoft uses MIDI
  compression.  This means your game port must have MIDI support which
  is usually only found on game ports built into your sound card.
  If you do not have a MIDI compatible game port, the joystick may work
  but not the force feedback.  If you do have a MIDI compatible game
  port and the force feedback still does not work, check the MIDI
  settings in accordance with the documentation that came with your
  Microsoft Force Feedback device.

Immersion Force Feedback products:
  (including but not limited to the following mfg.:
   Logitech, SC&T, ThrustMaster, Act Labs, CH Products)
  Immersion force feedback devices traditionally connect through the
  serial port and/or the game port or just a USB port.  The force
  commands are transferred through the serial or USB ports, but never
  through the game port. 


SERIAL LINK PROBLEMS
====================
If you are experiencing difficulties establishing a serial game
connection, check to ensure you are using a null-modem cable and not
a standard serial cable.  Null-modem cables are wired in a manner
which allows two computers to talk to one another.  If you discover
that you are using a standard serial cable and not a null-modem cable,
you can obtain an inexpensive "null-modem adapter" from almost any
electronics supply shop which you can connect to one end of the
serial cable; this adapter serves the same function as a standard
null-modem cable when used with a normal serial cable.


DISABLED NETWORK PLAY BUTTONS
=============================
If the IPX, TCP, or EA Racing Online buttons are disabled, check that
you are actually connected to a LAN or your Internet Service Provider
before you start NFS:HS.


MULTIPLAYER DROPOUT WITH A MINIMUM INSTALL
==========================================
Some systems may drop to Windows from the loading screen when trying
to enter a multiplayer game with a minimum install. If this occurs,
it may help to lower your CD Supplemental Cache settings.
Right click on "My Computer" and call up the System Properties dialog.
Select the "Performance" tab, and click on the "File System" button.
On this dialog, select the "CD-ROM" tab, and set the
"Supplemental cache size" slider to its minimum setting ("Small").


MODEM PROBLEMS
==============
If you are unable to host a modem game with a US Robotics 36.6 Voice
Modem, the problem is likely caused by the US Robotics driver.
Install Windows' standard modem driver for the modem. This should
solve the problem.


KEYBOARD PROBLEMS
=================
Some newer keyboards do not allow certain combinations of more than
two keys to be depressed simultaneously.  For example, if you were
pressing both the up arrow key to accelerate and the left arrow key
to turn, and you pressed the <H> key to honk your horn, your horn
would not honk.  Unfortunately, this problem is due to a limitation
of the hardware.


LOW SYSTEM RESOURCES
====================
If a warning appears when you run NFS:HS stating that your system
resources may be too low to run the game, it means that you may not
have enough free memory available.
Under Windows 95 and Windows 98, memory is a combination of RAM and
hard drive space.  The minimum RAM required for NFS:HS is 32 MB.
If you meet the minimum RAM requirement and you receive this warning,
make sure that no other applications are running before running NFS:HS.
If you still get the warning, check to see how much free space is
available on your hard drive (double-click My Computer, right-click
on your hard drive icon, and then click on Properties).
There should be at least 10 MB of free space, preferably much more.
Free up space if you need to by emptying your Recycle Bin,
clearing your web browser's cache, etc.


LESS THAN 1 MB HARD DRIVE SPACE
===============================
NFS:HS normally saves certain game setup information to your hard drive.
In addition to this, you can save replays, ghosts, knockouts and
tournaments.  If a warning appears when you run NFS:HS stating that you
have less than 1 MB of free space on your hard drive, it means that 
there may not be enough room for the game to save this data.  You 
should try to free up space on your hard drive if you get this warning.


VITALSIGNS NET.MEDIC
====================
If you are running VitalSigns Net.Medic at the same time as NFS:HS, you
may encounter a shifted color palette in gameplay.  It's a good idea
to close all open applications before running NFS:HS, including TSRs in
the System Tray.


WINDOWS NT
==========
NFS:HS was written to operate under Windows 95 and Windows 98 and
does not specifically support Windows NT.  If you attempt to install
the game on a Windows NT system, the installation will fail.


LEGAL
=====
ELECTRONIC ARTS and NEED FOR SPEED are trademarks or registered
trademarks of Electronic Arts in the United States and/or other
countries.
MICROSOFT, WINDOWS, WINDOWS 95, WINDOWS 98, WINDOWS NT, DIRECTX and
DIRECT3D are either trademarks or registered trademarks of Microsoft
Corporation in the United States and/or other countries.
Voodoo Graphics, Voodoo Rush and Voodoo2 are trademarks of 3Dfx
Interactive, Inc.  All rights reserved.
All other trademarks are the property of their respective owners.

This document is Copyright 1999 by Electronic Arts Inc.

English NFS:HS README Revision 11


