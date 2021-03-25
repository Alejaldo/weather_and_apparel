require 'apparel_collection'
require 'apparel'

describe ApparelCollection do
  before do
    @apparels = ApparelCollection.from_dir("#{__dir__}/fixtures/*.txt")
  end

  describe '#whole_temp_range' do
    it 'should be an ordered array' do
      expect(@apparels.whole_temp_range).to eq [5, 15, 20, 35]
    end
  end

  describe '#choose_suitable(user_input)' do
    it 'for 19 C degree should be suitable 2 apparels' do
      user_input = 19
      expect(
        @apparels.choose_suitable(user_input)[:Обувь].map { |value| value.to_s }
        ).to match_array(['Кеды (Обувь) 15 .. 35 °С', 'Полуботинки из кожи c тонким текстильным подкладом (Обувь) 5 .. 20 °С'])
    end
  end
end
