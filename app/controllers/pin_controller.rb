require './config/environment'

class PinController < ApplicationController

    get '/pins' do
        #binding.pry
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
        redirect to "/user/#{current_user.id}"
    end 

    get '/pins/:id' do 
        @pin = Pin.find(params[:id])
        erb :'pins/show'
    end 
    
    get '/pins/:id/edit' do 
        #binding.pry
        @pin = Pin.find_by_id(params[:id])
        #binding.pry
        if current_user != @pin.user 
            redirect to '/pins'
        end
        erb :'pins/edit'
    end 

    put '/pins/:id' do
        @pin = Pin.find(params[:id])

        if current_user != @pin.user 
            redirect to '/pins'
        end 
            @pin.update(params[:pin])
        if @pin.save 
            redirect to '/pins'
        else 
            erb :'pins/show'
        end 
    end 


    delete '/pins/:id' do 
        #binding.pry
       @pin = Pin.find(params[:id])
       if current_user != @pin.user 
        redirect to '/pins'
       else
        @pin.destroy
        redirect to '/pins'
       end 
    
    end 

    

end 