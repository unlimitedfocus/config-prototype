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

class Envfile < ApplicationRecord
  has_one_attached :file

  belongs_to :namespace, counter_cache: true
end
