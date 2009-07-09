Factory.define :post do |f|
  f.title { Faker::Lorem.sentence }
  f.body { Faker::Lorem.sentences.join("\n") }
end