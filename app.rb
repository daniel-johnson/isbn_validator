require 'sinatra'
require 'json'
require 'sinatra/reloader' if development?

helpers do
  def check_digit_invalid?(input)
    arr = split_into_integers(input)
    check_digit = arr.pop

    sum = 0
    arr.each_with_index do |int, index|
      weight = index.odd? ? 3 : 1
      sum += int * weight
    end

    calculated_check_digit = 10 - sum.modulo(10)
    return check_digit != calculated_check_digit
  end

  def split_into_integers(input)
    return input.split("").map {|char| char.to_i}
  end
end

get '/' do
  'Hello world!'
end

get '/:input/validate' do |input|
  content_type(:json, charset: 'utf-8')

  http_code, message =
    if !input.match?(/[0-9]{13}/)
      [400, "ISBN-13: #{input} is invalid. Must be 13 digit integer"]
    elsif check_digit_invalid?(input)
      [400, "ISBN-13: #{input} is invalid. Check digit is not correct."]
    else
      [200, "ISBN-13: #{input} is valid."]
    end

  response_body = {'message': message}.to_json

  return [http_code, response_body]
end
