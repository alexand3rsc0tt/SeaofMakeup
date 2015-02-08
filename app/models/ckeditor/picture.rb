class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 200.gigabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end

  def url_thumb
    url(:thumb)
  end
end
