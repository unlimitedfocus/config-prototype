# == Schema Information
#
# Table name: envfiles
#
#  id           :bigint           not null, primary key
#  filename     :string(255)      not null
#  namespace_id :bigint           not null
#  filetype     :integer          default(0)
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Envfile < ApplicationRecord
  has_one_attached :file

  belongs_to :namespace, counter_cache: true
end
