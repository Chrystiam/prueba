class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.date :dia
      t.time :hora
      t.string :aula
      t.references :materia
      t.references :instructor
      t.references :asignatura

      t.timestamps
    end
    add_index :horarios, :materia_id
    add_index :horarios, :instructor_id
    add_index :horarios, :asignatura_id
  end
end
