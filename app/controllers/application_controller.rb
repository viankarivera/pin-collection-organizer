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

  post '/login' do 
    @user = User.find_by(:username => params[:username])
    if @user !=nil && @user.password == params[:password]
      session[:user_id] = @user.id 
      redirect to '/pins/pins'
    end 
    erb :index
  end 

  
end
