class Jobemail < MailForm::Base

  attribute :fname,      :validate => true
  attribute :lname,      :validate => true
  attribute :email,      :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone_number, :validate => true   
  attribute :additional_information, :validate => true
  attribute :job_title, :validate => true
  attribute :job_id, :validate => true      

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Job Inquiry <#{job_title}>",
      :to => "metastest10@gmail.com",
      :from => %("#{fname}" <#{email}>)
    }
  end

end
