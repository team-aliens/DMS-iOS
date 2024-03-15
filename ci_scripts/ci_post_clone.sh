#!/bin/sh

cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

chmod +x ci_install_tuist.sh
./ci_install_tuist.sh
