#!/bin/bash
                    set -e
                    export PATH=$PATH:/var/lib/jenkins/.rbenv/bin
                    eval "$(rbenv init -)"
                    rbenv local 2.4.1
                    cd /source && git clone http://code.qt.io/qt/qtwebkit.git && cd /source/qtwebkit && git checkout 5.212 && \
                    cmake  -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBUILD_QTHELP_DOCS=ON -DBUILD_QCH=ON -DCMAKE_CXX_FLAGS:STRING=-pipe -DCMAKE_INSTALL_PREFIX=/opt/usr -DPORT=Qt
                    make && make install && rm -rfv /source/qtwebkit
