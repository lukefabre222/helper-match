json.array!(@events) do |event|
  json.title event.shop_name
  json.start event.start_date   
  json.end event.end_date
  json.status event.status
  json.url staff_event_path(id: event.id, format: :html) 

  if event.status == "申請中"
    json.color "#ff0000"
  else
    json.color ""
  end

end