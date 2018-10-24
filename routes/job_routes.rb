get '/jobs/new' do
  redirect to '/' unless logged_in?
  erb :'jobs/new_job'
end

post '/jobs' do
  job = Job.new
  job_client_id = params[:client_id]
  job.project_id = params[:project_id]
  job.client_contact_id = params[:client_id]
  job.worker_type = params[:worker_type]
  job.start_date = params[:start_date]
  job.start_time = params[:start_time]
  job.status = params[:status]
  job.user_id = current_user
  job.save

  redirect to("/jobs/#{job.id}")
end

get '/jobs/:id/edit' do
  redirect to '/' unless logged_in?
  @job = Job.find(params[:id])
  erb :'jobs/edit_job'
end

put '/jobs/:id' do
  job = Job.find(params[:id])
  job_client_id = params[:client_id]
  job.project_id = params[:project_id]
  job.client_contact_id = params[:client_id]
  job.worker_type = params[:worker_type]
  job.start_date = params[:start_date]
  job.start_time = params[:start_time]
  job.status = params[:status]
  job.user_id = current_user
  job.save

  redirect to("/jobs/#{job.id}")
end

delete '/jobs/:id' do
  job = Job.find(params[:id])
  job.destroy #would make sense to change a status to inactive as will need to keep details on record.
  redirect to('/dashboard')
end

get '/jobs/:id' do
  redirect to '/' unless logged_in?
  @job = Job.find(params[:id])
  erb :'jobs/job'
end
