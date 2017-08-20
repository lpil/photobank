#!/bin/sh

# Heroku is an arse and overrides this var
export HOME=/opt/app/
mix phx.server
