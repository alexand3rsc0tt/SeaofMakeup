class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => "/ckeditor_assets/attachments/:id/:filename",
                    :path => ":rails_root/public/ckeditor_assets/attachments/:id/:filename",
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 100.gigabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end

  def s3_credentials
    {:bucket => "thesea", :access_key_id => "AKIAIPJZD3CRMZ5CS6TA", :secret_access_key => "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"}
  end
end
