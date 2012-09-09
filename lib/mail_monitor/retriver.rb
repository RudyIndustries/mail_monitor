module MailMonitor
  class Retriver < Mail::Retriver

    # @return [Mail] The Mail object used to ping the inbox
    # @note It was originally desired that this classess be
    #   passed a Mail:Retriever object, but contrary to what
    #   the mail ruby gem documentation may indicate, the 
    #   instance methods associated with the class are not
    #   accessable.
    attr_accessor :retriver

    # Check the mailbox
    #
    # TODO: needs to check that in the given a frequency
    # a new message has arrived
    # TODO: Add support for matching attributes of the 
    # messages begin checked
    # @return [bool] indicates if a fault has occured
    def check
    end

  end
end
