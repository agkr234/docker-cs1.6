FROM agekara/docker-cs1.6:latest

RUN mkdir -p ${STEAMAPPDIR}/${STEAMAPP}/addons/metamod/dlls && \
    curl -sqL "http://prdownloads.sourceforge.net/metamod/metamod-1.20-linux.tar.gz" | tar zxf - -C ${STEAMAPPDIR}/${STEAMAPP}/addons/metamod/dlls && \
    touch ${STEAMAPPDIR}/${STEAMAPP}/addons/metamod/plugins.ini && \
    sed -i 's/gamedll_linux "dlls\/cs.so"/#gamedll_linux "dlls\/cs.so"\ngamedll_linux "addons\/metamod\/dlls\/metamod.so"/'  ${STEAMAPPDIR}/${STEAMAPP}/liblist.gam