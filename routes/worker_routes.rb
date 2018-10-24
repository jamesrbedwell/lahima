get '/workers/new' do
  redirect to '/' unless logged_in?
  erb :'workers/new_worker'
end

post '/workers' do
  worker = Worker.new
  worker.first_name = params[:first_name]
  worker.last_name = params[:last_name]
  worker.phone = params[:phone]
  worker.email = params[:email]
  worker.worker_type = params[:worker_type]
  worker.pay_rate = params[:pay_rate]
  worker.address1 = params[:address1]
  worker.city = params[:city]
  worker.state = params[:state]
  worker.country = params[:country]
  worker.post_code = params[:post_code]
  worker.user_id = current_user.id
  worker.save

  redirect to("/workers/#{worker.id}")
end

get '/workers/:id/edit' do
  redirect to '/' unless logged_in?
  @worker = Worker.find(params[:id])
  erb :'workers/edit_worker'
end

put '/workers/:id' do
  worker = Worker.find(params[:id])
  worker.first_name = params[:first_name]
  worker.last_name = params[:last_name]
  worker.phone = params[:phone]
  worker.email = params[:email]
  worker.worker_type = params[:worker_type]
  worker.pay_rate = params[:pay_rate]
  worker.address1 = params[:address1]
  worker.city = params[:city]
  worker.state = params[:state]
  worker.country = params[:country]
  worker.post_code = params[:post_code]
  worker.user_id = current_user.id
  worker.save

  redirect to("/workers/#{worker.id}")
end

delete '/workers/:id' do
  @worker = Worker.find(params[:id])
  @worker.destroy #would make sense to change a status to inactive as will need to keep details on record.
  redirect to('/dashboard')
end

get '/workers/:id' do
  redirect to '/' unless logged_in?
  @worker = Worker.find(params[:id])
  erb :'workers/worker'
end