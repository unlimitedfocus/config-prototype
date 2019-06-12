# == Schema Information
#
# Table name: namespaces
#
#  id             :bigint           not null, primary key
#  team           :string(255)
#  application    :string(255)
#  environment    :string(255)
#  deleted_at     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  envfiles_count :integer
#

class Namespace < ApplicationRecord
  has_many :envfiles

  def path
    "/#{environment}/#{team}/#{application}"
  end
end
