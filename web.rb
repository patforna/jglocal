require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'

get '/' do
  erb :index
end

get '/project' do
  erb :project
end


get '/create' do
  erb :create
end

post '*' do
  redirect to('/project')
end

get '/sass' do
  scss :sample, :style => :expanded
end
