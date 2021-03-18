require_relative 'lib/apparel'
require_relative 'lib/apparel_collection'

a = ApparelCollection.from_dir("#{__dir__}/data/*.txt")

=begin
puts "Сколько градусов за окном? (можно с минусом)"
user_input = STDIN.gets.to_i 
=end
