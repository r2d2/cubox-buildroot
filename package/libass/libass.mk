#############################################################
#
# libass
#
#############################################################
LIBASS_VERSION = 0.10.0
LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.gz
LIBASS_SITE = http://libass.googlecode.com/files
LIBASS_INSTALL_STAGING = YES
LIBASS_INSTALL_TARGET = YES
LIBASS_CONF_OPT = 
LIBASS_DEPENDENCIES = freetype fontconfig fribidi host-pkg-config

$(eval $(call AUTOTARGETS,package,libass))
