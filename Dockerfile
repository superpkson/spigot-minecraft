FROM amazoncorretto:21-alpine

RUN apk update && apk add git curl
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && java -jar BuildTools.jar --final-name server.jar

VOLUME ["/opt/mc"]
EXPOSE 25565
WORKDIR /opt/mc

RUN echo "eula=true" >> /opt/mc/eula.txt

CMD ["java","-Xmx1G","-Xms1G","-jar","/server.jar","nogui"]