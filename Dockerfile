FROM maven:latest AS build

WORKDIR /app

COPY hello-web/. .

RUN mvn clean package

FROM tomcat:latest

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
