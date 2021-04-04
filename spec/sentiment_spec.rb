# frozen_string_literal: true

RSpec.describe Sentimental do
  it "has a version number" do
    expect(Sentimental::VERSION).not_to be nil
  end

  it "the Analyzer object exists" do 
    expect(Sentimental::Analyzer).not_to be nil
  end

  it "the Sentiment object exists" do 
    expect(Sentimental::Sentiment).not_to be nil
  end

  it "can load the english model" do
    expect(Sentimental::Analyzer.new.loaded?).to be true
  end

  
end
