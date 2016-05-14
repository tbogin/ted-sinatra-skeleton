get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'restaurants/index'
end

get '/restaurants/new' do
  erb :'restaurants/new'
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :'restaurants/show'
end

post '/restaurants' do
  @restaurant = Restaurant.new(params[:restaurant])
  current_user.restaurants << @restaurant
  if @restaurant.save
    redirect '/'
  else
    @errors = @restaurant.errors.full_messages
  end
end

get '/restaurants/:id/edit' do
  erb :'restaurants/edit'
end

put '/restaurants' do
  @restaurant = Restaurant.find(params[:restaurant])
  @restaurant.assign_attributes(params[:restaurant])


  if @restaurant.save
    redirect '/'
  else
    erb :'restaurants/edit'
  end
end
