FROM maven:latest AS build

WORKDIR /app

COPY . .

RUN mvn clean package

FROM tomcat:latest

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

RUN ["cataline.sh", "run"]
