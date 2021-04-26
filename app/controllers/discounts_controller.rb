class DiscountsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
    @three_holidays = @discounts##

    # @merchant = Merchant.find(params[:merchant_id])
    # @enabled_items = Item.all.enabled
    # @disabled_items = Item.all.disabled
    # @top_items = Item.top_five_items(@merchant.id)
    # @top_days = @top_items.map {|item| item.item_best_day.first}
  end

  def show
    @discount = Discount.find(params[:id])

    # @item = Item.find(params[:id])
    # @merchant = @item.merchant
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    discount = @merchant.discounts.new({percent: params[:percent], quantity: params[:quantity]})
    if discount.save
      redirect_to "/merchants/#{@merchant.id}/discounts"
    else
      flash[:alert] = "ERROR: Discount not created."
      redirect_to "/merchants/#{@merchant.id}/discounts/new"
    end
  end

  def new
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
  end
end
