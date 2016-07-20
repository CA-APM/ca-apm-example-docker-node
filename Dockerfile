# Add the node.js probe to your application container
FROM mynodeapplication:latest

MAINTAINER first.last@company.com

# needed to compile the node.js probe
ENV LINK=g++

# the application name of the node.js probe
ENV CA_APM_PROBENAME=MyNodeApplication

# Collector agent information
ENV COLLECTOR_AGENT_HOST=collector
ENV COLLECTOR_AGENT_PORT=5005

# install from npm repository
RUN npm install -g ca-apm-probe

# or install from local file
#COPY ca-apm-probe-4.2.0.tgz ca-apm-probe-4.2.0.tgz
#RUN npm install -g ca-apm-probe-4.2.0.tgz

# start application using the probe wrapper, assuming /src/server/server is your node application
CMD ["ca-apm-run", "/src/server/server"]
