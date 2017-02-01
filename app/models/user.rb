class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_attached_file :thumbnail, :default_url => 'profile-pic-250.png', styles: { large: "300x300>", medium: "100x100>" }
	validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\z/ 
	# has_attached_file :thumbnail, :default_url => 'profile-pic-250.png'

	has_many :jobemails     
end
