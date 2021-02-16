FactoryBot.define do
  factory :user do
    nickname              {"tarou"}
    email                 {Faker::Internet.email}
    password              {"1111a1a"}
    password_confirmation    {"1111a1a"}
    first_name           {"山田"}
    first_name_reading      {"ヤマダ"}
    last_name            {"太郎"}
    last_name_reading       {"タロウ"}
    birth_date             {"2000-01-01"}
  end
end
