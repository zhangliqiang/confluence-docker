FROM atlassian/confluence:8.5.31

MAINTAINER https://github.com/zhangliqiang/confluence-docker

ADD jar/atlassian-agent.jar /opt

ADD jar/mysql-connector-j-8.4.0.jar /opt/atlassian/confluence/confluence/WEB-INF/lib

ADD windowsfonts /usr/share/fonts/windowsfonts

RUN sed -i 's/DEBUG/INFO/g' "${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/classes/log4j.properties" && \
    sed -i 's/jmx-app-logger=INFO/jmx-app-logger=ERROR/' "${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/classes/log4j.properties" && \
    echo log4j.logger.com.atlassian.confluence.synchrony.service.http=WARN >> "${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/classes/log4j.properties" && \
    echo log4j.logger.com.atlassian.confluence.ext.code.render=ERROR >> "${CONFLUENCE_INSTALL_DIR}/confluence/WEB-INF/classes/log4j.properties"

ENV CATALINA_OPTS="-Dconfluence.document.conversion.fontpath=/usr/share/fonts/windowsfonts/ -javaagent:/opt/atlassian-agent.jar ${CATALINA_OPTS}"
