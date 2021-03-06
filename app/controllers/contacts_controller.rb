class ContactsController < ApplicationController

  def main
  end

  def index
    @contacts = Contact.all

    respond_to do |format|
      format.json { render json: @contacts, only: [:name, :email, :phone, :img]}
    end
  end

  
  def new
    @contact = Contact.new 
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |f|
      if @contact.save 
        f.json { render json: @contact, status: :created}
      else
        f.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private 
  
  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :img)
  end
end
