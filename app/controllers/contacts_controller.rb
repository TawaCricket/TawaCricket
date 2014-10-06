class ContactsController < ApplicationController

def index
  @contact=Contact.new
end

def new
  @contact = Contact.new
end

def all_contacts
  @contact = Junior.all
  render :partial => 'all', :layout => false
end

def create 
  @contact=Contact.new(contact_params)
  respond_to do |format|
    if @contact.save
      format.html{redirect_to @contact, notice: 'Question has been recieved'}
      format.json{head :no_content}
    else
      format.html{redirect_to @contact, notice: 'Question has not been recieved'}
      format.json{head :no_content}
    end
  end
end


def contact_params
  params.require(:contact).permit(:name, :email, :question)
end
end
