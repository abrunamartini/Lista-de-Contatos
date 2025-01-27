module Contacts
  class CreateContract < Dry::Validation::Contract
    params do
      required(:name).filled(:string)
      required(:phone).filled(:string)
      required(:cpf).filled(:string)
      optional(:birthday).maybe(:date)
      required(:address).hash do
        required(:zip).filled(:string)
        required(:street).filled(:string)
        required(:city).filled(:string)
        required(:UF).filled(:string)
        optional(:complement).maybe(:string)
        optional(:country).maybe(:string)
        required(:number).filled(:integer)
      end
    end
  end
end
