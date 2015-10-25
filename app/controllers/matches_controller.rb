class MatchesController < ApplicationController
  before_filter :current_user
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.find_or_create_by( post_id: @current_user.id,
                                      profile_id: params[:profile_id],
                                      approved?: params[:approved])

    respond_to do |format|
      format.html {render html: "hey"}
      format.js
    end
  end

    # respond_to do |format|
    #   if @match.save
    #     format.html { redirect_to @match, notice: 'Match was successfully created.' }
    #     format.json { render :show, status: :created, location: @match }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @match.errors, status: :unprocessable_entity }
      # end

  # end

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
    params.require(:match).permit(:post_id, :profile_id, :approved?)
  end
end
