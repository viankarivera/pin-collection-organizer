class UserController < ApplicationController

  get '/signup' do 
    if !logged_in?
      flash[:signup_error] = "First Time? Please Sign Up."
      erb :'user/signup'
    else
      erb :'/index'
    end 

  end 

  get '/login' do 
    if logged_in?
      redirect "/user"
      erb :'/user/user'
    else 
      erb :'user/login'
    end 
  end 

  post '/signup' do 
    @user = User.new(:username => params[:username])
    @user.save
    session[:id] = @user.id 
    redirect '/pin'
  end 

  post '/login' do 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id 
      redirect "/pin"
    else
      redirect '/user/login'
    end 
  end 

  get '/logout' do 
    if logged_in?
      session.clear
      redirect '/login'
    else 
      redirect '/'
    end 
  end 
end 

