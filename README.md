# README
A simple rails app that explores the relationship between a game and its players and a video store and its movies

* Ruby version
-use Rails 5.2.4.x

* System dependencies
ruby '2.5.3'
'rails/rails'
```
gem 'rails', '~> 5.2.4', '>= 5.2.4.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
group :development, :test do
execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'pry'
  gem 'shoulda-matchers'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

* Configuration

* Database creation

![schema](/images/Screen%20Shot%202021-02-10%20at%209.29.35%20PM.png)

* Database initialization
   rails db:create
   rails db:migrate
   rails db:seed

* How to run the test suite
` bundle exec rake spec`   

