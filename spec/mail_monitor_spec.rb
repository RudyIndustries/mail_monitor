require_relative 'spec_helper'
require 'pry'
require 'mail'

describe MailMonitor::Polling do
  before(:each) do
    load_relative 'fixtures/mail_defaults.rb'
    @polling_frequency = 4
    @message = Mail.new do
      to 'larry.testone@gmail.com'
      from 'yo'
      subject rand( 0..1024).to_s
      body 'test'
    end
    @mail = Mail
    @polling = MailMonitor::Polling.new @polling_frequency, @mail, @message
  end 
    
  it "should start and stop the polling before the end of @polling_frequency" do
    @polling.start
    sleep (@polling_frequency / 2)
    @polling.stop
  end
  it "should detect a fault" do
    @polling.start
    sleep (@polling_frequency * 4)
    @polling.stop
    @mail.last.subject.should eq( @message.subject)
  end
end 