require './config/environment'

class PinController < ApplicationController

    get '/pins' do
        @pins = Pin.all
        erb :'pins/index'
    end 

    get '/pins/new' do 
        if !is_logged_in?
            redirect to '/login'
        end
        erb :"/pins/new"
         
    end 

    post '/pins' do
        @pin = Pin.create(params)
        @pin.user_id=current_user.id
        @pin.save


        #responsible for creating pins
        redirect to "/users/#{current_user.id}"
    end 

    get '/pins/:id' do 
        @pin = Pin.find(params[:id])
        erb :'pins/show'
    end 
    
    get '/pins/:id/edit' do 
        @pin = Pin.find_by_id(params[:id])
        if current_user != @pin.user 
            redirect to '/pins'
        end #this needs to be restful and it is not yet
        erb :'pins/edit' #is this right?
    end 

    put '/pins/:id' do #needs to redirect and udate or change database
        @pin = Pin.find_by_id(params[:id])

        if current_user != @pin.user 
            redirect to '/pins'
        end 
            @pin.update(params[:pin])
        if @pin.save 
            redirect to '/pins'
        else 
            erb :'pins/edit'
        end 
    end 


    delete '/pins/:id' do 
        @pin = Pin.find_by_id(params[:id])
        user = @pin.user #i want this to be if current user is logged in and wants to delete THEIR pin
        if user == current_user
            @pin.destroy
            redirect to "/pins"
        else
            redirect to "/pins" 
        end
    end

    

end 