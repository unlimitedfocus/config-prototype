class ApplicationsController < ApplicationController
  def index
    render json: {
      results: Namespace.distinct(:application).pluck(:application).map do |application|
        {
          name: application,
          value: application,
          text: application,
          disabled: false
        }
      end
    }
  end
end
