get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'restaurants/index'
end

get '/restaurants/new' do
  if request.xhr?
    erb :'restaurants/_new_restaurant_form', layout: false
  else
  erb :'restaurants/new'
  end
end

post '/restaurants' do
  @restaurant = current_user.restaurants.new(params[:restaurant])
    if @restaurant.save
      if request.xhr?
        erb :'restaurants/_single_restaurant', layout: false, locals: {restaurant: @restaurant}
      else
        redirect '/restaurants'
      end
    else
      erb :'restaurants/new'
    end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :'restaurants/show'
end


get '/restaurants/:id/edit' do
  @restaurant = Restaurant.find_by(id: params[:id])
  if request.xhr?
    erb :'restaurants/_restaurants_edit', layout: false, locals: {restaurant: @restaurant}
  else
    erb :'restaurants/edit'
  end
end

put '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.assign_attributes(params[:restaurant])
  if @restaurant.save
    if request.xhr?
      erb :'restaurants/_restaurant_name'
    else
      redirect "/restaurants/#{@restaurant.id}"
    end
  else
    erb :'restaurants/edit'
  end
end

delete '/restaurants/:id' do
  restaurant = Restaurant.find_by(id: params[:id])
  restaurant.destroy
  redirect '/'
end
