require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user}"
    else
      erb :index
    end 
  end 

  get '/user/login' do 
    erb :user/user_id
  end 

  helpers
    def logged_in?
      !!session[:id]
    end 

    def current_user
      User.find_by_id(session[:id])
    end 
  
end
