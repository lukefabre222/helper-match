json.array!(@events) do |event|
  json.title event.shop_name
  json.start event.start_date   
  json.end event.end_date   
  json.url staff_event_path(id: event.id, format: :html) 
end