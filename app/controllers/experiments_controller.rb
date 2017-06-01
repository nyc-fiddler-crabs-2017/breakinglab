class ExperimentsController < ApplicationController
  include SessionsHelper
  def new
    @experiment = Experiment.new
    @proposal = Proposal.find(params[:proposal_id])
    @user = User.find(params[:user_id])
  end

  def create
    # @proposal = Proposal.find_by(:id params[:proposal_id])
    @experiment = current_user.experiments.new(experiment_params)

    # @proposal.experiments()
    if @experiment.save
      redirect_to @proposal
    else
      render '/experiments/new'
    end
  end

  def show
    @experiment = Experiment.find_by(id: params[:id])
  end

  def edit
    @experiment = Experiment.find_by(id: params[:id])
    @proposal = @experiment.proposal
    @user = User.find(params[:user_id])
    if current_user != @experiment.experimenter
      redirect_to @experiment
    end
  end

  def update
    @experiment = Experiment.find_by(id: params[:id])
    if current_user == @experiment.experimenter
      if @experiment.update(experiment_params)
        redirect_to @experiment
      else
        render '/experiments/edit'
      end
    else
      redirect_to @experiment
    end
  end

  def destroy
    @experiment = Experiment.find_by(id: params[:id])
    if current_user == @experiment.experimenter
      @experiment.destroy
      redirect_to @experiment.proposal
    else
      redirect_to @experiment
    end
  end

  private
  def experiment_params
    params.require(:experiment).permit(:title, :proposal_id)
  end
end
