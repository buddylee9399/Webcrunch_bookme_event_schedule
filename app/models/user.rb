# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  booking_link           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_booking_link          (booking_link) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify
  has_person_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :booking_types

  # validates :booking_link, presence: true
  after_create :assign_default_role
  def assign_default_role
    if User.count == 1
      self.add_role(:site_admin) if self.roles.blank?
      self.add_role(:admin)
      self.add_role(:customer)      
    else
      self.add_role(:customer) if self.roles.blank?
    end
  end  
end
