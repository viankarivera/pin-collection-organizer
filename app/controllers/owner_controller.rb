class OwnerController < ApplicationController

    post '/login' do
        @owner = Owner.find_by(:username => params[:username])
        if @owner != nil && @owner.password == params[:password]
          session[:user_id] = @owner.id
          redirect to '/account'
        end
        erb :error
      end
    
      get '/account' do
        @current_owner = Owner.find_by_id(session[:user_id])
        if @current_owner
          erb :account
        else
          erb :error
        end
      end
end 