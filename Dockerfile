FROM openkbs/jdk-mvn-py3

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

#### --- Copy Entrypoint script in the container ---- ####
ENV APP_DIR=${APP_DIR:-${HOME}/app}
ENV LOG_FILE=${LOG_DIR:-${APP_DIR}/jsons-server.log}

VOLUME ${APP_DIR}

ENV JSON_SERVER_HOST=${JSON_SERVER_HOST:-0.0.0.0}
ENV JSON_SERVER_PORT=${JSON_SERVER_PORT:-3000}

EXPOSE ${JSON_SERVER_PORT}

#### --- Enterpoint for container ---- ####
USER ${USER}
WORKDIR ${HOME}

COPY ./scripts/run-json-server.sh ${HOME}/run-json-server.sh
RUN sudo chown $USER:$USER ${HOME}/run-json-server.sh && \
    sudo chmod +x ${HOME}/run-json-server.sh && \
    # sudo chown -R $USER:$(id -gn $USER) /home/developer/.config && \
    #sudo npm install -g npm && \
    sudo npm install -g json-server && \
    ls -al ${SCRIPT_DIR}/* 
    
RUN sudo apt-get clean && \
    sudo apt-get autoclean && \
    sudo apt-get autoremove
    
EXPOSE 3000

#### -- JSON db file: --
#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD "${HOME}/run-json-server.sh"

#### (Test/Debug only)
#CMD ["/usr/bin/firefox"]
#CMD ["/bin/bash"]

