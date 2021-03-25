require 'apparel_collection'
require 'apparel'

describe ApparelCollection do
  before do
    @apparels = ApparelCollection.from_dir("#{__dir__}/data/*.txt")
  end

  describe '#whole_temp_range' do
  end

  describe '#choose_suitable' do
  end
end
