class ProceduresController < ApplicationController

  def new
    @user = current_user
    @proposal = Proposal.find_by(id: params[:proposal_id])
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @procedure = Procedure.new
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @proposal = Proposal.find_by(id: params[:proposal_id])
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @procedure = @experiment.procedures.new(procedure_params)

    if @procedure.save
      redirect_to user_proposal_experiment_path(@user, @proposal, @experiment)
    else
      @errors = @procedure.errors.full_messages
      render 'new'
    end
  end

  def edit
    if logged_in?
      @user = User.find_by(id: params[:user_id])
      @proposal = Proposal.find_by(id: params[:proposal_id])
      @experiment = Experiment.find_by(id: params[:experiment_id])
      @procedure = Procedure.find_by(id: params[:id])
      if @user != current_user
        @errors = ["Wrong credentials"]
        render '/sessions/new'
      end
    else
      redirect_to '/login'
    end
  end

  def update
    @procedure = Procedure.find_by(id: params[:id])
    if @procedure.update(procedure_params)
      redirect_to user_proposal_experiment_url
    else
      render 'edit'
    end
  end

  def destroy
    # byebug
    @user = User.find_by(id: params[:user_id])
    @procedure = Procedure.find_by(id: params[:id])
    @experiment = Experiment.find_by(id: params[:experiment_id])

    @procedure.destroy

    redirect_to user_proposal_experiment_path(@user, @proposal, @experiment)
  end

  private
  def procedure_params
    params.require(:procedure).permit(:steps, :experiment_id)
  end
end
