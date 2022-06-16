#!/bin/bash

# Believe it or not, if you don't do this srcds_run shits itself
cd "${STEAMAPPDIR}"

# since "hostname" in command line settings will be overwritten by default server.cfg
sed -i "s/hostname \"Counter-Strike 1.6 Server\"/hostname \"$HLDS_HOSTNAME\"/" ${STEAMAPPDIR}/${STEAMAPP}/server.cfg

# configure FastDownload
sed -i "s/sv_downloadurl \"http:\/\/127.0.0.1\/cstrike\/\"/sv_downloadurl \"$SRCDS_FASTDL\"/" ${STEAMAPPDIR}/${STEAMAPP}/server.cfg

bash "${STEAMAPPDIR}/hlds_run" -game "${STEAMAPP}" \
                        -strictportbind \
                        -port "${HLDS_PORT}" \
                        +maxplayers "${HLDS_MAXPLAYERS}" \
                        +map "${HLDS_STARTMAP}" \
                        +sv_password "${HLDS_PW}" \
                        +ip "${HLDS_IP}" \
                        +sv_lan ${HLDS_SVLAN}