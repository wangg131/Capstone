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
      match = Match.find_or_create_by( post_id: @user.post.id,
                                        profile_id: params[:profile_id])
      match.update_columns(host_approved?: params[:approved])

      render json: { created: true }, status: :ok

      # respond_to do |format|
      #   format.html {render html: "hey"}
      #   format.js
      # end
    elsif @user.user_type == "seeker"
      match = Match.find_or_create_by( profile_id: @user.profile.id,
                                        post_id: params[:post_id])
      match.update_columns(seeker_approved?: params[:approved])
      # match.post = @user.profile
      respond_to do |format|
          # raise
          # if match.host_approved? && match.seeker_approved?
          #   flash[:notice] = "Order created - Click <a href='#{user_path(@user.id)}'>here</a> to go back to account!".html_safe
            # flash[:notice] = "link_to, "hey", '/users/#{@user.id}'}".html_safe
            # raise
          # end
        format.html {render html: "hey"}
        format.js
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

  def alert_match
    if match.host_approved? && match.seeker_approved?
      flash[:notice] = "Order created - Click <a href='#{user_path(@user.id)}'>here</a> to go back to account!".html_safe
    end
  end

  def match_params
    params.require(:match).permit(:post_id, :profile_id, :approved?)
  end
end
