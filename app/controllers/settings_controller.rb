class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gym = Gym.first
  end
end