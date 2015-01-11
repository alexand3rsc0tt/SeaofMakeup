class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' }

                    config.paperclip_defaults = {
                      :storage => :s3,
                      :s3_credentials => {
                        :bucket => ENV['seaofmakeup'],
                        :access_key_id => ENV['AKIAIIU6K3UAF4PC45IQ'],
                        :secret_access_key => ENV['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']
                      }
                    }

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 200.gigabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
