class ListsController < ApplicationController
  layout "dashboard"
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :set_select_collections, only: [:edit, :update, :new, :create]

  # GET /lists
  # GET /lists.json
  def index
    if current_user.admin
      @lists = List.all
    else
      @lists = current_user.lists
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    render layout: "contacts"
  end

  # GET /lists/new
  def new
    if current_user.contacts.length == 0
      flash[:notice] = "Please add some contacts first"  
      redirect_to new_contact_path 
    else
      @list = List.new
    end
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list= List.new(list_params)
    @list.user_id = current_user.id if current_user
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.fetch(:list).permit(:title, :contact_ids => [])
    end

    def set_select_collections
      @contacts = current_user.contacts
    end
end

