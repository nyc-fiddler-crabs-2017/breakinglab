class ExperimentsController < ApplicationController

  def show
    @experiment = Experiment.find_by(id: params[:id])
  end




  private

  def experiment_params
    params.require(:experiment).permit(:title)
  end
end
