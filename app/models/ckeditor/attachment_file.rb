class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 100.gigabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end

end
