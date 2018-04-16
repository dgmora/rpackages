FactoryBot.define do
  factory :package do
    authors { [ { name: 'Marco', email: 'm@polo.com' }, { name: 'Foo' } ] }
    description 'It does things how-cool-is-that'
    maintainers { [ { name: 'Marco', email: 'm@polo.com' }, { name: 'Foo' } ] }
    name 'Cartographer'
    publication_date '2017-04-16 20:02:24'
    title 'The Cartographer'
    version '1.0.0'
  end
end
