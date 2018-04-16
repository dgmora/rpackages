FactoryBot.define do
  factory :package do
    authors { [ { name: 'Marco', email: 'm@polo.com' }, { name: 'Foo' } ] }
    description 'It does things how-cool-is-that'
    maintainers { [ { name: 'Marco', email: 'm@polo.com' }, { name: 'Foo' } ] }
    name 'A3'
    publication_date '2017-04-16 20:02:24'
    title 'The 3 As'
    version '1.0.0'
  end
end
