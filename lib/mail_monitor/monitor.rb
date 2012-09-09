require 'mail'

# @author Kurt Robert Rudolph (rudolph9)
#
module MailMonitor

  class Monitor

    # @return [Int] the frequency in seconds the polling_address will be polled
    attr_accessor :frequency

    # @return [Retriver] the address to be polled from
    attr_accessor :retriver

    # @return [Notifier] the addresses to be notified when fault is identified.
    attr_accessor :notifier

    #
    #
    # @param [Int] frequency the frequency in seconds the polling_address will be polled
    def initialize frequency, retriver, notifier
      @frequency = frequency
      @retriver   = mailbox
      @notifier = notifier
    end

    # Begin monitoring the mailbox
    #
    def start
      @thread = Thread.new do
        loop do
          sleep( @frequency)
          @notifier.notify if @retriver.check!
        end
      end
    end

    # Begin monitoring the mailbox
    #
    def stop
      @thread.kill
      @thread.join
    end

  end
end