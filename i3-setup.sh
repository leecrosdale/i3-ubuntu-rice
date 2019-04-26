#!/bin/bash
sudo apt install -y git
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb-*-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake

cd /tmp

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

cd

sudo apt install -y i3status suckless-tools
sudo apt install -y libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool

git clone https://github.com/karlstav/cava cava

cd cava
./autogen.sh
./configure
make
sudo make install

cd

sudo apt install -y tizonia
sudo apt install -y i3lock


