FROM debian:12-slim

RUN set -x \
 && apt update \
 && apt install -fyq bash curl wget xz-utils jq apt-mirror tsocks torsocks \
 && sed -i 's/#SocksPort 9050/SocksPort 9050/g' /etc/tor/torrc

WORKDIR /app
COPY entrypoint.sh .
COPY postmirror.sh .
COPY update_ip.sh .

ENTRYPOINT ["/app/entrypoint.sh"]
