json.array!(@jigyoshos) do |jigyosho|
  json.extract! jigyosho, :id, :cd, :name, :ryakusho, :from_ymd, :to_ymd, :mail, :sort_num, :flg
  json.url jigyosho_url(jigyosho, format: :json)
end
