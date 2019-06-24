class ApplicationController < ActionController::Base
  layout :layout_by_resource

  before_action :authenticate_user!

  def index
    @namespaces = Namespace.all
    render template: 'application'
  end

  private

  def layout_by_resource
    if devise_controller?
      'default'
    else
      'application'
    end
  end
end
