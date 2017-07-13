class SinatraAuthProxy < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/*' do
    env['warden'].authenticate!

    uri = URI::HTTP.build(
        :host => "localhost",
        :port => 8080,
        :path => request.path_info,
        :query => request.query_string
    )

    content_type 'application/json', :charset => 'utf-8'
    Net::HTTP.get(uri)
  end
end
