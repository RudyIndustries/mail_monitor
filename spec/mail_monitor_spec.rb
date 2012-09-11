require_relative 'spec_helper'

describe MailMonitor::Polling do
  before(:each) do
    include_relative 'fixtures/mail_defaults'
    @polling = MailMonitor::Polling.new 10, Mail, Mail.new
  end 
    
  it "It should send detect a fault and send out a notification" do
    @polling.start
    sleep (4)
    @polling.stop
  end
end 