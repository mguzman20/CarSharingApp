class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show edit update delete]
  before_action :authenticate_user!, only: %i[new edit update delete]
  # GET /publications or /publications.json
  def index
    @publications = Publication.all
    @solicituds = {}
    @publications.each do |publication|
      @solicituds[publication.id] = publication.solicituds.order(created_at: :desc)
    end
    @publications = Publication.filter(params.slice(:tipo))
  end

  # GET /publications/no_reg
  def no_reg
    @publications = Publication.all
    @publications = Publication.filter(params.slice(:tipo))
  end

  # GET /publications/1 or /publications/1.json
  def show
    @publication = Publication.find(params[:id])
    @solicituds = @publication.solicituds
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
    @publication = Publication.find(params[:id])
  end

  # POST /publications or /publications.json
  def create
    @publication = Publication.new(publication_params)
    @publication.user = current_user

    respond_to do |format|
      if @publication.save
        format.html { redirect_to publication_url(@publication), notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    @publication = Publication.find(params[:id])

    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to publication_url(@publication), notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def delete
    @publication = Publication.find(params[:id])
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to publications_url, notice: "Publication was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_publication; end

  # Only allow a list of trusted parameters through.
  def publication_params
    params.require(:publication).permit(:dia, :salida, :hora, :tipo, :limite, :direccion, :user_id)
  end

  def filtering_params(params)
    params.slice(:tipo)
  end
end
