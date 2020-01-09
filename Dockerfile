FROM martenseemann/quic-network-simulator-endpoint:latest

RUN apt-get update && apt-get install -y wget iperf iputils-ping

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod +x wait-for-it.sh

COPY run.sh .
RUN chmod +x run.sh

ENTRYPOINT [ "./run.sh" ]
