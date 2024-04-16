class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
    render :new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to settings_path, notice: 'Successfully added'
    else
      render :new
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  private

  def payment_params
    params.require(:payment).permit(:card_number, :cvv, :expiry_date)
  end
end
