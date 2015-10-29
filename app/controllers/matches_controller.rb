class MatchesController < ApplicationController
  before_filter :current_user
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  # after_save :alert_match, only: [:create]

  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
  end

  def edit; end

  def create
    if @user.user_type == "host"
      match = Match.find_by(post_id: @user.post.id, profile_id: params[:profile_id])
      # if the match record doesn't exist, create it
      if match.nil?
        create_match = Match.create(post_id: @user.post.id, profile_id: params[:profile_id], host_approved_seeker?: params[:bool])
        render nothing: true
      # if the seeker already has selected the 'no button', then update the record
      elsif match.seeker_approved_host? == false
        match.update_columns(host_approved_seeker?: params[:bool])
        render nothing: true
      # if they both approve each other, then send an alert to the user
      elsif match.seeker_approved_host?
        match.update_columns(host_approved_seeker?: params[:bool])
        if match.host_approved_seeker?
          render json: {message: "hey"}
        elsif match.host_approved_seeker? == false
          render nothing: true
        end
      else
        render nothing: true
      end

    elsif @user.user_type == "seeker"
      match = Match.find_by(profile_id: @user.profile.id, post_id: params[:post_id])
      if match.nil?
        create_match = Match.create(profile_id: @user.profile.id, post_id: params[:post_id], seeker_approved_host?: params[:bool])
        render nothing: true
      elsif match.host_approved_seeker? == false
        match.update_columns(seeker_approved_host?: params[:bool])
        render nothing: true
      elsif match.host_approved_seeker?
        match.update_columns(seeker_approved_host?: params[:bool])
        if match.seeker_approved_host?
          render json: {message: "hey"}
        elsif match.seeker_approved_host? == false
          render nothing: true
        end
      else
        render nothing: true
      end
    end
  end


  

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  # def update
  #   respond_to do |format|
  #     if @match.update(match_params)
  #       format.html { redirect_to @match, notice: 'Match was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @match }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @match.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /matches/1
  # DELETE /matches/1.json
  # def destroy
  #   @match.destroy
  #   respond_to do |format|
  #     format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def match_params
    params.require(:match).permit(:post_id, :profile_id, :seeker_approved_host?, :host_approved_seeker?)
  end
end
