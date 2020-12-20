#!/bin/bash

bash cleanup.sh

cp -R /tmp/creeperpackinstaller /opt/minecraftftb

# echo "Creating Minecraft EULA file"
echo "eula=true" > eula.txt
bash -c java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx${MAXMEMORY} -Xms${MINMEMORY} -Dfml.queryResult=confirm -jar forge-*.jar nogui