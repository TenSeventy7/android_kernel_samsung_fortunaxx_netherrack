#!/system/bin/sh

#
# Copyright (C) 2020 TenSeventy7
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

mount -o remount,rw /;
mount -o rw,remount /system

# init.d support
if [ ! -e /system/etc/init.d ]; then
   mkdir /system/etc/init.d
   chown -R root.root /system/etc/init.d
   chmod -R 755 /system/etc/init.d
fi

# start init.d
for FILE in /system/etc/init.d/*; do
   sh $FILE >/dev/null
done;

