require 'rspec'
require_relative '../lib/csv_engine'

RSpec.describe Engine do
  describe '.csv calculate' do
    let(:csv) { Engine.new('spec/dataset/city_dataset_test.csv') }
    array = [12, 50, 72, 89, 33, 13, -1, 0, 124]

    context 'Search min item' do
      it { expect(csv.get_min_item(array)).to eq(-1) }
    end

    context 'Search max item' do
      it { expect(csv.get_max_item(array)).to eq 124 }
    end

    context 'Calculate mean' do
      it { expect(csv.calc_mean(array)).to eq 65.33 }
    end

    context 'Calculate correct sample variance' do
      it { expect(csv.sample_variance(array)).to eq 3261.89 }
    end
  end
end
