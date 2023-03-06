require 'sinatra'
require 'json'

articles = [
  { id: 1, title: 'First Article' },
  { id: 2, title: 'Second Article' },
  { id: 3, title: 'Third Article' }
]

get '/articles' do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*'
  articles.to_json
end
