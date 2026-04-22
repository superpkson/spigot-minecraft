FROM amazoncorretto:26-alpine

RUN apk update && apk add git curl
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --final-name server.jar
RUN rm -r BuildData BuildTools.jar BuildTools.log.txt Bukkit CraftBukkit Spigot

VOLUME ["/opt/mc"]
EXPOSE 25565
WORKDIR /opt/mc

RUN echo "eula=true" >> /opt/mc/eula.txt

CMD ["java","-Xmx1G","-Xms1G","-XX:+UseG1GC","-jar","/server.jar","nogui"]