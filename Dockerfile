FROM amazoncorretto:26-alpine

RUN apk update && apk add git curl
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --final-name server.jar
RUN rm -r BuildData BuildTools.jar BuildTools.log.txt Bukkit CraftBukkit Spigot

VOLUME ["/mnt/minecraft"]
EXPOSE 25565
WORKDIR /mnt/minecraft

RUN echo "eula=true" >> /mnt/minecraft/eula.txt

ENTRYPOINT ["java"]
CMD ["-Xmx4G","-Xms4G","-XX:+UseG1GC","-jar","/server.jar","nogui"]