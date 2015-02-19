10.times do
  user = User.create!(first_name: Faker::Name.first_name,
                     last_name: Faker::Name.last_name,
                     user_name: Faker::Internet.user_name,
                     points: rand(0...100),
                     email: Faker::Internet.email,
                     password: "password")
  10.times do
    user.tools.create!(tool_type: %w(Power saw Power drill Hand tool MIG welder Other).sample,
                      tool_model: %w(Bosch Ryobi Dewalt Milwaukee Makita Craftsman Other).sample,
                      point_cost: rand(0..10),
                      condition: %w(excellent good fair bad).sample,
                      user_id: rand(0..10))

  end
end
