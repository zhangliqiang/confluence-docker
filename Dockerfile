FROM atlassian/confluence:8.5.18

MAINTAINER https://github.com/zhangliqiang/confluence-docker

ADD jar/atlassian-agent.jar /opt

ADD jar/mysql-connector-j-8.4.0.jar /opt/atlassian/confluence/confluence/WEB-INF/lib

ADD windowsfonts /usr/share/fonts/windowsfonts

ENV CATALINA_OPTS="-Dconfluence.document.conversion.fontpath=/usr/share/fonts/windowsfonts/ -javaagent:/opt/atlassian-agent.jar ${CATALINA_OPTS}"
