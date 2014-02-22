Pod::Spec.new do |s|
  s.name         = "TRVSQueryStringSerializer"
  s.version      = "0.0.1"
  s.summary      = "NSDictionary to NSString query string serializer."

  s.description  = <<-DESC
                   NSDictionary to NSString query string serializer. Useful to network with APIs.
                   DESC

  s.homepage     = "https://github.com/travisjeffery/TRVSQueryStringSerializer"

  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }

  s.author             = { "Travis Jeffery" => "tj@travisjeffery.com" }
  s.social_media_url = "http://twitter.com/travisjeffery"

  s.source       = { :git => "https://github.com/travisjeffery/TRVSQueryStringSerializer.git", :tag => "0.0.1" }


  s.source_files  = 'TRVSQueryStringSerializer.{h,m}'
  s.exclude_files = 'Classes/Exclude'

  s.requires_arc = true
end
