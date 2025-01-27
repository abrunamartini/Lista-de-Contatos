require "rails_helper"

RSpec.describe ContactsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before { sign_in user }

  describe "#index" do
    before do
      create :contact, name: "Bruna Martini Duarte", user: user
      create :contact, name: "Lucas Guilherme Duarte", user: user
      create :contact, name: "Luiza Batista de Oliveira"
    end

    context "when the filter parameter is filled" do
      it "return just a contact" do
        get :index, params: { query: "Bruna Martini" }

        expect(assigns(:contacts).first.name).to eq("Bruna Martini Duarte")
        expect(assigns(:contacts).count).to eq(1)
        expect(response).to be_successful
      end
    end

    context "when the filter parameter is empty" do
      it "returns an full array" do
        get :index

        expect(assigns(:contacts)).to eq(Contact.where(user: user))
        expect(assigns(:contacts).count).to eq(2)
        expect(response).to be_successful
      end
    end
  end

  describe "#show" do
    let(:contact) { create :contact, name: "Bruna Martini Duarte", user: user }

    it "show contact" do
      get :show, params: { id: contact.id }

      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "#create" do
    let(:params) do
      {
        contact: {
          name: "Bruna Martini", cpf: "10194906914", phone: "48996716028",
          address: { zip: "88138300", city: "palhoca", UF: "SC", street: "Rua 1", number: 12, country: "Brasil " }
        }
      }
    end

    it "create contact" do
      post :create, params: params

      expect(Contact.first.name).to eq("Bruna Martini")
    end
  end

  describe "#update" do
    let(:contact) { create :contact, name: "Bruna Martini Duarte", user: user }

    let(:params) do
      {
        id: contact.id,
        contact: {
          name: "José da Rocha", cpf: "10194906914", phone: "48996716028",
          address: { zip: "88138300", city: "palhoca", UF: "SC", street: "Rua 1", number: 12, country: "Brasil " }
        }
      }
    end

    it "update contact" do
      put :update, params: params

      expect(contact.reload.name).to eq("José da Rocha")
    end
  end

  describe "#destroy" do
    let(:contact) { create :contact, name: "Bruna Martini Duarte", user: user }

    it "delete contact" do
      delete :destroy, params: { id: contact.id }

      expect(Contact.count).to eq(0)
    end
  end
end
