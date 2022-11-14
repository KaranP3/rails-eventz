class User < ApplicationRecord
   validates :email,  format: { with: URI::MailTo::EMAIL_REGEXP }

   has_many :registrations, dependent: :destroy
   has_many :events, through: :registrations
end
