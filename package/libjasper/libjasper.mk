#
# libjasper
#
#############################################################
LIBJASPER_VERSION = 1.900.1
LIBJASPER_SOURCE = jasper-$(LIBJASPER_VERSION).zip
LIBJASPER_SITE = http://www.ece.uvic.ca/~frodo/jasper/software
LIBJASPER_INSTALL_STAGING = YES
LIBJASPER_INSTALL_TARGET = YES
LIBJASPER_CONF_OPT = 
LIBJASPER_DEPENDENCIES =

define LIBJASPER_EXTRACT_CMDS
	unzip $(DL_DIR)/$(LIBJASPER_SOURCE) -d $(@D)
	mv $(@D)/jasper-$(LIBJASPER_VERSION)/* $(@D)
	rm -rf $(@D)/jasper-$(LIBJASPER_VERSION)
endef

$(eval $(call AUTOTARGETS,package,libjasper))
