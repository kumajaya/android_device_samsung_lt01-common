#!/sbin/sh

# Ketut P. Kumajaya, Sept 2014
# Do not remove above credits header!

# Dual boot environment setup

# Galaxy Tab 3 T31x block device
# Don't use /dev/block/platform/*/by-name/* symlink!
export SYSTEMDEV="/dev/block/mmcblk0p20"
export DATADEV="/dev/block/mmcblk0p21"
export CACHEDEV="/dev/block/mmcblk0p19"
export HIDDENDEV="/dev/block/mmcblk0p16"
# For a common /cache partition, set HIDDENDEV to /dev/block/mmcblk0p19
# /sbin/fstab.sh change (in boot image) needed

# Galaxy Tab 2 block device
# export SYSTEMDEV="/dev/block/mmcblk0p9"
# export DATADEV="/dev/block/mmcblk0p10"
# export CACHEDEV="/dev/block/mmcblk0p7"
# export HIDDENDEV="/dev/block/mmcblk0p11"

# Free internal storage needed for 2nd ROM
# 1G = 1024*1000
export DATAFREESPACE=3072000

# Create 2GB sparse image command in dual boot tool
# dd if=/dev/zero of=/data/media/.secondrom/system.img bs=1024 seek=2000000 count=0
# Set the seek value here, maximum 2000000
export IMGSEEKVALUE=2000000

# Reboot to download mode command, "download", "bootloader", etc
export DOWNLOADCMD="download"
