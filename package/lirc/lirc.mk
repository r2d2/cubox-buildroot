#############################################################
#
# lirc
#
#############################################################

KERNEL_DIR=$(find output/build/ -maxdepth 1 -name linux-* | head -n1)

LIRC_VERSION = 0.8.4a
LIRC_SOURCE = lirc-$(LIRC_VERSION).tar.gz
LIRC_SITE = http://prdownloads.sourceforge.net/lirc
LIRC_INSTALL_STAGING = YES
LIRC_INSTALL_TARGET = YES
LIRC_CONF_OPT = --without-x --with-driver=serial --with-kerneldir=$KERNEL_DIR
LIRC_DEPENDENCIES = 

$(eval $(call AUTOTARGETS,package,lirc))
