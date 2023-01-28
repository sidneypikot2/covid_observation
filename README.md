# README

# Ruby version
  `3.2.0`
# Rails version
  `6.1.7`
# Requirements
  `git`, `docker`, `docker-compose`
# How to setup

  `Clone`

  * $ git clone https://github.com/sidneypikot2/covid_observation.git

  `Build docker containers`

  * $ docker compose build

  `Start docker containers`

  * $ docker compose up -d

  `Setup database`

  * $ docker compose exec web rake db:setup db:migrate

  `Populate data - this will run in background and might take a while to finish.`

  * $ docker compose exec web bundle exec rails runner db/migrate_data/populate_covid_observation.rb

  `Check logs`

  * $ docker compose exec web tail -f log/development.log

  `Stop docker container`

  * $ docker compose down

# Routes
  ## Uploading data
  * `Will accept a CSV File as parameter`
  * `POST localhost:3000/upload-covid-observation-data`
  ## Display top confirmed list
  * `Will accept observation_date and max_results`
  * `GET localhost:3000/top/confirmed?observation_date=2020-01-22&max_results=2`
  * Sample Curl:
  ```
  curl --location --request GET 'localhost:3000/top/confirmed?observation_date=2020-01-22&max_results=2' \
  --header 'Cookie: __profilin=p%3Dt'
  ```