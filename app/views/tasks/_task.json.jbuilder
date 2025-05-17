json.extract! task, :id, :title, :description, :done, :assigned_by, :assigned_at, :deadline, :created_at, :updated_at
json.url task_url(task, format: :json)
