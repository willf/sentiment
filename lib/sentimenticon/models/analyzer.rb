# frozen_string_literal: true

module Sentimenticon

# Public: A sentiment analyzer.
class Analyzer

    attr_accessor :language
    attr_accessor :minimum_frequency
    attr_reader   :sentiments

    def initialize(language: 'en', minimum_frequency: 1.0e-08)
        @language = language
        @minimum_frequency = minimum_frequency
        @sentiments = Hash.new
        load_data
    end

    # Private: safely parse a float
    def self.safe_float(str)
        begin
            Float(str)
        rescue ArgumentError
            nil
        end
    end

    # Private: safely parse an int
    def self.safe_int(str)
        begin
            Integer(str)
        rescue ArgumentError
            nil
        end
    end

    # Private: normalize a Likert-scale of 1-9 to -1.0 to 1.0
    def self.normalize(ave)
        """normalize a Likert-scale of 1-9 to -1.0 to 1.0"""
        raise ArgumentError("#{ave} not in range (1.0, 9.0)") if (ave > 9.0) or (ave < 1.0)
        return (((ave - 1) / 8) * 2) - 1.0
    end

    # Private: Load data (happens on init)
    def load_data
        raise ArgumentError("Don't know how to load #{language}") unless language == 'en'
        File.open(File.join(Analyzer::data_directory, 'en', 'journal.pone.0026752.s001.txt')) do |io|
            io.each_line do |line|
                parts = line.strip.split("\t")
                next unless parts.size == 8
                word, rank, average, std, twitter, google, nyt, lyrics = parts
                r = Analyzer::safe_int(rank)
                ave = Analyzer::safe_float(average)
                s = Analyzer::safe_float(std)
                next unless r && ave && s
                norm = Analyzer::normalize(ave)
                twitter = Analyzer::safe_int(twitter)
                google = Analyzer::safe_int(google)
                nyt = Analyzer::safe_int(nyt)
                lyrics = Analyzer::safe_int(lyrics)
                s = Sentiment.new(word: word, rank: r, normed_average: norm, average: ave, std: s, twitter:twitter, google:google, nyt:nyt, lyrics:lyrics)
                @sentiments[word] = s
            end
        end
        self
    end

    # Public: Is the file loaded?
    def loaded?
        @sentiments.size > 0
    end

    # Private: Find the data directory
    def self.data_directory
        File.join(__dir__, "../../../data")
    end

    # Public:
    # return the normed sentiment of a word, returning default value if not found. word must be lowercased.
    def word_sentiment(word, default=0.0)
        s = @sentiments.dig(word)
        s ? s.normed_average : default
    end

    # Public:
    # return the average word sentiment of an iterable of words, using 0.0 for unknown words.
    # returns 0.0 for empty lists.
    def average_word_sentiment(words, default_sentiment=0.0)
        return default_sentiment unless words.size > 0
        words.map{|word| word_sentiment(word)}.sum / words.size
    end

    def sentiment_object(word)
        @sentiments.dig(word)
    end
end
end
