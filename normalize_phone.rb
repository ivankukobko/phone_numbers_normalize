class NormalizePhone

  attr_reader :result

  def initialize string
    @input = string
    @result = normalize string
  end

  private

  def parse string
    numbers = string.split(',')
    p numbers
    numbers.map{|num| num.scan(/\d+/).join('')}.reject{|num| num == ''}.compact
  end

  def normalize string
    numbers = parse(string)
    results = []
    numbers.each do |number|
      if number.length == 7
        # xxx-xx-xx, treat as Kyiv local number
        result = "+38044" << number
      elsif number.length >= 9 && number.length <= 12
        result = "+380"[0..12-number.length] << number
      else
        p "Wrong phone number: #{number}"
      end
      results << result
    end
    results
  end
end
