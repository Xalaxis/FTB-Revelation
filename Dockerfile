# Based on JDK 11, as I think that is the most recent version which works with FTB Omnia and I'm assuming that more recent versions of Java have better optimizations
FROM wolfrazu/creeperhostpackinstaller:java8
LABEL maintainer="matthew+docker@wolfie.ovh"
# Upgrade all packages to latest versions available
RUN apt-get update
RUN apt-get upgrade -y

WORKDIR /tmp/creeperpackinstaller

ENV VERSION="LATEST"
ENV MODPACKID="35"
ENV MAXMEMORY="4G"
ENV MINMEMORY="3072M"

# Build server
RUN bash downloadpack.sh

RUN bash yes y | ./serverinstall_*

RUN cp cleanup.sh /opt/minecraftftb

WORKDIR /opt/minecraftftb

RUN bash cleanup.sh

RUN bash cp -R /tmp/creeperpackinstaller /opt/minecraftftb
# echo "Creating Minecraft EULA file"
RUN echo "eula=true" > eula.txt
ENTRYPOINT [ "bash", "-c", "java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx${MAXMEMORY} -Xms${MINMEMORY} -Dfml.queryResult=confirm -jar forge-*.jar nogui" ]