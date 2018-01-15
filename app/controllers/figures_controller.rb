class FiguresController < ApplicationController


  get '/figures' do
    @figures=Figure.all
    @landmarks=Landmark.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

    post '/figures' do
      @figure = Figure.create(name: params["figure"])
        @figure.title = Title.find_or_create_by(name: params["title"]["name"])
        # if !params[:title][:name].empty?
        # @figure.titles << @figure.title
        #
         @figure.landmark = Landmark.find_or_create_by(name: params["landmark"]["name"])
        # @figure.landmarks << @figure.landmarks
      @figure.save
      redirect to "/figures/#{@figure.id}"
end

      get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])
        erb :'figures/edit'
      end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end


patch '/figures/:id' do
  @figure = Figure.find(params[:id])
  @Figure.update(params["figure"])
  @figure = Figure.create(name: params["figure"])
    @figure.title = Title.find_or_create_by(name: params["title"]["name"])
     @figure.landmark = Landmark.find_or_create_by(name: params["landmark"]["name"])
  redirect to "figures/#{@figure.id}"
end
end
