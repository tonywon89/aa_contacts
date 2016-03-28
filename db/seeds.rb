require 'faker'

10.times do
  u = User.create!(username: Faker::Internet.user_name)
    3.times do
      c = Contact.create!(name: Faker::Name.name, email: Faker::Internet.email, user_id: u.id)
    end
end

1.upto(9) do |i|
  ContactShare.create!(user_id: i, contact_id: i * 3 + 1)
end
