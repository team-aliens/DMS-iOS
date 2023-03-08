#!/bin/sh
sh ci_install_tuist.sh
cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

ci_scripts/tuist/tuist fetch
TUIST_CI=1 ci_scripts/tuist/tuist generate
