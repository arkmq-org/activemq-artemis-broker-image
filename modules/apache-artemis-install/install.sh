#!/bin/sh
# Installs the AMQ distribution into the filesystem.
set -e

AMQ_HOME=/opt/amq
SOURCES_DIR=/tmp/artifacts
SCRIPT_DIR=$(dirname $0)
ADDED_DIR=${SCRIPT_DIR}/added

unzip -q "$SOURCES_DIR/apache-artemis-bin.zip" -d apache-artemis-bin
mv "$(ls -d apache-artemis-bin/*)" $AMQ_HOME
rmdir apache-artemis-bin

cp $ADDED_DIR/launch.sh $AMQ_HOME/bin
chmod 0755 $AMQ_HOME/bin/launch.sh

# Upgrade packages
microdnf update -y --setopt=install_weak_deps=0 && rm -rf /var/cache/yum
