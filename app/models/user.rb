# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string(255)
#  encrypted_password :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  username           :string(255)      not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :rememberable

  before_save { self.username = username.downcase }

  validates :username, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def password_required?
    false
  end

  def password_changed?
    false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end

  def will_save_change_to_password?
    false
  end
end
