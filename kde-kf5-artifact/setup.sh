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
# Lesser General Public License fo-r more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library.  If not, see <http://www.gnu.org/licenses/>.
export PATH=/opt/usr/bin:/home/jenkins/.rbenv/bin:/home/jenkins/.rbenv/shims:$PATH
export WORKSPACE=`pwd`
echo $WORKSPACE


tar -xvf /in/artifact.tar.gz --strip-components=1 -C /opt
ls -l /opt/
rm /in/artifact.tar.gz
cd /in
rbenv init -
gem update bundler
bundle install
bundle binstubs rspec-core
bundle show rspec
rbenv rehash
bundle list --paths
bundle env
bundle exec rspec appimage-template/spec/artifact_recipe_rspec.rb --fail-fast
