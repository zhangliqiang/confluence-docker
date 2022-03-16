FROM atlassian/confluence-server:7.4.15

MAINTAINER https://github.com/zhangliqiang/confluence-docker

RUN rm -f /opt/atlassian/confluence/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.4.1.jar

ADD jar/atlassian-extras-decoder-v2-3.4.1.jar /opt/atlassian/confluence/confluence/WEB-INF/lib

ADD jar/mysql-connector-java-5.1.40.jar /opt/atlassian/confluence/confluence/WEB-INF/lib

ADD windowsfonts /usr/share/fonts/windowsfonts

ENV CATALINA_OPTS=-Dconfluence.document.conversion.fontpath=/usr/share/fonts/windowsfonts/
