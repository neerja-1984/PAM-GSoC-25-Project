## Introduction to the PAM project

PAM (Pharo Automated Mouth) is a rule-based Text-to-Speech (TTS) system developed for the Pharo environment. Unlike modern deep-learning TTS systems that require extensive datasets and computational resources, PAM employs a lightweight rule-based approach inspired by the classic <a href="https://discordier.github.io/sam/" target="_blank">SAM (Software Automatic Mouth)</a> system.

The system implements text-to-phoneme conversion using <strong>402 English → Grapheme rules</strong> and <strong>47 Grapheme → IPA phoneme rules</strong>, producing accurate IPA phoneme sequences with stress markers.

For synthesis, PAM adopts a concatenative sample-based approach: instead of generating audio purely algorithmically, it plays back pre-recorded audio samples of phonemes. These are sequenced and stitched together through a TpSampler-driven DSP pipeline (integrated with <a href="https://github.com/lucretiomsp/phausto" target="_blank">Phausto</a>), enabling intelligible speech output.

On top of this, PAM introduces prosody control, allowing each phoneme playback to be modulated by parameters such as pitch (adult/child voice presets), amplitude (stress-based loudness), and duration (temporal stretching). This hybrid design — rule-based phoneme generation + sample-based concatenative synthesis + prosodic control — makes PAM lightweight and customizable while still producing natural-sounding speech.

------

## Code snippets to install project via Metacello:

```smalltalk
Metacello new
  baseline: 'PAM';
  repository: 'github://neerja-1984/PAM-GSoC-25-Project:master/src';
  onConflict: [ :ex | ex useIncoming ];
  onUpgrade: [ :ex | ex useIncoming ];
  load.
```

To make PAM speak, you need to have the audio-samples in Documents Folder. 
Refer the below Readme to get the audio-samples :

[Download audio-samples](https://github.com/neerja-1984/PAM-GSoC-25-Project/releases/tag/v1.0)

----

## Steps to get PAM speaking !!
### Plug this in Pharo Playground :

```smalltalk
| dsp |
        
"initliase the DSP class"
dsp := PAMDsp new.
        
"audio for a array of numbers"
dsp sayNumbers: #(5 6 7 2).
        
"audio for all numbers from 0 to 9"
dsp sayNumbers0to9.
        
"audio for sentence"
dsp sayText: 'Dogs'.
        
"audio for sentence with prosody and child preset"
dsp sayTextWithProsody: 'Dogs' asChild: true.
        
"audio for sentence with prosody and adult preset"
dsp sayTextWithProsody: 'golf day!' asChild: false.
        
"Transcript for logs"
Transcript open.
```

------

## Links to understand Project better :

1. [😎 My final submission URL -> has complete explanation of project, work done, code snippets, PAM live demos, Blogs .. and more !](https://neerja-1984.github.io/rewind-gsoc25/)

2. [🖥️  PAM Repository -> Actual Project repository](https://github.com/neerja-1984/PAM-GSoC-25-Project)

3. [🗓️ GSOC'25 Weekly updates](https://github.com/neerja-1984/rewind-gsoc25)

4. [✒️ My Medium blogs](https://medium.com/@nirjadoshi2003)


-----

## Acknowledgements :

Special thanks to my mentors <strong>Domenico Cipriani</strong> and <strong>Nahuel Palumbo</strong> for all their guidance. Starting from Pharo architecture, DSP integration, software engineering best practices  to Debugging sessions we've had. PAM wouldn't have reached this stage if it wasn't for their guidance. Their expertise in both linguistic processing and audio synthesis was instrumental in achieving the project goals.

Noteworthy links

1. The project builds upon the foundational work of the original <a href="https://discordier.github.io/sam/" target="_blank">SAM system</a> and leverages the modern capabilities of <a href="https://github.com/lucretiomsp/phausto" target="_blank">Phausto</a> for audio generation.

2. Understanding IPA phoenems : <a href="https://gist.github.com/walkoncross/33059e1249a24d7596a7abb8c5cec986#-vowels" target="_blank">WalkOnCross Github.</a> Dataset of 44 Phoneme taken from here: <a href="https://github.com/moh3n9595/phonemes-dataset" target="_blank">Github</a>

3. Remove Metadata from audio files : <a href="https://online-audio-converter.com" target="_blank">online-audio-converter</a>
