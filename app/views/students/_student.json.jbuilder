json.extract! student, :id, :email, :name, :password, :educational_level, :university_id, :created_at, :updated_at
json.url student_url(student, format: :json)
