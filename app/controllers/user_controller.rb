class UserController < ApplicationController

  get '/signup' do 
    if !logged_in?
      erb :'user/signup'
    else
      erb :'/index'
    end 

  end 

  get '/login' do 
    if logged_in?
      redirect "/user/#{@user.id}"
      erb :"user/user"
    else 
      erb :'user/login'
    end 
  end
  
  post '/signup' do 
    @user = User.new(:username => params[:username])
    @user.save
    session[:id] = @user.id 
    redirect "/user/#{@user.id}"
  end 

  get '/user/show' do 
    erb :show
  end 
end 

