class AddAttachmentFotoToInstructores < ActiveRecord::Migration
  def self.up
    change_table :instructores do |t|
      t.attachment :foto
    end
  end

  def self.down
    drop_attached_file :instructores, :foto
  end
end
