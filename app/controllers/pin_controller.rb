class PinController < ApplicationController

    get '/pin/new' do 
        erb :'pin/new'  
    end 
    
    delete '/pin/:id/delete' do 
        @pin = Pin.find_by_id(params[:id])
        @pin.destroy
        redirect '/pin'
    end 

    private 
    def pin_params
        {artist: params[:artist], user_id: params[:user_id], series: params[:series], price: params[:price]}
    end 

end 