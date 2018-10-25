#!/bin/bash

export CFLAGS=$(pkg-config --cflags gstreamer-1.0) $CFLAGS
export LDFLAGS=$(pkg-config --libs gstreamer-1.0) $LDFLAGS

cd /source && git clone git://code.qt.io/qt/qt5.git && cd qt5 && git checkout 5.11
perl init-repository --module-subset=default,-qtmacextras,-qtwinextras,-qtwebkit-examples,-qtandroidextras
cd /source/qt5 && ./configure -v -release -opensource -nomake examples -nomake tests -confirm-license -opengl desktop -reduce-exports -prefix /opt/usr && make  -j8 && make install && rm -rfv $SOURCES/qt5
rm -rfv /source/qt5
