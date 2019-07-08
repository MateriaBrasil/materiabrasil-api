# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
Question.create!(
  [
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres na empresa?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres nos cargos de decisão na empresa?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Sobre o processo de recrutamento e seleção: a empresa possui políticas de equidade de gênero?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui alguma instância responsável por promover e supervisionar a implementação de ações de promoção da equidade de gênero?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui práticas ou políticas para combater o preconceito e a violência de gênero?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui práticas ou políticas para promover e garantir a liberdade, equidade e diversidade sexual?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres negras na empresa?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres negras nos cargos de decisão na empresa?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual a proporção de pessoas com deficiência (PCD) na empresa?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa promove ações e campanhas intrenas de sensibilização para fomentar um ambiente inclusivo onde as pessoas com deficiência são envolvidas e participam do diálogo das ações inclusivas?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Em relação à licença-maternidade e paternidade, qual a política da empresa?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece plano de saúde para os empregados?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece benefícios de alimentação para o empregado?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Com relação ao desenvolvimento técnico profissional'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Com relação ao desenvolvimento comportamental'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui processo de avaliação do desempenho dos empregados?'
    },
    {
      weight_for_small_companies: 2,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Os funcionários tem um canal de feeback e sugestões de melhorias?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui registro de funcionários no e-social?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui PCMSO e PPRA atualizados?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa realiza e mantém os atestados de saúde ocupacional atualizados?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece EPIs adequados para a realização das atividades para todos os funcionários?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Os equipamentos e mobiliários utilizados pelos funcionários são analisados ergonomicamente?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há política de gestão de resíduos dentro da empresa?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de negros na empresa?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual a proporção de negros nos cargos de decisão na empresa?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Sobre o processo de recrutamento e seleção: a empresa possui políticas de equidade de raça?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui alguma instância responsável por promover e supervisionar a implementação de ações de promoção da diversidade e equidade de raça?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui práticas ou políticas para combater o preconceito e a violência de raça?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual o multiplicador de salário entre o menor e o maior salário da sua organização?'
    }
  ]
)
# rubocop:enable Metrics/LineLength
