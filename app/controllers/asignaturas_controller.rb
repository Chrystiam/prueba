class AsignaturasController < ApplicationController
  
  before_filter :find_asignatura, :exeption => [:index, :create, :new]
  helper_method :sort_column, :sort_direction

  def index

    @nxp = (params[:registro] != nil)? params[:registro].to_i : 3

    if ((@nxp) <= 0)
      @nxp = 3
    end

    @asignaturas = Asignatura.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(@nxp)

    respond_to do |format|
      format.html # index.html.erb
      format.xml{render :xml => @asignaturas}
      #format.json { render json: @asignaturas }
    end
  end

  def show 
    @asignatura = Asignatura.find(params[:id])
  end

  def new
    @asignatura = Asignatura.new
  end

  def edit
    @asignatura = Asignatura.find(params[:id])
  end

  def create
    @asignatura = Asignatura.new(params[:asignatura])
    render :action => :new unless @asignatura.save
  end

  def update
    @asignatura = Asignatura.find(params[:id])
    render :action => :edit unless @asignatura.update_attributes(params[:asignatura])
  end

  def destroy
    @asignatura = Asignatura.find(params[:id])
    @asignatura.destroy
  end  

  private
  def find_asignatura
    @asignatura = Asignatura.find(params[:id]) if params[:id]
  end

  def sort_column
    Asignatura.column_names.include?(params[:sort]) ? params[:sort] : "nombre_asignatura"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
