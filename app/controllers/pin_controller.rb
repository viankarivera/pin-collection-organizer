class PinController < ApplicationController
    
    get '/pins' do
        erb :"pins/index"
    end 
    
    post '/pins' do 
        @pin = Pin.new(params)
        @pin.save
        redirect "/pins"
    end 
    
    get '/pins/new' do 
        if logged_in?
            erb :'/pins/new'
        else
            redirect '/welcome'
        end  
    end 
    
    get '/pins/:id' do
        if logged_in?
            @pins = Pin.find_by_id(params[:id])
            erb :'/pins/pins'
        else
            redirect '/welcome'
        end  
    end 
    
    get '/pins/:id/edit' do 
        if logged_in? 
            @pins = Pin.find_by_id(params[:id])
            erb :'/pins/edit'
        end 
    end 
    
    get '/pins' do 
        if logged_in?
            @pins = Pin.all.find_all do |pins|
                pin.owner_id == current_owner.id 
            end 
            erb :'/pins/pins'
        else 
            redirect '/welcome'
        end 
    end 

    post '/pins' do 
        if logged_in?
            @pins = Pin.new(pins_params)
            if @pins.save 
                redirect "/pins/#{@pins.id}"
            else 
                erb :'/pins/new'
            end 
        else 
            redirect '/login'
        end 
    end 

    patch '/pins/:id' do 
        @pins = Pin.find_by_id(params[:id])
        @pins.update(pins_params)
        if @pins.save 
            redirect "/pins"
        else
            erb :'/pins/edit'
        end 
    end 
    
    delete '/pins/:id' do 
        @pins = Pin.find_by_id(params[:id])
        @pins.destroy
        redirect '/pins'
    end 

    private 
    def pins_params
        {artist: params[:artist], owner_id: params[:owner_id], series: params[:series], price: params[:price]}
    end 

end 