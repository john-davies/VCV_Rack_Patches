# track_gen.vcv Patch Description

The "rows" below refer to the four rows of modules in the VCV Rack interface. This description doesn't provide details of the operation of each individual module. Refer to the module's manual for that information.

## Row 1

The Event Timer bar counter and the two Clocked modules control the overall length and tempo. The two clock modules are linked to provide six independent clock outputs. These are allocated as follows:

### Module 1 ( left, main module )
* CLK1 - Bar clock, usually divides the BPM, e.g. /4 for 4/4 time, /3 for 3/4 etc. This clock drives the overall bar counter and the instrument bar counters, see below.
* CLK2 - Arpeggiator, drives the arpeggiator on row 3
* CLK3 - Percussion, drives the persussion on row 4

### Module 2 ( right, secondary module )
* CLK1 - Keyboard, drives the keyboard instrument on row 2
* CLK2 - Wind, drives the wind instrument on row 2
* CLK3 - Backing, drives the backing instrument on row 3

The overall length of the piece will therefore be contolled by a combination of the bar count, the BPM setting and the bar clock

The sequence is started by clicking the "Run" button on the main clock module. If the sequence is completed then the patch will reset automatically. To stop the sequence part way through then click the "Run" button again and then click the "Reset" button.

Next there are a number of random sources. The two melody instruments are controlled from the noise source and the two Bernoulli gates. The random note source and the quantiser are used to switch notes in and out of the melody quantisers on row 2. The noise source has a number of different options, white, pink etc. These are largely the same but will have different frequency distributions.

The output control consists of a mixer, the Plateau module to colour the output sound and the standard VCV Rack audio output.

## Row 2

Row two has the two melody instruments. Although they're labelled "keyboard" and "wind" in reality each voice can be modified as necessary. The two event counters define the bars where the instruments start and stop playing. Note the operation of the counters - for example to start after 4 bars and play for 8 bars would need the counts to be set at 5 and 13 respectively. The same arrangement is used for the backing and percussion tracks as well.

The quantisers limit the range of notes available and these are modified from the randomising quantiser on row 1. The octave transposition allows a bit more flexibility on the range. The "keyboard" instrument uses the Bogaudio FM-OP module whereas the "wind" instrument uses the Basal oscillator and separate ADSR modules etc.

## Row 3

The backing track has two modes of operation. The random note input is passed through a quantiser but this time it is not modified by the note filter from row 1. The output of the quantiser is passed into the Chord-Key module which can have up to four notes per chord. By default it is set to the "standard" keys of C major but can obviously be modified as necessary.

With the two top rows of the Triggered Switches enabled the Arpeggiator is bypassed. Select the second row to use the Arpeggiator. Note that, by default, the arpeggiator clock PW is set to 99% as the arpeggiator only runs when the clock is set high.

Whatever is selected the output passed through a Bernoulli gate and an octave transposer before getting to the oscillator.

Row 3 also contains a Midi-Gate module which is used to trigger some parts of the system to make it easier to tune the melody and percussion sounds. C4 and D4 triggers the keyboard and wind melody instruments. C3, D3, E3, & F3 trigger the persussion instruments.

## Row 4

The percussion track has two bar start/stop controls ( see below for details ) and the four percussion options are controlled via the Trigs module. By default this is set to Random mode with the end of cycle output re-triggering the random pattern. The four percussion instruments are:

* Hora Snare Drum - left hand bar control
* Hora SB-CL - left hand bar control
* Hora Deep - left hand bar control
* Mutable Instruments, Elements - right hand bar control. _Note that the trigger signal from Trigs is passed through a Gate Mod module which is used to lengthen the trigger signal into the Elements module._
