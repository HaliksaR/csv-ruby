require_relative 'csv_engine'

class App
  def self.init_file
    puts 'Enter file name (.csv):'
    filepath = gets.chomp
    Engine.new(filepath)
  end

  def self.ch_cols(data, cols)
    count = 1
    (0..cols).each do |i|
      puts "#{count}"'. '"#{data[0][i]}"
      count += 1
    end
    gets.chomp.to_i
  end

  def self.prepare_data(csv, cols)
    buffer = []
    (1..csv.rows).each do |i|
      buffer[i - 1] = csv.data[i][cols].to_f
    end
    buffer
  end

  def self.start
    csv = init_file
    puts 'Enter cols for calculate'
    col = ch_cols(csv.data, csv.cols) - 1
    array = prepare_data(csv, col)
    puts 'min = '"#{csv.get_min_item(array)}"
    puts 'max = '"#{csv.get_max_item(array)}"
    puts 'mean = '"#{csv.calc_mean(array)}"
    puts 'sample_variance '"#{csv.sample_variance(array)}"
  end
end
