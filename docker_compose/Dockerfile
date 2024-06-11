# docker build -t image_name .


FROM openjdk:21

LABEL maintaner="hamitmizrak@gmail.com"

ENV APP_NAME="Spring And Docker"
ENV VERSION="V1.0.0"
ENV PORT="http://localhost:4444"

RUN echo "App Name: $APP_NAME"
RUN echo "Version: $VERSION"
RUN echo "Port:4444 $PORT"

VOLUME /tmp 

EXPOSE 4444 

# ARG JAR_FILE=/target/*.jar
ARG JAR_FILE=*.jar

ADD ${JAR_FILE} spring_react

ENTRYPOINT [ "java", "-jar","/spring_react" ]

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
 CMD wget --quiet --tries=1 --spider http://localhost:4444 exit 1

