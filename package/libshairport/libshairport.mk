#############################################################
#
# libshairport
#
#############################################################
LIBSHAIRPORT_VERSION = aeb4987f571ee79b3f2e6ccaecd7c1ac3c39e360
LIBSHAIRPORT_SOURCE = libshairport-$(LIBSHAIRPORT_VERSION).tar.gz
LIBSHAIRPORT_SITE = git://github.com/amejia1/libshairport.git
LIBSHAIRPORT_INSTALL_STAGING = YES
LIBSHAIRPORT_INSTALL_TARGET = YES
LIBSHAIRPORT_AUTORECONF = YES
LIBSHAIRPORT_CONF_OPT =
LIBSHAIRPORT_DEPENDENCIES = libao

$(eval $(call AUTOTARGETS,package,libshairport))
