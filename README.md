Create-Android-Icons
====================

OSX Bash script to automatically create icons for different Android pixel densities

Usage: 
```
chmod +x iconCreator.sh
./iconCreator.sh <filename of PNG image> <mode: launcher, actionbar, or notification>
```
Example input:
```
./iconCreator.sh app_icon_large.png launcher
```
Example output:
```
Created       mdpi image app_icon_large_48x48.png
Created       hdpi image app_icon_large_72x72.png
Created      xhdpi image app_icon_large_96x96.png
Created     xxhdpi image app_icon_large_144x144.png
Created    xxxhdpi image app_icon_large_192x192.png
Created GooglePlay image app_icon_large_512x512.png
```
