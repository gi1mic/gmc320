ARG BUILD_FROM
FROM $BUILD_FROM
COPY rootfs/gmc320.c /usr/src/.
WORKDIR /usr/src
RUN apk update --no-cache \
	&& apk add gcc \
	&& apk add libc-dev \
	&& apk add mosquitto-clients \
	&& cc gmc320.c -o gmc320 \
	&& cp gmc320 ../bin/. \
	&& rm -rf /usr/src/*

# Copy data
WORKDIR /

COPY --chmod=765 rootfs /

RUN chmod +x /var/run/s6/legacy-services/gmc320/*

