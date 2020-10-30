# meta-builderbot-support

meta-builderbot-support contains scripts to make sd card, read the README inside meta-builderbot-support for details

# image convert

The robot has a functionality to record its vision which is default to be off.
To enable it, add attributes to camera\_sensor in .argos file. For example:
```xml
<builderbot_camera_system 
    implementation="default" 
    save_as="saveImage/img"
    save_raw="true"
/>
```
## save\_as
Attribute "save\_as" means the path you want to store the images, a number and an extension will be automatically add.

If "save\_as" is given, the robot will automatically save gray images at the given place. For example

```bash
saveImage/img0.pnm
saveImage/img1.pnm
saveImage/img2.pnm
...
```
Note that in this example you have to create a saveImage folder for the robot.

## save\_raw
Attribute save\_raw means is to save the raw data of the image buffer. If true, instead of a gray pnm file, a raw uyvy file would be saved. For example
```bash
saveImage/img0.uyvy
saveImage/img1.uyvy
saveImage/img2.uyvy
...
```

To read the uyvy file, copy all the uyvy files back to your computer, 
and put convert.sh into the same folder,
and run sh convert.sh

convert.sh is a shell script to convert all uyvy to png, have a look inside and you'll understand what it does and you can make adjustments for yourself.

