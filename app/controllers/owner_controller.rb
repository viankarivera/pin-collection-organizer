class OwnerController < ApplicationController

    get '/login' do
      if logged_in?
        redirect "/owners/account"
      end 
    end 
end 