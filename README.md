# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Ruby version
  `3.2.0`
# Rails version
  `6.1.7`
# Requirements
  `git`, `docker`, `docker-compose`
# How to setup
  * Clone: `https://github.com/sidneypikot2/covid_observation.git`
  * docker compose build
  * docker compose up
  * docker compose run web rake db:create
# Routes
  ## Uploading data
  * `Will accept a CSV File as parameter`
  * `POST localhost:3000/upload-covid-observation-data`
  ## Display top confirmed list
  * `Will accept observation_date and max_results`
  * `GET localhost:3000/top/confirmed?observation_date=2020-01-22&max_results=2`