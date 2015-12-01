# I18n::Backend::Advanced

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18n-backend-advanced'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n-backend-advanced

## Usage

### Rails

```ruby
# somewhere in application.rb
I18n.backend = I18n::Backend::Advanced.new
```

Now you can use references in your locale files.

```yaml
# config/locales/de/application.yml
de:
  application:
    cancel: Abbrechen
    submit: Abschicken

# config/locales/de/languages.yml
de:
  languages:
    de: Deutsch
    en: Englisch
    es: Spanisch
    ...

# config/locales/de/users.yml
de:
  users:
    submit: ~> application.submit
    
    index:
      cancel: ~> application.cancel # t("users.index.cancel") => Abbrechen
      languages: ~> languages       # t("users.index.languages.en") => Englisch
      submit: ~> users.submit       # t("users.index.submit") ~> Abschicken
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/msievers/i18n-backend-advanced.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
