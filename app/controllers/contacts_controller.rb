class ContactsController < ApplicationController
  layout "contacts"
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
      @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact= Contact.new(contact_params)
    @contact.user_id = current_user.id if current_user
    respond_to do |format|
      if @contact.save!
        format.html { redirect_to @contact, notice: 'contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white contact through.
    def contact_params
      params.fetch(:contact).permit(:first_name, :last_name, :email, :address, 
                                    :address_formatted_address,
                                    :address_street_number,
                                    :address_street_name,
                                    :address_street,
                                    :address_city,
                                    :address_zip_code,
                                    :address_department,
                                    :address_department_code,
                                    :address_state,
                                    :address_state_code,
                                    :address_country,
                                    :address_country_code,
                                    :address_lat,
                                    :address_lng,
                                    )
    end
end
