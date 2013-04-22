class Horario < ActiveRecord::Base
  belongs_to :materia
  belongs_to :instructor
  belongs_to :asignatura
  attr_accessible :aula, :dia, :hora, :materia_id, :instructor_id, :asignatura_id

  validate :aula, :presence => true, :uniqueness => true, :length => {:maximum => 999} 

  def self.search(search)

  	where('aula like ?', "%#{search}%")
  	
  end

end
