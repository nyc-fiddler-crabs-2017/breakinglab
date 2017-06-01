class ExperimentsController < ApplicationController
  include SessionsHelper
  def new
    @experiment = Experiment.new
    @proposal = Proposal.find(params[:proposal_id])
    @user = User.find(params[:user_id])
  end

  def create
    @user = current_user
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = @user.experiments.new(experiment_params)

    # @proposal.experiments()
    if @experiment.save
      redirect_to user_proposal_path(@proposal.proposer, @proposal)
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
    @user = current_user
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = Experiment.find_by(id: params[:id])
    if current_user == @experiment.experimenter
      if @experiment.update(experiment_update_params)
        redirect_to user_proposal_path(@experiment.proposal.proposer, @experiment.proposal)
      else
        @errors = @experiment.errors.full_messages
        render '/experiments/edit'
      end
    else
      redirect_to @experiment
    end
  end

  def destroy
    @proposal = Proposal.find(params[:proposal_id])
    @experiment = Experiment.find_by(id: params[:id])
    if current_user == @experiment.experimenter
      @experiment.destroy
      redirect_to user_proposal_path(@experiment.proposal.proposer, @experiment.proposal)
    else
      redirect_to @experiment
    end
  end

  private
  def experiment_update_params
    params.require(:experiment).permit(:title, :proposal_id, :results, :conclusions)
  end
  def experiment_params
    params.require(:experiment).permit(:title, :proposal_id)
  end
end
