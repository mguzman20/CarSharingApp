class SolicitudsController < ApplicationController
  before_action :set_solicitud, only: %i[show edit update delete]
  before_action :authenticate_user!
  # GET /solicituds or /solicituds.json
  def index
    @solicituds = Solicitud.all
  end

  def chats
    @solicituds = Solicitud.all
  end

  def room
    @solicituds = Solicitud.all
    @solicitud = Solicitud.find(params[:id])
    @message = Message
    @messages = Message.all
  end

  # GET /solicituds/1 or /solicituds/1.json
  def show; end

  # GET /solicituds/new
  def new
    @publication_id = params[:publication_id]
    @solicitud = Solicitud.new
  end

  # GET /solicituds/1/edit
  def edit; end

  # POST /solicituds or /solicituds.json
  def create
    solicitud_params[:publication_id] = params[:publication_id].to_i
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.user = current_user
    @solicitud.estado = 'pendiente'
    respond_to do |format|
      if @solicitud.save
        format.html { redirect_to solicituds_url(@solicitud), notice: 'Solicitud was successfully created.' }
        format.json { render :show, status: :created, location: @solicitud }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicituds/1 or /solicituds/1.json
  def update
    @solicitud = Solicitud.find(params[:id])
    respond_to do |format|
      if @solicitud.update(solicitud_params)
        format.html { redirect_to solicitud_url(@solicitud), notice: 'Solicitud was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitud }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicituds/1 or /solicituds/1.json
  def delete
    @solicitud = Solicitud.find(params[:id])
    @id_publication = @solicitud.publication
    @solicitud.destroy

    respond_to do |format|
      format.html { redirect_to solicituds_url, notice: 'Solicitud was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_solicitud
    @solicitud = Solicitud.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def solicitud_params
    params.require(:solicitud).permit(:descripcion, :user_id, :publication_id, :estado)
  end
end
