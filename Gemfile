source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Rubocop 0.55 was realeased today and The package could not be downloaded..
  gem 'rubocop', '= 0.54', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end


