class Ckeditor::Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['seaofmakeup'],
      :access_key_id => ENV['AKIAIIU6K3UAF4PC45IQ'],
      :secret_access_key => ENV['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']
    }
  }
end
