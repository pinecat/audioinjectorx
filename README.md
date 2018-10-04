# AudioInjectorX

an implementation of my audio injector program for osx (macos)

have a wireless headset that shuts off if it doesn't recieve an audio signal?

audio injector fixes this problem, by sending an incredibly low frequency sound (2hz) to headset at a specified interval (in the case of AudioInjectorX, 3 minutes (180 seconds) by default).  its so low, that the user can't hear it, but its enough of an audio signal so that the headset doesn't shut off

my windows (c#) version of this program has not been uploaded to github yet (AudioInjectorV2)

similar to how AudioInjectorV2 is a windows tray app, AudioInjectorX is a macos status bar app

for this program to work, you must download the 2hz.aif file from the root directory of this github project

then place that directory in the Sounds directory of your user library (~/Library/Sounds/2hz.aif)
