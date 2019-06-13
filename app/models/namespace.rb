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

class Namespace < ApplicationRecord
  has_many :envfiles

  before_save do
    self.environment = environment.gsub(' ', '').underscore
    self.team = team.gsub(' ', '').underscore
    self.application = application.gsub(' ', '').underscore
  end

  def pathname
    [
      environment,
      team,
      application
    ].join('/')
  end
end
