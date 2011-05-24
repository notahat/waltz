require 'net/ssh'
require 'net/scp'

module Waltz
  class SessionCache

    def initialize
      @sessions = {}
    end

    def [](host, user)
      @sessions["#{user}@#{host}"] ||= Net::SSH.start(host, user).tap do |ssh|
        ssh.scp.upload!("tango", "tango", :recursive => true)
      end
    end

    def close
      @sessions.each_value {|session| session.close }
      @sessions = {}
    end

  end
end
