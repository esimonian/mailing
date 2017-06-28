class CampaignsController < ApplicationController
  layout "dashboard"
  

  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :set_select_collections, only: [:edit, :update, :new, :create]
  
  # GET /campaigns
  def index
    if current_user.admin
      @campaigns = Campaign.all
    else
      @campaigns = current_user.campaigns
    end
  end

  # GET /campaigns/1
  def show
  end

  # GET /campaigns/new
  def new
    if current_user.templates.length == 0
      flash[:notice] = "Please create a template first"  
      redirect_to new_template_path 
    elsif current_user.lists.length == 0
      flash[:notice] = "Please create some listsfirst"  
      redirect_to new_list_path 
    else
      @campaign = Campaign.new
    end
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id if current_user
    @campaign.draft!
    if @campaign.save
      redirect_to @campaign, notice: 'Campaign was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: 'Campaign was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def campaign_params
      params.require(:campaign).permit(:title, :description, :status, :template_id, :list_ids => [])
    end

    def set_select_collections
      @templates = current_user.templates
      @lists = current_user.lists
    end
end
