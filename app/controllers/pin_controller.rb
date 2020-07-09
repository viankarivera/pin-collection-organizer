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
    
    get '/pins/:id/edit_pin' do #this needs to be restful and it is not yet
        @pin = Pin.find_by_id(params[:id])
        erb :'pins/edit_pin' #is this right?
    end 

    put '/pins/:id' do #needs to redirect and udate or change database
        @pin = Pin.find_by_id(params[:id])
        @pin.update #what else?
        if @pin.save 
            redirect to '/pins'
        else 
            erb :'pins/edit_pin'
        end 
    end 


    delete '/pins/:id' do 
        @pin = Pin.find_by_id(params[:id])
        user = @pin.user #i want this to be if current user is logged in and wants to delete THEIR pin
        if user == current_user
        @pin.destroy
        redirect to "/pins"
        else
        redirect to "/pins/edit_pin" #?
        end
    end

    

end 