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
	# Install xorg driver
	cd $(@D)/xserver-xorg-video-dove-0.1.0 && ar x xserver-xorg-video-dove_0.3.4-1_armel.deb
        cd $(@D)/xserver-xorg-video-dove-0.1.0 && tar xzvf data.tar.gz
	cd $(@D)/xserver-xorg-video-dove-0.1.0 && cp -rf usr/lib/* $(TARGET_DIR)/usr/lib
	# Install libvmeta
	cd $(@D)/libvmeta && ar x libvmeta_1.0ubuntu2_armel.deb
        cd $(@D)/libvmeta && tar xzvf data.tar.gz
	cd $(@D)/libvmeta && cp -rf usr/lib/* $(TARGET_DIR)/usr/lib
	# Install libbmm
	cd $(@D)/bmm-lib && ar x libbmm0u_0.2.0-0ubuntu1~ppa8_armel.deb
        cd $(@D)/bmm-lib && tar xzvf data.tar.gz
	cd $(@D)/bmm-lib && cp -rf usr/lib/* $(TARGET_DIR)/usr/lib
	# Install xorg.conf
	cp package/marvellgfx/xorg.conf $(TARGET_DIR)/etc
	# Install vmeta clock init script	
	cd $(@D)/dove-vmeta-500MHz-conf && ar x dove-vmeta-500MHz-conf.deb
        cd $(@D)/dove-vmeta-500MHz-conf && tar xzvf data.tar.gz
	cd $(@D)/dove-vmeta-500MHz-conf && cp -rf etc/init.d/vmetaclk $(TARGET_DIR)/etc/init.d/S20vmetaclk

endef

$(eval $(call GENTARGETS,package,marvellgfx))
