FactoryBot.define do
  factory :task do
    title { 'title_1' }
    description { 'description_1' }
    status { 'todo' }
    priority { 'high' }
    start_at { "#{ Time.zone.now }" }
    end_at { "#{ Time.zone.now + 1.day}" }
    deleted_at { nil }

    trait :newest_task do
      title { 'newest title' }
      description { 'newest description' }
      status { 'doing' }
      priority { 'mid' }
    end

    trait :invalid_params do
      title { nil }
    end

    trait :update_params do
      status { 'doing' }
    end
  end
end 
