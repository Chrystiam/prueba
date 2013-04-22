class CreateAsignaturas < ActiveRecord::Migration
  def change
    create_table :asignaturas do |t|
      t.string :nombre_asignatura
      t.string :ficha

      t.timestamps
    end
  end
end
