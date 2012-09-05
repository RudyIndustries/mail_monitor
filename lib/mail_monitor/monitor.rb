# @author Kurt Robert Rudolph (rudolph9)
#
module MailMonitor

  class Monitor
    
    # @return [Int] the frequency in seconds the polling_address will be polled
    attr_accessor :frequency

    # @return [Mail::Retriver] the address to be polled from
    attr_accessor :retriver

    # @return [Mail::Message] the addresses to be notified when fault is identified.
    attr_accessor :notifier

    # @param [Int] frequency the frequency in seconds the polling_address will be polled
    # @param [Mail::Retriver] reciever the mail object for polling the mailbox
    # @param [Mail::Message] 
    def initialize frequency = 1800, reciever, notifier
      @frequency = frequency
      @reciever = retriver
      @notifier = notifier
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