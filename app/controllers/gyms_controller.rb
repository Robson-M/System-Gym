class GymsController < ApplicationController
    before_action :authenticate_user!

    def update
        @gym = Gym.find(params[:id])

        if @gym.update(gym_params)
            redirect_to settings_path, notice: "Academia atualizada com sucesso"
        else
            redirect_to settings_path, alert: "Erro ao salvar as alterações!"
        end
    end

    private

    def gym_params
        params.require(:gym).permit(:gym_name, :gym_address, :gym_phone, :gym_email)
    end
end