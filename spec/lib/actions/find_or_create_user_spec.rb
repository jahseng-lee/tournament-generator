require 'rails_helper'

RSpec.describe Actions::FindOrCreateUser, type: :action do
  subject(:action) do 
    described_class.call(
      name: name,  
      email: email,
      provider: "developer"
    )
  end
  let(:name) { "Jah Seng Lee" }
  let(:email) { "some-test-email@gmail.com" }

  context "#call" do
    context "given user does not exist" do
      context "given a valid name and email" do
        let(:name) { "Jah Seng Lee" }
        let(:email) { "some-test-email@gmail.com" }

        it "creates a User" do
          expect { action }.to change { User.count }.by(1)
        end
      end
    end

    context "given user already exists" do
      let(:existing_name) { "Jah Seng Lee" }
      let(:existing_email) { "some-test-email@gmail.com" }
      before do
        create(
          :user,
          name: existing_name,
          email: existing_email
        )
      end

      context "given the existing user's name and email" do
        it "finds the existing User" do
          expect { action }.to change { User.count }.by(0)
          expect(action).to be(User.find_by(name: existing_name, email: existing_email))
        end
      end

      context "given a new user's name and email" do
        let(:name) { "Isaiah Thomas" }
        let(:email) { "shortest-nba-player@gmail.com" }

        it "creates a User" do
          expect { action }.to change { User.count }.by(1)
        end
      end
    end
  end
end
