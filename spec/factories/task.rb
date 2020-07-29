FactoryBot.define do
  factory :task do
    title { 'go jogging' }
    description { 'run for a better life' }
    status { 'ToDo' }
    priority { 'High' }
    start_at { "#{ Time.zone.now }" }
    end_at { "#{ Time.zone.now + 1.day}" }
    deleted_at { nil }

    trait :newest_task do
      title { 'newest title' }
      description { 'newest description' }
      status { 'Doing' }
      priority { 'Mid' }
    end

    trait :invalid_params do
      title { nil }
    end

    trait :update_params do
      status { 'Doing' }
    end
  end
end 
