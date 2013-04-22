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
        "horario_#{@hclass HorarioPdf < Prawn::Document

  def initialize(horario,view)
  super()
  @horario = horario
  @view = view
  logo
  deliver_details
  horario_details
  end

  def logo
  logopath ="#{Rails.root}/app/assets/images/rails.png"
  image logopath, :width => 50,:heigth => 20
  move_down 10
  draw_text "Mi segundo PDF con Rails",:at => [150,650],size:30
  end


  def deliver_details
    move_down 60
    text "Horario Del Curso:
   #{@horario.asignatura.nombre_asignatura} ", :size => 13
  end

  def horario_details
    move_down 60
    dia = @horario.dia
    hora = @horario.hora
    aula = @horario.aula
    materia = @horario.materia.nombre_materia
    instructor = @horario.instructor.nombre
    asignatura = @horario.asignatura.nombre_asignatura
    table ([["Dia","#{dia}"],
      ["Hora","#{hora}"],
      ["Aula","#{aula}"],
      ["Materia","#{materia}"],
      ["instructor","#{instructor}"],
      ["Curso","#{asignatura}"],
    ]),
    :width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 100, 2 => 50}
      columns(3).font_style = :bold
    end 
  end
end oclass HorarioPdf < Prawn::Document

  def initialize(horario,view)
  super()
  @horario = horario
  @view = view
  logo
  deliver_details
  horario_details
  end

  def logo
  logopath ="#{Rails.root}/app/assets/images/rails.png"
  image logopath, :width => 50,:heigth => 20
  move_down 10
  draw_text "Mi segundo PDF con Rails",:at => [150,650],size:30
  end


  def deliver_details
    move_down 60
    text "Horario Del Curso:
   #{@horario.asignatura.nombre_asignatura} ", :size => 13
  end

  def horario_details
    move_down 60
    dia = @horario.dia
    hora = @horario.hora
    aula = @horario.aula
    materia = @horario.materia.nombre_materia
    instructor = @horario.instructor.nombre
    asignatura = @horario.asignatura.nombre_asignatura
    table ([["Dia","#{dia}"],
      ["Hora","#{hora}"],
      ["Aula","#{aula}"],
      ["Materia","#{materia}"],
      ["instructor","#{instructor}"],
      ["Curso","#{asignatura}"],
    ]),
    :width => 500 do
      columns(1).align = :center
      self.header = true
      self.column_widths = {0 => 100, 2 => 50}
      columns(3).font_style = :bold
    end 
  end
end rario.asignatura.nombre_asignatura}.pdf", 
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
