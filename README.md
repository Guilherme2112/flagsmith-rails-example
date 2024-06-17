# README

Change the following ENVs at .env file (and don't commit)
- `WEB_CONCURRENCY` : 0=single mode (works fine), 1..N=cluster mode (not picking up state changes)
- `FLAGSMITH_API_KEY`: should be your sdk server-side api key
- `FLAG_NAME`: should be your flag name, on the api-key environment

Now, boot the system with `bundle exec rails s`...strangely, the issue described in cluster mode does not happen if you use `bundle exec puma -t M:N -w:X`

# Rails default bla-bla-bla

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
