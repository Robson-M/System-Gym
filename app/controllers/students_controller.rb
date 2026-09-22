class StudentsController < ApplicationController
    before_action :set_student, only: [ :show, :edit, :update, :destroy ]

    def index
        @students = Student.all
        @students = Student.where("name_student ILIKE ?", "%#{params[:q]}%") if params[:q].present?
        @students ||= Student.all
        @payments = Payment.all
    end

    def show
    end

    def new
        @student = Student.new
        @plans = Plan.all
    end

    def create
        @student = Student.new(student_params)

        if @student.save
            @student.payments.create!(
                plan_id: @student.plan_id,
                amount: @student.plan.price,
                payment_method: params[:payment_method],
                paid_at: Date.today,
                due_date: Date.today + @student.plan.duration_days.days,
                status: "paid"
            )
            CheckDueDatesJob.perform_now
            redirect_to @student, notice: "Aluno cadastrado com sucesso!"
        else
            @plans = Plan.all
            flash.now[:alert] = "Erro ao cadastrar aluno. Verifique os campos informados."
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @plans = Plan.all
    end

    def update
        if @student.update(student_params)
            redirect_to @student, notice: "Aluno atualizado!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @student.destroy
        redirect_to students_path, notice: "Aluno removido."
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name_student, :cpf_student, :email_student, :birth_date, :phone, :neighborhood, :street, :house_number, :status, :plan_id, :payment_method)
    end
end
