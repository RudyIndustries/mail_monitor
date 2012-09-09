module MailMonitor
  class Notifier < Mail::Message
    
    # @return [Mail::Message] The message object
    attr_accessor :message

    # Notify a fault has occured
    #
    def notify frequency
      @message.deliver
    end

  end
end
    