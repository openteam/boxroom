class AddFingerPrintFieldToUserFile < ActiveRecord::Migration
  def self.up
    add_column :user_files, :attachment_fingerprint, :string
  end

  def self.down
    remove_column :user_files, :attachment_fingerprint
  end
end
