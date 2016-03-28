class ContactsController < ApplicationController

  def index
    contacts = User.find_by_id(params[:user_id]).contacts
    render json: contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find_by_id(params[:id])
    if contact
      render json: contact
    else
      render text: "Contact not found", status: :not_found
    end
  end

  def update
    contact = Contact.find_by_id(params[:id])
    if contact
      contact.update(contact_params)
      render json: contact
    else
      render text: "Contact not found", status: :not_found
    end
  end

  def destroy
    Contact.delete(params[:id])
    render text: "Contact has been destroyed"
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
