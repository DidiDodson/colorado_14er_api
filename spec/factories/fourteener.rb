FactoryBot.define do
  factory :fourteener do
    english_name { Faker::TvShows::StarTrek.location  }
    arapahoe_name { Faker::Fantasy::Tolkien.location }
    arapahoe_translation { Faker::Movies::LordOfTheRings.location }
    ute_name { Faker::Fantasy::Tolkien.location }
    ute_translation { Faker::Movies::LordOfTheRings.location }
    elevation { Faker::Number.within(range: 14000..14500)  }
    range { Faker::Mountain.range }
    county { Faker::Address.community }
    nearby_towns { Faker::Address.city }
    hiking_routes { Faker::Compass.direction }
    climate { Faker::TvShows::TwinPeaks.quote }
    geology { Faker::Hipster.paragraphs }
    first_ascent { Faker::GreekPhilosophers.quote }
    history { Faker::Fantasy::Tolkien.poem }
  end
end
