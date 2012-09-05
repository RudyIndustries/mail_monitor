#!/usr/bin/env ruby
require 'rubygems'
require 'mail'

#TIME_FREQUENCY = ARGV[0].to_f;

#notify_emails = ARGV[1].split(';')


Mail.defaults do
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

puts Mail.last.subject

Mail.deliver do
  to 'larry.testone@gmail.com'
  from 'larry.testone@gmail.com'
  subject 'testing sendmail'
  body 'testing sendmail'
end



=begin
while true do
  sleep( TIME_FREQUENCY)
  if ( last == Mail.last)
    Mail.deliver do
       from    'larry.testone@gmail.com'
       to      'larry.testone@gmail.com'
       subject 'Notification'
       body    'body'
  end else
    last = mail.last

  end
end
=end


