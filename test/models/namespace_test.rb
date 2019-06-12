# == Schema Information
#
# Table name: namespaces
#
#  id             :bigint           not null, primary key
#  team           :string(255)      not null
#  application    :string(255)      not null
#  environment    :string(255)      not null
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  envfiles_count :integer
#

require 'test_helper'

class NamespaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
