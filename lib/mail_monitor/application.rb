require 'yaml'

module MailMonitor

  # MailMonitor main application object.  When invoking +mail_monitor+ from the
  # command line, a MailMonitor::Application object is created and run.
  #
  class Application
    # Run the commanline application
    #
    def run
      argv
      polling = Polling.new @polling_frequency @mail
      polling.start
    end


    private
      # gets the arguments input
      #
      def argv
        # TODO: I don't know how I would like to orient the configuration.
        # Furthermore, I don't know if I even want to use a Yaml file,
        # I am tempted to just include a configuration of a mail object
        # but I fear that that is a bit of a security whole provided this
        # is is to be input via a command line.
        config = YAML.load_file( ARGV[0]) #TODO Some kind of catch/rescue
        check_config config
      end

      # checks the command line arguments
      # 
      # @arg [Hash] config the configuration of the Mail object.
      # TODO: some checks
      def check_config config
      end
  end
end