class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' },
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 200.gigabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end

  def s3_credentials
    {:bucket => "thesea", :access_key_id => "AKIAIPJZD3CRMZ5CS6TA", :secret_access_key => "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"}
  end
end
