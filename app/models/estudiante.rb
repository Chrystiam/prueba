class Estudiante < ActiveRecord::Base
  belongs_to :asignatura
  attr_accessible :apellido, :cedula, :direccion, :nombre, :telefono, :asignatura_id

  validates :nombre, :presence => true, :length => {:maximum => 80}
  validates :apellido, :presence => true, :length => {:maximum => 80}
  validates :cedula, :presence => true, :uniqueness => true, :length => {:maximum => 18}
  validates :telefono, :presence => true, :uniqueness => true, :length => {:maximum => 20}
  validates :direccion, :presence => true, :uniqueness => true 
  def self.search(search)

  	where('nombre like ?', "%#{search}%")
  	
  end
end
