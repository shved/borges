source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '>= 5.0.0'
gem 'bundler', '>= 1.8.4'
gem 'pg', '~> 0.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 2.0'
gem 'awesome_print'
gem 'pry-rails'
gem 'capistrano-rails'
gem 'slim'
gem 'devise'
gem 'typekit-rails'
gem 'react-rails'
gem 'autoprefixer-rails'
gem 'russian'

source 'https://rails-assets.org' do
  gem 'rails-assets-normalize-css'
  gem 'rails-assets-textarea-autosize'
end

# heroku
group :production do
  gem 'puma'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
