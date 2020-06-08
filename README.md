# Need For Speed: High Stakes Alternate Installer

An alternate installer for *Need For Speed: High Stakes*, built in [Inno Setup](https://jrsoftware.org/isinfo.php) and targeting modern Windows.

This is based on a nocd installer dated 2012-11-03 claiming to be from https://www.old-games.ru/, found through [My Abandonware](https://www.myabandonware.com/game/need-for-speed-high-stakes-bgf#download). In addition to the nocd and bug patches supplied by that installer, I've done the following:
- Add better images to the installer, including an [icon](http://www.iconarchive.com/show/mega-games-pack-22-icons-by-3xhumed/Need-for-Speed-High-Stakes-2-icon.html) by Exhumed
- Bundle [Modern Patch](https://veg.by/en/projects/nfs4/) 0.1.0 by VEG
- Bundle [improved lens flare](http://users.beagle.com.au/jmk222/nfshs.html) by JMK
- Replace European title with High Stakes title from JMK (because the My Abandonware disc hardcodes the European title and I want the US title)
- Bundle [FSHTool](http://www-math.mit.edu/~auroux/software/index.html) 1.22 by Denis Auroux
- Bundle extra cars sourced from [My Abandonware](https://www.myabandonware.com/game/need-for-speed-high-stakes-bgf#download)
- Bundle refcard and manual PDFs sourced from My Abandonware
- Add option to skip intro videos (requires modern patch)
- Add Windows 8.1/10 Start tile
- Add web shortcuts to Classic NFS, IPLounge, and NFSCars
- Port EA Technical Support help file from WinHelp to HTML Help
- Offer to delete save data upon uninstallation
- Optionally create standalone installer

## Install
1. Download the installer from the [releases](https://github.com/jkmartindale/NFS-High-Stakes-Installer/releases) page
1. Insert a *Need For Speed: High Stakes* disc or mount a [disc image](https://www.myabandonware.com/game/need-for-speed-high-stakes-bgf#download)
1. Run the installer

The installer requires files on the game disc to install so that I can avoid distributing a full pirated copy of the game. The installer still applies a nocd patch so once the game is installed, the CD wil no longer be needed.

## Build
I wrote this targeting Inno Setup 6. You could likely build this with an older version but why would you? Anyway I didn't add a version check to the script, if you want to shoot yourself in the foot that's not my problem.

Nothing special is needed to build the installer other than Inno Setup. However if you wish to create a standalone installer, copy the contents of a game disc to a directory called `CD Files` in the same directory as the installer script. The script will then build an installer with a different name that bundles everything.

If you want to build both the CD-required and standalone installers, you will probably need to restart the Inno Setup compiler between builds if you're using the GUI. Otherwise it will build to the last-used filename, which will not match.

## License
I can only claim ownership of the install script and the Start tile manifest. FSHTool is distributed under the terms of the GNU General Public License. `FindDisc.pas` is modified from [Triangle717](https://triangle717.wordpress.com/)'s [LEGO®️ Racers Alternate Installer](https://github.com/le717/Racers-Alternate-Installer), with an unknown license. The other components, media, and binaries are subject to separate licenses from their respective owners.
