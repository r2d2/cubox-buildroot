#############################################################
#
# marvellgfx
#
#############################################################
MARVELLGFX_VERSION = 1.0
MARVELLGFX_SOURCE = packages.tar.gz
MARVELLGFX_SITE = http://dl.dropbox.com/u/9548900/debian_packages
MARVELLGFX_INSTALL_STAGING = YES
MARVELLGFX_INSTALL_TARGET = YES
MARVELLGFX_DEPENDENCIES = 

define MARVELLGFX_BUILD_CMDS
	cd $(@D)/marvell-ipp && tar xzvf marvell-ipp_0.2.1-0ubuntu1~ppa10.tar.gz
endef

define MARVELLGFX_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/marvell-ipp
	$(INSTALL) -D -m 0755 $(@D)/libgfx/libgfx/bin/*.so* $(STAGING_DIR)/usr/lib/
	cp -rf $(@D)/libgfx/libgfx/include/* $(STAGING_DIR)/usr/include/
	$(INSTALL) -D -m 0755 $(@D)/marvell-ipp/marvell-ipp/bin/*.so* $(STAGING_DIR)/usr/lib/
	cp -rf $(@D)/marvell-ipp/marvell-ipp/include/* $(STAGING_DIR)/usr/include/marvell-ipp
endef

define MARVELLGFX_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/lib/modules
	$(INSTALL) -d $(TARGET_DIR)/usr/lib
	$(INSTALL) -d $(TARGET_DIR)/etc
#	$(INSTALL) -D -m 0755 $(@D)/libgfx/libgfx/bin/*.ko $(TARGET_DIR)/lib/modules/
#	cp -rf $(@D)/packages/libgfx/libgfx/etc/* $(TARGET_DIR)/etc/
	$(INSTALL) -D -m 0755 $(@D)/libgfx/libgfx/bin/*.so* $(TARGET_DIR)/usr/lib/
	$(INSTALL) -D -m 0755 $(@D)/marvell-ipp/marvell-ipp/bin/*.so* $(TARGET_DIR)/usr/lib/
	cp -rf $(@D)/marvell-ipp/marvell-ipp/etc/* $(TARGET_DIR)/etc/
endef

$(eval $(call GENTARGETS,package,marvellgfx))
