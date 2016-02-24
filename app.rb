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
	IO.popen('notmuch --config=/home/till/.notmuch-config search --format=json kegeln')
end

get '/notmuch/show' do
	content_type :json
	IO.popen('notmuch --config=/home/till/.notmuch-config show --format=json kegeln')
end

get '/notmuch/address' do
	content_type :json
	IO.popen('notmuch --config=/home/till/.notmuch-config addresss --format=json kegeln')
end

get '/notmuch/count' do
	content_type :json
	IO.popen('notmuch --config=/home/till/.notmuch-config count --format=json kegeln')
end

not_found do
	content_type :json
	halt 404, { error: 'URL not found' }.to_json
end
