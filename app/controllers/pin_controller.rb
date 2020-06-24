class PinController < ApplicationController
    
    get '/pins' do
        @pins = Pin.all 
        erb :"pins/index"
    end 
    
    post '/pins' do 
        @pin = Pin.new(params)
        @pin.save
        redirect "/pins"
    end 
    
    get '/pins/new' do 
        erb :"/pins/new" 
    end 
    
    get '/pins/:id' do 
    end 
    
    get '/pins/:id/edit' do 
    end 
    
    patch '/pins/:id' do 
    end 
    
    delete '/pins/:id' do 
    end 

end 