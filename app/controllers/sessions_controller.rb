class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    auth_hash
    raise NotImplementedError, "TODO"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
