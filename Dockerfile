#
# Nasqueron - Auth Grove image
#

FROM nasqueron/nginx-php7-fpm:novolume
MAINTAINER Nasqueron Organisation <docker@nasqueron.org>

#
# Prepare the container
#

COPY files /

WORKDIR /var/wwwroot/default

RUN setup-nodesource-deb && apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    git clone https://devcentral.nasqueron.org/source/auth-grove.git . && \
    composer install --no-dev -o && \
    npm install -g gulp && \
    npm install && \
    chown -R app:app /var/wwwroot/default

#
# Run the container
#

CMD ["/usr/local/sbin/init-container"]
