class UserController < ApplicationController

  get '/signup' do 
    if !logged_in?
      erb :'user/signup'
    else
      erb :'/show'
    end 

  end 

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else 
      @user = User.new(:username => params[:username])
      @user.save
      session[:id] = @user.id 
      redirect to '/show'
    end 
  end 

  get '/login' do 
    if !logged_in?
      erb :'user/login'
    else 
      redirect to '/show'
    end 
  end

  post '/login' do 
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect to "/show"
    else 
      redirect to '/signup'
    end 
  end 

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  get '/show' do
    if logged_in?
    erb :'user/show'
    else 
      redirect to '/show'
    end 
  end 


end 

