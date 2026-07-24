class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [ :show, :edit, :update, :destroy ]

    # def index
    #     @user = User.all
    # end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: "Usuario cadastrado!"
        else
            flash.now[:alert] = "Erro ao cadastrar usuario. Verifique os campos informados."
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @user.update(user.params)
            redirect_to @user, notice: "Usuario atualizado!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
        redirect_to user_path, notice: "Usuario removido."
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:cpf, :encrypted_password, :role)
    end
end
