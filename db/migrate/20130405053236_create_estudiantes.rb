class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :nombre
      t.string :apellido
      t.string :cedula
      t.string :telefono
      t.string :direccion
      t.references :asignatura

      t.timestamps
    end
    add_index :estudiantes, :asignatura_id
  end
end
