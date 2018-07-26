class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2,:facebook]


  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def set_auth_token
  	self.auth_token= SecureRandom.uuid
  	self.save
  end

  def self.from_omniauth(data)
    # can be accessed by User.from_omniauth
    user=User.find_by(email:data.email)
    if user.blank?
      user=User.create(email:data.email,password:Devise.friendly_token)
    end
    return user
   end

end
