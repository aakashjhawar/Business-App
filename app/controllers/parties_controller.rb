class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  # GET /parties
  # GET /parties.json
  def index
    # @parties = Party.search(params[:search])
    if params[:search].blank?  
      @parties = Party.order(:party_name).paginate(:page => params[:page], :per_page => 7)
    else  
      print("---------------Party---------------") 
      @parameter = params[:search].downcase  
      @parties = Party.search(@parameter).order(:party_name).paginate(:page => params[:page], :per_page => 7)
      end
  end

  # def search  
  #   if params[:search].blank?  
  #     redirect_to(parties_path, alert: "Empty field!") and return  
  #   else  
  #     @parameter = params[:search].downcase  
  #     @results = Party.search(@parameter)
  #     end  
  # end 

  # GET /parties/1
  # GET /parties/1.json
  def show
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:party_name, :party_code)
    end
end
