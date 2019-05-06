require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'Hello world!'
end

get '/service/:input/validate' do |input|
  response_body = "Input is '#{input}'."
  return [200, {}, response_body]
end
