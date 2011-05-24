require 'waltz/session_cache'

module Waltz
  describe SessionCache do
    it "generates a new session" do
      session = double("session")
      scp     = double("scp")

      Net::SSH.should_receive(:start).with("example.com", "fred").and_return(session)
      session.should_receive(:scp).and_return(scp)
      scp.should_receive(:upload!).with("tango", "tango", :recursive => true).and_return(nil)

      cache = SessionCache.new
      cache["example.com", "fred"].should == session
    end

    it "returns a cached session" do
      session = double("session")
      scp     = double("scp")

      Net::SSH.should_receive(:start).with("example.com", "fred").and_return(session)
      session.should_receive(:scp).and_return(scp)
      scp.should_receive(:upload!).with("tango", "tango", :recursive => true).and_return(nil)

      cache = SessionCache.new
      cache["example.com", "fred"].should == session
      cache["example.com", "fred"].should == session
    end
  end
end
