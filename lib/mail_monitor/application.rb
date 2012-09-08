require 'shellwords'
require 'optparse'
require 'yaml'

module MailMonitor

  ######################################################################
  # MailMonitor main application object.  When invoking +mail_monitor+ from the
  # command line, a MailMonitor::Application object is created and run.
  #
  class Application

    # @return [Int] the frequency in seconds the polling_address will be polled
    attr_accessor :frequency

    # @return [Mail::Retriver] the address to be polled from
    attr_accessor :retriver

    # @return [Mail::Message] the addresses to be notified when fault is identified.
    attr_accessor :notifier


    def run
      mail = Mail.defaults do
        delivery_method :smtp, { :address              => 'smtp.gmail.com',
                                 :port                 => 587,
                                 :domain               => 'gmail.com',
                                 :user_name            => 'larry.testone@gmail.com',
                                 :password             => 'NzoDUsi89lMF',
                                 :authentication       => 'plain',
                                 :enable_starttls_auto => true }
        retriever_method :imap, { :address    => 'imap.googlemail.com',
                                  :port       => 993,
                                  :user_name  => 'larry.testone@gmail.com',
                                  :password   => 'NzoDUsi89lMF',
                                  :enable_ssl => true }
      end
      monitor = Monitor.new mail
      monitor.start

    end

    # gets the arguments input
    #
    def argv
      check_argv
      config = YAML.load_file( ARGV[0]) #TODO Some kind of catch/rescue
      @notifier.deliver
    end

    private
      def check_argv 
      end




  end