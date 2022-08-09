class DailyWeatherScheduleJob < ApplicationJob
  queue_as :default

  def perform

    # pulling this out separate for now. Should be in the loop above.
    Property.all.each do |property|
      property.switch!
      HourlyForecast.pull(property)
      DailyForecast.pull(property)
    end
  end
end
