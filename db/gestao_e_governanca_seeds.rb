# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
questionnaire = Questionnaire.create!(
  name: 'Gestão e Governança',
  about_type: 'Supplier',
  driver: 'management_and_governance',
  sorting: 2
)

Question.create!(
  [
    {
      questionnaire: questionnaire,
      sorting: 1,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres na empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 2,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres nos cargos de decisão na empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 3,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Sobre o processo de recrutamento e seleção: a empresa possui políticas de equidade de gênero?'
    },
    {
      questionnaire: questionnaire,
      sorting: 4,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui alguma instância responsável por promover e supervisionar a implementação de ações de promoção da equidade de gênero?'
    },
    {
      questionnaire: questionnaire,
      sorting: 5,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui práticas ou políticas para combater o preconceito e a violência de gênero?'
    },
    {
      questionnaire: questionnaire,
      sorting: 6,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui práticas ou políticas para promover e garantir a liberdade, equidade e diversidade sexual?'
    },
    {
      questionnaire: questionnaire,
      sorting: 7,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres negras na empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 8,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres negras nos cargos de decisão na empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 9,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual a proporção de pessoas com deficiência (PCD) na empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 10,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa promove ações e campanhas intrenas de sensibilização para fomentar um ambiente inclusivo onde as pessoas com deficiência são envolvidas e participam do diálogo das ações inclusivas?'
    },
    {
      questionnaire: questionnaire,
      sorting: 11,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Em relação à licença-maternidade e paternidade, qual a política da empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 12,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece plano de saúde para os empregados?'
    },
    {
      questionnaire: questionnaire,
      sorting: 13,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece benefícios de alimentação para o empregado?'
    },
    {
      questionnaire: questionnaire,
      sorting: 14,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Com relação ao desenvolvimento técnico profissional'
    },
    {
      questionnaire: questionnaire,
      sorting: 15,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Com relação ao desenvolvimento comportamental'
    },
    {
      questionnaire: questionnaire,
      sorting: 16,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui processo de avaliação do desempenho dos empregados?'
    },
    {
      questionnaire: questionnaire,
      sorting: 17,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Os funcionários tem um canal de feeback e sugestões de melhorias?'
    },
    {
      questionnaire: questionnaire,
      sorting: 18,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui registro de funcionários no e-social?'
    },
    {
      questionnaire: questionnaire,
      sorting: 19,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui PCMSO e PPRA atualizados?'
    },
    {
      questionnaire: questionnaire,
      sorting: 20,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa realiza e mantém os atestados de saúde ocupacional atualizados?'
    },
    {
      questionnaire: questionnaire,
      sorting: 21,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece EPIs adequados para a realização das atividades para todos os funcionários?'
    },
    {
      questionnaire: questionnaire,
      sorting: 22,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Os equipamentos e mobiliários utilizados pelos funcionários são analisados ergonomicamente?'
    },
    {
      questionnaire: questionnaire,
      sorting: 23,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há política de gestão de resíduos dentro da empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 24,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de negros na empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 25,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual a proporção de negros nos cargos de decisão na empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 26,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Sobre o processo de recrutamento e seleção: a empresa possui políticas de equidade de raça?'
    },
    {
      questionnaire: questionnaire,
      sorting: 27,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui alguma instância responsável por promover e supervisionar a implementação de ações de promoção da diversidade e equidade de raça?'
    },
    {
      questionnaire: questionnaire,
      sorting: 28,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui práticas ou políticas para combater o preconceito e a violência de raça?'
    },
    {
      questionnaire: questionnaire,
      sorting: 29,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual o multiplicador de salário entre o menor e o maior salário da sua organização?'
    }
  ]
)
# rubocop:enable Metrics/LineLength
