module Sentimenticon


    class Sentiment

    attr_accessor :word
    attr_accessor :rank
    attr_accessor :normed_average
    attr_accessor :average
    attr_accessor :std 
    attr_accessor :twitter
    attr_accessor :google
    attr_accessor :nyt
    attr_accessor :lyrics

    def initialize(
        word:, 
        rank:, 
        normed_average:, 
        average:, 
        std:, 
        witter:, 
        google:, 
        nyt:, 
        lyrics:
        )
        @word = word
        @rank = rank
        @normed_average = normed_average
        @average = average
        @std = std
        @twitter = twitter
        @google = google
        @nyt = nyt
        @lyrics = lryics
    end

    end
end
