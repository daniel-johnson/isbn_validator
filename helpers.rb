module CheckDigitHelpers
  def check_digit_invalid?(input)
    arr = split_into_integers(input)
    check_digit = arr.pop
    calculated_check_digit = calculate_check_digit(arr)
    return check_digit != calculated_check_digit
  end

  private

  def split_into_integers(input)
    return input.split("").map {|char| char.to_i}
  end

  def calculate_check_digit(arr)
    sum = 0
    arr.each_with_index do |int, index|
      weight = index.odd? ? 3 : 1
      sum += int * weight
    end

    return 10 - sum.modulo(10)
  end
end
