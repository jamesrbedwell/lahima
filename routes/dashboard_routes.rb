get '/dashboard' do
  redirect to '/' unless logged_in?
  @user = User.find(current_user.id)
  @jobs = Job.all
  @unfilled = Job.unfilled.order(start_date: :asc)
  @filled = Job.filled.order(start_date: :asc)
  @available_workers = Worker.available
  @working_jobs = Job.working
  erb :dashboard
end