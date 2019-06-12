class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    @namespaces = Namespace.all
    @envfiles = Envfile.all
    render template: 'application'
  end
end
