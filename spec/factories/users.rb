FactoryBot.define do
  factory :user do
    nickname              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"111111"}
    encrypted_password    {"111111"}
    family_name           {"山田"}
    family_name_kana      {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_day             {"2000-01-01"}
  end
end
