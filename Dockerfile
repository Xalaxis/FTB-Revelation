# Based on JDK 11, as I think that is the most recent version which works with FTB Omnia and I'm assuming that more recent versions of Java have better optimizations
FROM wolfrazu/creeperhostpackinstaller:latest
LABEL maintainer="matthew+docker@wolfie.ovh"
# Upgrade all packages to latest versions available
RUN apt-get update
RUN apt-get upgrade -y

# Create install directory if it isn't mounted to the host already
RUN mkdir -p /usr/src/ftbomnia

WORKDIR /usr/src/temporary

ENV VERSION="LATEST"
ENV MODPACKID="35"

# Build server
RUN bash downloadpack.sh
RUN bash yes y | ./serverinstall_"$MODPACKID"_"$VERSION"
# echo "Creating Minecraft EULA file"
RUN echo "eula=true" > eula.txt
ENTRYPOINT [ "java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx4G -Xms3072M -Dfml.queryResult=confirm -jar forge-*.jar nogui" ]