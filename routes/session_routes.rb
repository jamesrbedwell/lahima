post '/session' do
  #authenticate
  user = User.find_by(email: params[:email])
  #if user exists and the password is correct, take them to dashboard page.
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to("/dashboard")
  #redirect
  else  
    redirect to('/')
  end
end

delete '/session' do 
  # destory session
  session[:user_id] = nil
  # redirect
  redirect to('/')
end