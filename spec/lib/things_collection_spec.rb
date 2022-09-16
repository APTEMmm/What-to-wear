# frozen_string_literal: true

require './lib/things_collection'
require 'rspec'

RSpec.describe ThingsCollection do
  let(:things_collection) { described_class.new([]) }

  describe '.from_dir' do
    it 'should return ThingCollection instance' do
      expect(things_collection).to be_a ThingsCollection
    end
  end

  describe '#suitable_clothing' do
    it 'should return array' do
      expect(things_collection.suitable_clothing(10)).to be_a Array
    end
  end
end
