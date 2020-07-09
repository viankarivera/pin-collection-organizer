require './config/environment'

class PinController < ApplicationController

    get '/pins' do 
        erb :'pins/index'
    end 

    get '/pins/new' do 
        if is_logged_in?
            erb :"/pins/new"
        else 
            redirect to '/login'
        end 
         
    end 

    post '/pins' do
        @pin = Pin.create(params)
        @pin.user_id=current_user.id
        @pin.save


        #responsible for creating pins
        redirect to "/users/#{current_user.id}"
    end 

    get '/pins/:id' do 
        erb :'pins/pins'
    end 
    
    get '/pins/edit_pin' do #this needs to be restful and it is not yet
        erb :'pins/edit_pin'
    end 

    put '/pins/:id' do  #needs to redirect and udate or change database
        erb :'pins/edit_pin'
    end 


    delete '/pins/:id' do 
        @pin = Pin.find(params[:id])
        user = @pin.user
        if user == current_user
        @pin.destroy
        redirect to "/pins"
        else
        redirect to "/pins"
        end
    end

    

end 