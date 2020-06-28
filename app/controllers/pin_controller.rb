require './config/environment'

class PinController < ApplicationController

    get '/pins' do  
        erb :'pins/pins'
    end 

    get '/pins/new' do 
        erb :"/pins/new"
    end 

    post '/pins' do 
        erb :'pins/pins'
    end 

    get '/pins/:id' do 
        erb :'pins/pins'
    end 
    
    get '/pins/edit_pin' do
        erb :'pins/edit_pin'
    end 

    put '/pins/:id' do 
        erb :'pins/edit_pin'
    end 

    post '/pins/new' do 
        erb :"pins/pins"
    end 



    post '/pins/edit_pin' do 
       erb :'pins/edit_pin'
    
    end

    delete '/pins/:id' do 
        @pins = Pin.find(params[:id])
        user = @pins.user
        if user == current_user
        @pins.destroy
        redirect to "/pins/pins"
        else
        redirect to "/index"
        end
    end

    



    private 
    def pin_params
        {artist: params[:artist],
        user_id: params[:user_id],
        series: params[:series],
        price: params[:price]}
    end 

end 