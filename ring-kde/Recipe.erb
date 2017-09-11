#!/bin/bash
#
# Copyright (C) 2016 Scarlett Clark <sgclark@kde.org>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) version 3, or any
# later version accepted by the membership of KDE e.V. (or its
# successor approved by the membership of KDE e.V.), which shall
# act as a proxy defined in Section 6 of version 3 of the license.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library.  If not, see <http://www.gnu.org/licenses/>.

cd /
# Get helper functions
wget -q https://github.com/probonopd/AppImages/raw/master/functions.sh -O ./functions.sh
. ./functions.sh
rm -f functions.sh

cd /app.Dir
#Move binary/desktop/icon into AppDir
mv /app.Dir/usr/bin/<%= binary %> .
mv /app.Dir/usr/share/applications/cx.ring.ring-kde.desktop <%= binary %>.desktop
cp /app.Dir/usr/share/icons/hicolor/48x48/apps/*<%= name %>* .

mkdir ./etc; cp /etc/mime.types $_

cp -rfv /usr/share/mime ./usr/share/
update-mime-database ./usr/share/mime

# Run appimage once with QT_DEBUG_PLUGINS=1 to add missing ( linuxdeployqt should install correctly)
mkdir -p ./plugins; cp -r /opt/usr/plugins/{bearer,generic} $_
# Bring in kf5 plugins
mv /opt/usr/plugins/kf5/* ./plugins/ || true

#move arch libs into same dir as rest
mv /opt/usr/lib/x86_64-linux-gnu/pkgconfig/* /opt/usr/lib/pkgconfig/
rmdir /opt/usr/lib/x86_64-linux-gnu/pkgconfig
mv /opt/usr/lib/x86_64-linux-gnu/cmake/* /opt/usr/lib/cmake/
rmdir /opt/usr/lib/x86_64-linux-gnu/cmake
mv /opt/usr/lib/x86_64-linux-gnu/* /opt/usr/lib/

mkdir ./lib
#Uncomment for sound
cp -rfv /opt/usr/lib/qt5/plugins/phonon4qt5_backend  ./plugins/
cp /opt/usr/bin/gst* ./usr/bin/
rm -rfv /opt/usr/lib/gstreamer-1.0/include
cp /opt/usr/lib/gstreamer-1.0/* ./lib/
cp /opt/usr/lib/pulseaudio/* ./lib/
mv /opt/usr/libexec/gstreamer-1.0/* ./usr/bin || true

rsync -aruxv --progress /opt/usr/resources/ ./usr/bin/
rsync -aruxv --progress /opt/usr/translations/ ./usr/bin/


mv /opt/usr/libexec/Qt* ./usr/bin/ || true

unset LD_LIBRARY_PATH
~/./linuxdeployqt-1-x86_64.AppImage <%= name %> -verbose=3 -bundle-non-qt-libs -qmldir=/opt/usr/qml

patch_usr
glibc_needed
delete_blacklisted
#Cleanup
# We don't bundle the developer stuff
rm -rf ./usr/include || true
rm -rf ./usr/lib/cmake || true
rm -rf ./lib/cmake || true
rm -rf ./usr/lib/pkgconfig || true
rm -rf ./usr/share/ECM/ || true
rm -rf ./usr/share/gettext || true
rm -rf ./usr/share/pkgconfig || true
rm -rf ./usr/mkspecs/ || true
rm -rf ./usr/gettext-* || true
rm -rf ./usr/autoconf-* || true
rm -rf ./usr/automake-* || true
rm -rf ./usr/libtool-* || true
rm -rf ./libexec || true
rm -rf ./usr/share/cmake-3.8 || true
rm -rf ./usr/share/man || true
rm -rf ./usr/share/doc/ECM || true
rm -rf ./usr/share/doc/libdbusmenu-qt5-doc || true
rm -rf ./usr/share/gtk-doc || true
rm -rf ./usr/share/wallpapers || true
rm -rf ./usr/share/aclocal || true
rm -rf ./usr/share/bash-completion || true
rm -rf ./usr/share/common-lisp || true
rm -rf ./usr/share/cups || true
rm -rf ./usr/share/doc/{cups,gettext,gnupg,libasprintf,pcre} || true
rm -rf ./usr/share/gir-1.0 || true
rm -rf ./usr/share/gnupg || true
rm -rf ./usr/share/gobject-introspection-1.0 || true
rm -rf ./usr/share/util-macros || true
find . -name '*.a' -exec rm {} \;
strip -g $(find . -type f -exec) || true
find . -type f -exec file {} \; | grep "not stripped"
#Add back libkrb5
cp /usr/lib/x86_64-linux-gnu/libkrb5* ./lib/
get_desktopintegration <%= name %>
cd /source/
rm -rfv appimage-exec-wrapper || true
git clone git://anongit.kde.org/scratch/brauch/appimage-exec-wrapper
cd /source//appimage-exec-wrapper/
make clean
make
cp -v exec.so /app.Dir//exec_wrapper.so
rm -rfv  /app/src/appimage-exec-wrapper
cd /app.Dir/
rm AppRun
#Create AppRun
cat > AppRun << EOF
#!/bin/bash
DIR="\`dirname \"\$0\"\`"
HERE="\`( cd \"\$DIR\" && pwd )\`"
export LD_PRELOAD=\$HERE/exec_wrapper.so
export QML2_IMPORT_PATH=\$HERE/qml
export QT_PLUGIN_PATH=\$HERE/plugins
export GRANTLEE_PLUGIN_PATH=\$HERE/plugins
export PATH=\$HERE/usr/bin/:\$HERE/usr/sbin/:\$HERE/usr/games/:\$HERE/bin/:\$HERE/sbin/:\$PATH
export LD_LIBRARY_PATH=\$HERE/usr/lib/:\$HERE/usr/lib/x86_64-linux-gnu/:\$HERE/usr/lib64/:\$HERE/lib/:\$HERE/lib/x86_64-linux-gnu/:\$HERE/lib64/:\$LD_LIBRARY_PATH
export XDG_DATA_DIRS=\$HERE/usr/share:\$HOME/.local/share:\$HERE/share:/usr/local/share/:/usr/share:\$XDG_DATA_DIRS
export XDG_DATA_HOME=\$HOME/.local/share
export XDG_CONFIG_DIRS=\$HERE/.config:\$HERE/etc/xdg:\$XDG_CONFIG_DIRS
export KDE_FORK_SLAVES=1
export KF5_LIBEXEC_DIR=\$HERE/usr/bin
export GST_PLUGIN_PATH=\$HERE/lib
export GST_PLUGIN_SCANNER=\$HERE/bin
export QT_STYLE_OVERRIDE=
dring &
PID=$!
<%= binary %> $@
kill $PID
EOF
chmod +x AppRun
mv <%= binary %> ./usr/bin/
cp <%= binary %>.desktop ./usr/share/applications/
cd ~


#Appstream support for appimagetool
rm -rfv /source/*



#Re set LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/usr/lib:/opt/usr/lib/x86_64-linux-gnu:/usr/lib:/usr/lib64:/lib
