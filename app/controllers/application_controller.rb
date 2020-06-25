require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    erb :welcome
   
  end 

  helpers
    def logged_in?
      !!session[:id]
    end 

    def current_user
      Owner.find_by_id(session[:id])
    end 
  
  get '/sign_up' do
    "Hello"
  end 

  post '/sign_up' do 
    owner = Owner.new(:username => params[:username], :password => params[:password])

    if owner.save 
      session[:owner_id] = @owner.id
      redirect to '/account'

    else
      redirect "/failure"
    end  
  end 
  
  get '/login' do 
    "Hello"
  end 

  post '/login' do
   "Hello"
  end 

end
