class UserController < ApplicationController

  get '/login' do 
    if logged_in?
      redirect "/users/#{current_user.slug}"
      erb :'/users/show_user'
    else
      erb :'users/login'
    end 
  end 

  get '/users/:slug' do 
    if @user = User.find_by_slug(params[:username])
      @pin = @user 
      erb :'users/show_user'
    else
      redirect '/'
    end 
  end 

end 