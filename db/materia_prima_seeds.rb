# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
questionnaire = Questionnaire.create!(
  name: 'Matéria Prima',
  about_type: 'Material',
  driver: 'raw_material',
  sorting: 4
)

Question.create!(
  [
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Como voce caracteriza a sua materia-prima quanto a sua natureza?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual a característica da fonte de sua principal materia-prima?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Há substâncias tóxicas ou contaminantes na composição da sua matéria-prima ou produto final?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Existem regulações, normas e certificações associadas a produção das suas materias primas'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual o percentual de materia Prima renovável na composição final do seu produto?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: ' Qual o percentual de matéria prima reciclável na composição final do seu produto?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual o percentual de materia Prima reciclada na composição final do seu produto?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual a característica da fonte de sua materia-prima reciclada'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'O número / diversidade de materiais / componentes é o mínimo possível ?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'A configuração do seu produto permite a separação de materiais e componentes?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'As peças são rotuladas para fácil identificação dos materiais?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Você oferece produto pra reuso ou remanufaturado?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'O seu produto ou serviço atende e se adapta a diferentes necessidades?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual a vida útil do seu produto com relação à média de mercado? Menos que a média, igual, mais etc?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Possui um manual de uso com instruções de montagem e desmontagem, assim como recomendações para o encaminhamento ambientalmente adequado?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Sua empresa disponibiliza peças de reposição?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Existem políticas e práticas voltadas para a redução do impacto ambiental associado à sua embalagem?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Os materiais utilizados na sua embalagem são reciclados e recicláveis?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há integração de serviço para garantir a qualidade do produto que você oferece? Quanto?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 0,
      weight_for_medium_companies: 0,
      weight_for_large_companies: 1,
      weight_for_service_companies: 3,
      description: 'Existem serviços ou funções específicas que são atendidas por via digital?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 2,
      weight_for_service_companies: 2,
      description: 'Vc oferece alguma forma de compartilhamento de seu produto ou serviço?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Como é o planejamento da produção do seu produto ou da oferta do seu serviço?'
    },
    {
      questionnaire: questionnaire,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há comunicação dos aspectos e impactos ambientais do seu produto?'
    }
  ]
)
# rubocop:enable Metrics/LineLength
