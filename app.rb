#
# notmuch-sinatra
# A Ruby / Sinatra / AngularJS GUI for notmuch
# v0.0.1
#

require 'sinatra'

get '/' do
	File.read "#{Dir.pwd}/index.html"
end

get '/notmuch/search' do
	content_type :json
	system('/home/till/notmuch search --format=json test')
end

get '/notmuch/show' do
	content_type :json
	system('/home/till/notmuch show --format=\"json\"'+ params)
end

get '/notmuch/address' do
	content_type :json
	system('/home/till/notmuch address --format=\"json\"'+ params)
end

get '/notmuch/count' do
	content_type :json
	system('/home/till/notmuch count --format=\"json\"'+ params)
end

not_found do
	content_type :json
	halt 404, { error: 'URL not found' }.to_json
end
