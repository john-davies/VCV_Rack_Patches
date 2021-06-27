# VCV_Rack_Patches

[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

Some of my example patches for the [VCV Rack](https://vcvrack.com/) open source Eurorack modular synth simulator. These patches are licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

## random3.vcv

My first attempt at a generative patch. Based on [Omri Cohen’s videos on YouTube](https://www.youtube.com/channel/UCuWKHSHTHMV_nVSeNH4gYAg) and using only open source modules. There’s a 3 minute extract in the SoundCloud link below.

* Patch Storage: https://patchstorage.com/random-3-2/
* SoundCloud example: https://soundcloud.com/user-912901662/random-3

## track_gen.vcv

This is a development of random3.vcv to allow the user to control the length and instrumentation of a track. The original intention was to use it for generating royalty-free backing tracks of defined lengths for YouTube videos. There are many control settings and details of the overall operation can be found [here](./track_gen.md).

* Patch Storage:
* SoundCloud example:

There are a few improvements for future releases:

* The melody and backing instruments are a little simplistic and there's some scope for improvements with extra filters etc.
* The individual instruments' event timers would be more flexible if there were three counters. This was there would be a delay before start, then an 'on' time followed by an 'off' time and an optional 'repeat' setting which would repeat the on/off sequence.
* The random noise input works quite well to generate the melody but it would be more flexible if there was on optional MIDI input as well.
* Some means of changing the volume level of each instrument would be useful.
