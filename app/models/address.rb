class Address < ApplicationRecord
  STATES = %w[AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO].freeze

  belongs_to :contact

  after_validation :geocode

  geocoded_by :full_address, latitude: :lat, longitude: :lon

  validates :zip, :UF, :city, :street, :number, presence: true
  validates :UF, inclusion: { in: STATES }

  def full_address
    "#{street}, #{number} - #{city}, #{zip}"
  end
end
