class HorariosController < ApplicationController

  helper_method :sort_column, :sort_direction
  def index

    @nxp = (params[:registros] != nil)? params[:registros].to_i : 3

    if ((@nxp) <= 0)
      @nxp = 3
    end

    @horarios = Horario.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).per_page(@nxp)

    respond_to do |format|
      format.html # index.html.erb
      format.xml {render :xml => @horarios}
      #format.json { render json: @horarios }
    end
  end

  def show
    @horario = Horario.find(params[:id]) 
    respond_to do |format| 
      format.json { render json: @horario }
      format.pdf do
        pdf = HorarioPdf.new(@horario, view_context)
        send_data  pdf.render, filename:
        "horario_#{@horario.asignatura.nombre_asignatura}.pdf",
        type: "application/pdf"
      end  
    end     
  end

  def new
    @horario = Horario.new
  end

  def edit
    @horario = Horario.find(params[:id])
  end

  def create
    @horario = Horario.new(params[:horario])
    render :action => :new unless @horario.save
  end

  def update
    @horario = Horario.find(params[:id])
    render :action => :edit unless @horario.update_attributes(params[:horario])
  end

  def destroy
    @horario = Horario.find(params[:id])
    @horario.destroy
  end

  private
  def sort_column
    Horario.column_names.include?(params[:sort]) ? params[:sort] : "dia"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
