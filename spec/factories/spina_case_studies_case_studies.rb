FactoryGirl.define do
  factory :spina_case_studies_case_study, class: 'Spina::CaseStudies::CaseStudy' do
    title "MyString"
    intro "MyText"
    spina_photo nil
  end
end
