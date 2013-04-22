class CreateMaterias < ActiveRecord::Migration
  def change
    create_table :materias do |t|
      t.string :nombre_materia
      t.references :asignatura

      t.timestamps
    end
    add_index :materias, :asignatura_id
  end
end
