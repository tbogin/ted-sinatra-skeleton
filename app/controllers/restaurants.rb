get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'restaurants/index'
end

get '/restaurants/new' do
  erb :'restaurants/new'
end

post '/restaurants' do
  @restaurant = Restaurant.new(params[:restaurant])
      current_user.restaurants << @restaurant
    if @restaurant.save
    else
      erb :'restaurants/new'
    end
  redirect '/restaurants'
  # current_user.restaurants.new(params[:restaurant])
  # # @restaurant = Restaurant.new(params[:restaurant])
  # # current_user.restaurants << @restaurant
  # if current_user.save
  #   redirect '/'
  # else
  #   @errors = @restaurant.errors.full_messages
  # end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :'restaurants/show'
end


get '/restaurants/:id/edit' do
  @restaurant = Restaurant.find(params[:id])
  erb :'restaurants/edit'
end

put '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.assign_attributes(params[:restaurant])
  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    erb :'restaurants/edit'
  end
end
