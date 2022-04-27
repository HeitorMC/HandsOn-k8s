FROM ruby:latest

ADD . /Sinatra-Docker
WORKDIR /Sinatra-Docker

RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]