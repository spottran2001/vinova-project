class PaymentsController < ApplicationController
	def index
	end

	def new
		@payment = Payment.new
	end

	def create
		@payment = Payment.new(payment_params)

		if @payment.save
			@payment.order.update(status: 'completed')

			redirect_to root_path
			#redirect_to new_payment_path, :order => @order
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def payment_params
		params.require(:payment).permit(:payment_type, :name_on_card,
																		:card_number, :expiry_date,
																		:security_code, :checkout_id,
																		:order_id)
	end
end
