class ItemsController < ApplicationController
<<<<<<< HEAD
  before_action :find_item_and_merchant, only: [:show, :edit, :update]
  before_action :find_merchant, only: [:new, :create, :index]

  def index
    @enabled_items = @merchant.items.where(status: 1)
    @disabled_items = @merchant.items.where(status: 0)
  end

  def show

  end

  def edit

  end

  def update
    if @item.update(item_params)
      flash.notice = "Succesfully Updated Item Info!"
      redirect_to merchant_item_path(@merchant, @item)
    else
      flash.notice = "All fields must be completed, get your act together."
      redirect_to edit_merchant_item_path(@merchant, @item)
=======

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @enabled_items = Item.all.enabled
    @disabled_items = Item.all.disabled
    @top_items = Item.top_five_items(@merchant.id)
    @top_days = @top_items.map {|item| item.item_best_day.first}
  end

  def show
    @item = Item.find(params[:id])
    @merchant = @item.merchant
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    item = @merchant.items.new({name: params[:name], description: params[:description], unit_price: params[:unit_price], able: params[:able]})
    if item.save
      redirect_to "/merchants/#{@merchant.id}/items"
    else
      flash[:alert] = "ERROR: Item not created."
      redirect_to "/merchants/#{@merchant.id}/items/new"
>>>>>>> bulk
    end
  end

  def new
<<<<<<< HEAD

  end

  def create
    Item.create!(name: params[:name],
                description: params[:description],
                unit_price: params[:unit_price],
                id: find_new_id, merchant: @merchant)
    redirect_to merchant_items_path(@merchant)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end

  def find_item_and_merchant
    @item = Item.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_new_id
    Item.last.id + 1
=======
    @merchant = Merchant.find(params[:merchant_id])
  end

  def edit
    @item = Item.find(params[:id])
    @merchant = @item.merchant
  end

  def update
    item = Item.find(params[:id])
    @merchant = item.merchant
    if params[:name]
      item.update({
        name: params[:name],
        description: params[:description],
        unit_price: params[:unit_price],
        able: params[:able]
        })
    else
      item.update({able: params[:able]})
    end
    if item.save
      flash[:notice] = "Item was successfully updated."
      redirect_to "/merchants/#{@merchant.id}/items"
      # redirect_to "/merchants/#{@merchant.id}/items/#{item.id}"  #NOW  /items/#{item.id}
    else
      flash[:alert] = "ERROR: Item not updated."
      redirect_to "/items/#{item.id}/edit"
    end
>>>>>>> bulk
  end
end
