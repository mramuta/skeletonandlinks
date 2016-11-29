get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  valid_login = User.authenticate(params[:username], params[:password])
  if valid_login
    user = User.find_by(username:params[:username])
    session[:user] = user.id
    redirect '/'
  else
    @invalid_login = 'Invalid login credentials'
    @entries = Entry.all
    erb :'entries/index'
  end
end

delete '/sessions' do
  session[:user] = nil
  redirect '/'
end
