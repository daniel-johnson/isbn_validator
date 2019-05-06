require 'sinatra'
require 'json'

require 'sinatra/reloader' if development?

helpers do
  def check_digit_invalid?(input)
    arr = split_into_integers(input)
    check_digit = 0
    arr.each_with_index do |int, index|
      # yarr
    end

    return false
  end

  def split_into_integers(input)
    return input.split("").map {|char| char.to_i}
  end
end

get '/' do
  'Hello world!'
end

get '/service/:input/validate' do |input|
  content_type(:json, charset: 'utf-8')

  http_code, message =
    if !input.match?(/[0-9]{13}/)
      [400, "ISBN-13: '#{input}' is invalid. Must be 13 digit integer"]
    elsif check_digit_invalid?(input)
      [400, "ISBN-13: #{input} is invalid. Check digit is not correct."]
    else
      [200, "ISBN-13: '#{input}' is valid."]
    end

  response_body = {'message': message}.to_json

  return [http_code, response_body]
end
