class PinController < ApplicationController

    get '/pin/new' do 
        erb :pin/new  
    end 

    
    get '/pin/:id' do
        if logged_in?
            @pin = Pin.find_by_id(params[:id])
            erb :'/pins/index'
        else
            redirect '/index'
        end  
    end 
    
    get '/pin/:id/edit' do 
        if logged_in? 
            @pin = Pin.find_by_id(params[:id])
            erb :'/pin/edit'
        end 
    end 
    
    get '/pin' do 
        if logged_in?
            @pin = Pin.all.find_all do |pin|
                pin.user_id == current_user.id 
            end 
            erb :'/pins/index'
        else 
            redirect '/index'
        end 
    end 

    post '/pin' do 
        if logged_in?
            @pin = Pin.new(pin_params)
            if @pin.save 
                redirect "/pin/#{@pin.id}"
            else 
                erb :'/pins/new'
            end 
        else 
            redirect '/login'
        end 
    end 

    patch '/pin/:id' do 
        @pin = Pin.find_by_id(params[:id])
        @pin.update(pin_params)
        if @pin.save 
            redirect "/pin"
        else
            erb :'/pin/edit'
        end 
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