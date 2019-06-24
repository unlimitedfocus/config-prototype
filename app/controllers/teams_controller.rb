class TeamsController < ApplicationController
  def index
    render json: {
      results: Namespace.distinct(:team).pluck(:team).map do |team|
        {
          name: team,
          value: team,
          text: team,
          disabled: false
        }
      end
    }
  end
end
