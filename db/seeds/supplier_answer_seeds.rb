# frozen_string_literal: true

user1 = User.create!(
  email: 'foo@bar.com',
  first_name: 'Foo',
  last_name: 'Bar',
  password: '123456789'
)

user2 = User.create!(
  email: 'bar@foo.com',
  first_name: 'Foo',
  last_name: 'Bar',
  password: '123456789'
)

user3 = User.create!(
  email: 'bar@bar.com',
  first_name: 'Foo',
  last_name: 'Bar',
  password: '123456789'
)

supplier1 = Supplier.create!(
  user: user1,
  name: 'Zebu Mídias Sustentáveis ltda - ME',
  description: 'Zebu Mídias Sustentáveis ltda - ME',
  website: 'http://foo',
  email: 'foo@company.com',
  cnpj: '123456789',
  company_name: 'Foo Inc',
  municipal_subscription: 'does not apply',
  state_subscription: '987654321',
  phone: '5551987654321',
  company_revenue: '100000000',
  type_of_company: 4,
  reach: 'country',
  image_url: 'http://foo-image'
)

material1 = Material.create!(
  name: 'Cartão de Bambu',
  supplier: supplier1,
  image_url: 'https://image.ibb.co/bPMTky/tecido.jpg',
  description: 'Lona com urdume de algodão natural, sem aplicação de'\
  ' tingimento e trama de algodão reciclado em cores. Foi desenvolvido com o'\
  ' intuito de ser ecologicamente correto e orgânico, por isso em sua'\
  ' composição foram utilizadas apenas fibras naturais. A mescla de fios de'\
  ' algodão novos com fios já reciclados garante um visual rústico e'\
  ' exclusivo.',
  average_price: 'R$ 30,00',
  code: '00672',
  highlighted: true,
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

# HUMANO SOCIAL
[
  { questionnaire_id: 1, question_index: 1, option_value: 2 },
  { questionnaire_id: 1, question_index: 2, option_value: 3 },
  { questionnaire_id: 1, question_index: 3, option_value: 5 },
  { questionnaire_id: 1, question_index: 4, option_value: 1 },
  { questionnaire_id: 1, question_index: 5, option_value: 3 },
  { questionnaire_id: 1, question_index: 6, option_value: 3 },
  { questionnaire_id: 1, question_index: 7, option_value: 5 },
  { questionnaire_id: 1, question_index: 8, option_value: 5 },
  { questionnaire_id: 1, question_index: 9, option_value: 0 },
  { questionnaire_id: 1, question_index: 10, option_value: 5 },
  { questionnaire_id: 1, question_index: 11, option_value: 5 },
  { questionnaire_id: 1, question_index: 12, option_value: 0 },
  { questionnaire_id: 1, question_index: 13, option_value: 2 },
  { questionnaire_id: 1, question_index: 14, option_value: 4 },
  { questionnaire_id: 1, question_index: 15, option_value: 3 },
  { questionnaire_id: 1, question_index: 16, option_value: 2 },
  { questionnaire_id: 1, question_index: 17, option_value: 2 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: supplier1,
    question: question,
    option: option
  )
end

# GESTAO E GOVERNANCA
[
  { questionnaire_id: 2, question_index: 1, option_value: 3 },
  { questionnaire_id: 2, question_index: 2, option_value: 5 },
  { questionnaire_id: 2, question_index: 3, option_value: 0 },
  { questionnaire_id: 2, question_index: 4, option_value: 1 },
  { questionnaire_id: 2, question_index: 5, option_value: 2 },
  { questionnaire_id: 2, question_index: 6, option_value: 1 },
  { questionnaire_id: 2, question_index: 7, option_value: 0 },
  { questionnaire_id: 2, question_index: 8, option_value: 0 },
  { questionnaire_id: 2, question_index: 9, option_value: 0 },
  { questionnaire_id: 2, question_index: 10, option_value: 0 },
  { questionnaire_id: 2, question_index: 11, option_value: 5 },
  { questionnaire_id: 2, question_index: 12, option_value: 0 },
  { questionnaire_id: 2, question_index: 13, option_value: 0 },
  { questionnaire_id: 2, question_index: 14, option_value: 4 },
  { questionnaire_id: 2, question_index: 15, option_value: 2 },
  { questionnaire_id: 2, question_index: 16, option_value: 0 },
  { questionnaire_id: 2, question_index: 17, option_value: 0 },
  { questionnaire_id: 2, question_index: 18, option_value: 0 },
  { questionnaire_id: 2, question_index: 19, option_value: 0 },
  { questionnaire_id: 2, question_index: 20, option_value: 0 },
  { questionnaire_id: 2, question_index: 21, option_value: 5 },
  { questionnaire_id: 2, question_index: 22, option_value: 5 },
  { questionnaire_id: 2, question_index: 23, option_value: 2 },
  { questionnaire_id: 2, question_index: 24, option_value: 1 },
  { questionnaire_id: 2, question_index: 25, option_value: 0 },
  { questionnaire_id: 2, question_index: 26, option_value: 0 },
  { questionnaire_id: 2, question_index: 27, option_value: 1 },
  { questionnaire_id: 2, question_index: 28, option_value: 1 },
  { questionnaire_id: 2, question_index: 29, option_value: 0 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: supplier1,
    question: question,
    option: option
  )
end

# PROCESSO
[
  { questionnaire_id: 3, question_index: 1, option_value: 2 },
  { questionnaire_id: 3, question_index: 2, option_value: 2 },
  { questionnaire_id: 3, question_index: 3, option_value: 5 },
  { questionnaire_id: 3, question_index: 4, option_value: 5 },
  { questionnaire_id: 3, question_index: 5, option_value: 5 },
  { questionnaire_id: 3, question_index: 6, option_value: 5 },
  { questionnaire_id: 3, question_index: 7, option_value: 0 },
  { questionnaire_id: 3, question_index: 8, option_value: 5 },
  { questionnaire_id: 3, question_index: 9, option_value: 1 },
  { questionnaire_id: 3, question_index: 10, option_value: 5 },
  { questionnaire_id: 3, question_index: 11, option_value: 2 },
  { questionnaire_id: 3, question_index: 12, option_value: 2 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: material1,
    question: question,
    option: option
  )
end

# MATERIA PRIMA
[
  { questionnaire_id: 4, question_index: 1, option_value: 5 },
  { questionnaire_id: 4, question_index: 2, option_value: 0 },
  { questionnaire_id: 4, question_index: 3, option_value: 5 },
  { questionnaire_id: 4, question_index: 4, option_value: 1 },
  { questionnaire_id: 4, question_index: 5, option_value: 5 },
  { questionnaire_id: 4, question_index: 6, option_value: 5 },
  { questionnaire_id: 4, question_index: 7, option_value: 5 },
  { questionnaire_id: 4, question_index: 8, option_value: 0 },
  { questionnaire_id: 4, question_index: 9, option_value: 5 },
  { questionnaire_id: 4, question_index: 10, option_value: 0 },
  { questionnaire_id: 4, question_index: 11, option_value: 0 },
  { questionnaire_id: 4, question_index: 12, option_value: 0 },
  { questionnaire_id: 4, question_index: 13, option_value: 5 },
  { questionnaire_id: 4, question_index: 14, option_value: 1 },
  { questionnaire_id: 4, question_index: 15, option_value: 0 },
  { questionnaire_id: 4, question_index: 16, option_value: 0 },
  { questionnaire_id: 4, question_index: 17, option_value: 0 },
  { questionnaire_id: 4, question_index: 18, option_value: 5 },
  { questionnaire_id: 4, question_index: 19, option_value: 0 },
  { questionnaire_id: 4, question_index: 20, option_value: 5 },
  { questionnaire_id: 4, question_index: 21, option_value: 5 },
  { questionnaire_id: 4, question_index: 22, option_value: 5 },
  { questionnaire_id: 4, question_index: 23, option_value: 3 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: material1,
    question: question,
    option: option
  )
end

supplier2 = Supplier.create!(
  user: user2,
  name: 'FCC - INDÚSTRIA E COMÉRCIO LTDA.',
  description: 'FCC - INDÚSTRIA E COMÉRCIO LTDA.',
  website: 'http://foo',
  email: 'foo@company.com',
  cnpj: '123456789',
  company_name: 'Foo Inc',
  municipal_subscription: 'does not apply',
  state_subscription: '987654321',
  phone: '5551987654321',
  company_revenue: '100000000',
  type_of_company: 3,
  reach: 'country',
  image_url: 'http://foo-image'
)

material2 = Material.create!(
  name: 'Fcc Massa Dundun 3Kg',
  supplier: supplier2,
  image_url: 'https://image.ibb.co/bPMTky/tecido.jpg',
  description: 'Lona com urdume de algodão natural, sem aplicação de'\
  ' tingimento e trama de algodão reciclado em cores. Foi desenvolvido com o'\
  ' intuito de ser ecologicamente correto e orgânico, por isso em sua'\
  ' composição foram utilizadas apenas fibras naturais. A mescla de fios de'\
  ' algodão novos com fios já reciclados garante um visual rústico e'\
  ' exclusivo.',
  average_price: 'R$ 40,00',
  code: '00672',
  highlighted: true,
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

# HUMANO SOCIAL
[
  { questionnaire_id: 1, question_index: 1, option_value: 3 },
  { questionnaire_id: 1, question_index: 2, option_value: 0 },
  { questionnaire_id: 1, question_index: 3, option_value: 0 },
  { questionnaire_id: 1, question_index: 4, option_value: 2 },
  { questionnaire_id: 1, question_index: 5, option_value: 0 },
  { questionnaire_id: 1, question_index: 6, option_value: 5 },
  { questionnaire_id: 1, question_index: 7, option_value: 5 },
  { questionnaire_id: 1, question_index: 8, option_value: 0 },
  { questionnaire_id: 1, question_index: 9, option_value: 4 },
  { questionnaire_id: 1, question_index: 10, option_value: 0 },
  { questionnaire_id: 1, question_index: 11, option_value: 0 },
  { questionnaire_id: 1, question_index: 12, option_value: 3 },
  { questionnaire_id: 1, question_index: 13, option_value: 3 },
  { questionnaire_id: 1, question_index: 14, option_value: 0 },
  { questionnaire_id: 1, question_index: 15, option_value: 0 },
  { questionnaire_id: 1, question_index: 16, option_value: 0 },
  { questionnaire_id: 1, question_index: 17, option_value: 0 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: supplier2,
    question: question,
    option: option
  )
end

# GESTAO E GOVERNANCA
[
  { questionnaire_id: 2, question_index: 1, option_value: 4 },
  { questionnaire_id: 2, question_index: 2, option_value: 3 },
  { questionnaire_id: 2, question_index: 3, option_value: 2 },
  { questionnaire_id: 2, question_index: 4, option_value: 0 },
  { questionnaire_id: 2, question_index: 5, option_value: 2 },
  { questionnaire_id: 2, question_index: 6, option_value: 2 },
  { questionnaire_id: 2, question_index: 7, option_value: 1 },
  { questionnaire_id: 2, question_index: 8, option_value: 1 },
  { questionnaire_id: 2, question_index: 9, option_value: 0 },
  { questionnaire_id: 2, question_index: 10, option_value: 0 },
  { questionnaire_id: 2, question_index: 11, option_value: 2 },
  { questionnaire_id: 2, question_index: 12, option_value: 5 },
  { questionnaire_id: 2, question_index: 13, option_value: 4 },
  { questionnaire_id: 2, question_index: 14, option_value: 0 },
  { questionnaire_id: 2, question_index: 15, option_value: 2 },
  { questionnaire_id: 2, question_index: 16, option_value: 4 },
  { questionnaire_id: 2, question_index: 17, option_value: 0 },
  { questionnaire_id: 2, question_index: 18, option_value: 0 },
  { questionnaire_id: 2, question_index: 19, option_value: 5 },
  { questionnaire_id: 2, question_index: 20, option_value: 5 },
  { questionnaire_id: 2, question_index: 21, option_value: 5 },
  { questionnaire_id: 2, question_index: 22, option_value: 5 },
  { questionnaire_id: 2, question_index: 23, option_value: 5 },
  { questionnaire_id: 2, question_index: 24, option_value: 1 },
  { questionnaire_id: 2, question_index: 25, option_value: 1 },
  { questionnaire_id: 2, question_index: 26, option_value: 0 },
  { questionnaire_id: 2, question_index: 27, option_value: 1 },
  { questionnaire_id: 2, question_index: 28, option_value: 3 },
  { questionnaire_id: 2, question_index: 29, option_value: 2 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: supplier2,
    question: question,
    option: option
  )
end

# PROCESSO
[
  { questionnaire_id: 3, question_index: 1, option_value: 2 },
  { questionnaire_id: 3, question_index: 2, option_value: 3 },
  { questionnaire_id: 3, question_index: 3, option_value: 3 },
  { questionnaire_id: 3, question_index: 4, option_value: 5 },
  { questionnaire_id: 3, question_index: 5, option_value: 0 },
  { questionnaire_id: 3, question_index: 6, option_value: 5 },
  { questionnaire_id: 3, question_index: 7, option_value: 0 },
  { questionnaire_id: 3, question_index: 8, option_value: 0 },
  { questionnaire_id: 3, question_index: 9, option_value: 3 },
  { questionnaire_id: 3, question_index: 10, option_value: 1 },
  { questionnaire_id: 3, question_index: 11, option_value: 3 },
  { questionnaire_id: 3, question_index: 12, option_value: 3 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: material2,
    question: question,
    option: option
  )
end

# MATERIA PRIMA
[
  { questionnaire_id: 4, question_index: 1, option_value: 1 },
  { questionnaire_id: 4, question_index: 2, option_value: 2 },
  { questionnaire_id: 4, question_index: 3, option_value: 5 },
  { questionnaire_id: 4, question_index: 4, option_value: 2 },
  { questionnaire_id: 4, question_index: 5, option_value: 1 },
  { questionnaire_id: 4, question_index: 6, option_value: 1 },
  { questionnaire_id: 4, question_index: 7, option_value: 1 },
  { questionnaire_id: 4, question_index: 8, option_value: 0 },
  { questionnaire_id: 4, question_index: 9, option_value: 1 },
  { questionnaire_id: 4, question_index: 10, option_value: 1 },
  { questionnaire_id: 4, question_index: 11, option_value: 5 },
  { questionnaire_id: 4, question_index: 12, option_value: 1 },
  { questionnaire_id: 4, question_index: 13, option_value: 1 },
  { questionnaire_id: 4, question_index: 14, option_value: 3 },
  { questionnaire_id: 4, question_index: 15, option_value: 3 },
  { questionnaire_id: 4, question_index: 16, option_value: 0 },
  { questionnaire_id: 4, question_index: 17, option_value: 5 },
  { questionnaire_id: 4, question_index: 18, option_value: 5 },
  { questionnaire_id: 4, question_index: 19, option_value: 1 },
  { questionnaire_id: 4, question_index: 20, option_value: 5 },
  { questionnaire_id: 4, question_index: 21, option_value: 1 },
  { questionnaire_id: 4, question_index: 22, option_value: 1 },
  { questionnaire_id: 4, question_index: 23, option_value: 5 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: material2,
    question: question,
    option: option
  )
end

supplier3 = Supplier.create!(
  user: user3,
  name: 'Imperveg Polímeros Indústria E Comércio Ltda',
  description: 'Imperveg Polímeros Indústria E Comércio Ltda',
  website: 'http://foo',
  email: 'foo@company.com',
  cnpj: '123456789',
  company_name: 'Foo Inc',
  municipal_subscription: 'does not apply',
  state_subscription: '987654321',
  phone: '5551987654321',
  company_revenue: '100000000',
  type_of_company: 1,
  reach: 'country',
  image_url: 'http://foo-image'
)

material3 = Material.create!(
  name: 'Imperveg Poliuretano Vegetal',
  supplier: supplier3,
  image_url: 'https://image.ibb.co/bPMTky/tecido.jpg',
  description: 'Lona com urdume de algodão natural, sem aplicação de'\
  ' tingimento e trama de algodão reciclado em cores. Foi desenvolvido com o'\
  ' intuito de ser ecologicamente correto e orgânico, por isso em sua'\
  ' composição foram utilizadas apenas fibras naturais. A mescla de fios de'\
  ' algodão novos com fios já reciclados garante um visual rústico e'\
  ' exclusivo.',
  average_price: 'R$ 50,00',
  code: '00672',
  highlighted: true,
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

# HUMANO SOCIAL
[
  { questionnaire_id: 1, question_index: 1, option_value: 1 },
  { questionnaire_id: 1, question_index: 2, option_value: 2 },
  { questionnaire_id: 1, question_index: 3, option_value: 3 },
  { questionnaire_id: 1, question_index: 4, option_value: 1 },
  { questionnaire_id: 1, question_index: 5, option_value: 1 },
  { questionnaire_id: 1, question_index: 6, option_value: 5 },
  { questionnaire_id: 1, question_index: 7, option_value: 0 },
  { questionnaire_id: 1, question_index: 8, option_value: 1 },
  { questionnaire_id: 1, question_index: 9, option_value: 1 },
  { questionnaire_id: 1, question_index: 10, option_value: 3 },
  { questionnaire_id: 1, question_index: 11, option_value: 1 },
  { questionnaire_id: 1, question_index: 12, option_value: 3 },
  { questionnaire_id: 1, question_index: 13, option_value: 0 },
  { questionnaire_id: 1, question_index: 14, option_value: 0 },
  { questionnaire_id: 1, question_index: 15, option_value: 1 },
  { questionnaire_id: 1, question_index: 16, option_value: 0 },
  { questionnaire_id: 1, question_index: 17, option_value: 0 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: supplier3,
    question: question,
    option: option
  )
end

# GESTAO E GOVERNANCA
[
  { questionnaire_id: 2, question_index: 1, option_value: 2 },
  { questionnaire_id: 2, question_index: 2, option_value: 2 },
  { questionnaire_id: 2, question_index: 3, option_value: 0 },
  { questionnaire_id: 2, question_index: 4, option_value: 1 },
  { questionnaire_id: 2, question_index: 5, option_value: 1 },
  { questionnaire_id: 2, question_index: 6, option_value: 1 },
  { questionnaire_id: 2, question_index: 7, option_value: 0 },
  { questionnaire_id: 2, question_index: 8, option_value: 0 },
  { questionnaire_id: 2, question_index: 9, option_value: 0 },
  { questionnaire_id: 2, question_index: 10, option_value: 0 },
  { questionnaire_id: 2, question_index: 11, option_value: 2 },
  { questionnaire_id: 2, question_index: 12, option_value: 0 },
  { questionnaire_id: 2, question_index: 13, option_value: 1 },
  { questionnaire_id: 2, question_index: 14, option_value: 5 },
  { questionnaire_id: 2, question_index: 15, option_value: 1 },
  { questionnaire_id: 2, question_index: 16, option_value: 5 },
  { questionnaire_id: 2, question_index: 17, option_value: 1 },
  { questionnaire_id: 2, question_index: 18, option_value: 5 },
  { questionnaire_id: 2, question_index: 19, option_value: 5 },
  { questionnaire_id: 2, question_index: 20, option_value: 5 },
  { questionnaire_id: 2, question_index: 21, option_value: 5 },
  { questionnaire_id: 2, question_index: 22, option_value: 5 },
  { questionnaire_id: 2, question_index: 23, option_value: 2 },
  { questionnaire_id: 2, question_index: 24, option_value: 3 },
  { questionnaire_id: 2, question_index: 25, option_value: 1 },
  { questionnaire_id: 2, question_index: 26, option_value: 1 },
  { questionnaire_id: 2, question_index: 27, option_value: 1 },
  { questionnaire_id: 2, question_index: 28, option_value: 1 },
  { questionnaire_id: 2, question_index: 29, option_value: 0 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: supplier3,
    question: question,
    option: option
  )
end

# PROCESSO
[
  { questionnaire_id: 3, question_index: 1, option_value: 4 },
  { questionnaire_id: 3, question_index: 2, option_value: 5 },
  { questionnaire_id: 3, question_index: 3, option_value: 5 },
  { questionnaire_id: 3, question_index: 4, option_value: 5 },
  { questionnaire_id: 3, question_index: 5, option_value: 5 },
  { questionnaire_id: 3, question_index: 6, option_value: 5 },
  { questionnaire_id: 3, question_index: 7, option_value: 3 },
  { questionnaire_id: 3, question_index: 8, option_value: 0 },
  { questionnaire_id: 3, question_index: 9, option_value: 2 },
  { questionnaire_id: 3, question_index: 10, option_value: 0 },
  { questionnaire_id: 3, question_index: 11, option_value: 0 },
  { questionnaire_id: 3, question_index: 12, option_value: 0 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: material3,
    question: question,
    option: option
  )
end

# MATERIA PRIMA
[
  { questionnaire_id: 4, question_index: 1, option_value: 5 },
  { questionnaire_id: 4, question_index: 2, option_value: 3 },
  { questionnaire_id: 4, question_index: 3, option_value: 5 },
  { questionnaire_id: 4, question_index: 4, option_value: 0 },
  { questionnaire_id: 4, question_index: 5, option_value: 4 },
  { questionnaire_id: 4, question_index: 6, option_value: 0 },
  { questionnaire_id: 4, question_index: 7, option_value: 0 },
  { questionnaire_id: 4, question_index: 8, option_value: 0 },
  { questionnaire_id: 4, question_index: 9, option_value: 0 },
  { questionnaire_id: 4, question_index: 10, option_value: 0 },
  { questionnaire_id: 4, question_index: 11, option_value: 5 },
  { questionnaire_id: 4, question_index: 12, option_value: 0 },
  { questionnaire_id: 4, question_index: 13, option_value: 5 },
  { questionnaire_id: 4, question_index: 14, option_value: 4 },
  { questionnaire_id: 4, question_index: 15, option_value: 0 },
  { questionnaire_id: 4, question_index: 16, option_value: 0 },
  { questionnaire_id: 4, question_index: 17, option_value: 1 },
  { questionnaire_id: 4, question_index: 18, option_value: 5 },
  { questionnaire_id: 4, question_index: 19, option_value: 0 },
  { questionnaire_id: 4, question_index: 20, option_value: 0 },
  { questionnaire_id: 4, question_index: 21, option_value: 5 },
  { questionnaire_id: 4, question_index: 22, option_value: 5 },
  { questionnaire_id: 4, question_index: 23, option_value: 0 }
].each do |options|
  next if options[:option_value].zero?

  question = Question.find_by(
    questionnaire_id: options[:questionnaire_id],
    sorting: options[:question_index]
  )

  option = question.options.find_by(
    value: options[:option_value]
  )

  Answer.create!(
    about: material3,
    question: question,
    option: option
  )
end
