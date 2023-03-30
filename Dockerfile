FROM atlassian/confluence-server:7.19.7

MAINTAINER https://github.com/zhangliqiang/confluence-docker

ADD jar/atlassian-agent.jar /opt

ADD jar/mysql-connector-java-5.1.49.jar /opt/atlassian/confluence/confluence/WEB-INF/lib

ADD windowsfonts /usr/share/fonts/windowsfonts

ENV CATALINA_OPTS="-Dconfluence.document.conversion.fontpath=/usr/share/fonts/windowsfonts/ -javaagent:/opt/atlassian-agent.jar ${CATALINA_OPTS}"
