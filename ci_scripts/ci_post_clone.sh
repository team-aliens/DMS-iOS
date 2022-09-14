#!/bin/sh

  bash <(curl -Ls <https://install.tuist.io>)

 $INSTALL_DIR/tuist fetch
 $INSTALL_DIR/tuist generate
