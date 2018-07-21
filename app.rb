require_relative 'config/environment'
require_relative 'models/piglatinizer'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/piglatinize' do
    pl = PigLatinizer.new

    @piglatin = pl.piglatinize(params[:user_phrase])

    erb :result
  end
end
