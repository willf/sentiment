# frozen_string_literal: true

RSpec.describe Sentimenticon do
  analyzer  = Sentimenticon::Analyzer.new

  it "has a version number" do
    expect(Sentimenticon::VERSION).not_to be nil
  end

  it "the Analyzer object exists" do 
    expect(Sentimenticon::Analyzer).not_to be nil
  end

  it "the Sentiment object exists" do 
    expect(Sentimenticon::Sentiment).not_to be nil
  end

  it "can load the english model" do
    expect(Sentimenticon::Analyzer.new.loaded?).to be true
  end

  it "declares happy is positive" do
    expect((analyzer.word_sentiment("happy") > 0.0)).to be true
  end

  it "declares sad is negative" do
    expect((analyzer.word_sentiment("sad") < 0.0)).to be true
  end

  it "declares unknown words to be middling" do
    expect((analyzer.word_sentiment("asfdklfsdakjsfjklsafd") == 0.0)).to be true
  end

  it "declares joy beauty love to be is positive" do
    expect((analyzer.average_word_sentiment("joy beauty love".split(' ')) > 0.0)).to be true
  end

  it "declares sad terrorist horror is negative" do
    expect((analyzer.average_word_sentiment("sad terrorist horror".split(' ')) < 0.0)).to be true
  end

  it "declares unknown words to be middling" do
    expect((analyzer.average_word_sentiment("jdkadslksda adksdakdsf adsaaskleee".split(' ')) == 0.0)).to be true
  end

  
end
