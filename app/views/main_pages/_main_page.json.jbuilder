json.extract! main_page, :id, :title, :body, :created_at, :updated_at
json.url main_page_url(main_page, format: :json)
