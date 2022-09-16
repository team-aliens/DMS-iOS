#!/bin/sh
sh ci_install_tuist.sh
cd ../
ci_scripts/tuist/tuist fetch
ci_scripts/tuist/tuist generate
