class Asignatura < ActiveRecord::Base
	has_many :estudiantes
	has_many :horarios
  attr_accessible :ficha, :nombre_asignatura 

  validate :nombre_asignatura,  :presence => true, :length => {:maximum => 70}
  validate :ficha, :presence => true, :uniqueness => true, :length => {:maximum => 70}

  def self.search(search)
  	if search
  	   where('nombre_asignatura like ?',"%#{search}%")
  	else
  		scoped
  	end	
  end
end
