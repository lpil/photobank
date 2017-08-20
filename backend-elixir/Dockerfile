FROM bitwalker/alpine-elixir:1.5.0
MAINTAINER Louis Pilfold <louis@lpil.uk>

ENV MIX_ENV=prod

# Add deps and config
ADD ./mix* /photobank/
ADD ./config /photobank/config

ADD ./apps/bank/mix.exs /photobank/apps/bank/
ADD ./apps/bank/config /photobank/apps/bank/

ADD ./apps/bank_web/mix.exs /photobank/apps/bank_web/
ADD ./apps/bank_web/config /photobank/apps/bank_web/

WORKDIR /photobank/

RUN mix deps.get --only prod && \
  mix deps.compile

# Add project
ADD ./apps /photobank/apps

# Add frontend assets
RUN rm /photobank/apps/bank_web/priv/static
RUN mkdir -p /photobank/apps/bank_web/priv
ADD ./tmp/static /photobank/apps/bank_web/priv/static

RUN mix compile

# Avoid running app as root
RUN adduser -S www-photobank
USER www-photobank

ADD ./bin /photobank/bin
CMD ["sh", "./bin/prod-start.sh"]
