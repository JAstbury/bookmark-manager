<<<<<<< HEAD
ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

get '/links' do
  @links =Link.all
  erb :'links/index'
end

get '/links/new' do
  erb :'links/new'
end

post '/links' do
  Link.create(url: params[:url], title: params[:title])
  redirect '/links'
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
=======
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
>>>>>>> day-4
