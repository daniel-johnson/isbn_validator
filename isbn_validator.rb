require 'sinatra'
require 'json'

require 'sinatra/reloader' if development?

helpers do
  def check_digit_invalid?(isbn)
    return false
  end
end

get '/' do
  'Hello world!'
end

get '/service/:input/validate' do |input|
  content_type(:json, charset: 'utf-8')

  http_code, message =
    if !input.match?(/[0-9]{13}/)
      [400, "'#{input}' is not a valid ISBN number. Correct format is an integer with 13 digits"]
    elsif check_digit_invalid?(input)
      [400, "ISBN code invalid. Check digit is not correct."]
    else
      [200, "ISBN #{input} is valid."]
    end

  response_body = {'message': message}.to_json

  return [http_code, response_body]
end
