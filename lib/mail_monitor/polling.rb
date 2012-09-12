# @author Kurt Robert Rudolph (rudolph9)
#
module MailMonitor

  class Polling

    # @return [Int] the frequency in seconds the polling_address will be polled
    attr_accessor :frequency

    # 
    #
    # @param [Int] frequency the frequency in seconds the polling_address will be polled
    # @param [Mail] mailbox the object to be polled from
    # @param [Mail::Message] notification the object where is delievered when a fault occurs
    def initialize frequency, mailbox, notification
      @frequency = frequency
      @mailbox = mailbox
      @notification = notification
      @last_message  = nil
    end

    # Begin monitoring the mailbox
    #
    def start
      @last_message_date ||= @mailbox.last.date
      @thread = Thread.new do
        loop do
          sleep( @frequency)
          check
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
      # Check if a fault has occured
      #
      # TODO: Add support for matching attributes of the 
      # messages begin checked
      # @return [bool] indicates if a fault has occured
      def check
         notify if @last_message_date == @mailbox.last.date
      end

      def notify
        @notification.deliver
      end

  end
end