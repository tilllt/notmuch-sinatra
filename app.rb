#
# notmuch-sinatra
# A Ruby / Sinatra / AngularJS GUI for notmuch
# v0.0.1
#

require 'sinatra'
require 'rerun'

get '/' do
	File.read "#{Dir.pwd}/index.html"
end

get '/notmuch/search' do
	content_type :json
	# search = params.keys.join (" AND ")
	p params['query'].inspect
	IO.popen('notmuch --config=/home/till/.notmuch-config search --format=json '+params['query'])
end

get '/notmuch/show' do
	content_type :json
	search = params.keys.join (" AND ")
	IO.popen('notmuch --config=/home/till/.notmuch-config show --format=json '+search)
end

get '/notmuch/address' do
	content_type :json
	search = params.keys.join (" AND ")
	IO.popen('notmuch --config=/home/till/.notmuch-config addresss --format=json '+search)
end

get '/notmuch/count' do
	content_type :json
	search = params.keys.join (" AND ")
	IO.popen('notmuch --config=/home/till/.notmuch-config count --format=json '+search)
end

not_found do
	content_type :json
	halt 404, { error: 'URL not found' }.to_json
end
