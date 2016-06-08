FROM debian:jessie

RUN apt-get update && \
	apt-get install -y gearman-job-server && \
	apt-get install -y supervisor && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

VOLUME ["/etc/supervisor/conf.d"]

COPY docker-entrypoint.sh /
CMD [ "/docker-entrypoint.sh" ]

EXPOSE 4730