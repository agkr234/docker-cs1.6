FROM cm2network/steamcmd:root

ENV STEAMAPPID 10
ENV STEAMAPP cstrike
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

# Add entry script
ADD entry.sh ${HOMEDIR}/entry.sh

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
	&& chmod +x "${HOMEDIR}/entry.sh" \
	&& chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" \
	# Clean up
	&& rm -rf /var/lib/apt/lists/* \
	&& bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
				+login anonymous \
				+app_update 90 validate \
				+quit \
    &&  bash "${STEAMCMDDIR}/steamcmd.sh" \
				+login anonymous \
				+app_update 70 validate \
				+quit \
    &&  bash "${STEAMCMDDIR}/steamcmd.sh" \
				+login anonymous \
				+app_update 10 validate \
				+quit \
    &&  bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
				+login anonymous \
				+app_update 90 validate\
				+quit

# Add config files
ADD cfg/ ${STEAMAPPDIR}/${STEAMAPP}/cfg

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