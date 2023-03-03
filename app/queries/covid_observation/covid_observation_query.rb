class CovidObservation::CovidObservationQuery
  module Scopes
    def filter_by_id(id)
      return self if id.blank?
      where(id: id)
    end

    def filter_by_s_no(s_no)
      return self if s_no.blank?
      where(s_no: s_no)
    end

    def filter_by_deaths(deaths)
      return self if deaths.blank?
      where(deaths: deaths)
    end

    def filter_by_country(country)
      return self if country.blank?
      where(country: country)
    end

    def filter_by_confirmed(confirmed)
      return self if confirmed.blank?
      where(confirmed: confirmed)
    end

    def filter_by_recovered(recovered)
      return self if recovered.blank?
      where(recovered: recovered)
    end

    def filter_by_last_update(last_update)
      return self if last_update.blank?
      where(last_update: last_update)
    end

    def filter_by_observation_date(observation_date)
      return self if observation_date.blank?
      observation_date = DateConverterService.call(observation_date, '%Y-%m-%d')
      where(observation_date: observation_date.beginning_of_day..observation_date.end_of_day)
    end

    def sort_result(sort_key, sort_direction)
      sort_key = "confirmed" if !sort_key
      sort_direction = "desc" if !sort_direction
      self.order("#{sort_key} #{sort_direction}")
    end

    def limit_result(take_only)
      return self if take_only.blank?
      self.limit(take_only)
    end
  end

  def self.call(params)
    CovidObservation
      .extending(Scopes)
      .filter_by_id(params[:id])
      .filter_by_s_no(params[:s_no])
      .filter_by_deaths(params[:deaths])
      .filter_by_country(params[:country])
      .filter_by_confirmed(params[:confirmed])
      .filter_by_recovered(params[:recovered])
      .filter_by_last_update(params[:last_update])
      .filter_by_observation_date(params[:observation_date])
      .sort_result(params[:sort_key],params[:sort_direction])
      .limit_result(params[:max_results])
  end
end