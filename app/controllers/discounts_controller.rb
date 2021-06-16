class DiscountsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
    ## @three_holidays =
  end

  def show
    @discount = Discount.find(params[:id])
    @merchant = @discount.merchant
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    discount = @merchant.discounts.new({percent: params[:percent], quantity: params[:quantity]})
    if discount.save
      redirect_to "/merchants/#{@merchant.id}/discounts"
    else
      flash[:alert] = "ERROR: Please enter percentage & quantity"
      redirect_to "/merchants/#{@merchant.id}/discounts/new"
    end
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def edit
    @discount = Discount.find(params[:id])
    @merchant = @discount.merchant
  end

  def update
    discount = Discount.find(params[:id])
    @merchant = discount.merchant
    discount.update!({
      percent: params[:percent],
      quantity: params[:quantity]
      })
    flash[:notice] = "Discount was successfully updated."
    redirect_to "/merchants/#{@merchant.id}/discounts/#{discount.id}"
  end

  def destroy
    discount = Discount.find(params[:id])
    merchant = discount.merchant
    discount.destroy
    redirect_to "/merchants/#{merchant.id}/discounts"
  end
end
