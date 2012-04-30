require 'helper'

describe Peerindex::Client::User do

  before do
    @client = Peerindex::Client.new
  end

  describe ".user" do
    context "with user name passed" do
      before do
       stub_request(:get, "http://api.peerindex.net/v2/profile/profile.json?api_key=fake&id=alkema").
          with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Peerindex Ruby Gem 0.0.1'}).
          to_return(:status => 200, :body => fixture("alkema.json"), :headers => {})
      end

      it "should request the correct resource" do
        @client.user("alkema")
        a_get("v2/profile/profile.json").
          with(:query => {:id => "alkema", :api_key => "fake"}).
          should have_been_made
      end

      # {"activity":24,"audience":45,"authority":23,"peerindex":28,"known":1,"twitter":"alkema","url":"http:\/\/pi.mu\/10X3"}
      it "should get activity" do
        @client.user("alkema").activity.should == 24
      end

      it "should get authority" do
        @client.user("alkema").authority.should == 23
      end

      it "should get audience" do
        @client.user("alkema").audience.should == 45
      end

      it "should get a peerindex value" do
        @client.user("alkema").peerindex.should == 28
      end

      it "should get a known status" do
        @client.user("alkema").known.should == 1
      end
    end
  end
  
end

