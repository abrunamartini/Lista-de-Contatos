require "rails_helper"

RSpec.describe UpdateContactService, type: :service do
  let(:user) { FactoryBot.create(:user) }

  describe "update contact" do
    context "success - update contact" do
      let(:contact) { create :contact, name: "Bruna Martini Duarte", user: user }

      let(:params) do
        {
          name: "Bruna Martini"
        }
      end

      it "update contact" do
        result = UpdateContactService.new(contact, params).call

        expect(result).to eq({ success: I18n.t("contacts.messages.success"), contact: contact })
      end
    end
  end
end
