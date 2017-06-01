class ObservationsController < ApplicationController

  def new
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @proposal = @experiment.proposal
    @observation = Observation.new
    @user = current_user
  end

  def create
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @proposal = @experiment.proposal
    @user = @proposal.proposer
    @observation = current_user.observations.new(observation_params)
    if @observation.save
      redirect_to user_proposal_experiment_path(@user, @proposal, @experiment)
    else
      render'new'
    end
  end

  def show
    @observation = Observation.find(params[:id])
  end

  def edit
    @observation = Observation.find(params[:id])
    if @observation.observable_type == "experiment"
      @experiment = @observation.observable
    else
      @procedure = @observation.observable
    end
  end

  def destroy
    @observation = Observation.find(params[:id])
    @observation.destroy
  end

  private
  def observation_params
    params.require(:observation).permit(:body, :observable_id, :observable_type, :observer)
  end
end
