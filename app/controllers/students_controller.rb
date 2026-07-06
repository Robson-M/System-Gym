class StudentsController < ApplicationController
    before_action :set_student, only: [ :show, :edit, :update, :destroy ]

    def index
        @students = Student.all
    end

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to @student, notice: "Aluno cadastrado com sucesso!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
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
        redirect_to student_path, notice: "Aluno removido."
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name_student, :phone)
    end
end
