module Helpers
  def uploaded_file(file: nil, mime_type: 'image/png')
    file ||= Rails.root.join('spec/factories/test.png')
    Rack::Test::UploadedFile.new(file, mime_type)
  end

  def json_response
    if response.content_type.include? 'json'
      JSON.parse(response.body)
    else
      response.body
    end
  end
end
