#!/bin/bash
# set +e: don't exit if a command exits with a non-zero status
set -e

#replace developerMode
if [ "${DEVELOPER_MODE}" == "true" ]; then
  sed -i 's/developerMode = false/developerMode = true/' /usr/local/bin/Yadoms/bin/yadoms.ini
fi

exec "$@"
