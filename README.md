# CopyGithubLabels
[![Gem Version](https://badge.fury.io/rb/copy_github_labels.svg)](https://badge.fury.io/rb/copy_github_labels)


Copy labels from one GitHub repository to another.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'copy_github_labels'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install copy_github_labels

## Usage

Use command-line:
```bash
# Use access token
$ copy_github_labels -t <access_token> <source_repo> <target_repo>

# Use username & password
$ copy_github_labels -u <username> <source_repo> <target_repo>

# Override existing labels
$ copy_github_labels -t <access_token> -f <source_repo> <target_repo>

```

Use in code:
```ruby
client = CopyGithubLabels::Client.new(access_token: 'YOUR-ACCESSTOKEN')
client.copy_labels('source-repo', 'target-repo', options = { override: false })
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/copy_github_labels. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CopyGithubLabels project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/copy_github_labels/blob/master/CODE_OF_CONDUCT.md).
