Factory.define :comment do |f|
  f.name { Faker::Name.name}
  f.site {|a| "http://#{Faker::Internet.domain_name}"}
  f.email {|a| "#{a.name.downcase.gsub(" ", ".")}@#{a.site.gsub("http://", "")}" }
  f.body { Faker::Lorem.sentence }
  f.association :post
end