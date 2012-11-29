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

get '/createupdate' do
  erb :createupdate
end

get '/preview' do
  erb :preview
end

get '/error' do
  erb :error
end

get '/test' do
  erb :test, {:layout => false}
end

post '*' do
  redirect to('/project')
end

get '/sass' do
  scss :sample, :style => :expanded
end

get '/local/*' do
  file = File.join(settings.public_folder, params[:splat].join('/'))
  halt(404) if !File.exists?(file)
  send_file file
end
