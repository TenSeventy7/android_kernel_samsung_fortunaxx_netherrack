#
#	     __     _   _                              _    
#	  /\ \ \___| |_| |__   ___ _ __ _ __ __ _  ___| | __
#	 /  \/ / _ \ __| '_ \ / _ \ '__| '__/ _` |/ __| |/ /
#	/ /\  /  __/ |_| | | |  __/ |  | | | (_| | (__|   < 
#	\_\ \/ \___|\__|_| |_|\___|_|  |_|  \__,_|\___|_|\_\
#                                                    
#
#  =========================
#  
#  Copyright (C) 2019-2020 tensevntysevn
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#  
#  =========================
#  
# Netherrack MOdifications Script
# Based on AnyKernel3 by osm0sis @ xda-developers

# Netherrack Primary setup
# begin properties
properties() { '
kernel.string=Netherrack Kernel
do.devicecheck=1
do.modules=1
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
supported.patchlevels=
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

. tools/ak3-core.sh;

set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

dump_boot;

# begin ramdisk changes

# init.rc
backup_file init.rc;
insert_line init.rc "init.nether.rc" after "import /init.environ.rc" "import /init.nether.rc";

# init.qcom.rc
backup_file init.qcom.rc;
insert_line init.qcom.rc "service msm-cpu" before "service qcom-post-boot /system/bin/sh /system/etc/init.qcom.post_boot.sh" "service msm-cpu /init.nether.msm8916.sh\n\tclass late_start\n\tuser root\n\tseclabel u:r:init:s0\n\toneshot\n\tdisabled\n";
insert_line init.qcom.rc "start msm-cpu" after "start qcom-post-boot" "\tstart msm-cpu";
# end ramdisk changes

write_boot;
## end install

