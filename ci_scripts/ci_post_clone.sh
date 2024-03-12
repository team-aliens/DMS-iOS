#!/bin/sh
curl https://mise.jdx.dev/install.sh | sh
curl https://mise.run | sh
mise install tuist
eval "$(mise activate bash --shims)"

sh ci_install_tuist.sh
cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

tuist fetch
TUIST_CI=1 tuist generate
