class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @contacts = 
      if params[:query].present?
        current_user.contacts.includes(:address).search_contact(params[:query]).order(:name)
      else
        current_user.contacts.includes(:address)
      end

    @contacts = @contacts.order(:name).page(params[:page]).per(5)
  end

  def create
    begin
      add_contact

      redirect_to contacts_path
    rescue AddContactService::ContactCreationError => e
      flash[:alert] = e.message
      redirect_to new_contact_path
    end
  end

  def show
    contact
  end

  def update
    begin
      update_contact

      redirect_to contacts_path
    rescue UpdateContactService::ContactError => e
      flash[:alert] = e.message
      redirect_to contact_path
    end
  end

  def destroy
    contact.address&.destroy
    contact.destroy

    redirect_to contacts_path
  end


  private

  def add_contact
    ::AddContactService.new(create_params).call
  end

  def update_contact
    ::UpdateContactService.new(Contact.find(params[:id]), update_params).call
  end

  def contact
    @contact = Contact.find(params[:id])
  end

  def create_params
    params["contact"].permit(
      :name, :phone, :cpf, :birthday,
      address: [ :zip, :street, :city, :UF, :complement, :country, :number ]
    ).merge(user_id: current_user.id)
  end

  def update_params
    params["contact"].permit(
      :id, :name, :phone, :cpf, :birthday,
      address: [ :zip, :street, :city, :UF, :complement, :country, :number ]
    )
  end
end
