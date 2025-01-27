FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    cpf { CPF.generate }
    phone { Faker::PhoneNumber.phone_number }

    association :user, factory: :user

    after(:create) do |contact|
      create(:address, contact: contact)
    end
  end
end
