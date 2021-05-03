class Appointment < ActiveRecord::Base
    include MailForm::Delivery
  
    attribute :name,      :validate => true
    attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :gender,    :validate => true
    attribute :phone,     :validate => true
    attribute :birthday,  :validate => true
    attribute :address,   :validate => true
    
  
    def headers
      { 
        #this is the subject for the email generated, it can be anything you want
        subject: "New Booking",
        to: 'johndoe111620@gmail.com',
        from: %("Paralejas Notifications") # The <notifications@paralejas.com> is autofill using the email from ENV['GMAIL_EMAIL']
        #the from will display the name entered by the user followed by the email
      }
    end


end
