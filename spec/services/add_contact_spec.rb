require "rails_helper"

RSpec.describe AddContactService, type: :service do
  let(:user) { FactoryBot.create(:user) }

  describe "create contact" do
    context "success" do
      let(:params) do
        {
          name: "Bruna Martini", cpf: "10194906914", phone: "48996716028", user: user,
          address: { zip: "88138300", city: "palhoca", UF: "SC", street: "Rua 1", number: 12, country: "Brasil" }
        }
      end

      it "create contact" do
        expect(AddContactService.new(params).call).to eq({ success: I18n.t("contacts.messages.success"), contact: Contact.first })
      end
    end
  end
end
