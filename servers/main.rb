require 'rubygems'
require 'sinatra'

$:.push(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))
require 'sprocketizing_server'

use SprocketizingServer

set :public, File.join(File.dirname(__FILE__), '../public')

# SASS stylesheet
get '/stylesheets/style.css' do
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass :style
end

get '/' do
  haml :index
end

get '/speed/unpackaged' do
  haml :unpackaged, :layout => :speed
end

get '/speed/packaged' do
  haml :packaged, :layout => :speed
end
