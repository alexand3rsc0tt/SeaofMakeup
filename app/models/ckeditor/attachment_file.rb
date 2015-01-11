class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url => "/ckeditor_assets/attachments/:id/:filename",
                    :path => ":rails_root/public/ckeditor_assets/attachments/:id/:filename"

                    config.paperclip_defaults = {
                      :storage => :s3,
                      :s3_credentials => {
                        :bucket => ENV['seaofmakeup'],
                        :access_key_id => ENV['AKIAIIU6K3UAF4PC45IQ'],
                        :secret_access_key => ENV['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']
                      }
                    }
                    
  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 100.gigabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
