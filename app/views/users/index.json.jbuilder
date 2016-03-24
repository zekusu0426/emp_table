json.array!(@users) do |user|
  json.extract! user, :id, :emp_id, :name, :jigyosho_id, :birthday, :phone1, :phone2, :zip, :address, :other, :flg
  json.url user_url(user, format: :json)
end
