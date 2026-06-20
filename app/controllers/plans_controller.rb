class PlansController < ApplicationController
    before_action :authenticate_user!
    before_action :set_plan, only: [:show, :edit, :update, :destroy]

    def index
        @plan = Plan.all
    end

    def show
    end

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(plan_params)
        if @plan.save
            redirect_to @plan, notice: "Plano criado!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @plan.update(plan.params)
            redirect_to @plan, notice: "Plano atualizado"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @plan.destroy, notice: "!!!!Plano removido!!!!"
        redirect_to plan_path
    end

    private

    def set_plan
        @plan = Plan.find(params[:id])
    end

    def plan_params
        params.require(:plan).permit(:active, :duration_days, :name_plan, :price)
    end
end
