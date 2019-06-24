class EnvironmentsController < ApplicationController
  def index
    render json: {
      results: Namespace.distinct(:environment).pluck(:environment).map do |environment|
        {
          name: environment,
          value: environment,
          text: environment,
          disabled: false
        }
      end
    }
  end
end
