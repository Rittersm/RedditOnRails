class VotesController < ApplicationController
  before_action :require_user

  def create
    @vote = current_user.votes.create!(
      value: params[:value] || 1,
      link_id: params[:link_id]
    )
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
