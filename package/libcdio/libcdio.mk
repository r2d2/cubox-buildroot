#############################################################
#
# libcdio
#
#############################################################
LIBCDIO_VERSION = 0.83
LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.gz
LIBCDIO_SITE = http://ftp.gnu.org/gnu/libcdio
LIBCDIO_INSTALL_STAGING = YES
LIBCDIO_INSTALL_TARGET = YES
LIBCDIO_CONF_OPT = 
LIBCDIO_DEPENDENCIES =

$(eval $(call AUTOTARGETS,package,libcdio))
