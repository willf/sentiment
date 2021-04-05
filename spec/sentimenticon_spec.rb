# frozen_string_literal: true

RSpec.describe Sentimenticon do
  it "has a version number" do
    expect(Sentimenticon::VERSION).not_to be nil
  end

  it "the Analyzer object exists" do 
    expect(Sentimenticon::Analyzer).not_to be nil
  end

  it "the Sentiment object exists" do 
    expect(Sentimenticon::Sentiment).not_to be nil
  end

  #it "can load the english model" do
  #  expect(Sentimenticon::Analyzer.new.loaded?).to be true
  #end

  
end
