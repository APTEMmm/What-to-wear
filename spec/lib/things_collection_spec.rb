# frozen_string_literal: true

require './lib/things_collection'
require './lib/thing'
require 'rspec'

RSpec.describe ThingsCollection do
  let(:thing1) { Thing.new('Шапка-ушанка', 'Головной убор', '(-20, -5)') }
  let(:thing2) { Thing.new('Шлепанцы', 'Обувь', '(+20, +40)') }
  let(:things_collection) { described_class.new([thing1, thing2]) }

  describe '.from_dir' do
    it 'should return ThingCollection instance' do
      expect(things_collection).to be_a ThingsCollection
    end
  end

  describe '#suitable_clothing' do
    let(:thing_for_plus20) { ['Головной убор: Нечего порекомендовать', 'Обувь: Шлепанцы (+20, +40)'] }
    let(:thing_for_minus10) { ['Головной убор: Шапка-ушанка (-20, -5)', 'Обувь: Нечего порекомендовать'] }
    it 'should return ' do
      expect(things_collection.suitable_clothing(20)).to eq thing_for_plus20
      expect(things_collection.suitable_clothing(-10)).to eq thing_for_minus10
    end
  end
end
