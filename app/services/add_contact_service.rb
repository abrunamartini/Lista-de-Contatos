class AddContactService
  class ContactCreationError < StandardError; end

  def initialize(params)
    @contact_params = params.except("address")
    @address_params = params[:address]
  end

  def call
    contact = Contact.new(contact_params)
    address = Address.new(address_params.merge(contact: contact))

    ActiveRecord::Base.transaction do
      contact.save! && address.save!

      return { success: I18n.t("contacts.messages.success"), contact: contact }
    end
  rescue ActiveRecord::RecordInvalid => e
    error_messages = [ contact.errors.full_messages, address.errors.full_messages ].to_sentence

    raise ContactCreationError, I18n.t("contacts.messages.failure", error: error_messages)
  end

  private

  attr_reader :contact_params, :address_params
end
