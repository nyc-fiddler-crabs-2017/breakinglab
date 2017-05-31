class ProposalsController < ApplicationController
   def index
    @proposals = Proposal.all
  end
  
  def show
    @user = User.find(params[:user_id])
    @proposal = Proposal.find(params[:id])
  end

  def create
  end

  def new
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update(proposal_params)
      redirect_to user_proposal_url
    else
      render 'edit'
    end
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    redirect_to @proposal.proposer
  end

  private
  def proposal_params
    params.require(:proposal).permit(:summary, :hypothesis, :status)
  end

end
