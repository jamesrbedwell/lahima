get '/dashboard' do
  redirect to '/' unless logged_in?
  @user = User.find(current_user.id)
  erb :dashboard
end