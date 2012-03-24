#############################################################
#
# librtmp
#
#############################################################
LIBRTMP_VERSION = 2.3
LIBRTMP_SOURCE = rtmpdump-$(LIBRTMP_VERSION).tgz
LIBRTMP_SITE = http://rtmpdump.mplayerhq.hu/download
LIBRTMP_INSTALL_STAGING = YES
LIBRTMP_INSTALL_TARGET = YES
LIBRTMP_DEPENDENCIES = 

define LIBRTMP_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/librtmp all
endef

define LIBRTMP_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/librtmp/librtmp.so $(STAGING_DIR)/usr/lib/librtmp.so
	$(INSTALL) -d $(STAGING_DIR)/usr/include/librtmp
	$(INSTALL) -D -m 0644 $(@D)/librtmp/*.h $(STAGING_DIR)/usr/include/librtmp
endef

define LIBRTMP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/librtmp/librtmp.so $(TARGET_DIR)/usr/lib/librtmp.so
endef

$(eval $(call GENTARGETS,package,librtmp))
