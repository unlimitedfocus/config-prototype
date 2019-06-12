class ApplicationController < ActionController::Base

  def index
    @namespaces = Namespace.all
    @envfiles = Envfile.all
    render template: 'application'
  end
end
