FROM ghost

WORKDIR /var/lib/ghost/

COPY entrypoint.sh ./

# Start and enable SSH
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x ./entrypoint.sh

RUN apt install netcat -y
RUN apt install dnsutils -y

COPY sshd_config /etc/ssh/

EXPOSE 8000 2222

ENTRYPOINT [ "./entrypoint.sh" ]