FROM python:3.6.1

#RUN mkdir /code
COPY . /home/site/wwwroot

#COPY requirements.txt /home/site/wwwroot/
# Web Site Home
ENV HOME_SITE "/home/site/wwwroot"

WORKDIR ${HOME_SITE}

RUN pip install -r requirements.txt
#COPY . /home/site/wwwroot/

# ssh
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
	&& apt-get install -y --no-install-recommends openssh-server \
	&& echo "$SSH_PASSWD" | chpasswd 

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

#install opencv

	
RUN chmod u+x /usr/local/bin/init.sh
EXPOSE 5000 2222
ENTRYPOINT ["init.sh"]
