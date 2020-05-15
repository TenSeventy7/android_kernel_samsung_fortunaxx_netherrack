#!/system/bin/sh

# HMP scheduler settings for 8916

echo "2" > /proc/sys/kernel/sched_window_stats_policy

# HMP scheduler load tracking settings

echo "5" > /proc/sys/kernel/sched_ravg_hist_size

# HMP Task packing settings for 8916

echo "50" > /proc/sys/kernel/sched_small_task
echo "50" > /sys/devices/system/cpu/cpu0/sched_mostly_idle_load
echo "10" > /sys/devices/system/cpu/cpu0/sched_mostly_idle_nr_run


# apply gov settings
# disable thermal core_control to update scaling_min_freq

echo "0" > /sys/module/msm_thermal/core_control/enabled
echo "1" > /sys/devices/system/cpu/cpu0/online
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# causes perms error
# echo "1" > /sys/devices/system/cpu/cpu0/rq-stats/hotplug_disable

echo "200000" > /sys/devices/system/cpu/cpu0/sched_mostly_idle_freq
echo "200000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "1190400" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

# enable thermal core_control now

echo "1" > /sys/module/msm_thermal/core_control/enabled
echo "80000 998400:60000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "99" > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo "130000" > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo "200000" > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo "0" > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo "1 200000:85 200000:90 200000:80" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo "150000" > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo "0" > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo "20000" > /sys/devices/system/cpu/cpufreq/interactive/max_freq_hysteresis
echo "1" > /sys/devices/system/cpu/cpufreq/interactive/use_sched_load
echo "1" > /sys/devices/system/cpu/cpufreq/interactive/align_windows
echo "1" > /sys/devices/system/cpu/cpufreq/interactive/use_migration_notif
echo "3" > /sys/devices/system/cpu/cpufreq/interactive/boost
echo "10000" > /sys/devices/system/cpu/cpufreq/interactive/boostpulse_duration
echo "180000" > /sys/devices/system/cpu/cpufreq/interactive/timer_slack

# sdtweaks

echo "deadline" > /sys/block/mmcblk0/queue/scheduler
echo "deadline" > /sys/block/mmcblk1/queue/scheduler
echo "2048" > /sys/block/mmcblk0/queue/read_ahead_kb
echo "2048" > /sys/block/mmcblk1/queue/read_ahead_kb

# Bring up all cores online

echo "1" > /sys/devices/system/cpu/cpu1/online
echo "1" > /sys/devices/system/cpu/cpu2/online
echo "1" > /sys/devices/system/cpu/cpu3/online
