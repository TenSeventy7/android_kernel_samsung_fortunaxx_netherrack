ifeq ($(CONFIG_SDCARD_FS_XATTR),y)
EXTRA_CFLAGS += -DSDCARD_FS_XATTR
endif

ifeq ($(CONFIG_SDCARD_FS_SEC_API_M),y)
obj-$(CONFIG_SDCARD_FS) += mm/sdcardfs.o

sdcardfs-y := mm/dentry.o mm/file.o mm/inode.o mm/main.o mm/super.o mm/lookup.o mm/mmap.o mm/packagelist.o mm/derived_perm.o
sdcardfs-$(CONFIG_SDCARD_FS_XATTR) += mm/xattr.o
endif

ifeq ($(CONFIG_SDCARD_FS_SEC_API_L),y)
obj-$(CONFIG_SDCARD_FS) += lp/sdcardfs.o

sdcardfs-y := lp/dentry.o lp/file.o lp/inode.o lp/main.o lp/super.o lp/lookup.o lp/mmap.o lp/packagelist.o lp/derived_perm.o
sdcardfs-$(CONFIG_SDCARD_FS_XATTR) += lp/xattr.o
endif