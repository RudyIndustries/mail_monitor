#!/usr/bin/env ruby

require 'mail'

TIME_FREQUENCY = ARGV[0].to_f;

notify_emails = ARGV.values_at(1...-1) 




Mail.defaults do
  retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'larry.testone',
                          :password   => 'NzoDUsi89lMF',
                          :enable_ssl => true
end

Mail.deliver do
   from    'larry.testone@gmail.com'
   to      'larry.testone@gmail.com'
   subject 'Notification'
   body    'body'
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


