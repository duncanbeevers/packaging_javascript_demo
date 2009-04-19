APP_ROOT = File.join(File.dirname(__FILE__))

task :build do
  # load YAML options and symbolize keys
  options = YAML.load_file(File.join(APP_ROOT, 'sprockets.yml')).
    inject({}) { |a, (k, v)| a[k.to_sym] = v; a }
  
  system('sprocketize',
    '-I', options[:load_path].join,
    '-a', options[:asset_root],
    options[:source_files].join)
end
