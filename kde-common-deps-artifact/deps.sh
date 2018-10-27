#!/bin/bash
set -e
set -x

function error_exit
{
	echo "$1" 1>&2
	exit 1
}

#Newer toolchain
cd $SOURCES && wget http://ftp.x.org/pub/individual/util/util-macros-1.19.0.tar.bz2 && tar -jxvf util-macros-1.19.0.tar.bz2 && \
cd $SOURCES/util-macros-1.19.0 && ./configure --prefix /usr && make install && rm $SOURCES/util-macros-1.19.0.tar.bz2 && rm -rfv $SOURCES/util-macros-1.19.0
cd $SOURCES && wget http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.bz2 && tar -jxvf m4-1.4.18.tar.bz2 && \
cd $SOURCES/m4-1.4.18  && mkdir builddir && cd builddir && ../configure --prefix=/usr --enable-shared &&  make -j 8 && make install \
&& rm $SOURCES/m4-1.4.18.tar.bz2 && rm -rfv $SOURCES/m4-1.4.18
cd $SOURCES && wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz && tar -xvf autoconf-2.69.tar.xz && \
cd $SOURCES/autoconf-2.69 && mkdir builddir && cd builddir && ../configure --prefix=/usr &&  make -j 8 && make install && \
rm $SOURCES/autoconf-2.69.tar.xz && rm -rfv $SOURCES/autoconf-2.69
cd $SOURCES && wget https://ftp.gnu.org/gnu/automake/automake-1.15.tar.xz && tar -xvf automake-1.15.tar.xz && \
cd $SOURCES/automake-1.15 && mkdir builddir && cd builddir && ../configure --prefix=/usr &&  make -j 8 && make install && \
rm $SOURCES/automake-1.15.tar.xz && rm -rfv $SOURCES/automake-1.15
cd $SOURCES && wget https://ftp.gnu.org/gnu/autogen/rel5.18.12/autogen-5.18.12.tar.xz && tar -xvf autogen-5.18.12.tar.xz && \
cd $SOURCES/autogen-5.18.12 && mkdir builddir && cd builddir && ../configure --prefix=/usr &&  make -j 8 && make install && \
rm $SOURCES/autogen-5.18.12.tar.xz && rm -rfv $SOURCES/autogen-5.18.12
cd $SOURCES && wget http://ftp.gnu.org/pub/gnu/gettext/gettext-0.19.3.tar.gz && tar -xzvf gettext-0.19.3.tar.gz && \
cd $SOURCES/gettext-0.19.3 && ./configure --prefix=/usr &&  make -j 8 && make install && rm $SOURCES/gettext-0.19.3.tar.gz && rm -rfv $SOURCES/gettext-0.19.3
cd $SOURCES && wget http://www.cups.org/software/1.7.5/cups-1.7.5-source.tar.bz2 && tar -jxvf cups-1.7.5-source.tar.bz2 && \
cd $SOURCES/cups-1.7.5 && aclocal -I config-scripts && autoconf -I config-scripts && ./configure --prefix=/usr &&  make -j 8 && make install && \
rm -rfv $SOURCES/cups-1.7.5 && rm $SOURCES/cups-1.7.5-source.tar.bz2

#New pulseaudio
cd $SOURCES && wget http://freedesktop.org/software/pulseaudio/releases/pulseaudio-10.0.tar.xz && tar -xvf pulseaudio-10.0.tar.xz
cd $SOURCES/pulseaudio-10.0 && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/pulseaudio-10.0.tar.xz && rm -rfv $SOURCES/pulseaudio-10.0


