#############################################################
#
# libnfs
#
#############################################################
LIBNFS_VERSION = 1.3.0
LIBNFS_SOURCE = libnfs-$(LIBNFS_VERSION).tar.gz
LIBNFS_SITE = https://github.com/downloads/sahlberg/libnfs
LIBNFS_INSTALL_STAGING = YES
LIBNFS_INSTALL_TARGET = YES
LIBNFS_AUTORECONF = YES
LIBNFS_CONF_OPT =
LIBNFS_DEPENDENCIES = 

$(eval $(call AUTOTARGETS,package,libnfs))
