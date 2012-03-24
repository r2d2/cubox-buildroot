#############################################################
#
# fribidi
#
#############################################################
FRIBIDI_VERSION = 0.19.2
FRIBIDI_SOURCE = fribidi-$(FRIBIDI_VERSION).tar.gz
FRIBIDI_SITE = http://fribidi.org/download
FRIBIDI_INSTALL_STAGING = YES
FRIBIDI_INSTALL_TARGET = YES
FRIBIDI_CONF_OPT = --without-glib
FRIBIDI_DEPENDENCIES = 

$(eval $(call AUTOTARGETS,package,fribidi))
