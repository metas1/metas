class Jobemail < MailForm::Base

  attribute :first_name,      :validate => true
  attribute :last_name      
  attribute :email,      :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone_number, :validate => true   
  attribute :additional_information, :validate => true
  attribute :job_title, :validate => true
  attribute :job_id, :validate => true      

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Job Inquiry for #{job_title}",
      :to => "hi@metas.io",
      :from => %("#{first_name}" <#{email}>)
    }
  end

end
