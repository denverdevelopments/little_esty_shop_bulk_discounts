class Admin::MerchantsController < ApplicationController
<<<<<<< HEAD
  before_action :set_merchant, only: [:show, :edit, :update]
  def index
    @merchants = Merchant.all
    @enabled_merchants = Merchant.enabled
    @disabled_merchants = Merchant.disabled
  end

  def show
  end

  def create
    Merchant.create!(name: params[:name],
                     id: find_new_id)
    flash.notice = 'Merchant Has Been Created!'
    redirect_to admin_merchants_path
  end

  def edit
  end

  def update
    if @merchant.update(merchant_params)
      flash.notice = "Merchant Has Been Updated!"
      redirect_to admin_merchant_path(@merchant)
    else
      flash.notice = "All fields must be completed, get your act together."
      redirect_to edit_admin_merchant_path(@merchant)
    end
  end

  private
  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    params.require(:merchant).permit(:name)
  end

  def find_new_id
    Merchant.last.id + 1
  end
end
=======
  before_action(:set_merchant, only: [:show, :edit, :update])

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def index
    @enabled_merchants = Merchant.enabled #TODO: better here or in view?
    @disabled_merchants = Merchant.disabled
    @top_five_by_revenue = Merchant.top_five_by_revenue
  end

  def show
    @merchant
  end

  def edit
    @merchant
  end

  def update
    @merchant.update(merchant_params)
    if params[:status].present?
      redirect_to "/admin/merchants", notice: "Merchant successfully updated."
    else
      redirect_to "/admin/merchants/#{@merchant.id}", notice: "Merchant successfully updated."
    end
  end

  def new
  end

  def create
    if merchant_params[:status] == 'enabled' || merchant_params[:status] == 'disabled'
      merchant = Merchant.new(merchant_params)
    else
      redirect_to '/admin/merchants/new', notice: "Invalid Status"
      return
    end

    if merchant.save
      redirect_to '/admin/merchants', notice: "Merchant Successfully Created"
    else
      redirect_to "/admin/merchants/new"
      flash[:alert] = "Error: #{error_message(merchant.errors)}"
    end
  end

  private
  def merchant_params
    if params[:status].present?
      params.permit(:status)
    else
      params.require(:merchant).permit(:name, :status)
    end
  end
end
>>>>>>> bulk
