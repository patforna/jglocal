require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

get '/view' do
  erb :view
end


get '/create' do
  erb :create
end

post '*' do
  redirect to('/')
end