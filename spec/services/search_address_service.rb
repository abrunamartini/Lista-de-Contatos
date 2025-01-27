require "rails_helper"

RSpec.describe SearchAddressService, type: :service do
  let(:service) { SearchAddressService.new(address_params) }

  describe "#call" do
    context "when the address is valid" do
			let(:address_params) { UF: "SP", city: "Sao Paulo", street: "Avenida Paulista" }

      it "returns the address successfully" do
        result = service.call
        expect(result).not_to eq([])
      end
    end

    context "when the address is invalid or not found" do
			let(:address_params) { UF: "AA", city: "Sao Paulo", street: "Avenida Paulista" }

      it "returns an empty array when no address is found" do
        result = service.call
        expect(result).to eq([])
      end
    end
  end
end
