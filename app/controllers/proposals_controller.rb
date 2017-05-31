class ProposalsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @proposal = Proposal.find(params[:id])
  end

  def create
  end

  def new
  end

  def update
  end

  def edit
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    redirect_to root
  end
end
