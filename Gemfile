source "https://rubygems.org"

gemspec

group :development, :test do
  gem "bundler",   ">= 1.9"
  gem "rake",      ">= 10.0"
  gem "rspec",     ">= 3.0.0",  "< 4.0.0"
  gem "simplecov", ">= 0.8.0"
end

if !ENV["CI"] && RUBY_ENGINE == "ruby"
  group :development do
    gem "pry",                "~> 0.9.12.6"
    gem "pry-byebug",         "<= 1.3.2"
    gem "pry-rescue",         "~> 1.4.1"
    gem "pry-stack_explorer", "~> 0.4.9.1"
    gem "pry-syntax-hacks",   "~> 0.0.6"
  end
end

group :test do
  gem "codeclimate-test-reporter", require: nil
end
