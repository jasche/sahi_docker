FROM openjdk:slim

 

# install xvfb and jni

RUN apt-get update && apt-get install -y libswt-gtk2-4-jni xvfb wget ant firefox net-tools telnet && rm -rf /var/lib/apt/lists/*

 

# clear cache to conserve space

RUN apt-get clean

 

# disable assistive technologies

#RUN sed -i 's/^assistive_technologies=/#&/' /etc/java-8-openjdk/accessibility.properties

 

 

COPY xvfb /etc/init.d/xvfb

RUN chmod +x /etc/init.d/xvfb

 

RUN echo "service xvfb start" >> /etc/bash.bashrc

ENV DISPLAY :99

 

COPY  silent_install.xml  silent_install.xml

 

COPY install_sahi_pro_v750_20171222.jar install_sahi_pro_v750_20171222.jar

 

RUN java -jar install_sahi_pro_v750_20171222.jar silent_install.xml

 

COPY license.data /sahi_pro/userdata/config/

 

RUN cp /sahi_pro/lib/ant-sahi.jar /usr/share/ant/lib/

 

COPY test.xml test.xml

 

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ENTRYPOINT ["docker-entrypoint.sh"]


