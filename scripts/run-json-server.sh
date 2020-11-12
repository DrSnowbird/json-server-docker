#!/bin/bash -x

echo "####################### Main Process: $(basename $0) ###########################"

printenv

echo ">>>> Who am i: `whoami` ; UID=`id -u` ; GID=`id -g`"

#### Do some process calls here ... ####
cd ${APP_DIR}

echo "$(basename $0): inputs= $*"

if [ -s ${HOME}/.config ]; then
    sudo chown -R $USER:$(id -gn $USER) ${HOME}/.config
fi

ls -al ${APP_DIR}

SERVER_HOST_PORT=" --host ${JSON_SERVER_HOST:-0.0.0.0} --port ${JSON_SERVER_PORT:-3000} "
## -- run json-server: --
function runJsonServer() {
    JSON_FILE=`ls ${APP_DIR}/*.json | head -1`
    json_file=${1:-$JSON_FILE}
    if [[ $1 == "http"* ]]; then
        echo "-- resource is HTTP/HTTPS URL JSON remote file"
        echo -e "---- INFO: Input JSON_URL=${JSON_URL}"
        json-server ${SERVER_HOST_PORT} ${JSON_URL} 2>&1 | sudo tee ${LOG_FILE}
    else
        echo "-- resource local JSON file --"
        if [ -s $JSON_FILE ]; then
            json-server ${SERVER_HOST_PORT} --watch ${JSON_FILE} 2>&1 | sudo tee ${LOG_FILE}
        else
            echo -e "**** ERROR: Can't find any JSON file to launch REST API Service for! Abort! ****"
        fi
    fi
}

## -- main --
if [ $# -ge 1 ]; then
    if [ "$1" = "/bin/sh" ] || [ "$1" = "/bin/bash" ]; then
        echo "## -- commands: /bin/bash $@"
        exec $@
    else
        JSON_URL="$@"
        echo "## -- commands: runJsonServer $@"
        runJsonServer "$@"
    fi
else
    echo "## -- commands: runJsonServer <using default ${APP_DIR}/*.json"
    runJsonServer
fi
#tail -f /dev/null
