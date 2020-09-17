# Overview

The code in this repository is meant to run on real builderbot. 
To use them, copy all the code to the builderbot

```bash
scp -r * root@192.168.1.110:~
```
where ```192.168.1.110``` is the ip address of the robot.

And on robot side (after ssh login into robot), argos3 -c xxx.argos to run each code. 

There are two folders, one is called 00_basic_functionality, the other is called 01_library.
00_basic_functionality contains test codes for basic builderbot functions, go through 01 to 06 to check all builderbot function are running correctly.
01_library contains test codes for lua_library provided by argos3-srocs.

# Files

## 00\_basic\_functionality

Inside this folder you can find pairs of .argos files and .lua files. Each pair of .argos and .lua files have the same name starting with a number.

Files from No. 01 to 06 are test files for testing the following builderbot functions:
1. differential drive system
2. rangefinder system
3. camera system
4. lift system
5. electromagnet system
6. system time and temperature

There are two special pairs of files which start by 000 or 001 serves for special functions.
000_full_stop.argos/lua is to stop the robot urgently. 
001_lift_calibration.argos/lua is to calibrate the lift system, since the lift system needs to be calibrated only once when the robot starts up.

## 01\_library

To be continued.

# Issues

The following issue needs to be solved:

1. rangefinder calibration. The calibration file seems to be lost
2. nfc and wifi system needs to be tested
3. when loadfile("xxx.luac"), robot system tells "size\_t size mismatch in precompiled chunk"
