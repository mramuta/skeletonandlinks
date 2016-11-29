get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    @registration_errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id/entries' do
  @user = User.find(params[:id])
  erb :'users/show'
end
