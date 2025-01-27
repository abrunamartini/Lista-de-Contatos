class Contact < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy

  validates :name, :cpf, :phone, presence: true
  validates :cpf, uniqueness: { scope: :user_id }
  validate :validate_cpf

  scope :search_contact, ->(param) { where("cpf LIKE :param OR name LIKE :param", param: "%#{param}%") }

  private

  def validate_cpf
    unless CPF.valid?(cpf)
      errors.add(:cpf, I18n.t("contacts.messages.invalid"))
    end
  end
end
