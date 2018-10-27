#!/bin/bash
set -e
SOURCES=/source
#GPG stack for gpgme
# cd $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.26.tar.bz2 && tar -jxvf libgpg-error-1.26.tar.bz2 && \
# cd $SOURCES/libgpg-error-1.26 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
# rm $SOURCES/libgpg-error-1.26.tar.bz2 && rm -rfv $SOURCES/libgpg-error-1.26
# cd $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.3.5.tar.bz2 && tar -jxvf libksba-1.3.5.tar.bz2 && \
# cd  $SOURCES/libksba-1.3.5 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
# rm  $SOURCES/libksba-1.3.5.tar.bz2 && rm -rfv $SOURCES/libksba-1.3.5
# cd  $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.3.tar.bz2 && tar -jxvf libassuan-2.4.3.tar.bz2 && \
# cd $SOURCES/libassuan-2.4.3 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
# rm $SOURCES/libassuan-2.4.3.tar.bz2 && rm -rfv $SOURCES/libassuan-2.4.3
cd $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/npth/npth-1.3.tar.bz2 && tar -jxvf npth-1.3.tar.bz2 && \
cd $SOURCES/npth-1.3 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/npth-1.3.tar.bz2 && rm -rfv $SOURCES/npth-1.3
cd $SOURCES && wget https://github.com/gpg/libgcrypt/archive/libgcrypt-1.7.10.tar.gz && tar -xvf libgcrypt-1.7.10.tar.gz && \
cd $SOURCES/libgcrypt-libgcrypt-1.7.10 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr && cd doc && make stamp-vti && cd .. &&  make -j 8 && make install && \
rm $SOURCES/libgcrypt-1.7.10.tar.gz && rm -rfv $SOURCES/libgcrypt-libgcrypt-1.7.10
cd $SOURCES && wget http://ftp.gnu.org/gnu/libtasn1/libtasn1-4.10.tar.gz && tar -zxvf libtasn1-4.10.tar.gz && \
cd $SOURCES/libtasn1-4.10 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install &&\
rm $SOURCES/libtasn1-4.10.tar.gz && rm -rfv $SOURCES/libtasn1-4.10
cd $SOURCES && wget https://ftp.gnu.org/gnu/nettle/nettle-3.3.tar.gz && tar -zxvf nettle-3.3.tar.gz && \
cd $SOURCES/nettle-3.3 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/nettle-3.3.tar.gz && rm -rfv $SOURCES/nettle-3.3
cd $SOURCES && wget https://github.com/p11-glue/p11-kit/releases/download/0.23.14/p11-kit-0.23.14.tar.gz && tar -zxvf p11-kit-0.23.14.tar.gz && \
cd $SOURCES/p11-kit-0.23.14 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && \
rm $SOURCES/p11-kit-0.23.14.tar.gz && rm -rfv $SOURCES/p11-kit-0.23.14
cd $SOURCES && wget ftp://ftp.gnutls.org/gcrypt/gnutls/v3.5/gnutls-3.5.10.tar.xz && tar -xvf gnutls-3.5.10.tar.xz && \
cd $SOURCES/gnutls-3.5.10 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr --with-included-libtasn1 &&  make -j 8 && make install && \
rm $SOURCES/gnutls-3.5.10.tar.xz && rm -rfv $SOURCES/gnutls-3.5.10
cd $SOURCES && wget http://downloads.sourceforge.net/pcre/pcre-8.35.tar.bz2 && tar -jxvf pcre-8.35.tar.bz2 && \
cd $SOURCES/pcre-8.35 && ./configure --prefix=/opt/usr && make && make install && \
rm $SOURCES/pcre-8.35.tar.bz2 && rm -rfv $SOURCES/pcre-8.35
cd $SOURCES && wget https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.1.17.tar.bz2 && tar -jxvf gnupg-2.1.17.tar.bz2 && \
cd gnupg-2.1.17 && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && rm /gnupg-2.1.17.tar.bz2 && rm -rfv /gnupg-2.1.17
cd $SOURCES && git clone git://git.gnupg.org/gpgme.git && \
cd $SOURCES/gpgme && autoreconf --force --install && mkdir builddir && cd builddir && ../configure --prefix=/opt/usr &&  make -j 8 && make install && rm -rfv $SOURCES/gpgme

