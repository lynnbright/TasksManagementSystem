FactoryBot.define do
  factory :task do
    title { 'go jogging' }
    description { 'run for a better life' }
    status { '待處理' }
    priority { '高' }
    start_at { "#{ Time.zone.now }" }
    end_at { "#{ Time.zone.now + 1.day}" }
    deleted_at { nil }

    trait :invalid_params do
      title { nil }
    end

    trait :update_params do
      status { '進行中' }
    end
  end
end 
