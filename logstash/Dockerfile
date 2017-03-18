FROM logstash:5.2.2

RUN apt-get update && apt-get install -y net-tools curl

WORKDIR /app

COPY logstash.conf /app

CMD ["logstash", "-f", "logstash.conf"]