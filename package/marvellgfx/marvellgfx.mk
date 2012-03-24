#############################################################
#
# marvellgfx
#
#############################################################
MARVELLGFX_VERSION = 1.0
MARVELLGFX_SOURCE = libgfx.tar.gz
MARVELLGFX_SITE = http://dl.dropbox.com/u/9548900/debian_packages
MARVELLGFX_INSTALL_STAGING = YES
MARVELLGFX_INSTALL_TARGET = YES
MARVELLGFX_DEPENDENCIES = 

define MARVELLGFX_BUILD_CMDS
	cd $(@D) && tar xzvf marvell-libgfx_0.2.0-0ubuntu1~ppa15.tar.gz
endef

define MARVELLGFX_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libgfx/bin/*.so* $(STAGING_DIR)/usr/lib/
	cp -rf $(@D)/libgfx/include/* $(STAGING_DIR)/usr/include/
endef

define MARVELLGFX_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/lib/modules
	$(INSTALL) -d $(TARGET_DIR)/usr/lib
	$(INSTALL) -d $(TARGET_DIR)/etc
	$(INSTALL) -D -m 0755 $(@D)/libgfx/bin/*.ko $(TARGET_DIR)/lib/modules/
	$(INSTALL) -D -m 0755 $(@D)/libgfx/bin/*.so* $(TARGET_DIR)/usr/lib/
	cp -rf $(@D)/libgfx/etc/* $(TARGET_DIR)/etc/
endef

$(eval $(call GENTARGETS,package,marvellgfx))
