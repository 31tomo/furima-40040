FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6) + '+'}
    password_confirmation {password}
    last_name             { 'やマ田' }
    first_name            { '太ろウ' }
    last_name_kana        { 'カタカナ' }  # 適切なカタカナを設定してください
    first_name_kana       { 'カタカナ' }  # 適切なカタカナを設定してください
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
