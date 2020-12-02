FactoryBot.define do
  factory :suggestion do
    content {"新規プロジェクト"}
    purpose {"新規顧客獲得の為"}
    detail {"新規顧客獲得には何が必要か案を出し合う"}
    deadline {"月末まで"}
    association :user
    
  end
end
