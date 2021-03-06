#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/form' do
	erb :form
end

get '/secret' do
	erb :secret
end

get '/contacts' do
	erb :contacts
end

post '/form' do

	@username = params[:username]
	@phone = params[:phonenumber]
	@date = params[:datetime]
	@barber_id = params[:barber_id]

	hh = { 	:username => 'Введите имя', 
			:phonenumber => 'Введите телефон', 
			:datetime => 'Выберите дату' }

	# для каждой пары ключ-значение 
	hh.each do |key, value|

		if params[key] == ''
			@error = value

			return erb :form 
		end 
	end

	file = File.open './public/users.txt', 'a'
	file.write "Имя: #{params[:username]}, телефон: #{params[:phonenumber]}, модель собакена: #{params[:dog_type]}, грумер: #{@barber_id}\n"
	file.close

	erb "Ok, #{params[:username]}, где там ваша #{params[:dog_type]}, приводите #{@date}"
end

hh = {'admin' => '123456', 'user' => '123'}

post '/secret' do
	name = params[:login]
	password = params[:password]

	if hh[name] && password == hh[name] && params[:login] == 'admin'
		erb "Hello, you are logged in! You are Admin"

	elsif hh[name] && password == hh[name] && params[:login] != 'admin'
		erb "You are just user"
	else
		@error = 'Acces denied!'
		erb :secret
	end 
end

post '/contacts' do
	file = File.open './public/contacts.txt', 'a'
	file.write "Email: #{params[:email]}, Текст сообщения: #{params[:text]}\n"
	file.write "====================\n"
	file.close
	erb "Ok, ваше сообщение отправлено."
end
