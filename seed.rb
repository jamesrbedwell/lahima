require 'faker'
require_relative 'db_config'
require_relative 'models/user' #(singular)
require_relative 'models/client' #(singular)
require_relative 'models/client_contact' #(singular)
require_relative 'models/worker' #(singular)
require_relative 'models/job' #(singular)
require_relative 'models/project' #(singular)

10.times do
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
    :transport => 'Public Transport',
    :available => true,
    :user_id => 1
  })
end

5.times do
  Worker.create({
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :phone => Faker::PhoneNumber.cell_phone,
    :email => Faker::Internet.email,
    :worker_type => 'Ticketed',
    :pay_rate => 30.00,
    :address1 => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state, 
    :country => Faker::Address.country,
    :post_code => Faker::Address.postcode,
    :transport => 'Car',
    :available => true,
    :user_id => 1
  })
end

5.times do
  Worker.create({
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :phone => Faker::PhoneNumber.cell_phone,
    :email => Faker::Internet.email,
    :worker_type => 'Carpenter',
    :pay_rate => 40.00,
    :address1 => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state, 
    :country => Faker::Address.country,
    :post_code => Faker::Address.postcode,
    :transport => 'Car',
    :available => true,
    :user_id => 1
  })
end

10.times do
  Client.create({
    :name => Faker::Company.name,
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

20.times do
  Project.create({
    :name => Faker::Address.community,
    :address1 => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state, 
    :country => Faker::Address.country,
    :post_code => Faker::Address.postcode,
    :client_id => rand(1..10)
  })
end