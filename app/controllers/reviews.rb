get '/restaurants/:id/reviews' do
  @restaurant = Restaurant.find(params[:id])
  @reviews = @restaurant.reviews
end

get '/restaurants/:id/reviews/new' do
  @restaurant = Restaurant.find(params[:id])
  erb :'reviews/new'
end

post '/restaurants/:id/reviews/new' do
  @restaurant = Restaurant.find(params[:id])
  @review = Review.new(params[:review])
  current_user.reviews << @review
  @restaurant.reviews << @review
    if @review.save
      redirect "/restaurants/#{@restaurant.id}"
    else
      erb :'/reviews/new'
    end
end


# post '/reviews' do

#   # @review = Review.new(params[:review])
#   @restaurant = Restaurant.find(params[:id])
#   @restaurant.reviews << @review
#   @user = User.find(params[:id])
#   @user.reviews << @review

#   if @review.save
#     redirect '/'
#   else
#     @errors = @user.errors.full_messages
#     erb :'users/new'
#   end
# end


