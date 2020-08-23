4.times do |n|
  name = Faker::Japanese::Name.name
  email = "email#{n+1}@sample.com"
  password = "password"
  Staff.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)
end

10.times do |f|
  from = Date.current.beginning_of_month
  to = Date.current.end_of_month
  date = Random.rand(from..to)
  Report.create(
    worked_on: date,
    shop_name: "東戸塚",
    ftth: Random.rand(5),
    tab_new: Random.rand(5),
    tab_change: Random.rand(5),
    d_card_g: Random.rand(5),
    d_card_r: Random.rand(5),
    sls: Random.rand(5),
    h4d: Random.rand(5),
    skp: Random.rand(5),
    hs: Random.rand(5),
    mnp: Random.rand(5),
    migration: Random.rand(5),
    reception: "5",
    staff_id: "1"
    
  )
end