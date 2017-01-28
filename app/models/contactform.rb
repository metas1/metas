class Contactform < MailForm::Base
  
  attribute :full_name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :body,      :validate => true


  def headers
    {
      :subject => "Contact Metas",
      :to => "karen.s.sanchez08@gmail.com",
      :from => %("#{full_name}" <#{email}>)
    }
  end
end