FROM agekara/docker-cs1.6:meta

RUN curl -sqL "https://www.amxmodx.org/release/amxmodx-1.8.2-base-linux.tar.gz" | tar zxf - -C ${STEAMAPPDIR}/${STEAMAPP} && \
    curl -sqL "https://www.amxmodx.org/release/amxmodx-1.8.2-cstrike-linux.tar.gz" | tar zxf - -C ${STEAMAPPDIR}/${STEAMAPP} && \
    echo "linux addons/amxmodx/dlls/amxmodx_mm_i386.so" >> ${STEAMAPPDIR}/${STEAMAPP}/addons/metamod/plugins.ini && \
    echo "\"$ADMIN_STEAM_ID\" \"\" \"abcdefghijklmnopqrstu\" \"ce\" ; Server admin added during container build" >> ${STEAMAPPDIR}/${STEAMAPP}/addons/amxmodx/configs/users.ini
