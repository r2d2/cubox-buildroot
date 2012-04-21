#############################################################
#
# cuboxxbmc
#
#############################################################

# This is to compile gimli branch : marvell-dove branch
ifeq ($(BR2_PACKAGE_CUBOXXBMC_GIMLI),y)

CUBOXXBMC_VERSION = 45b2727e792cc0ac07cbe0212aeb717a0866bd45
CUBOXXBMC_SOURCE = cuboxxbmc-$(CUBOXXBMC_VERSION).tar.gz
CUBOXXBMC_SITE = git://github.com/huceke/xbmc.git
CUBOXXBMC_INSTALL_STAGING = YES
CUBOXXBMC_INSTALL_TARGET = YES
CUBOXXBMC_CONF_OPT = --enable-gles --disable-pulse --disable-projectm --enable-dbus --with-platform=marvell-dove
CUBOXXBMC_DEPENDENCIES = boost sqlite mysql_client libass libmpeg2 libmad jpeg tiff libsamplerate libogg libvorbis libmodplug libcurl flac lzo zlib bzip2 gst-plugins-good yajl libgcrypt pcre libcdio libjasper dbus sdl sdl_mixer sdl_image libmicrohttpd samba python gperf marvellgfx xlib_libXdamage xlib_libXfixes xlib_libXrandr libgcrypt openssl xlib_libXext afpfsng libnfs libplist libshairport librtmp libusb avahi fribidi lirc

endif

# This is to compile from Rabeeh branch
ifeq ($(BR2_PACKAGE_CUBOXXBMC_RABEEH),y)

CUBOXXBMC_VERSION = HEAD
CUBOXXBMC_SOURCE = cuboxxbmc-$(CUBOXXBMC_VERSION).tar.gz
CUBOXXBMC_SITE = git://github.com/rabeeh/xbmc.git
CUBOXXBMC_INSTALL_STAGING = YES
CUBOXXBMC_INSTALL_TARGET = YES
CUBOXXBMC_CONF_OPT = --enable-gles --enable-dove --enable-dove-overlay --enable-gstreamer --disable-pulse --disable-vdpau
CUBOXXBMC_DEPENDENCIES = boost sqlite mysql_client libass libmpeg2 gstreamer libmad jpeg tiff libsamplerate libogg libvorbis libmodplug libcurl flac lzo zlib bzip2 gst-plugins-good yajl libgcrypt pcre libcdio libjasper dbus sdl sdl_mixer sdl_image libmicrohttpd samba python gperf marvellgfx xlib_libXdamage xlib_libXfixes xlib_libXrandr libgcrypt openssl xlib_libXext afpfsng libnfs libplist libshairport librtmp libusb avahi fribidi lirc

endif

define CUBOXXBMC_BOOTSTRAP
	if [ ! -e $(CUBOXXBMC_DIR)/configure ] ; then cd $(CUBOXXBMC_DIR) && ./bootstrap ; fi
endef

define CUBOXXBMC_INITSCRIPT
	cp -rf package/cuboxxbmc/xbmcinit $(TARGET_DIR)/etc/init.d/S95xbmc
endef

CUBOXXBMC_PRE_CONFIGURE_HOOKS += CUBOXXBMC_BOOTSTRAP
CUBOXXBMC_POST_INSTALL_TARGET_HOOKS += CUBOXXBMC_INITSCRIPT

$(eval $(call AUTOTARGETS,package,cuboxxbmc))
