class Contactform < MailForm::Base
  
  attribute :first_name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone_number,      :validate => true
  attribute :body,      :validate => true


  def headers
    {
      :subject => "Contact Metas",
      :to => "karen.s.sanchez08@gmail.com",
      :from => %("#{first_name}" <#{email}>)
    }
  end
end