# cd $SOURCES && git clone git://code.qt.io/qt/qtdeclarative.git && cd $SOURCES/qtdeclarative && git checkout 5.9 && \
# cd $SOURCES/qtdeclarative &&  qmake PREFIX=/opt/usr . && make && make install && rm -rfv $SOURCES/qtdeclarative
# cd $SOURCES && git clone http://code.qt.io/qt/qtstyleplugins.git && \
# cd $SOURCES/qtstyleplugins && qmake PREFIX=/opt/usr . && make && make install && rm -rfv $SOURCES/qtstyleplugins
# cd $SOURCES && git clone https://code.qt.io/cgit/qt/qtquick1.git && \
# cd $SOURCES/qtquick1 && qmake PREFIX=/opt/usr . && make && make install && rm -rfv $SOURCES/qtquick1
# cd $SOURCES && git clone https://github.com/flavio/qjson && \
# cd $SOURCES/qjson &&  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX:PATH=/opt/usr && make && make install && rm -rfv $SOURCES/qjson
# cd $SOURCES && wget 'https://gstreamer.freedesktop.org/src/qt-gstreamer/qt-gstreamer-1.2.0.tar.xz' && tar -xvf qt-gstreamer-1.2.0.tar.xz && \
# cd $SOURCES/qt-gstreamer-1.2.0 &&  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX:PATH=/opt/usr -DQT_VERSION=5 -DCMAKE_REQUIRED_INCLUDES=/opt/usr/include/gstreamer-1.0/ \
# -DQTGSTREAMER_STATIC=OFF -DQTGSTREAMER_EXAMPLES=OFF && make && make install && rm $SOURCES/qt-gstreamer-1.2.0.tar.xz && rm -rfv $SOURCES/qt-gstreamer-1.2.0
# # RUN cd $SOURCES && wget https://www.riverbankcomputing.com/static/Downloads/PyQt5/PyQt5_gpl-5.8.3.dev1704051437.tar.gz && tar -zxvf PyQt5_gpl-5.8.3.dev1704051437.tar.gz && \
# # cd $SOURCES/PyQt5_gpl-5.8.3.dev1704051437 && /opt/usr/bin/python3 configure.py --confirm-license --verbose --destdir /opt/usr --sip /opt/usr/bin/sip --sip-incdir /opt/usr/include/python3.5/ \
# # -q /opt/usr/bin/qmake -c -j 4 LIBDIR_QT=/opt/usr/lib STRIP="" MOC=/usr/bin/moc --qmake="/opt/usr/bin/qmake" \
# # LIBS_OPENGL="" LIBS_X11="" LIBS_THREAD="" -m /opt/usr/lib/python3.5/config-3.5m \
# # -d /opt/usr/lib/python3.5/dist-packages	--dbus /usr/include/dbus-1.0 --no-designer-plugin --no-qml-plugin && make -j8 && make install && \
# # rm -rfv $SOURCES/PyQt5_gpl-5.8.3.dev1704051437 && rm $SOURCES/PyQt5_gpl-5.8.3.dev1704051437.tar.gz && rm $SOURCES/sip-4.19.1.tar.gz && rm -rfv $SOURCES/sip-4.19.1
# cd $SOURCES && wget http://download.kde.org/stable/qca/2.1.1/src/qca-2.1.1.tar.xz && tar -xvf qca-2.1.1.tar.xz && \
# cd $SOURCES/qca-2.1.1 && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX:PATH=/opt/usr .. && cmake --build . && cmake --build . --target install && \
# rm $SOURCES/qca-2.1.1.tar.xz && rm -rfv $SOURCES/qca-2.1.1
# RUN cd $SOURCES && git clone https://github.com/ayoy/qoauth && \
# cd $SOURCES/qoauth && sed s#/usr#/opt/usr# -i src/src.pro  && sed s#/lib64#/lib# -i src/src.pro&& qmake ' "QT += widgets" "QT += webkitwidgets" "CONFIG += crypto" "DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x000000"' src/src.pro \
# && make -j8 && make install && rm -rfv $SOURCES/qoauth
# cd $SOURCES && svn export svn://svn.code.sf.net/p/qwt/code/branches/qwt-6.1 && cd $SOURCES/qwt-6.1 && qmake -set prefix '/opt' && qmake qwt.pro && \
# make -j8 && INSTALL_ROOT=/opt make install && rm -rfv $SOURCES/qwt-6.1 && \
# mv /opt/usr/local/qwt-6.1.4-svn/include/* /opt/usr/include/ && \
# mv /opt/usr/local/qwt-6.1.4-svn/lib/* /opt/usr/lib/ && \
# mv /opt/usr/local/qwt-6.1.4-svn/plugins/designer/* /opt/usr/plugins/designer/ && rmdir /opt/usr/local/qwt-6.1.4-svn/plugins/designer
# cd $SOURCES && git clone https://github.com/steveire/grantlee && \
# cd $SOURCES/grantlee && mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/usr CMAKE_BUILD_TYPE=Release .. && cmake --build . && cmake --build . --target install \
# && rm -rfv $SOURCES/grantlee
# cd $SOURCES && wget https://poppler.freedesktop.org/poppler-0.51.0.tar.xz && tar -xvf poppler-0.51.0.tar.xz && \
# cd $SOURCES/poppler-0.51.0 && mkdir build && cd build && ../configure --prefix=/opt/usr -sysconfdir=/opt/etc --disable-static --enable-build-type=release \
# --enable-cmyk --enable-xpdf-headers --enable-poppler-qt5 && make && make install && rm $SOURCES/poppler-0.51.0.tar.xz && rm -rfv $SOURCES/poppler-0.51.0
