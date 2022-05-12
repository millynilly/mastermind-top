class Code

  @@code = ''

  attr_reader :code

  def generate_code
    digits = [*1..6]
    4.times { @@code << digits.sample() }
    @@code
  end

  


end