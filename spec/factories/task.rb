FactoryBot.define do
  factory :task do
    title { 'go jogging' }
    description { 'run for a better life' }
    status { '待處理' }
    priority { '高' }
    start_at { '2020-06-25 22:00:00' }
    end_at { '2020-06-26 22:00:00' }
    deleted_at { nil }

    trait :invalid_params do
      title { nil }
    end

    trait :update_params do
      status { '處理中' }
    end
  end
end 
