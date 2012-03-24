#############################################################
#
# libplist
#
#############################################################
LIBPLIST_VERSION = 1.3
LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
LIBPLIST_SITE = https://github.com/downloads/JonathanBeck/libplist
LIBPLIST_INSTALL_STAGING = YES
LIBPLIST_INSTALL_TARGET = YES
LIBPLIST_CONF_OPT =
LIBPLIST_DEPENDENCIES = libxml2

$(eval $(call CMAKETARGETS,package,libplist))
