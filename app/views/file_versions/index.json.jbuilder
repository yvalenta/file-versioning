json.array!(@file_versions) do |file_version|
  json.extract! file_version, :id, :file_upload_id, :file_version
  json.url file_version_url(file_version, format: :json)
end
