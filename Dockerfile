# Based on JDK 11, as I think that is the most recent version which works with FTB Omnia and I'm assuming that more recent versions of Java have better optimizations
FROM wolfrazu/creeperhostpackinstaller:latest
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
WORKDIR /opt/minecraftftb
RUN bash yes y | ./serverinstall_*
# echo "Creating Minecraft EULA file"
RUN echo "eula=true" > eula.txt
ENTRYPOINT [ "bash", "java", "-server", "-XX:+UseG1GC", "-XX:+UnlockExperimentalVMOptions", "-Xmx${MAXMEMORY}", "-Xms${MINMEMORY}", "-Dfml.queryResult=confirm", "-jar", "forge-*.jar", "nogui" ]