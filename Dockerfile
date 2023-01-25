FROM tomcat:8.0-alpine
LABEL maintainer="ankit.x.pandey@oracle.com"

ADD ecnj-project.war /usr/local/tomcat/webapps/

RUN mkdir /data
ADD jmx_prometheus_javaagent-0.17.0.jar /data/jmx_prometheus_javaagent-0.17.0.jar
ADD prometheus-jmx-config.yaml /data/prometheus-jmx-config.yaml

ENV JAVA_OPTS="-javaagent:/data/jmx_prometheus_javaagent-0.17.0.jar=8088:/data/prometheus-jmx-config.yaml"

EXPOSE 8088

EXPOSE 8080

CMD ["catalina.sh", "run"]
