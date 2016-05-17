get '/users' do

  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  erb :'users/edit'
end

put '/users/:id' do
end

delete '/users/:id' do

end
