require 'sinatra'
require 'pony'

get '/:yo_callback_path' do
	return status 400 unless params[:username]==ENV['USER']
	return status 400 unless params[:yo_callback_path]==ENV['YO_CALLBACK_PATH']
	Pony.mail :to => ENV['TO_ADDRESS'],
	:from => ENV['FROM_ADDRESS'],
	:body => 'ごはんいらないYo',
	:via => :smtp,
	:via_options => {
		:enable_starttls_auto => true,
		:address => ENV['SMTP_ADDRESS'],
		:port => ENV['SMTP_PORT'],
		:user_name => ENV['MAIL_USER'],
		:password => ENV['MAIL_PASS'],
		:authentification => :plain,
		:domain => ENV['MAIL_DOMAIN']
	}
end
