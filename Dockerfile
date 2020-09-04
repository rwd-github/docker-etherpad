FROM  node:alpine

#RUN apk add --no-cache --update git
RUN apk add --no-cache --update curl

#RUN git clone https://github.com/ether/etherpad-lite.git && \
#	cd etherpad-lite && \
#	bin/installDeps.sh --root

#ENV ETHERPAD_VERSION 1.6.2
ENV ETHERPAD_VERSION 1.8.4

ADD https://github.com/ether/etherpad-lite/archive/${ETHERPAD_VERSION}.zip ./etherpad.zip

RUN	unzip etherpad.zip && \
	rm etherpad.zip && \
	mv etherpad-lite-${ETHERPAD_VERSION} etherpad-lite && \
	cd etherpad-lite && \
	bin/installDeps.sh --root


COPY entrypoint.sh /entrypoint.sh

EXPOSE 9001

ENTRYPOINT ["/entrypoint.sh"]