#GPG stack for gpgme
cd $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.26.tar.bz2 && tar -jxvf libgpg-error-1.26.tar.bz2 && \
cd $SOURCES/libgpg-error-1.26 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/libgpg-error-1.26.tar.bz2 && rm -rfv $SOURCES/libgpg-error-1.26
cd $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.3.5.tar.bz2 && tar -jxvf libksba-1.3.5.tar.bz2 && \
cd  $SOURCES/libksba-1.3.5 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm  $SOURCES/libksba-1.3.5.tar.bz2 && rm -rfv $SOURCES/libksba-1.3.5
cd  $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.3.tar.bz2 && tar -jxvf libassuan-2.4.3.tar.bz2 && \
cd $SOURCES/libassuan-2.4.3 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/libassuan-2.4.3.tar.bz2 && rm -rfv $SOURCES/libassuan-2.4.3
cd $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/npth/npth-1.3.tar.bz2 && tar -jxvf npth-1.3.tar.bz2 && \
cd $SOURCES/npth-1.3 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/npth-1.3.tar.bz2 && rm -rfv $SOURCES/npth-1.3
cd $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.5.tar.bz2 && tar -jxvf libgcrypt-1.7.5.tar.bz2 && \
cd $SOURCES/libgcrypt-1.7.5 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/libgcrypt-1.7.5.tar.bz2 && rm -rfv $SOURCES/libgcrypt-1.7.5
cd $SOURCES && wget http://ftp.gnu.org/gnu/libtasn1/libtasn1-4.10.tar.gz && tar -zxvf libtasn1-4.10.tar.gz && \
cd $SOURCES/libtasn1-4.10 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install &&\
rm $SOURCES/libtasn1-4.10.tar.gz && rm -rfv $SOURCES/libtasn1-4.10
cd $SOURCES && wget https://ftp.gnu.org/gnu/nettle/nettle-3.3.tar.gz && tar -zxvf nettle-3.3.tar.gz && \
cd $SOURCES/nettle-3.3 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/nettle-3.3.tar.gz && rm -rfv $SOURCES/nettle-3.3
cd $SOURCES && wget http://p11-glue.freedesktop.org/releases/p11-kit-0.23.2.tar.gz && tar -zxvf p11-kit-0.23.2.tar.gz && \
cd $SOURCES/p11-kit-0.23.2 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/p11-kit-0.23.2.tar.gz && rm -rfv $SOURCES/p11-kit-0.23.2
cd $SOURCES && wget ftp://ftp.gnutls.org/gcrypt/gnutls/v3.5/gnutls-3.5.10.tar.xz && tar -xvf gnutls-3.5.10.tar.xz && \
cd $SOURCES/gnutls-3.5.10 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr --with-included-libtasn1 &&  make -j 8 && make install && \
rm $SOURCES/gnutls-3.5.10.tar.xz && rm -rfv $SOURCES/gnutls-3.5.10
cd $SOURCES && wget http://downloads.sourceforge.net/pcre/pcre-8.35.tar.bz2 && tar -jxvf pcre-8.35.tar.bz2 && \
cd $SOURCES/pcre-8.35 && ./configure --prefix=/opt/usr && make && make install && \
rm $SOURCES/pcre-8.35.tar.bz2 && rm -rfv $SOURCES/pcre-8.35
cd $SOURCES && git clone git://git.gnupg.org/gpgme.git && \
cd $SOURCES/gpgme && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && rm -rfv $SOURCES/gpgme
#New python3
apt-get -y remove 'python3.*' 'sip.*'
cd $SOURCES && wget https://www.python.org/ftp/python/3.5.3/Python-3.5.3.tar.xz && tar -xvf Python-3.5.3.tar.xz
cd $SOURCES/Python-3.5.3 && ./configure --prefix=/opt/usr --enable-shared --enable-static &&  make -j 8 && make install && rm $SOURCES/Python-3.5.3.tar.xz && rm -rfv $SOURCES/Python-3.5.3
cd $SOURCES && wget https://sourceforge.net/projects/pyqt/files/sip/sip-4.19.1/sip-4.19.1.tar.gz && tar -zxvf sip-4.19.1.tar.gz
cd $SOURCES/sip-4.19.1 && python3 configure.py --destdir /opt/usr --incdir /opt/usr/include/python3.5 && make && make install
pip3 install Sphinx clang PyOpenGL PyOpenGL_accelerate

# #Build newer gstreamer for sound stack
sudo apt-get -y remove 'gstreamer.*'
cd $SOURCES && wget 'https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.4.tar.xz' && tar -xvf gstreamer-1.10.4.tar.xz && \
cd $SOURCES/gstreamer-1.10.4 && ./configure --prefix=/opt/usr --enable-shared --enable-gst-debug && make && make install && rm $SOURCES/gstreamer-1.10.4.tar.xz && rm -rfv $SOURCES/gstreamer-1.10.4
cd $SOURCES && wget 'https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.10.4.tar.xz' && tar -xvf gst-plugins-base-1.10.4.tar.xz && \
cd $SOURCES/gst-plugins-base-1.10.4 && ./configure --prefix=/opt/usr --enable-shared --enable-gst-debug && make && make install && rm $SOURCES/gst-plugins-base-1.10.4.tar.xz && rm -rfv $SOURCES/gst-plugins-base-1.10.4
cd $SOURCES && wget 'https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.10.4.tar.xz' && tar -xvf gst-plugins-good-1.10.4.tar.xz && \
cd $SOURCES/gst-plugins-good-1.10.4 && ./configure --prefix=/opt/usr --enable-shared --enable-gst-debug && make && make install && rm $SOURCES/gst-plugins-good-1.10.4.tar.xz && rm -rfv $SOURCES/gst-plugins-good-1.10.4

