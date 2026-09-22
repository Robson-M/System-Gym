class PaymentsController < ApplicationController
    before_action :set_payment, only: [ :show, :create, :edit, :update, :destroy ]

    def index
        @payments = Payment.all
        @student = Student.find(params[:student_id])
        @payments = @student.payments.order(paid_at: :desc)
        @payment = @student.payments.build
        @plans = Plan.all
    end

    def show
        @student = Student.find(params[:id])
    end

    def new
    end

    def create
        @payment = @student.payments.build(payment_params)

        if @payment.save
            redirect_to student_payments_path(@student), notice: "Pagamento realizado com sucesso!"
        else
            @payments = @student.payments.order(paid_at: :desc)
            @plans = Plan.all
            flash.now[:alert] = @payment.errors.full_messages.to_sentence
            render "payments/index", status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @payment.update(payment_params)
            redirect_to @payment, notice: "Pagamento efetuado com sucesso"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @payment = @student.payments.find(params[:id])
        @payment.destroy
        redirect_to student_payments_path(@student), notice: "Pagamento excluido."
    end

    private

    def set_payment
        @student = Student.find(params[:student_id])
    end

    def payment_params
        params.require(:payment).permit(:amount, :due_date, :paid_at, :payment_method, :status, :plan_id)
    end
end
