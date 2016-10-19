# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach('seed_csvs/unicorn_items.csv', :headers => false) do |csv_obj|
  Product.create(name: csv_obj[0], description: csv_obj[1], price: csv_obj[2], stock: csv_obj[3], merchant_id: csv_obj[4], retired: csv_obj[5])
end
