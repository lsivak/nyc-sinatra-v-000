class FiguresController < ApplicationController



  get '/figures' do
    @figures=Figure.all
    @landmarks=Landmark.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

      get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :'figures/show'
      end

    get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      erb :'figures/edit'
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
post '/figures/:id' do
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
