class FiguresController < ApplicationController

  get '/figures' do
    erb :index
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    params[:figure][:title_ids].each do |title_id|
      Figure_title.create(title_id: title_id, figure_id: @figure.id)
    end
  end

end
