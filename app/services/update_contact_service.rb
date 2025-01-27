class UpdateContactService
  class ContactError < StandardError; end

  def initialize(contact, params)
    @contact = contact
    @contact_params = params.except("address")
    @address_params = params[:address]
  end

  def call
    address = contact.address

    ActiveRecord::Base.transaction do
      contact.update!(contact_params) && address.update!(address_params)

      return { success: I18n.t("contacts.messages.success"), contact: contact }
    end
  rescue ActiveRecord::RecordInvalid => e
    error_messages = [ contact.errors.full_messages, address.errors.full_messages ].to_sentence

    raise ContactError, I18n.t("contacts.messages.failure", error: error_messages)
  end

  private

  attr_reader :contact_params, :address_params
  attr_accessor :contact
end
