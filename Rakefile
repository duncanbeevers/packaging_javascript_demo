APP_ROOT = File.join(File.dirname(__FILE__))
WWW_ROOT = File.join(APP_ROOT, 'public')

task :build do
  require 'sprockets'
  require 'tempfile'
  
  # load YAML options and symbolize keys
  options = YAML.load_file(File.join(APP_ROOT, 'config/sprockets.yml')).
    inject({}) { |a, (k, v)| a[k.to_sym] = v; a }
  
  Tempfile.open('concatenation.js') do |f|
    %x[ sprocketize \
          -I #{options[:load_path].join} \
          -a #{options[:asset_root]} #{options[:source_files]} \
          > #{f.path} ]
    f.size
    
    jar = File.join(APP_ROOT, 'vendor/yuicompressor-2.4.2.jar')
    out = File.join(WWW_ROOT, 'compressed.js')
    
    system('java', '-jar', jar,
      '--type', 'js',
      '-o', out,
      f.path
    )
  end
end
