require 'mail'

# @author Kurt Robert Rudolph (rudolph9)
#
module MailMonitor

  class Polling

    # @return [Int] the frequency in seconds the polling_address will be polled
    attr_accessor :frequency

    # @return [Retriever] the address to be polled from
    attr_accessor :retriever

    # @return [Notifier] the addresses to be notified when fault is identified.
    #attr_accessor :notifier # you should access the original object passed to it

    # 
    #
    # @param [Int] frequency the frequency in seconds the polling_address will be polled
    # @param [Retriever]
    def initialize frequency, retriever, notifier
      @frequency = frequency
      @retriever = retriever
      @notifier  = notifier
      @last_message  = nil
    end

    # Begin monitoring the mailbox
    #
    def start
      @last_message_date ||= @retriever.last.date
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
         @notifier.notify if @last_message_date == @retriever.last.date
         return true
      end

  end
end