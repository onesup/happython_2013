json.array!(@jobs) do |job|
  json.extract! job, :category, :title, :content, :time, :level, :workers_count, :pay, :address
  json.url job_url(job, format: :json)
end
