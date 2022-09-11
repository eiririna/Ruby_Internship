# frozen_string_literal: true

require 'sinatra'
require 'csv'
require 'sinatra/reloader'

get '/' do
  'Working with Products Table'
end

get '/products' do
  @products = ''
  CSV.open('products.csv') do |csv|
    csv.each { |id, name, count, price, creator| @products += "#{id}, #{name}, #{count}, #{price}, #{creator}<p>" }
  end
  @products
end

post '/products' do
  add_product = request.body.read.split(', ')
  CSV.open('products.csv', 'a') do |csv|
    csv << add_product
  end
  add_product.join(',')
end

patch '/products/:id' do
  patch_product = request.body.read.split(', ')
  id = params[:id]
  id.slice!(0)
  csv_read = CSV.open('products.csv')
  csv_patch = CSV.open('patch_products.csv', 'a')
  csv_read.each do |row|
    csv_patch << if row[0] != id
                   row
                 else
                   patch_product
                 end
  end
  csv_read.close
  csv_patch.close
  File.delete('products.csv')
  File.rename('patch_products.csv', 'products.csv')
  redirect '/products'
end

delete '/products/:id' do
  delete_product = request.body.read.split(', ')
  id = params[:id]
  id.slice!(0)
  csv_read = CSV.open('products.csv')
  csv_delete = CSV.open('delete_products.csv', 'a')
  csv_read.each do |row|
    csv_delete << row if row[0] != id
  end
  csv_read.close
  csv_delete.close
  File.delete('products.csv')
  File.rename('delete_products.csv', 'products.csv')
  redirect '/products'
end
