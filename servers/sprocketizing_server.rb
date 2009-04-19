require 'rubygems'
require 'sinatra'
require 'sprockets'

class SprocketizingServer < Sinatra::Default
  if (!const_defined?(:APP_ROOT))
    APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  end
  
  get '/sprocketize/*' do
    headers 'Content-Type' => 'application/x-javascript'
    secretary(params[:splat].map { |f| File.join('vendor', f) }).concatenation.to_s
  end
  
  def secretary source_files
    # load YAML options and symbolize keys
    options = YAML.load_file(File.join(APP_ROOT, 'config/sprockets.yml')).
      inject({}) { |a, (k, v)| a[k.to_sym] = v; a }
    
    Sprockets::Secretary.new(
      options.merge(:source_files => source_files)
    )
  end
end
