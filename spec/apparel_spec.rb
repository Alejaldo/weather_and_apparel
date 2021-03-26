require 'apparel'

describe Apparel do
  before do
    @apparel = Apparel.new(title: 'Кеды', type: 'Обувь', temperature_range: "(+15, +35)")
    @apparel_from_file = Apparel.from_file("#{__dir__}/fixtures/01.txt")
  end

  it 'initialize class object' do
    expect(@apparel.title).to eq 'Кеды'
    expect(@apparel.type).to eq 'Обувь'
    expect(@apparel.temperature_range).to eq [15, 35]
  end

  describe '#self.from_file' do
    it 'correct reading parameters from file' do 
      expect(@apparel_from_file.title).to eq 'Кеды'
      expect(@apparel_from_file.type).to eq 'Обувь'
      expect(@apparel_from_file.temperature_range).to eq [15, 35]
    end
  end

  describe '#suitable' do
    it 'returns true if user_input is 20' do
      expect(@apparel.suitable?(20)).to eq true
    end

    it 'returns false if user_input is 10' do
      expect(@apparel.suitable?(10)).to eq false
    end
  end

  describe '#to_s' do
    it 'puts info' do
      expect(@apparel.to_s).to eq "Кеды (Обувь) 15 .. 35 °С"
    end
  end
end
