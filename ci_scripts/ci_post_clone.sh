#!/bin/sh
curl -Ls https://install.tuist.io | bash

cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

tuist clean --path ..
tuist fetch --path ..
TUIST_CI=1 tuist generate --path ..
