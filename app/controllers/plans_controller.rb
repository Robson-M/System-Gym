class PlansController < ApplicationController
    before_action :authenticate_user!
    before_action :set_plan, only: [ :show, :edit, :update, :destroy ]

    def index
        @plans = Plan.all
    end

    def show
    end

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(plan_params)
        if @plan.save
            redirect_to edit_plan_path(@plan), notice: "Plano criado!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @plan.update(plan_params)
            redirect_to plans_path, notice: "Plano atualizado"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @plan.destroy
        redirect_to plans_path, alert: "!!!!Plano removido!!!!"
    end

    private

    def set_plan
        @plan = Plan.find(params[:id])
    end

    def plan_params
        params.require(:plan).permit(:active, :duration_days, :name_plan, :price)
    end
end
