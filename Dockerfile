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

RUN setup-nodesource-deb && apt-get install -y nodejs python2 g++ && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    git clone https://devcentral.nasqueron.org/source/auth-grove.git . && \
    chown -R app:app /var/wwwroot/default

USER app
RUN composer install --no-dev --no-scripts -o && \
    npm install && \
    npm run production

#
# Run the container
#

USER root
CMD ["/usr/local/sbin/init-container"]
