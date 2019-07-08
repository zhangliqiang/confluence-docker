FROM atlassian/confluence-server:6.13.6

MAINTAINER https://github.com/zhangliqiang/confluence-docker

RUN rm -f /opt/atlassian/confluence/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.4.1.jar

ADD jar/atlassian-extras-decoder-v2-3.4.1.jar /opt/atlassian/confluence/confluence/WEB-INF/lib

ADD jar/mysql-connector-java-5.1.40.jar /opt/atlassian/confluence/confluence/WEB-INF/lib