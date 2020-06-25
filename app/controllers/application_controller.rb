require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
   
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
  

  post '/login' do
    @owner = Owner.find_by(:username => params[:username])
    if @owner != nil && @owner.password == params[:password]
      session[:owner_id] = @owner.id
      redirect to '/account'
    end
    erb :error
  end

end
