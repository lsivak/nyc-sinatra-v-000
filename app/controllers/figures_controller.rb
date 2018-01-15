class FiguresController < ApplicationController



  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

    post '/figures' do
      @figure = Figure.create(name: params["figure"])
        @figure.titles Title.find_or_create_by(name: params["title"]["name"])
        @figure.landmarks = Landmark.find_or_create_by(name: params["landmark"]["name"])
      @figure.save
      redirect to "/figures/#{@figure.id}"
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'figures/show'
    end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

patch '/figures/:id' do
  @figure = Figure.find(params[:id])
  @Figure.update(params["figure"])
  if !params["title"]["name"].empty?
    @figure.titles << Title.create(name: params["title"]["name"])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Figure.create(name: params["landmark"]["name"])
    end
  end
  redirect to "figures/#{@figure.id}"
end
end
