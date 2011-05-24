module Waltz

  class Runner
    def initialize(session_cache = SessionCache.new)
      @session_cache = session_cache
    end

    def exec!(command, options = {})
      if options[:on].is_a?(String)
        exec_on_one_box!(command, options[:on], options[:as])
      else
        exec_on_multiple_boxes!(command, options[:on], options[:as])
      end
    end

  private

    def exec_on_one_box!(command, host, user)
      puts "[#{user}@#{host}] " + @session_cache[host, user].exec!(command)
    end

    def exec_on_multiple_boxes!(command, hosts, user)
      hosts.each {|host| exec_on_one_box!(command, host, user) }
    end

  end

  describe Runner do
    it "runs a command on a remote box" do
      session_cache = double("session_cache")
      session = double("session")

      session_cache.should_receive(:[]).with("example.com", "fred").and_return(session)
      session.should_receive(:exec!).with("echo foo").and_return("foo\n")

      runner = Runner.new(session_cache)
      runner.exec!("echo foo", :on => "example.com", :as => "fred")
    end
  end

end
