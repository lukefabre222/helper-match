13.times do |n|
  name = Faker::Japanese::Name.name
  email = "email#{n+1}@sample.com"
  password = "password"
  price = 25000 + n*1000
  Staff.create!(name: name,
                email: email,
                status: 1,
                price: price,
                password: password,
                password_confirmation: password)
end

1.times do |n|
  name = "DS東戸塚店"
  email = "email_shop@sample.com"
  password = "password"
  Staff.create!(name: name,
                email: email,
                status: 2,
                password: password,
                password_confirmation: password)
end

13.times do |s|
staff_id = "#{s+1}"
  1.times do |f|
    from = Date.current.beginning_of_month
    to = Date.current.end_of_month
    date = Random.rand(from..to)
    Report.create(
      worked_on: date,
      shop_name: "東戸塚",
      ftth: Random.rand(3),
      tab_new: Random.rand(2),
      tab_change: Random.rand(3),
      d_card_g: Random.rand(3),
      d_card_r: Random.rand(3),
      sls: Random.rand(3),
      h4d: Random.rand(1),
      skp: Random.rand(1),
      hs: Random.rand(2),
      mnp: Random.rand(1),
      migration: Random.rand(3),
      reception: "5",
      staff_id: staff_id  
    )
  end
end