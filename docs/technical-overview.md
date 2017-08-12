# Technical Overview

A rough technical overview/proposal for the Photobank application.


## Front end

A progressive web app written in Elm, a functional language that compiles to
Javascript.

Assets for the front end (i.e. JS, CSS, etc) are to be served over HTTPS from
a CDN. Application assets are to be named with a hashing function to avoid
unneeded cache busting.

The DOM is to be manipulated soley through Elm's `Html` library, reducing risk
of XSS.

Cookies are not to be used, reducing risk of CSRF. Localstorage can be used
for any session data.


## Back end

A Ruby based web application that serves a JSON REST API consumed by the front
end.

UUIDs are to be used for all table ids rather than incrementing integers.

In-application authorization will leverage a mature library rather than a
ad-hoc home-brewed solution. Louis suggests
[Pundit](https://github.com/elabs/pundit).

The API is to only only be accessible over HTTPS.


### Background processing

Ruby has been chosen as it is a language that many of the tech team feel
comfortable working work, but the weak of a concurrency model in Ruby means we
will need to build another system for doing background processing (namely of
uploaded images).

One option [Sucker Punch](https://github.com/brandonhilkert/sucker_punch)
for quick background processing in the same process as the web server and a
FaaS offering (GCP Cloud Functions, AWS Lambda, etc) for processing images
uploaded to the object store.


## Infrastructure

As we're using Ruby we cannot leverage FaaS offerings to serve the back end,
there will be some small operational overhead of running the application.

Heroku has been suggested. The ease of use and low operational overhead could
make it a good place to at least start.


## Persistence

Postgresql RDMS is to be used for data persistence. We're short on resource and
Louis doesn't want to spend his free time looking after databases so we will
leverage a managed service such as GCP SQL, AWS RDS, Heroku Postgres.


## Object storage

A popular cloud object store will be used, such as GCP Storage or AWS S3.

The ingest bucket will be have images uploaded directly to it by the users via
the front end application using pre-signed URLs.

Images will be processed (resized, compressed, stripped of metadata) and moved
to a egress bucket that is fronted by a CDN.

Images will stored in the egress bucket with UUID keys rather than the
original filename or any data directly related to the user, to reduce the risk
of the CDN being scraped.


## Image processing

When an image is uploaded we need to process it in several ways:

- Stripped of all metadata, to prevent personal user information from being
  shared (e.g. GPS coordinates)
- Resized to a range of suitable sizes, to reduce bandwidth used.
- Compressed suitably, to reduce bandwidth used.


## Code hosting

Currently the GitHub code repository is public. Louis likes the idea of this
being an open source project that belongs to the people, however we may want
to make it private for commercial reasons. Louis pays for GitHub already so we
can make it private without cost.


## Authentication

Whether we handle authentication ourselves or whether we leverage a third
party service such as Auth0 is yet to be decided. If we do it ourselves we
need to look into what our security obligations are, and we need to do the
usual best practices (hashing, salting, etc).

The API is to be authenticated via some method that is not session cookies.
