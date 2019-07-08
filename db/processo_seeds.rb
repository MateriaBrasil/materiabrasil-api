# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
Question.create!(
  [
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Como você define a sua matriz energética?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'A sua empresa implementou algum dos seguintes métodos de conservação de água no seu pocesso produtivo?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua empresa implementou algum dos seguintes métodos de conservação de água nos seus escritórios e áreas administrativas?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Há substâncias tóxicas usadas como insumos em seus processos de produção?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual é a destinação final dos resíduos de seus processos de produção?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual porcentagem de resíduos perigosos/contaminantes foi eliminada com responsabilidade, com uma terceira parte documentada? resíduos perigosos incluem: pilhas, rejeitos médicos, equipamentos eletrônicos, solventes, óleos, pigmentos sintéticos, metais pesados, etcQual porcentagem de resíduos perigosos/contaminantes foi eliminada com responsabilidade, com uma terceira parte documentada? resíduos perigosos incluem: pilhas, rejeitos médicos, equipamentos eletrônicos, solventes, óleos, pigmentos sintéticos, metais pesados, etc'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Há programa de eliminação ou redução dos resíduos gerados de seus processos de produção?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Há programa de reuso ou reciclagem dos resíduos gerados de seus processos de produção?'
    },
    {
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 2,
      weight_for_service_companies: 2,
      description: 'Os processos da sua cadeia de valor/ciclo de vida são realizados através de colaborações com outras organizações ou indivíduos?'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há processos de reciclagem para seu produto? '
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'A sua empresa implementou algum dos seguintes métodos de conservação de energia no seu processo produtivo'
    },
    {
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua empresa implementou algum dos seguintes métodos de conservação de energia ou eficiência energética nos seus escritórios e áreas administrativas?'
    }
  ]
)
# rubocop:enable Metrics/LineLength
