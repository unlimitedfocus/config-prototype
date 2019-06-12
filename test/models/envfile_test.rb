# == Schema Information
#
# Table name: envfiles
#
#  id           :bigint           not null, primary key
#  filename     :string(255)
#  namespace_id :bigint
#  filetype     :integer
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class EnvfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
