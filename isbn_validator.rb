require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'Hello world!'
end

get '/service/:input/validate' do |input|
  content_type(:json, charset: 'utf-8')

  response_body = "Input is '#{input}'."
  return [200, {}, response_body]
end
