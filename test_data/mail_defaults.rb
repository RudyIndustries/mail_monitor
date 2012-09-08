
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
