require_relative 'lib/apparel'
require_relative 'lib/apparel_collection'
require_relative 'lib/temperature_getter'
require 'dotenv/load'

OPENWEATHERMAP_API_KEY = ENV['OPENWEATHERMAP_API_KEY'].freeze

apparels = ApparelCollection.from_dir("#{__dir__}/data/*.txt")
user_temp = TemperatureGetter.call(api_key: OPENWEATHERMAP_API_KEY).round

puts "Сейчас у Вас #{user_temp}°С"

if user_temp.between?(apparels.whole_temp_range.min, apparels.whole_temp_range.max)
  puts "\nДля #{user_temp}°С предлагаем сегодня надеть:\n\n"

  apparels.choose_suitable(user_temp).each { |type, apparels| puts apparels.sample }
else
  puts "\nИзвините, но наши технические возможности позволяют пока что давать рекоммендации только для температурного диапазона:"
  puts "#{apparels.whole_temp_range[0]} .. +#{apparels.whole_temp_range[1]} °С"
end
