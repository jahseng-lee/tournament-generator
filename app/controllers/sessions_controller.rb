class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    FindOrCreateUser.call(auth_hash)
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
