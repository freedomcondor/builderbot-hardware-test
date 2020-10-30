In this folder there are scripts to make sd-card.

Copy the scripts folder under meta-builderbot folder.

After bitbake compilation of the image, follow the instructions to make sd card.

To make the sdcard, use dmesg to check its id, for example: sdb
	1. Create a mount point
	```bash
	sudo mkdir /media/card
	```
	2. Specify target directory in environment variable
	```bash
	source OETMP=tmp
	```
	3. Partition the SD card into 2 partitions. 
	Check your sdcard label very carefully!!! The "sdb"s in the following commands are just examples!!!
	```bash
	sudo ../meta-builderbot/scripts/mk2parts.sh sdb
	```

	4. Copy boot loader
	```bash
	../meta-builderbot/scripts/copy_boot.sh sdb
	```
	5. Copy root file system
	```bash
	../meta-builderbot/scripts/copy_rootfs.sh sdb
	```

