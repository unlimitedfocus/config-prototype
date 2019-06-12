class EnvfilesController < ApplicationController
  before_action :set_envfile, only: [:show, :edit, :update, :destroy]

  # GET /envfiles
  # GET /envfiles.json
  def index
    @envfiles = Envfile.all
  end

  # GET /envfiles/1
  # GET /envfiles/1.json
  def show
  end

  # GET /envfiles/new
  def new
    @envfile = Envfile.new
  end

  # GET /envfiles/1/edit
  def edit
  end

  # POST /envfiles
  # POST /envfiles.json
  def create
    @envfile = Envfile.new(envfile_params)

    respond_to do |format|
      if @envfile.save
        format.html { redirect_to @envfile, notice: 'Envfile was successfully created.' }
        format.json { render :show, status: :created, location: @envfile }
      else
        format.html { render :new }
        format.json { render json: @envfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /envfiles/1
  # PATCH/PUT /envfiles/1.json
  def update
    respond_to do |format|
      if @envfile.update(envfile_params)
        format.html { redirect_to @envfile, notice: 'Envfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @envfile }
      else
        format.html { render :edit }
        format.json { render json: @envfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /envfiles/1
  # DELETE /envfiles/1.json
  def destroy
    @envfile.destroy
    respond_to do |format|
      format.html { redirect_to envfiles_url, notice: 'Envfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_envfile
      @envfile = Envfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def envfile_params
      params.require(:envfile).permit(:filename, :namespace_id, :filetype, :deleted_at)
    end
end
