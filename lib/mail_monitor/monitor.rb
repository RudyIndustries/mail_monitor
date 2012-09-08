require 'mail'

# @author Kurt Robert Rudolph (rudolph9)
#
module MailMonitor

  class Monitor

    #
    #
    # @param [Int] frequency the frequency in seconds the polling_address will be polled
    def initialize frequency, mailbox
      @frequency = frequency
      @mailbox   = mailbox
    end

    # Begin monitoring the mailbox
    #
    def start #TODO: fix up this logic
      prev_message = @mailbox.last
      @thread = Thread.new do
        loop do
          sleep( @frequency)
          @mailbox.last == prev_message ? notify : prev_message = @mailbox.last
        end
      end
    end


    # Begin monitoring the mailbox
    #
    def stop
      @thread.kill
      @thread.join
    end

    private
      # Notify a fault has occured
      #
      def notify
        @mailbox.deliver do
          from 'piss'
          to   'larry.testone@gmail.com'
          subject 'piss'
        end
        puts 'notify'
      end

      # Finds new messages with the matched string
      #
      
  end
end