
Debian
====================
This directory contains files used to package mochad/mocha-qt
for Debian-based Linux systems. If you compile mochad/mocha-qt yourself, there are some useful files here.

## mocha: URI support ##


mocha-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install mocha-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your mocha-qt binary to `/usr/bin`
and the `../../share/pixmaps/mocha128.png` to `/usr/share/pixmaps`

mocha-qt.protocol (KDE)

