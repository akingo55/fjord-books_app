json.extract! user, :id, :email, :postal_code, :address, :introduce
json.url user_url(user, format: :json)
