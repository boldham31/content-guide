FROM circleci/ruby:2.5.1

RUN echo '#!/usr/bin/env bash \n\
\n\
cd /workdir \n\
sudo bundle install --path=vendor/bundle \n\
sudo JEKYLL_ENV=production bundle exec jekyll serve -H 0.0.0.0 --watch --drafts --destination ./_site/content-guide --baseurl /content-guide \n\
\n\
exec "$@"' > /tmp/start.sh

RUN chmod +x /tmp/start.sh

WORKDIR /workdir

ENTRYPOINT ["/tmp/start.sh"]
