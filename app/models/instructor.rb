class Instructor < ActiveRecord::Base
	has_many :horarios
	belongs_to :materia
  attr_accessible :apellido, :cedula, :direccion, :nombre, :telefono, :materia_id, :foto

  has_attached_file :foto, :styles => { :small => "150x150>", :lsmall => "30x30>"},
  :url  => "/assets/instructores/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/instructores/:id/:style/:basename.:extension"

  validates_attachment_presence :foto
  validates_attachment_size :foto, :less_than => 5.megabytes
  validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png','image/jpg']
 
  validate :nombre, :presence => true, :length => {:maximum => 80}
  validate :apellido, :presence => true, :length => {:maximum => 80}
  validate :cedula, :presence => true, :uniqueness => true, :length => {:maximum => 20}
  validate :telefono, :presence => true, :uniqueness => true, :length => {:maximum => 18}
  validate :direccion, :presence => true, :uniqueness => true 
  
  def self.search(search)

  	where('nombre like ? or apellido like ?', "%#{search}%", "%#{search}%")
  end
end
