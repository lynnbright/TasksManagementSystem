FactoryBot.define do
  factory :task do
    title { 'go jogging' }
    description { 'run for a better life' }
    status { '待處理' }
    priority { '高' }
    start_at { '2020-06-25 22:00:00' }
    end_at { '2020-06-26 22:00:00' }
    deleted_at { nil }
  end
end 
