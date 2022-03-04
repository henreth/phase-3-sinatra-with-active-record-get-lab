class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # look up the bakery in the database using its ID
    bakery = Bakery.find(params[:id])

    bakery.to_json(include: :baked_goods)

  end

  get '/baked_goods/by_price' do
    # get all the bakeries from the database
    # baked_goods = BakedGood.by_price
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do 
    # baked_goods = BakedGood.by_price.first
    baked_goods = BakedGood.all.order(price: :desc).first
    baked_goods.to_json
  end


end
