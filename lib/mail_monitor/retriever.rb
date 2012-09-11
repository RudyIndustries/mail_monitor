module MailMonitor
  class Retriever < Mail::Retriever

    # @return [Mail] The Mail object used to ping the inbox
    # @note It was originally desired that this classess be
    #   passed a Mail:Retriever object, but contrary to what
    #   the mail ruby gem documentation may indicate, the 
    #   instance methods associated with the class are not
    #   accessable.
    attr_accessor :retriever

  end
end