# cat > lib-7.7.md5 << EOF
# a615e17d9fee6f097fc3b716eacb3dca  xtrans-1.3.4.tar.bz2
# c35d6ad95b06635a524579e88622fdb5  libX11-1.6.2.tar.bz2
# 0d9f6dd9c23bf4bcbfb00504b566baf5  libXfont2-2.0.1.tar.bz2
# 52df7c4c1f0badd9f82ab124fb32eb97  libXext-1.3.3.tar.bz2
# a8a0dbd2299b2568d8c919883f5c8501  libFS-1.0.6.tar.bz2
# addfb1e897ca8079531669c7c7711726  libICE-1.0.9.tar.bz2
# 499a7773c65aba513609fe651853c5f3  libSM-1.2.2.tar.bz2
# 7a773b16165e39e938650bcc9027c1d5  libXScrnSaver-1.2.2.tar.bz2
# 03149823ae57bb02d0cec90d5b97d56c  libXt-1.1.4.tar.bz2
# 41d92ab627dfa06568076043f3e089e4  libXmu-1.1.2.tar.bz2
# 769ee12a43611cdebd38094eaf83f3f0  libXpm-3.5.11.tar.bz2
# 7446f5fba888672aad068b29c0928ba3  libXaw-1.0.12.tar.bz2
# b985b85f8b9386c85ddcfe1073906b4d  libXfixes-5.0.1.tar.bz2
# f7a218dcbf6f0848599c6c36fc65c51a  libXcomposite-0.4.4.tar.bz2
# 2bd9a15fcf64d216e63b8d129e4f1f1c  libXrender-0.9.8.tar.bz2
# 1e7c17afbbce83e2215917047c57d1b3  libXcursor-1.1.14.tar.bz2
# 0cf292de2a9fa2e9a939aefde68fd34f  libXdamage-1.1.4.tar.bz2
# ad2919764933e075bb0361ad5caa3d19  libfontenc-1.1.2.tar.bz2
# 664629bfa7cdf8b984155019fd395dcb  libXfont-1.5.0.tar.bz2
# 331b3a2a3a1a78b5b44cfbd43f86fcfe  libXft-2.3.2.tar.bz2
# 9c4a69c34b19ec1e4212e849549544cb  libXi-1.7.4.tar.bz2
# 9336dc46ae3bf5f81c247f7131461efd  libXinerama-1.1.3.tar.bz2
# 210ed9499a3d9c96e3a221629b7d39b0  libXrandr-1.4.2.tar.bz2
# 45ef29206a6b58254c81bea28ec6c95f  libXres-1.0.7.tar.bz2
# 25c6b366ac3dc7a12c5d79816ce96a59  libXtst-1.2.2.tar.bz2
# e0af49d7d758b990e6fef629722d4aca  libXv-1.0.10.tar.bz2
# 2e4014e9d55c430e307999a6b3dd256d  libXvMC-1.0.8.tar.bz2
# d7dd9b9df336b7dd4028b6b56542ff2c  libXxf86dga-1.1.4.tar.bz2
# e46f6ee4f4567349a3189044fe1bb712  libXxf86vm-1.1.3.tar.bz2
# ba983eba5a9f05d152a0725b8e863151  libdmx-1.1.3.tar.bz2
# b7c0d3afce14eedca57312a3141ec13a  libpciaccess-0.13.2.tar.bz2
# 19e6533ae64abba0773816a23f2b9507  libxkbfile-1.0.8.tar.bz2
# 2dd10448c1166e71a176206a8dfabe6d  libxshmfence-1.1.tar.bz2
# EOF
# grep -v '^#' lib-7.7.md5 | awk '{print $2}' | wget -i- -c \
#     -B http://xorg.freedesktop.org/releases/individual/lib/ &&
# md5sum -c lib-7.7.md5
#
# for package in $(grep -v '^#' lib-7.7.md5 | awk '{print $2}')
# do
#   packagedir=${package%.tar.bz2}
#   tar -xf $package
#   pushd $packagedir
#   case $packagedir in
#     libXfont-[0-9]* )
#       ./configure  --prefix=/opt/usr \
#        --disable-devel-docs
#     ;;
#     libXt-[0-9]* )
#       ./configure  --prefix=/opt/usr \
#       --with-appdefaultdir=/etc/X11/app-defaults
#     ;;
#     * )
#       ./configure  --prefix=/opt/usr
#     ;;
#   esac
#   make -j8
#   make install
#   popd
#   rm -rf $packagedir
# done

git clone http://git.videolan.org/git/x264.git
if cd x264; then
	  ./configure --enable-static --enable-shared --prefix=/opt/usr
	  make -j4 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
if wget http://ftp.videolan.org/pub/videolan/x265/x265_2.3.tar.gz; then
	tar xvf x265_2.3.tar.gz
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi

if cd x265_2.3/build/linux; then
	  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/opt/usr" -DENABLE_PIC=ON -DENABLE_SHARED=ON ../../source
	  make -j4 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
if wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2; then
	tar xjvf ffmpeg-snapshot.tar.bz2
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi

if cd ffmpeg; then
	 ./configure --prefix="/opt/usr" --extra-ldflags="-L/opt/usr//lib -lstdc++ -lm -lrt -ldl" --extra-cflags="-I/opt/usr/include" --pkg-config-flags="--static" --enable-static --enable-avfilter \
	 --enable-gpl --enable-avresample --enable-avutil --enable-libx265 --enable-libvpx --enable-libx264 --disable-doc && \
	  make -j4 && make install
else
	error_exit "$LINENO: An error has occurred.. Aborting."
fi
