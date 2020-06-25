class UserController < ApplicationController

    get '/login' do 
      if logged_in?
        redirect "/owner/#"
end 