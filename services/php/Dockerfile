ARG PHP_VERSION
FROM ${PHP_VERSION}

ARG TZ
ARG PHP_EXTENSIONS
ARG CONTAINER_PACKAGE_URL


RUN if [ $CONTAINER_PACKAGE_URL ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi


COPY ./extensions /tmp/extensions
WORKDIR /tmp/extensions
RUN chmod +x install.sh \
    && sh install.sh \
    && rm -rf /tmp/extensions

ADD ./extensions/install-php-extensions  /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions

RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/$TZ" /etc/localtime \
    && echo "$TZ" > /etc/timezone


# Fix: https://github.com/docker-library/php/issues/240
RUN apk add gnu-libiconv libstdc++ --no-cache --repository http://${CONTAINER_PACKAGE_URL}/alpine/edge/community/ --allow-untrusted
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

# Install composer and change it's cache home  阿里云镜像
RUN curl -o /usr/bin/composer https://qiniu.likephp.cn/composer_2.2.0.phar \
    && chmod +x /usr/bin/composer

#composer1版本
#RUN #composer self-update --1

ENV COMPOSER_HOME=/tmp/composer

# 阿里云镜像
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

#NPM 、YARN 前端组件
RUN apk add nodejs npm yarn \
    && yarn config set registry https://registry.npm.taobao.org/


# php image's www-data user uid & gid are 82, change them to 1000 (primary user)
RUN apk --no-cache add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN apk add openvpn

VOLUME [ "/sys/fs/cgroup" ]


WORKDIR /www
