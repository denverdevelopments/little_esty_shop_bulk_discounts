class Admin::InvoicesController < ApplicationController
<<<<<<< HEAD
  before_action :set_invoice, only: [:show, :edit, :update]
  def index
    @invoices = Invoice.all
  end

  def show
  end

  def edit
  end

  def update
    @invoice.update(invoice_params)
    flash.notice = 'Invoice Has Been Updated!'
    redirect_to admin_invoice_path(@invoice)
  end

  private
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

=======
  def index
    @invoices = Invoice.all
  end  
  
  def show
    @invoice = Invoice.find(params[:id])
  end

  def update
    invoice = Invoice.find(params[:id])
    invoice.update(invoice_params)
    redirect_to "/admin/invoices/#{invoice.id}"
  end

  private
>>>>>>> bulk
  def invoice_params
    params.require(:invoice).permit(:status)
  end
end