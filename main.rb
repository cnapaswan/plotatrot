require 'sinatra/base' 
require 'sinatra'
#require 'sinatra/reloader'
require 'pry'
require_relative 'db_config'
require_relative 'models/trip'
require_relative 'models/trot'
require_relative 'models/comment'
#homepage starts
  get '/' do
    @trips = Trip.all #array of hashes
    erb :index
  end


  post '/trips' do
    trip = Trip.new
    trip.city = params[:city]
    trip.country = params[:country]
    trip.save

    redirect '/'
  end
#homepage ends

#trip summary page starts
  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    @goers = Trot.where(category: 'go').where(trip_id: @trip.id)
    @eats = Trot.where(category: 'eat').where(trip_id: @trip.id)
    @sleeps = Trot.where(category: 'sleep').where(trip_id: @trip.id)

    erb :summary
  end

#trip summary page ends

#go page starts
  get '/trips/:id/go' do
    @trip = Trip.find(params[:id])
    @trots = Trot.includes(:comments).where(category: "go").where(trip_id: @trip.id)
    erb :go
  end

  post '/go' do
    go = Trot.new
    go.trip_id = params[:trip_id]
    go.name = params[:name]
    go.category = params[:category]
    go.image_url = params[:image_url]
    go.description = params[:description]
    go.save
    redirect "/trips/#{go.trip_id}/go"
  end

  delete '/delete/go/:trip_id/:trot_id' do
    go = Trot.find(params[:trot_id])
    go.destroy
    redirect "/trips/#{params[:trip_id]}/go"
  end

  post '/comment/go' do
    comment = Comment.new
    comment.trot_id = params[:trot_id]
    comment.name = params[:name]
    comment.body = params[:body] 
    comment.save
    trots = Trot.includes(:comments).where(category: "go").find(params[:trot_id])

    redirect "/trips/#{trots.trip_id}/go"
  end
#go page ends

#eat page starts
  get '/trips/:id/eat' do
    @trip = Trip.find(params[:id])
    @trots = Trot.includes(:comments).where(category: "eat").where(trip_id: @trip.id)
    erb :eat
  end

  post '/eat' do
    eat = Trot.new
    eat.trip_id = params[:trip_id]
    eat.name = params[:name]
    eat.category = params[:category]
    eat.image_url = params[:image_url]
    eat.description = params[:description]
    eat.save

    redirect "/trips/#{eat.trip_id}/eat"

  end

  delete '/delete/eat/:trip_id/:trot_id' do
    eat = Trot.find(params[:trot_id])
    eat.destroy
    redirect "/trips/#{params[:trip_id]}/eat"
  end

  post '/comment/eat' do
    comment = Comment.new
    comment.trot_id = params[:trot_id]
    comment.name = params[:name]
    comment.body = params[:body] 
    comment.save

    trots = Trot.includes(:comments).where(category: "eat").find(params[:trot_id])
    redirect "/trips/#{trots.trip_id}/eat"
  end

#eat page ends

#sleep page starts
  get '/trips/:id/sleep' do
    @trip = Trip.find(params[:id])
    @trots = Trot.includes(:comments).where(category: "sleep").where(trip_id: @trip.id)
    erb :sleep
  end

  post '/sleep' do
    sleep = Trot.new
    sleep.trip_id = params[:trip_id]
    sleep.name = params[:name]
    sleep.category = params[:category]
    sleep.image_url = params[:image_url]
    sleep.description = params[:description]
    sleep.save

    redirect "/trips/#{sleep.trip_id}/sleep"

  end

  delete '/delete/sleep/:trip_id/:trot_id' do
    sleep = Trot.find(params[:trot_id])
    sleep.destroy
    redirect "/trips/#{params[:trip_id]}/sleep"
  end

  post '/comment/sleep' do
    comment = Comment.new
    comment.trot_id = params[:trot_id]
    comment.name = params[:name]
    comment.body = params[:body] 
    comment.save

    trots = Trot.includes(:comments).where(category: "sleep").find(params[:trot_id])
    redirect "/trips/#{trots.trip_id}/sleep"
  end

#sleep page ends






