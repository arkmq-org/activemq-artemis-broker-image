#!/bin/sh
set -e

AMQ_HOME=/opt/amq

chmod 0755 $AMQ_HOME
chmod 0755 $AMQ_HOME/bin
chown -R jboss:root $AMQ_HOME
chmod -R g+rwX $AMQ_HOME
