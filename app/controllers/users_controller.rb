class UsersController < ApplicationController

    def index
        @users = User.all.order(created_at: :desc)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: "Usuário excluido com sucesso"
    end
end
