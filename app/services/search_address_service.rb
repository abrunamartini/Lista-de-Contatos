class SearchAddressService
  def initialize(address)
    @uf = address[:UF]
    @city = address[:city].gsub(" ", "+")
    @street = address[:street].gsub(" ", "+")
  end

  def call
    addresses = ViaCepAdapter.get_address("#{uf}/#{city}/#{street}")

    addresses[:success] ? addresses[:success] : []
  end

  private

  attr_reader :uf, :city, :street
end
