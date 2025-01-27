require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:phone) }
  it { should validate_uniqueness_of(:cpf).scoped_to(:user_id) }
end
