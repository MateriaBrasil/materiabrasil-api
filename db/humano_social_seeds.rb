# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
questionnaire = Questionnaire.create!(
  name: 'Humano Social',
  about_type: 'Supplier',
  driver: 'social_human',
  sorting: 1
)

Question.create!(
  [
    {
      questionnaire: questionnaire,
      sorting: 1,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 1,
      description: 'Sua empresa busca formular políticas junto a outros atores econômicos (incluindo concorrentes) para desenvolver ou defender uma maior adoção de padrões sociais e ambientais ou práticas voluntárias em seu setor?'
    },
    {
      questionnaire: questionnaire,
      sorting: 2,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 1,
      description: 'Existe política de patrocínio/doação para iniciativas e organizações de impacto positivo?'
    },
    {
      questionnaire: questionnaire,
      sorting: 3,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Há iniciativa de incentivo para o engajamento dos funcionários em projetos sociais?'
    },
    {
      questionnaire: questionnaire,
      sorting: 4,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Quais critérios sociais e ambientais são usados para a triagem da maioria dos fornecedores significativos da sua empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 5,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A sua empresa realiza algum dos seguintes procedimentos para promover engajamento e desenvolvimento da comunidade?'
    },
    {
      questionnaire: questionnaire,
      sorting: 6,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual é a duração média de seus relacionamentos com fornecedores significativos?'
    },
    {
      questionnaire: questionnaire,
      sorting: 7,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua produção valoriza a cultura e tradição local?'
    },
    {
      questionnaire: questionnaire,
      sorting: 8,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A sua produção envolve mão de obra de cooperativas ou associações?'
    },
    {
      questionnaire: questionnaire,
      sorting: 9,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual das seguintes opções representa a estrutura de tomada de decisão da sua empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 10,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua empresa tem uma declaração de missão empresarial e ela inclui algum dos seguintes'
    },
    {
      questionnaire: questionnaire,
      sorting: 11,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual porcentagem das despesas da sua empresa (exceto mão de obra) foi gasta com fornecedores locais para abastecer a sede da empresa ou instalações de produção relevantes?'
    },
    {
      questionnaire: questionnaire,
      sorting: 12,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há canais de comunicação de feedback do produto?'
    },
    {
      questionnaire: questionnaire,
      sorting: 13,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua empresa possui um sistema de gestão ambiental que inclua algum dos seguintes temas?'
    },
    {
      questionnaire: questionnaire,
      sorting: 14,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 1,
      description: 'À parte de uma missão por escrito, a sua empresa tomou alguma das medidas abaixo para assegurar legalmente que a sua missão social ou ambiental será mantida ao longo do tempo, independentemente da propriedade da empresa?'
    },
    {
      questionnaire: questionnaire,
      sorting: 15,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A sua empresa tem algum dos seguintes modelos de negócios de impacto focados na comunidade ou trabalhador?'
    },
    {
      questionnaire: questionnaire,
      sorting: 16,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual o posicionamento da sua empresa em relação à equidade de gênero?'
    },
    {
      questionnaire: questionnaire,
      sorting: 17,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual o posicionamento da sua empresa em relação à equidade de raça?'
    }
  ]
)
# rubocop:enable Metrics/LineLength
