class UsersController < ApplicationController
    def index
        @users = User.all.order(created_at: :desc)
    end

    def destroy
        @user = User.find(params[:id])

        if @user == current_user
            redirect_to users_path, alert: "Você não pode excluir a si mesmo"
        else
            redirect_to users_path, notice: "Usuário excluido com sucesso"
        end
    end
end
