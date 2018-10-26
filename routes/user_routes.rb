get '/users/new' do
  redirect to '/' unless logged_in?
  erb :'users/new_user'
end

post '/users' do
  user = User.new
  user.email = params[:email]
  user.password = params[:password]
  user.first_name = params[:first_name]
  user.last_name = params[:last_name]
  user.phone = params[:phone]
  user.save

  redirect to("/users/#{current_user.id}")
end

get '/users/:id' do
  redirect to '/' unless logged_in?
  @user = current_user
  erb :'users/user'
end
