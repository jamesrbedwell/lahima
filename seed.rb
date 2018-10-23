require 'faker'
require_relative 'db_config'
require_relative 'models/user' #(singular)
require_relative 'models/client' #(singular)
require_relative 'models/client_contact' #(singular)
require_relative 'models/worker' #(singular)
require_relative 'models/job' #(singular)
require_relative 'models/project' #(singular)

30.times do
  Worker.create({
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :phone => Faker::PhoneNumber.cell_phone,
    :email => Faker::Internet.email,
    :worker_type => 'Labourer',
    :pay_rate => 23.00,
    :address1 => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state, 
    :country => Faker::Address.country,
    :post_code => Faker::Address.postcode,
    :user_id => 1
  })
end

10.times do
  Client.create({
    :entity_name => Faker::Company.name,
    :abn => Faker::Company.australian_business_number,
    :address1 => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state, 
    :country => Faker::Address.country,
    :post_code => Faker::Address.postcode,
    :labour_rate => 36.00,
    :ticketed_rate => 44.00,
    :trade_rate => 52.00,
    :user_id => 1
  })
end

20.times do
  ClientContact.create({
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :phone => Faker::PhoneNumber.cell_phone,
    :email => Faker::Internet.email,
    :client_id => rand(1..10)
  })
end

30.times do
  Project.create({
    :project_name => Faker::Address.community,
    :address1 => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state, 
    :country => Faker::Address.country,
    :post_code => Faker::Address.postcode,
    :client_contact_id => rand(1..20)
  })
end