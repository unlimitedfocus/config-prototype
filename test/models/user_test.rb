# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  username            :string(255)      not null
#  email               :string(255)
#  encrypted_password  :string(255)
#  remember_created_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
