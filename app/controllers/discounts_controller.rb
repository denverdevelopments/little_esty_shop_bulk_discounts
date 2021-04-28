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
    @merchant = @discount.merchant

    # @item = Item.find(params[:id])
    # @merchant = @item.merchant
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
# <%= form_with url:"/merchants/#{@merchant.id}/discounts", method: :post, local: true do |form| %>


  def edit
    @discount = Discount.find(params[:id])
    @merchant = @discount.merchant
  end

  def update
    discount = Discount.find(params[:id])
    @merchant = discount.merchant
    # if params[:name]
      discount.update({
        percent: params[:percent],
        quantity: params[:quantity]
        })
    # else
    #   item.update({able: params[:able]})
    # end
    if discount.save
      flash[:notice] = "Discount was successfully updated."
      redirect_to "/merchants/#{@merchant.id}/discounts"
    else
      flash[:alert] = "ERROR: Discount not updated."
      redirect_to "/merchants/#{@merchant.id}/discounts/#{discount.id}/edit"
    end
  end

  def destroy

    # Discount.find(params[:id]).destroy
    discount = Discount.find(params[:id])
    merchant = discount.merchant
    discount.destroy
    redirect_to "/merchants/#{merchant.id}/discounts"
  end
end

##SHOW
# <h1 id="disc_show">Show</h1>
#
# <section id="links">
#   <%= link_to "Discounts", "/admin/merchants" %>
#   <%= link_to "Invoices", "/admin/invoices" %>
# </section>
#
# <section id="incomplete_invoices">
#   <h2>Incomplete Invoices</h2>
#   <% @incomplete_invoices.each do |invoice| %>
#     <div id="incomplete_invoice-<%= invoice.id %>">
#       Invoice#<%= link_to "#{invoice.id}", "/admin/invoices/#{invoice.id}" %>
#       <%= invoice.created_at.strftime("%A, %B %d, %Y") %>
#     </div>
#   <% end %>
# </section>
#
# <section id="top_five_customers">
#   <h2>Top Five Customers</h2>
#   <% @top_five_customers.each do |customer| %>
#     <div id="customer-<%= customer.id %>">
#       <%= customer.first_name %>
#       <%= customer.last_name %> -
#       <%= customer.num_transactions %> purchases
#     </div>
#   <% end %>
# </section>


# <<section id="discount_show">
#   Total Revenue: $<%= @invoice.revenue %>
# </section>
#
# <section>
#   Created at: <%= @invoice.created_at.strftime("%A, %B %d, %Y") %>
# </section>
#
# <section>
#   Customer: <%= @invoice.customer.first_name%>
#             <%= @invoice.customer.last_name%>
# </section>
#
# <section id="items">
#   <h3>Items</h3>
#   <% @invoice.item_sell_info.each do |invoice_item| %>
#     <section id="item-<%= invoice_item.item.id %>">
#       <%= invoice_item.item.name %><br>
#       Quantity: <%= invoice_item.quantity %><br>
#       Sell Price: <%= invoice_item.unit_price %><br>
#       Invoice Item Status: <%= invoice_item.status %>
#     </section><br>
#   <% end %>
# </section>
