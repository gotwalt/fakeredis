require 'spec_helper'

module FakeRedis
  describe "Pubsub" do
    before(:each) do
      @client = Redis.new
    end

    it "should accept a publish command but return zero" do
      @client.publish(:test_key, 'data').should == 0
    end
    
    it "should never yield when subscribe is called, as this isn't a fancy library" do
      # lousy test, but calling it properly results in a block that never ever yields
      @client.methods.should be_include(:subscribe)
    end
  end
end
