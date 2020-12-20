#!/bin/bash

bash cleanup.sh

RUN cp -R /tmp/creeperpackinstaller /opt/minecraftftb

# echo "Creating Minecraft EULA file"
RUN echo "eula=true" > eula.txt
bash -c java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx${MAXMEMORY} -Xms${MINMEMORY} -Dfml.queryResult=confirm -jar forge-*.jar nogui