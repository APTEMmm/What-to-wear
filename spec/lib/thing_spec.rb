# frozen_string_literal: true

require './lib/thing'
require 'rspec'

RSpec.describe Thing do
  let(:thing) { described_class.new('Шапка-ушанка', 'Головной убор', '(-20, -5)') }

  describe '#initialize' do
    it 'should return instance of Thing' do
      expect(thing).to be_a Thing
    end
  end

  describe '#suits_the_weather?' do
    context 'when suits the weather' do
      it { expect(thing.suits_the_weather?(-10)).to be true }
    end

    context 'when does not suit the weather' do
      it { expect(thing.suits_the_weather?(1_000_000)).to be false }
    end
  end

  describe '#to_s' do
    it 'should return a string' do
      expect(thing.to_s).to be_a String
    end
  end
end
