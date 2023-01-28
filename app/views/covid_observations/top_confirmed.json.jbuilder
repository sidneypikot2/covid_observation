json.observation_date     DateTime.parse(@observation_date).strftime('%Y-%m-%d')
json.countries   @covid_observations do |covid_observation|
  json.country            covid_observation['country']
  json.confirmed          covid_observation['confirmed']
  json.deaths             covid_observation['deaths']
  json.recovered          covid_observation['recovered']
end