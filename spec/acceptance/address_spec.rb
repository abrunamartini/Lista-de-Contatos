require "rails_helper"

RSpec.describe AddressController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before { sign_in user }

  describe "#index" do
    context "when the address parameter is provided" do
      it "calls the SearchAddressService and assigns addresses" do
        get :index, params: { address: { UF: "SC", city: "palhoca", street: "candido da silva" } }

        expect(assigns(:addresses).count).to eq(8)
        expect(response).to be_successful
      end
    end

    context "when the address parameter is not provided" do
      it "returns an empty array" do
        get :index
        expect(assigns(:addresses)).to eq([])
        expect(response).to be_successful
      end
    end

    context "when the address parameter is not valid" do
      it "returns an empty array" do
        get :index, params: { address: { UF: "AA", city: "", street: "candido da silva" } }

        expect(assigns(:addresses)).to eq([])
        expect(response).to be_successful
      end
    end
  end
end
