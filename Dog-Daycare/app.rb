require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/Dog'
require_relative './models/Owner'

set :database, {adapter: 'postgresql', database: 'dogowners'}

get '/' do
    "Welcome to S.H.I.E.L.D. Daycare for Dogs"
end   

get '/dogs'do
    @dog = Dog.all
    erb :dog
end

get '/owners' do
    @owner = Owner.all
    erb :owner
end    

get '/owners/:id' do
  @id = params[:id]
  @owner = Owner.find(params[:id])
  @ownsdogs = Dog.where(owner_id: @id)
  erb :owneranddogs
end