get '/reviews/new' do
  erb :'reviews/new'
end

post '/reviews' do
  @review = Review.new(params[:review])

  if @review.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end
