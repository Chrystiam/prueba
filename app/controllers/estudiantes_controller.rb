class EstudiantesController < ApplicationController

  before_filter :find_asignatura_estudiante
  helper_method :sort_column, :sort_direction
  def index
    @nxp = (params[:registros] != nil)? params[:registros].to_i : 3
    if ((@nxp) <= 0)
      @nxp = 3
    end
    @estudiantes = @asignatura.estudiantes.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(@nxp)

    respond_to do |format|
      format.html # index.html.erb
      format.xml {render :xml => @estudiantes} 
    end
  end

  def show 
  end

  def new
    @estudiante = Estudiante.new
  end

  def edit 
  end

  def create
    @estudiante = Estudiante.new(params[:estudiante])
    @asignatura = Asignatura.find(params[:asignatura_id])
    @estudiante.asignatura_id = @asignatura.id
    render :action => :new unless @estudiante.save
  end

  def update
    render :action => :edit unless @estudiante.update_attributes(params[:estudiante])
  end

  def destroy
    @estudiante.destroy
  end  

  private
  def find_asignatura_estudiante
    @asignatura = Asignatura.find(params[:asignatura_id])
    @estudiante = Estudiante.find(params[:id]) if params[:id]
  end

  def sort_column
    Estudiante.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
