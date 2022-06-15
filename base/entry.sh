#!/bin/bash

# Believe it or not, if you don't do this srcds_run shits itself
cd "${STEAMAPPDIR}"

bash "${STEAMAPPDIR}/hlds_run" -game "${STEAMAPP}" \
                        -strictportbind \
                        +hostname "${HLDS_HOSTNAME}" \
                        -port "${HLDS_PORT}" \
                        +maxplayers "${HLDS_MAXPLAYERS}" \
                        +map "${HLDS_STARTMAP}" \
                        +sv_password "${HLDS_PW}" \
                        -ip "${HLDS_IP}" \
                        +sv_lan ${HLDS_SVLAN}