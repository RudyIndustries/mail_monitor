require 'mail_monitor/application'

module MailMonitor

  # MailMonitor module singleton methods.
  #
  class << self
    # Current MailMonitor Application
    def application
      @application ||= MailMonitor::Application.new
    end

    # Set the current MailMonitor application object.
    def application=(app)
      @application = app
    end

    # Return the original directory where the MailMonitor application was started.
    def original_dir
      application.original_dir
    end

    # Load a mail_monitor_file
    def load_mail_monitor_file(path)
      load(path)
    end
  end

end