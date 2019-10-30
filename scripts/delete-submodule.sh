#!/bin/sh

# This script deletes a submodule.
#
# SDIR: APD/scripts$
# EDIR: APD/scripts$

# CDIR: APD/scripts$
echo -n "ENTER A SUBMODULE PATH: "
read submodulepath
# CDIR: APD$
cd ..
git config -f .git/config --remove-section submodule.$submodulepath
git config -f .gitmodules --remove-section submodule.$submodulepath
git rm --cached "$submodulepath"
git add .gitmodules
git commit -m "DELETED $submodulepath"
rm -r "./$submodulepath"
rm -rf "./.git/modules/$submodulepath"
cd scripts
# CDIR: APD/scripts$
