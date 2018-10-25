get '/jobs/new' do
  redirect to '/' unless logged_in?
  erb :'jobs/new_job'
end

get '/jobs/client' do
  @client = Client.find(params[:client_id])
  erb :'jobs/job_details'
end

post '/jobs' do
  job = Job.new
  job.project_id = params[:project_id]
  job.worker_type = params[:worker_type]
  job.start_date = params[:start_date]
  job.start_time = params[:start_time]
  job.status = params[:status]
  job.save

  redirect to("/jobs/#{job.id}")
end

get '/jobs/:id/edit' do
  redirect to '/' unless logged_in?
  @job = Job.find(params[:id])
  erb :'jobs/edit_job'
end

put '/jobs/:id/update' do
  job = Job.find(params[:id])
  job.project_id = params[:project_id]
  job.worker_type = params[:worker_type]
  job.start_date = params[:start_date]
  job.start_time = params[:start_time]
  job.status = params[:status]
  
  job.save
  
  redirect to("/jobs/#{job.id}")
end

put '/jobs/:id/add_worker' do
  worker = Worker.find(params[:worker_id])
  worker.available = false
  worker.save
  job = Job.find(params[:id])
  job.worker_id = worker.id
  job.status = 'filled'
  job.save

  redirect to("/dashboard")
end

put '/jobs/:id/working' do
  job = Job.find(params[:id])
  job.status = 'working'
  job.save

  redirect to("/dashboard")
end

put '/jobs/:id/remove_worker' do
  job = Job.find(params[:id])
  worker = Worker.find(job.worker_id)

  worker.available = true
  worker.save

  job.worker_id = nil
  job.status = 'unfilled'
  job.save

  redirect to("/dashboard")
end

put '/jobs/:id/finished' do
  job = Job.find(params[:id])
  job.status = 'finished'
  job.save

  worker = Worker.find(job.worker_id)
  worker.available = true
  worker.save

  redirect to("/dashboard")
end

get '/jobs/:id/:client_id' do
  @job = Job.find(params[:id])
  @client = Client.find(params[:client_id])

  erb :'jobs/job_details'
end


put '/jobs/:id' do
  job = Job.find(params[:id])
  job.worker_type = params[:worker_type]
  job.start_date = params[:start_date]
  job.start_time = params[:start_time]
  job.worker_id = params[:worker_id]
  job.status = params[:status]

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

