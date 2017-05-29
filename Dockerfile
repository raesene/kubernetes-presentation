FROM jekyll/jekyll

MAINTAINER Rory McCune <rorym@mccune.org.uk>


WORKDIR /srv/jekyll/

ADD . /srv/jekyll/

RUN chown -R 1000:1000 /srv/jekyll/

CMD ["jekyll", "serve", "-H", "0.0.0.0"]
