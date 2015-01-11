class AddAttachmentPostToAdmins < ActiveRecord::Migration
  def self.up
    change_table :admins do |t|
      t.attachment :post
    end
  end

  def self.down
    remove_attachment :admins, :post
  end
end
