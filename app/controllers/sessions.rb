get '/login' do
  erb :'sessions/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])

  if user && user.authenticate(params[:user][:password])
    session[:id] = user.id
    redirect '/'
  else
    p "potato"
    redirect '/login'
  end

end

get '/logout' do
  session.clear
  redirect '/'
end
