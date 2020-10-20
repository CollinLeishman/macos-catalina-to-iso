#!/bin/bash

set -eux

mkdir -p out

sudo hdiutil create -o out/Catalina.cdr -size 9g -layout SPUD -fs HFS+J
sudo hdiutil attach out/Catalina.cdr.dmg -noverify -mountpoint /Volumes/install_build
sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/install_build --nointeraction
hdiutil detach /Volumes/Install\ macOS\ Catalina
hdiutil convert out/Catalina.cdr.dmg -format UDTO -o out/Catalina.iso
mv out/Catalina.iso.cdr out/Catalina.iso
rm out/Catalina.cdr.dmg

# Credits to Intel008 and Bogdam from https://communities.vmware.com/thread/611961
# Credits to mkuzmin https://github.com/jetbrains-infra/packer-builder-vsphere/blob/master/examples/macos/setup/iso-macos.sh
# Credits to pat-s https://gist.github.com/agentsim/00cc38c693e7d0e1b36a2080870d955b
