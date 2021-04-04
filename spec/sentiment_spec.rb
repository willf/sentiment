# frozen_string_literal: true

RSpec.describe Sentiment do
  it "has a version number" do
    expect(Sentiment::VERSION).not_to be nil
  end

  it "the Analyzer object exists" do 
    expect(Sentiment::Analyzer).not_to be nil
  end

  it "the Sentiment object exists" do 
    expect(Sentiment::Sentiment).not_to be nil
  end

  it "can load the english model" do
    expect(Sentiment::Analyzer.new.loaded?).to be true
  end

  
end
