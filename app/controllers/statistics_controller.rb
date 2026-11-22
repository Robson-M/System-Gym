class StatisticsController < ApplicationController
  def index
    @stats = GymStatistics.new
  end
end
