#!/bin/bash
export PATH=/kb/runtime/bin:/mnt/kb/dev_container/bin:/kb/runtime/glassfish3/bin:/kb/runtime//java/bin:/kb/runtime/thrift/bin:/kb/runtime/java/bin:/kb/deployment/bin:/kb/runtime/bin:/kb/runtime/bin:/mnt/kb/dev_container/bin:/kb/runtime/glassfish3/bin:/kb/runtime//java/bin:/kb/runtime/thrift/bin:/kb/runtime/java/bin:/kb/deployment/bin:/kb/runtime/bin:/kb/runtime/bin:/mnt/kb/dev_container/bin:/kb/runtime/glassfish3/bin:/kb/runtime//java/bin:/kb/runtime/thrift/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/kb/deployment/bin
export KB_RUNTIME=/kb/runtime
export PYTHONPATH="/mnt/kb/dev_container/modules/coexpression/lib"
export KB_SERVICE_NAME="CoExpression"
export KB_DEPLOYMENT_CONFIG="/kb/module/deploy.cfg"
coverage run /mnt/kb/dev_container/modules/coexpression/ltest/script_test/basic_test.py $1 $2 $3
