#!/bin/sh
sh ci_install_tuist.sh
cd ../
ci_scripts/tuist/tuist fetch
TUIST_CI=1 ci_scripts/tuist/tuist generate
