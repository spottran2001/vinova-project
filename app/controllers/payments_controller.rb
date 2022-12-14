class PaymentsController < ApplicationController
	def index
	end

	def new
		@payment = Payment.new
	end

	def create
		@payment = Payment.new(payment_params)

		if @payment.save
			@payment.order.status = "completed"
		end
	end

	private

	def payment_params
		params.require(:payment).permit()
	end
end
