source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.4"

gem "rails", "~> 8.0"
gem "pg", "~> 1.1"          # adapter PostgreSQL
gem "puma", ">= 5.0"        # servidor web
gem "bootsnap", require: false  # inicialização mais rápida

# Front-end
gem "propshaft"             # pipeline de assets (Rails 8 default)
gem "turbo-rails"           # Hotwire Turbo
gem "stimulus-rails"        # Hotwire Stimulus

# Auth
gem "devise"                # autenticação

# Background Jobs
gem "sidekiq"        # jobs assíncronos

# Paginação
gem "kaminari"

group :development, :test do
  gem "debug"               # debugger
  gem "rspec-rails"         # testes
  gem "factory_bot_rails"   # factories para testes
  gem "faker"               # dados falsos para seeds/testes
  gem "dotenv-rails"        # carrega .env no Rails
end

group :development do
  gem "web-console"
  gem "bullet"              # detecta N+1 queries
  gem "rubocop-rails-omakase", require: false  # linter
end

group :test do
  gem "shoulda-matchers"
  gem "capybara"
  gem "selenium-webdriver"
end