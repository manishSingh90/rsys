# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
# slower
# YAML.load_file("db/seeds/users.yml").each{|user| User.create(user)}
#faster way
# binding.pry
# User.create(YAML.load_file("db/seeds/users.yml"))
puts "======Seed Started========="
YAML.load_file("db/seeds/users.yml").each do |user|
  puts user
  _user = User.new(user.except('address'))
  _user.address = Address.new(user.dig('address')) if user.dig('address').present?
  # _user.build_address(user.dig('address')) if user.dig('address').present?
  _user.save!
end


=begin

address = Address.new({"address1"=>"Vandana Paradide", "address2"=>"Roopena Agrahara", "country"=>"INDIA", "state"=>"KA", "zip"=>560068})

User.create!(
              first_name: 'Manish',
              last_name: 'Singh',
              dob: '1990-12-15',
              gender: 'Male',
              email: 'manish@gmail.com',
              phone_number: '9971601245',
              password: '123',
              address: address
)

=end

# slower
=begin
User.create([
                {
                    first_name: 'Manish',
                    last_name: 'Singh',
                    dob: '1990-12-15',
                    gender: 'Male',
                    email: 'manish@gmail.com',
                    phone_number: '9971601245',
                    password: '123'
                },
                {
                    first_name: 'Sonu',
                    last_name: 'Singh',
                    dob: '1991-12-21',
                    gender: 'Male',
                    email: 'sonu@gmail.com',
                    phone_number: '9971601225',
                    password: '123'
                },
                {
                    first_name: 'Anjali',
                    last_name: 'Singh',
                    dob: '1991-2-12',
                    gender: 'Female',
                    email: 'anjali@gmail.com',
                    phone_number: '9071601245',
                    password: '123'
                },
                {
                    first_name: 'Monu',
                    last_name: 'Singh',
                    dob: '1995-05-22',
                    gender: 'Male',
                    email: 'monu@gmail.com',
                    phone_number: '9971601145',
                    password: '123'
                },
                {
                    first_name: 'Lebin',
                    last_name: 'SB',
                    dob: '1990-03-24',
                    gender: 'Male',
                    email: 'lb@gmail.com',
                    phone_number: '9333601245',
                    password: '123'
                },
                {
                    first_name: 'JJ',
                    last_name: 'Giri',
                    dob: '1993-3-15',
                    gender: 'Female',
                    email: 'jj@gmail.com',
                    phone_number: '9974444245',
                    password: '123'
                }
            ])
=end
