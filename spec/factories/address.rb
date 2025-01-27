FactoryBot.define do
  factory :address do
    street { "Arcanjo Candido da Silva" }
    city { "palhoca" }
    UF { "SC" }
    country { "Brasil" }
    number { rand(10)  }
    zip { 88138300 }
  end
end
