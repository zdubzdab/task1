source 'https://rubygems.org' 
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.2'

gem "rspec-rails"
gem "factory_girl_rails"
gem "capybara"
gem "guard-rspec"
gem 'better_errors'
gem 'binding_of_caller'#with better_errors
gem 'will_paginate'#postorinkova_navihatsia

#See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'sass-rails'
gem "less-rails"
gem "twitter-bootstrap-rails"
gem 'devise'
gem 'cancan'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'
gem 'sprockets', '=2.12.1'
gem 'paperclip'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do#heroku
  gem 'rails_12factor'
end

gem 'sqlite3', :group => [:development, :test]
  group :production do
    gem 'thin' 
    gem 'pg' 
  end

