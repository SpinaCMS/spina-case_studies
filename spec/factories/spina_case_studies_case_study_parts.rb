FactoryGirl.define do
  factory :spina_case_studies_case_study_part, class: 'Spina::CaseStudies::CaseStudyPart' do
    title "MyString"
    content "MyText"
    spina_photo nil
    alignment "MyString"
  end
end
