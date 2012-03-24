#############################################################
#
# cuboxgraphics
#
#############################################################
CUBOXGRAPHICS_VERSION = 1.0
CUBOXGRAPHICS_SOURCE = gc3184-mrvl-armv7-hard_release.tar.gz
CUBOXGRAPHICS_SITE = http://dl.dropbox.com/u/9548900/GC-Driver/gc3184-mrvl-armv7-hard_release.zip
CUBOXGRAPHICS_INSTALL_STAGING = YES
CUBOXGRAPHICS_INSTALL_TARGET = YES
CUBOXGRAPHICS_DEPENDENCIES = xlib_libXfixes xlib_libXdamage marvellgfx

define CUBOXGRAPHICS_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/*.so $(STAGING_DIR)/usr/lib/
	cd $(STAGING_DIR)/usr/lib/ && ln -s libGLESv2x.so libGLESv2.so
endef

define CUBOXGRAPHICS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/*.so $(TARGET_DIR)/usr/lib/
	cd $(TARGET_DIR)/usr/lib/ && ln -s libGLESv2x.so libGLESv2.so
endef

$(eval $(call GENTARGETS,package,cuboxgraphics))
