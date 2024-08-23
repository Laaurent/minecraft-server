FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /minecraft

RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    nano \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O server.jar https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.16.2/1.0.1/server/jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT [ "java" ]

CMD ["-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]

COPY server.properties /minecraft/server.properties
