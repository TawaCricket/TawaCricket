class AddAttachmentPhotoToGallaries < ActiveRecord::Migration
  def self.up
    add_column :gallary, :photo_file_name, :string # Original filename
    add_column :gallary, :photo_content_type, :string # Mime type
    add_column :gallary, :photo_file_size, :integer # File size in bytes
    end
  end

  def self.down
    remove_column :gallary, :photo_file_name # Original filename
    remove_column :gallary, :photo_content_type # Mime type
    remove_column :gallary, :photo_file_size # File size in bytes
  end
end
