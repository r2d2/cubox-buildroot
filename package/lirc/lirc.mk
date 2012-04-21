#############################################################
#
# lirc
#
#############################################################

LIRC_VERSION = 0.9.0
LIRC_SOURCE = lirc-$(LIRC_VERSION).tar.gz
LIRC_SITE = http://prdownloads.sourceforge.net/lirc
LIRC_INSTALL_STAGING = YES
LIRC_INSTALL_TARGET = YES
LIRC_CONF_OPT = --without-x --with-driver=serial --enable-sandboxed
LIRC_DEPENDENCIES = 
LIRC_AUTORECONF = YES

$(eval $(call AUTOTARGETS,package,lirc))
