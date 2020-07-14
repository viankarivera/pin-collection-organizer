require './config/environment'

class PinController < ApplicationController

    get '/pins' do
        @pins = Pin.all
        erb :'pins/index'
    end 

    get '/pins/new' do 
        if !is_logged_in?
            redirect to '/login'
        else
            erb :"/pins/new"
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
        @pin = Pin.find(params[:id])
        erb :'pins/edit'
    end 
    
    get '/pins/:id/edit' do 
        @pin = Pin.find(params[:id])
        if current_user != @pin.user 
            redirect to '/pins'
        end
        erb :'pins/edit'
    end 

    put '/pins/:id/edit' do
        @pin = Pin.find(params[:id])

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


    delete '/pins/:id/delete' do 
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