require 'csv'

class Engine
  attr_accessor :data, :cols, :rows

  def initialize(path)
    @file = path
    @data = CSV.parse(File.read(path))
    @cols = @data[0].length - 1
    @rows = @data.length - 1
    @mean = 0.0
  end

  def get_min_item(array)
    array.min
  end

  def get_max_item(array)
    array.max
  end

  def calc_mean(array)
    (array.inject { |sum, index| sum + index }.to_f / @rows).round(2)
  end

  def sample_variance(array)
    @mean = calc_mean(array)
    sum = array.map { |item| (item - @mean)**2 }
    sum = sum.reduce(:+)
    (sum / @rows - 1).round(2)
  end
end
