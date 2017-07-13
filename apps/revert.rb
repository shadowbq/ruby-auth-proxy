class Revert < Sinatra::Base
  get '/revert/:id' do
    param :id, Integer, transform: :to_s, required: true

    uri = URI::HTTP.build(
        :host => localhost,
        :port => 8080,
        :path => request.path_info,
        :query => request.query_string
    )

    content_type 'application/json', :charset => 'utf-8'

    Net::HTTP.get(uri)
  end
end
