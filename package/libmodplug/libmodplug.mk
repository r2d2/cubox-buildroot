

#############################################################
#
# libmodplug
#
#############################################################
LIBMODPLUG_VERSION = 0.8.8.4
LIBMODPLUG_SOURCE = libmodplug-$(LIBMODPLUG_VERSION).tar.gz
LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
LIBMODPLUG_INSTALL_STAGING = YES
LIBMODPLUG_INSTALL_TARGET = YES
LIBMODPLUG_CONF_OPT =
LIBMODPLUG_DEPENDENCIES = 

$(eval $(call AUTOTARGETS,package,libmodplug))
