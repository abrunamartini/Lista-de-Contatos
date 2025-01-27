class UpdateContactService
  class ContactError < StandardError; end

  def initialize(contact, params)
    @contact = contact
    @address = contact.address
    @contact_params = params.except("address")
    @address_params = params[:address]
  end

  def call
    ActiveRecord::Base.transaction do
      update_contact && update_address

      return { success: I18n.t("contacts.messages.success"), contact: contact }
    end
  rescue ActiveRecord::RecordInvalid => e
    error_messages = [ contact.errors.full_messages, address.errors.full_messages ].to_sentence

    raise ContactError, I18n.t("contacts.messages.failure", error: error_messages)
  end

  private

  attr_reader :contact_params, :address_params
  attr_accessor :contact, :address

  def update_address
    return true if address_params.blank?

    address.update!(address_params)
  end

  def update_contact
    return true if contact_params.blank?

    contact.update!(contact_params)
  end
end
