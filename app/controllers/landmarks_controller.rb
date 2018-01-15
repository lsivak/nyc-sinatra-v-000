class LandmarksController < ApplicationController

  get '/' do
    redirect to '/landmarks'
  end

  get '/landmarks' do
    @landmarks=Landmark.all
    # @figures=Figure.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks' do
  @landmark=Landmark.find_or_create_by(:name => params["name"], :year_completed => params["year_completed"] )
  @landmark.figure=Figure.find_or_create_by(:name => params["name"])

  @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

    get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/edit'
    end

    patch '/landmarks/:id' do
      @landmark = Landmark.create(name: params["landmark"])
      @landmark.name = Landmark.create(name: params["landmark"]["name"])
      @landmark..year_completed = Landmark.create(name: params["landmark"]["year_completed"])
      @landmark.save
      redirect to "/landmarks/#{@landmark.id}"
    end

  end
