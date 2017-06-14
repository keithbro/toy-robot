FROM ruby:2.4.1-alpine

COPY app /app

WORKDIR app

CMD [ "ruby", "bin/toy-robot" ]
