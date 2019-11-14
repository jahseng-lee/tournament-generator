require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "POST #create" do
    let(:args) { { name: "Test", email: "Test@test.test", provider: "test" } }

    it "calls FindOrCreateUser#call" do
      expect(Actions::FindOrCreateUser).to receive(:call).with(args)

      request.headers.merge!({ "omniauth.auth" => args })
      post :create, params: args
    end
  end
end
