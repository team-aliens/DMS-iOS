#!/bin/sh
chmod +x ci_install_tuist.sh
sh ci_install_tuist.sh
cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

tuist fetch
TUIST_CI=1 tuist generate
