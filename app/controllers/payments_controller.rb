class PaymentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_payment, only: [:edit, :update]

    def index
        @payment = Payment.all
    end

    # def show
    # end

    def new
        @payment = Payment.new
    end

    def create
        @payment = Payment.new(payment_params)
        if @payment.save
            redirect_to @payment, notice: "Pagamento realizado com sucesso!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    # def edit
    # end

    # def update
    #     if @payment.update(payment_params)
    #         redirect_to @payment,
    #     else
    #         render :edit, status: :unprocessable_entity
    #     end
    # end

    # def destroy
    #     @payment.destroy, notice: "Pagamento excluido."
    #     redirect_to payment_path
    # end

    private

    def set_payment
        @payment = Payment.find(params[:id])
    end

    def payment_params
        params.require(:payment).permit(:amount, :due_date, :paid_at, :payment_method, :status)
    end
end
