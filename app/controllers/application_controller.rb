require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "pinstuff"
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  helpers do 
    def is_logged_in?
      !!session[:user_id]
    end 

    def current_user
      @current_user ||=User.find_by_id(session[:user_id])
    end 
  end 

  
end
