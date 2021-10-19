ARG APP_DIR=/opt/app

FROM adoptopenjdk/openjdk11:alpine-jre as builder
ARG APP_DIR
WORKDIR ${APP_DIR}
COPY config ./config
ARG JAR_FILE=target/spring-config-server.jar
COPY ${JAR_FILE} application.jar
RUN java -Djarmode=layertools -jar application.jar extract

FROM adoptopenjdk/openjdk11:alpine-jre
LABEL maintainer="aaronjohn.asuncion@gmail.com"
ARG APP_DIR
WORKDIR ${APP_DIR}
RUN mkdir ${APP_DIR}/logs
RUN addgroup -S AaronGroup && adduser -S Aaron -G AaronGroup
RUN chown -R Aaron:AaronGroup ${APP_DIR}
USER Aaron
COPY --from=builder ${APP_DIR}/config/ ./config
COPY --from=builder ${APP_DIR}/dependencies/ ./
COPY --from=builder ${APP_DIR}/snapshot-dependencies/ ./
COPY --from=builder ${APP_DIR}/spring-boot-loader/ ./
COPY --from=builder ${APP_DIR}/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]