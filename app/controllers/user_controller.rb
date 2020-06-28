require './config/environment'

class UserController < ApplicationController
  configure do
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/signup' do 
    erb :'user/signup'

  end 

  post '/signup' do
    erb :'pins/new'
    #user = User.create(params[:user])
    #if user.save
     # session[:user_id] = user.id
      #redirect to '/show'
    #else
     # erb :'user/signup'
    #end 
  end 

  get '/login' do 
    erb :'user/login'
  end

  post '/login' do
    erb :'pins/pins'
    #user = User.find_by_username(params[:user][:username])
    #if user && user.authenticate(params[:user][:password])
     # session[:user_id] = user.id 
      #redirect to '/show'
    #else 
    #  redirect to '/login'
    #end 
  end 

    get '/user/show' do 
      erb :"/user/show"
    end 

  post '/user/show' do 
      erb :"/user/show"
  end 

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end 
  end 

end 

