FROM cm2network/steamcmd:root

ENV STEAMAPPID 10
ENV STEAMAPP cstrike
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

RUN set -x \
	# Add i386 architecture
	&& dpkg --add-architecture i386 \
	# Install, update & upgrade packages
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		wget=1.21-1+deb11u1 \
        curl \
        libgcc1:i386 \
        unzip \
	&& mkdir -p "${STEAMAPPDIR}" \
	&& chown -R "${USER}:${USER}" "${STEAMAPPDIR}" \
	# Clean up
	&& rm -rf /var/lib/apt/lists/*

RUN ${STEAMCMDDIR}/steamcmd.sh +login anonymous +force_install_dir "${STEAMAPPDIR}" +app_update 90 +app_set_config 90 mod cstrike validate +quit || true && \
    mkdir -p "${STEAMAPPDIR}/steamapps" && \
    curl -s https://raw.githubusercontent.com/dgibbs64/HLDS-appmanifest/master/CounterStrike/appmanifest_90.acf -o ${STEAMAPPDIR}/steamapps/appmanifest_90.acf && \
    ${STEAMCMDDIR}/steamcmd.sh +login anonymous +force_install_dir "${STEAMAPPDIR}" +app_update 90 +app_set_config 90 mod cstrike validate +quit

# Add entry script/config files after finshing installing game app, 
# otherwise you will end up installing game app again when you change the contents of those files.
ADD cfg/ "${STEAMAPPDIR}/${STEAMAPP}/cfg"
ADD entry.sh ${HOMEDIR}/entry.sh
RUN chmod +x "${HOMEDIR}/entry.sh" \
	&& chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh"
	
ENV HLDS_PORT=27015 \
	HLDS_IP=0 \
	HLDS_MAXPLAYERS=16 \
	HLDS_PW="" \
	HLDS_STARTMAP="de_dust2" \
	HLDS_HOSTNAME="Counter-Strike Dedicated Server" \
    HLDS_SVLAN=0

# Switch to user
USER ${USER}

WORKDIR ${HOMEDIR}

CMD ["bash", "entry.sh"]

# Expose ports
EXPOSE 27015/tcp \
	    27015/udp \