# frozen_string_literal: true

# Public: 
#
# The sentiment module provides methods for returning word-level and
# average word sentiment scores, currently for English only.
#
# The sentiment data is from the article Temporal Patterns of Happiness and Information in a Global Social Network: 
# Hedonometrics and Twitter
# Peter Sheridan Dodds, Kameron Decker Harris, Isabel M. Kloumann, Catherine A. Bliss, and Christopher M. Danforth
#
# Sentiments range from -1.0 to 1.0, where -1.0 is the most unfavorable, and 1.0 is the most favorable.
# Words must be downcased; sentences must be downcased and tokenized.
#
# In addition, a Sentiment object can be inspected for the original values from the Hedonometrics paper.
# 
# Examples:
#
# >> require 'sentimenticon'
# >> analyzer = Sentimenticon::Analyzer.new; true
# => true
# >> analyzer.word_sentiment("love")
# => 0.855
# >> analyzer.word_sentiment("terrorist")
# => -0.925
# >> analyzer.average_word_sentiment("I love my happy friend.".downcase.scan(/\w+/))
# => 0.5730000000000001
# >> analyzer.average_word_sentiment("I hate my terrorist enemy.".downcase.scan(/\w+/))
# => -0.332
# >> analyzer.average_word_sentiment("I fear our terrorist enemies.".downcase.scan(/\w+/))
# => -0.34700000000000003
# 
module Sentimenticon
end

require_relative "sentimenticon/version"
require_relative "sentimenticon/models/analyzer"
require_relative "sentimenticon/models/sentiment"



