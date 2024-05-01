class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: [:edit, :update]

  def edit
    # Renders the edit form
  end

  def update
    if @payment.update(payment_params)
      flash[:success] = "Payment details updated successfully"
      redirect_to settings_path
    else
      flash[:error] = "Failed to update payment details"
      render :edit
    end
  end

  private

  def set_payment
    @payment = current_user.payment || current_user.build_payment
  end

  def payment_params
    params.require(:payment).permit(:card_number, :cvv, :expiry_date)
  end
end
