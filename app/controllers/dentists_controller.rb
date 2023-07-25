class DentistsController < ApplicationController
  before_action :set_dentist, only: %i[ show edit update destroy ]

  # GET /dentists or /dentists.json
  def index
    @dentists = Dentist.all
  end

  # GET /dentists/1 or /dentists/1.json
  def show
  end

  # GET /dentists/new
  def new
    @dentist = Dentist.new
  end

  # GET /dentists/1/edit
  def edit
  end

  def search
    @dentists = Dentist.where("nome LIKE ?", "%#{params[:query]}%")
  end

  # POST /dentists or /dentists.json
  def create
    @dentist = Dentist.new(dentist_params)

    respond_to do |format|
      if @dentist.save
        format.html { redirect_to dentist_url(@dentist), notice: "Dentist was successfully created." }
        format.json { render :show, status: :created, location: @dentist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dentist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dentists/1 or /dentists/1.json
  def update
    respond_to do |format|
      if @dentist.update(dentist_params)
        format.html { redirect_to dentist_url(@dentist), notice: "Dentist was successfully updated." }
        format.json { render :show, status: :ok, location: @dentist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dentist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dentists/1 or /dentists/1.json
  def destroy
    @dentist.destroy

    respond_to do |format|
      format.html { redirect_to dentists_url, notice: "Dentist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dentist
      @dentist = Dentist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dentist_params
      params.require(:dentist).permit(:nome, :cpf, :email, :especialidade, :cro, :inicio_horario_atendimento, :termino_horario_atendimento)
    end
end
