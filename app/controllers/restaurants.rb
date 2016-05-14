get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'restaurants/index'
end

get '/restaurants/new' do
  erb :'restaurants/new'
end

post '/restaurants' do
  @restaurant = Restaurant.new(params[:restaurant])
  if @restaurant.save
    redirect '/'
  else
    @errors = @restaurant.errors.full_messages
  end
end
