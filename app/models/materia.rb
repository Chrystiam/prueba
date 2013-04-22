class Materia < ActiveRecord::Base
	has_many :horarios
	has_many :instructor
	belongs_to :asignatura
  attr_accessible :nombre_materia, :asignatura_id

  validate :nombre_materia, :presence => true, :uniqueness => true, :length => {:maximum => 80}

  def self.search(search)

  	if search
		where('nombre_materia like ?', "%#{search}%")
	else
		scoped
	end		
  	
  end
end
