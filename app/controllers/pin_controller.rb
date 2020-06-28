require './config/environment'

class PinController < ApplicationController

    get '/pins' do 
        @pins = Pin.all 
        erb :'pins/pins'
    end 

    post '/pins' do 
        erb :'pins'
    end 

    get '/pins/new' do 
        erb :"/pins/new"
    end 

    post '/pins/new' do 
        erb :"/pins/show_pins"
    end 

    get '/pins/:id/edit_pin' do 
        if logged_in?
            @pins = Pin.find_by_id(params[:id])
            if @pins && @pins.user == current_user 
                erb :'pins/edit_pin'
            else 
                redirect to '/pins'
            end 
        else 
            redirect to '/login'
        end 
    end 

    patch '/pins/:id' do 
        if logged_in?
            if params[:content] == ""
                redirect to "/pins/#{params[:id]}/edit_pin"
            else
                @pins = Pin.find_by_id(params[:id])
                if @pins && @pins.user == current_user 
                    if @pins.update(content: params[:content])
                        redirect to "/pins/#{@pin.id}"
                    else
                        redirect to "/pins/#{@pin.id}/edit_pin"
                    end 
                else
                    redirect to '/pins'
                end 
            end 
        else
            redirect to '/login'
        end 
    end 
    
    delete '/pins/:id' do 
        #if logged_in?
        @pins = Pin.find(params[:id])
        user = @pins.user 
        if user == current_user 
            @pins.destroy
            redirect to "/pins"
        else
            redirect to "/pins"  
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