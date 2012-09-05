# @author Kurt Robert Rudolph (rudolph9)
#
module MailMonitor

  class Monitor
    
    # @return [Int] the frequency the polling_address will be polled
    attr_accessor :frequency

    # @return [String] the address to be polled from
    attr_accessor :polling_address 

    # @return [Array] the addresses to be notified when fault is identified.
    attr_accessor :notify_addresses

    def initialize 

    end

    # Begin monitoring the mailbox
    #
    def start
      
    end

    # Begin monitoring the mailbox
    #
    def stop
    end

  end
end