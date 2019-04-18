FROM maven:3.5.3-jdk-8

ENV WORK_PATH  /product/services/dream-tencenthub
RUN mkdir -p $WORK_PATH  && \
    mkdir -p /product/log
WORKDIR $WORK_PATH

# lightning cloud
COPY target/dream-tencenthub-1.0-SNAPSHOT.jar $WORK_PATH

ARG JVM_OPTS
ARG APPLICATION_JAR
ARG TZ
ARG SERVICE_NAME

CMD ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && java ${JVM_OPTS} -jar ${APPLICATION_JAR}
