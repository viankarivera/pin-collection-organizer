class PinController < ApplicationController

    get '/pin' do 
        if logged_in?
            @pin = Pin.all 
            erb :'pin/pins'
        else 
            redirect to '/login'
        end 
    end 

    get '/pin/new' do 
        if logged_in?
            erb :'pin/new'
        else
            redirect to '/login'
        end 
    end 

    post '/pin' do 
        if logged_in?
            if params[:content] == ""
                redirect to "/pin/new"
            else 
                @pin = current_user.pins.build(content: params[:content])
                if @pin.save
                    redirect to "/pin/#{@pin.id}"
                else
                    redirect to "/pin/new"
                end 
            end 
        else 
            redirect to '/login'
        end 
    end 

    get '/pin/:id/edit_pin' do 
        if logged_in?
            @pin = Pin.find_by_id(params[:id])
            if @pin && @pin.user == current_user 
                erb :'pin/edit_pin'
            else 
                redirect to '/pin'
            end 
        else 
            redirect to '/login'
        end 
    end 

    patch '/pin/:id' do 
        if logged_in?
            if params[:content] == ""
                redirect to "/pin/#{params[:id]}/edit_pin"
            else
                @pin = Pin.find_by_id(params[:id])
                if @pin && @pin.user == current_user 
                    if @pin.update(content: params[:content])
                        redirect to "/pin/#{@pin.id}"
                    else
                        redirect to "/pin/#{@pin.id}/edit_pin"
                    end 
                else
                    redirect to '/pins'
                end 
            end 
        else
            redirect to '/login'
        end 
    end 
    
    delete '/pin/:id/delete' do 
        if logged_in?
            @pin = Pin.find_by_id(params[:id])
            if @pin && @pin.user == current_user
            @pin.delete
            end 
            redirect to '/pins'
        else
            redirect to '/login'
        end 
    end 


    #private 
    #def pin_params
     #   {artist: params[:artist], user_id: params[:user_id], series: params[:series], price: params[:price]}
    #end 

end 