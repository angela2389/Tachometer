json.extract! experiment, :id, :name, :start_date, :end_date, :completed, :created_at, :updated_at
json.url experiment_url(experiment, format: :json)