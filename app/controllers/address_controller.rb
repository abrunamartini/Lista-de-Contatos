class AddressController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    return @addresses = [] if params["address"].nil?

    @addresses = ::SearchAddressService.new(params["address"].permit(:UF, :city, :street)).call
  end
end
