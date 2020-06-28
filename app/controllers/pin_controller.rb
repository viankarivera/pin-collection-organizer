require './config/environment'

class PinController < ApplicationController

    get '/pins' do  
        erb :'pins/pins'
    end 

    post '/pins' do 
        erb :'pins/pins'
    end 
    
    get '/pins/edit_pin' do
        erb :'pins/edit_pin'
    end 

    post '/pins/edit_pin' do 
       erb :'pins/edit_pin'
    end 

    get '/pins/new' do 
        erb :"/pins/new"
    end 

    post '/pins/new' do 
        erb :"pins/pins"
    end 

    



    private 
    def pin_params
        {artist: params[:artist],
        user_id: params[:user_id],
        series: params[:series],
        price: params[:price]}
    end 

end 