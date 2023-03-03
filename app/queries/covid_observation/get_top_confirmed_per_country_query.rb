class CovidObservation::GetTopConfirmedPerCountryQuery
  def self.call(params)
    observation_date = DateConverterService.call(params[:observation_date], '%Y-%m-%d')
    sql = <<-SQL
      Select *
      FROM (
        SELECT
          country,
          MAX(confirmed) as confirmed,
          SUM(deaths) as deaths,
          SUM(recovered) as recovered
        FROM covid_observations
        WHERE observation_date BETWEEN TIMESTAMP WITH TIME ZONE '#{observation_date.beginning_of_day.to_s}'
              AND '#{observation_date.end_of_day.to_s}'
        GROUP BY country
        ORDER BY country, confirmed desc
      ) as r
      ORDER BY confirmed desc
      LIMIT #{params[:max_results]}
    SQL

    ActiveRecord::Base.connection.execute(sql)
  end
end