#!/bin/bash

# Believe it or not, if you don't do this srcds_run shits itself
cd "${STEAMAPPDIR}"

# since "hostname" in command line settings will be overwritten by default server.cfg
ESCAPED_HLDS_HOSTNAME="$(echo $HLDS_HOSTNAME | sed 's/[!@#$%^&*()-/]/\\&/g')"
sed -i "s/hostname \"Counter-Strike 1.6 Server\"/hostname \"$ESCAPED_HLDS_HOSTNAME\"/" ${STEAMAPPDIR}/${STEAMAPP}/server.cfg

# configure FastDownload
ESCAPED_FASTDL_URL="$(echo $FASTDL_URL | sed 's/[!@#$%^&*()-/]/\\&/g')"
sed -i "s/sv_downloadurl \"http:\/\/127.0.0.1\/cstrike\/\"/sv_downloadurl \"$ESCAPED_FASTDL_URL\"/" ${STEAMAPPDIR}/${STEAMAPP}/server.cfg

bash "${STEAMAPPDIR}/hlds_run" -game "${STEAMAPP}" \
                        -strictportbind \
                        -port "${HLDS_PORT}" \
                        +maxplayers "${HLDS_MAXPLAYERS}" \
                        +map "${HLDS_STARTMAP}" \
                        +sv_password "${HLDS_PW}" \
                        +ip "${HLDS_IP}" \
                        +sv_lan ${HLDS_SVLAN}