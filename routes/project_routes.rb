get '/projects/new' do
  redirect to '/' unless logged_in?
  erb :'projects/new_project'
end

get '/projects/list' do
  redirect to '/' unless logged_in?

  @projects = Project.all
  erb :'projects/list_projects'
end

post '/projects' do
  project = Project.new
  project.name = params[:name]
  project.address1 = params[:address1]
  project.city = params[:city]
  project.state = params[:state]
  project.country = params[:country]
  project.post_code = params[:post_code]
  project.client_id = params[:client_id]
  project.save

  redirect to("/projects/#{project.id}/edit")
end

get '/projects/:id/edit' do
  redirect to '/' unless logged_in?
  @project = Project.find(params[:id])
  erb :'projects/edit_project'
end

put '/projects/:id' do
  project = Project.find(params[:id])
  project.name = params[:name]
  project.address1 = params[:address1]
  project.city = params[:city]
  project.state = params[:state]
  project.country = params[:country]
  project.post_code = params[:post_code]
  project.client_contact_id = params[:client_contact_id]
  project.save

  redirect to("/projects/#{project.id}")
end

delete '/projects/:id' do
  project = Project.find(params[:id])
  project.destroy #would make sense to change a status to inactive as will need to keep details on record.
  redirect to('/dashboard')
end

get '/projects/:id' do
  redirect to '/' unless logged_in?
  @project = Project.find(params[:id])
  erb :'projects/project'
end
