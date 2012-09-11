require_relative 'spec_helper'
require 'pry'

describe MailMonitor::Polling do
  before(:each) do
    include_relative 'fixtures/mail_defaults'
    @polling_frequency = 4
    message = MailMonitor::Notifier.new do
      to 'larry.testone@gmail.com'
      from 'yo'
      subject 'test'
      body 'test'
    end
    @polling = MailMonitor::Polling.new @polling_frequency, MailMonitor::Retriever.new, message
  end 
    
  it "should start and stop the polling before the end of @polling_frequency" do
    @polling.start
    sleep (@polling_frequency / 2)
    @polling.stop
  end
  it "should detect a fault" do
    @polling.start
    sleep (@polling_frequency * 2)
    @polling.stop
  end
end 