#############################################################
#
# afpfsng
#
#############################################################
AFPFSNG_VERSION = 0.8.1
AFPFSNG_SOURCE = afpfs-ng-$(AFPFSNG_VERSION).tar.bz2
AFPFSNG_SITE = http://sourceforge.net/projects/afpfs-ng/files/afpfs-ng/$(AFPFSNG_VERSION)
AFPFSNG_INSTALL_STAGING = YES
AFPFSNG_INSTALL_TARGET = YES
AFPFSNG_AUTORECONF = YES
AFPFSNG_CONF_OPT =
AFPFSNG_DEPENDENCIES = libfuse

define AFPFSNG_INSTALL_HEADERS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/afpfs-ng
	$(INSTALL) -D -m 0644 $(@D)/include/*.h $(STAGING_DIR)/usr/include/afpfs-ng
endef

AFPFSNG_POST_INSTALL_STAGING_HOOKS += AFPFSNG_INSTALL_HEADERS

$(eval $(call AUTOTARGETS,package,afpfsng))
