require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'

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
  redirect to('/view')
end

get '/sass' do
  scss :sample, :style => :expanded
end
