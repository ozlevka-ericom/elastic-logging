FROM logstash:5.3.0

RUN apt-get update && apt-get install -y net-tools curl

WORKDIR /app

COPY logstash.conf /app
COPY log-template.json /app

CMD ["logstash", "-f", "logstash.conf"]