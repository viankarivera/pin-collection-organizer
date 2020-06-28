require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
      erb :index
  end 

  helpers do 
    def logged_in?
      !!session[:user_id]
    end 

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end 
  end 
  
end
