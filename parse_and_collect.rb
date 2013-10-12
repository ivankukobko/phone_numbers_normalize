require './normalize_phone'
require 'csv'

source = ARGV[0] || "source.csv"
output = ARGV[1] || "#{Time.now.to_i}.csv"
numbers = []

CSV.foreach(source) do |row|
  phones = NormalizePhone.new(row.join(', ')).result
  numbers << phones
end

numbers.flatten!

CSV.open(output, 'w+') do |out|
  numbers.map{|num| out << [num]}
end

p "Phones collected total: #{numbers.count}"
