#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/visit' do
	erb :visit
end

get '/about' do
	erb "Какие мы охуенные"
end

get '/contacts' do
	erb :form
end

post '/visit' do
	users = File.open './public/users.txt', 'a'
	users.write "Имя: #{params[:name]}, телефон: #{params[:phone]}, порода: #{params[:dog_model]}\n"
	users.close
	erb "Thanks, we will wait you"
end

post '/contacts' do
	users = File.open './public/messages.txt', 'a'
	users.write "Имя: #{params[:email]}\nСообщение: #{params[:phone]}, порода: #{params[:dog_model]}\n"
	users.write "=======================================\n"
	users.close
	erb "Thanks!"
end