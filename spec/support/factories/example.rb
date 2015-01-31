FactoryGirl.define do
  factory :account_category do
    name { Forgery('lorem_ipsum').words(3) }
    kind { AccountCategoryKind.list.sample }
    status { AccountCategoryStatus.list.sample }
    background_color { Forgery('basic').hex_color }
    foreground_color { Forgery('basic').hex_color }
  end

  factory :invalid_account_category, parent: :account_category do
    name nil
    kind nil
    status nil
    background_color nil
    foreground_color nil
  end
end
