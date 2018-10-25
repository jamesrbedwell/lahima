get '/register' do
  session[:user_id] = nil
  @worker_types = ['Labourer', 'Ticketed', 'Carpenter']
  @transport_types = ['Car', 'Public Transport']
  erb :'workers/register', layout: :'workers/register_layout'
end

get '/registered/:name' do
  @name = params[:name]
  erb :'workers/registered', layout: :'workers/register_layout'
end

post '/workers/register' do
  worker = Worker.new
  worker.first_name = params[:first_name]
  worker.last_name = params[:last_name]
  worker.phone = params[:phone]
  worker.email = params[:email]
  worker.address1 = params[:address1]
  worker.city = params[:city]
  worker.state = params[:state]
  worker.country = params[:country]
  worker.post_code = params[:post_code]
  worker.transport = params[:transport]
  worker.worker_type = params[:worker_type]
  if params[:available] == "true"
    worker.available = true
  else 
    worker.available = false;
  end
  worker.save

  redirect to("/registered/#{worker.first_name}")
end

get '/workers/new' do
  redirect to '/' unless logged_in?
  erb :'workers/new_worker'
end

get '/workers/list' do
  redirect to '/' unless logged_in?
  @available = Worker.available
  @unavailable = Worker.unavailable
  @avail_labourers = Worker.avail_labourers
  @avail_ticketed = Worker.avail_ticketed
  @avail_carpenters = Worker.avail_carpenters

  erb :'workers/list_workers'
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

post '/workers/claim' do
  worker = Worker.find(params[:worker_id])
  worker.user_id = current_user.id
  worker.save

  redirect to("/workers/#{worker.id}/edit")
end

get '/workers/:id/edit' do
  redirect to '/' unless logged_in?
  @worker = Worker.find(params[:id])
  @worker_types = ['Labourer', 'Ticketed', 'Carpenter']
  @transport_types = ['Car', 'Public Transport']
  erb :'workers/edit_worker'
end

put '/workers/:id' do
  worker = Worker.find(params[:id])
  worker.first_name = params[:first_name]
  worker.last_name = params[:last_name]
  worker.phone = params[:phone]
  worker.email = params[:email]
  worker.pay_rate = params[:pay_rate]
  worker.address1 = params[:address1]
  worker.city = params[:city]
  worker.state = params[:state]
  worker.country = params[:country]
  worker.post_code = params[:post_code]
  worker.worker_type = params[:worker_type]
  worker.transport = params[:transport]
  if params[:available] == "true"
    worker.available = true
  else 
    worker.available = false;
  end
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