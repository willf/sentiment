# Sentimenticon

 The Sentimenticon module provides methods for returning word-level and
 average word sentiment scores, currently for English only.

 The sentiment data is from the article Temporal Patterns of Happiness and Information in a Global Social Network: 
 Hedonometrics and Twitter
 Peter Sheridan Dodds, Kameron Decker Harris, Isabel M. Kloumann, Catherine A. Bliss, and Christopher M. Danforth

 Sentiments range from -1.0 to 1.0, where -1.0 is the most unfavorable, and 1.0 is the most favorable.
 Words must be downcased; sentences must be downcased and tokenized.

 In addition, a Sentiment object can be inspected for the original values from the Hedonometrics paper.
 
 Examples:

```ruby
 >> require 'sentimenticon'
 >> analyzer = Sentimenticon::Analyzer.new; true
 => true
 >> analyzer.word_sentiment("love")
 => 0.855
 >> analyzer.word_sentiment("terrorist")
 => -0.925
 >> analyzer.average_word_sentiment("I love my happy friend.".downcase.scan(/\w+/))
 => 0.573
 >> analyzer.average_word_sentiment("I hate my terrorist enemy.".downcase.scan(/\w+/))
 => -0.332
 >> analyzer.average_word_sentiment("I fear our terrorist enemies.".downcase.scan(/\w+/))
 => -0.347
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sentimenticon'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sentimenticon

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/willf/sentimenticon_rb
