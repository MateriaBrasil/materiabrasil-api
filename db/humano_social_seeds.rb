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
      description: 'Sua empresa busca formular políticas junto a outros atores econômicos (incluindo concorrentes) para desenvolver ou defender uma maior adoção de padrões sociais e ambientais ou práticas voluntárias em seu setor?',
      options: [
        { value: 1, description: 'Não há nenhuma prática vigente no momento' },
        { value: 2, description: 'Sim, a empresa forneceu tempo de trabalha de seus funcionários ou apoio financeiro' },
        { value: 3, description: 'Sim, a empresa realizou esforços ativamente para aprimorar os padrões atuais, seja fazendo recomendações e fornecendo expertise ou criando e comprovando novos padrões' },
        { value: 4, description: 'Sim, a empresa já trabalhou com outros atores do setor em uma iniciativa conjunta' },
        { value: 5, description: 'Sim, e os esforços resultaram em uma reforma institucional, setorial ou regulatória específica' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 2,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 1,
      description: 'Existe política de patrocínio/doação para iniciativas e organizações de impacto positivo?',
      options: [
        { value: 1, description: 'Não há' },
        { value: 2, description: 'Sim, apoiamos causas mas não há política estabelecida' },
        { value: 3, description: 'Sim, apoiamos regularmente e temos uma política de apoia a causas sociais e ambientais que é revisada anualmente' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 3,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Há iniciativa de incentivo para o engajamento dos funcionários em projetos sociais?',
      options: [
        { value: 1, description: 'Não há' },
        { value: 2, description: 'Sim, existe pelo menos uma iniciativa interna' },
        { value: 3, description: 'Sim, existe mais de uma iniciativa interna' },
        { value: 4, description: 'Sim, existe pelo menos uma iniciativa interna e disponibilizamos pelo menos um dia remunerados por ano para iniciativas externas' },
        { value: 5, description: 'Sim, existe mais de uma iniciativa interna e disponibilizamos pelo menos um dia remunerado por ano para iniciativas externas' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 4,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Quais critérios sociais e ambientais são usados para a triagem da maioria dos fornecedores significativos da sua empresa?',
      options: [
        { value: 1, description: 'Não há um processo formal de triagem instituido' },
        { value: 2, description: 'Triagem com base na não aplicação de práticas negativas ou que não estejam em conformidade com os regulamentos aplicáveis (por exemplo, uso de mão de obra infantil)' },
        { value: 3, description: 'Triagem com base na aplicação de práticas positivas (processo de fabricação ecológico, práticas trabalhistas de excelência, etc)' },
        { value: 4, description: 'Triagem com base na aplicação de práticas positivas e realizamos visita ao fornecedor' },
        { value: 5, description: 'Selecionamos somente fornecedores certificados com relação a boas práticas socioambientais' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 5,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A sua empresa realiza algum dos seguintes procedimentos para promover engajamento e desenvolvimento da comunidade?',
      options: [
        { value: 1, description: 'Não há procedimentos nesse sentido' },
        { value: 2, description: 'A empresa é membro de uma organização cívica' },
        { value: 3, description: 'A empresa patrocinou/recebeu eventos para a comunidade' },
        { value: 4, description: 'A empresa atende principalmente clientes/compradores na sua comunidade local' },
        { value: 5, description: 'A atividade central da empresa visa solucionar desafios sociais e ambientais da comunidade local' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 6,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual é a duração média de seus relacionamentos com fornecedores significativos?',
      options: [
        { value: 1, description: 'Menos de 12 meses' },
        { value: 2, description: 'De 13 à 36 meses' },
        { value: 3, description: 'De 37 à 60 meses' },
        { value: 4, description: 'De 61 à 90 meses' },
        { value: 5, description: 'Mais de 90 meses' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 7,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua produção valoriza a cultura e tradição local?',
      options: [
        { value: 1, description: 'Não' },
        { value: 5, description: 'Sim' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 8,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A sua produção envolve mão de obra de cooperativas ou associações?',
      options: [
        { value: 1, description: 'Não' },
        { value: 5, description: 'Sim' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 9,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual das seguintes opções representa a estrutura de tomada de decisão da sua empresa?',
      options: [
        { value: 1, description: 'Apenas os sócios' },
        { value: 2, description: 'Os sócios e o corpo gerencial' },
        { value: 3, description: 'Inclui, pelo menos, um membro independente que represente comunidades vulneráveis' },
        { value: 4, description: 'Os sócios, o corpo gerencial e os funcionários' },
        { value: 5, description: 'Empresa é uma cooperativa e elege conselho de associação ou em seu conselho Inclui, pelo menos um membro independente que represente comunidades vulneráveis' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 10,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua empresa tem uma declaração de missão empresarial e ela inclui algum dos seguintes',
      options: [
        { value: 1, description: 'Não há Declaração por escrito' },
        { value: 2, description: 'Uma Missão corporativa descrita que não inclui nenhum compromisso social ou ambiental' },
        { value: 3, description: 'Um compromisso geral com a responsabilidade e gestão social e/ou ambiental' },
        { value: 4, description: 'Um compromisso com um impacto social e/ou ambiental positivo específico (ex: redução da pobreza, desenvolvimento econômico sustentável, etc)' },
        { value: 5, description: 'A missão empresarial da empresa foi reformulada e é alinhada com os Objetivos de Desenvolvimento Sustentável (ODS) da ONU' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 11,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual porcentagem das despesas da sua empresa (exceto mão de obra) foi gasta com fornecedores locais para abastecer a sede da empresa ou instalações de produção relevantes?',
      options: [
        { value: 1, description: 'Não temos fornecedores locais' },
        { value: 2, description: 'Menos de 20%' },
        { value: 3, description: 'De 20% à 39%' },
        { value: 4, description: 'De 40% à 59%' },
        { value: 5, description: 'Acima de 60%' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 12,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há canais de comunicação de feedback do produto?',
      options: [
        { value: 1, description: 'Não há' },
        { value: 2, description: 'Sim, via email' },
        { value: 3, description: 'Sim, via email e telefone' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 13,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua empresa possui um sistema de gestão ambiental que inclua algum dos seguintes temas?',
      options: [
        { value: 1, description: 'não há' },
        { value: 2, description: 'Política escrita documentando o compromisso da empresa com o meio ambiente' },
        { value: 3, description: 'Há objetivos e metas pra aspectos ambientais das operações da empresa. Avaliação interna ou externa realizada quanto aos impactos ambientais relacionados às atividades de negócios da empresa' },
        { value: 4, description: 'Programação projetada, com os recursos alocados, para atingir estes objetivos' },
        { value: 5, description: 'Auditoria ou supervisão periódicas para avaliar o impacto ambiental das atividades' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 14,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 1,
      description: 'À parte de uma missão por escrito, a sua empresa tomou alguma das medidas abaixo para assegurar legalmente que a sua missão social ou ambiental será mantida ao longo do tempo, independentemente da propriedade da empresa?',
      options: [
        { value: 1, description: 'Assinou um Contrato ou uma Deliberação do Conselho de Administração para alterar o Estatuto ou adotar um formato legal que requeira a consideração dos trabalhadores, da comunidade e do meio ambiente' },
        { value: 2, description: 'Emendou os documentos de governança corporativa de forma a exigir a consideração dos interesses dos trabalhadores, da comunidade e do meio ambiente (ex. Estatuto Social alterado)' },
        { value: 3, description: 'Tem uma entidade legal específica ou estrutura de governança que preserva a missão (ex.: cooperativa)' },
        { value: 4, description: 'Entidade legal/estrutura de governança preserva a missão e exige que se leve em consideração o público interessado (ou seja, Benefit Corp, B Corp ou cooperativa que tenha alterado seu estatuto para incluir a atenção aos grupos de interesse).' },
        { value: 5, description: 'Outro (por favor descreva)' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 15,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A sua empresa tem algum dos seguintes modelos de negócios de impacto focados na comunidade ou trabalhador?',
      options: [
        { value: 1, description: 'não possui' },
        { value: 2, description: 'A nossa empresa intencionalmente contrata e treina pessoas com barreiras crônicas ao emprego' },
        { value: 3, description: 'Nossa empresa é de propriedade de nossos funcionários e todos os funcionários têm a oportunidade de se tornarem proprietários' },
        { value: 4, description: 'A nossa empresa procura fornecedores carentes ou de baixa renda e negocia preços acima do mercado ou outras formas de apoio para aliviar a pobreza (ex. comércio justo)' },
        { value: 5, description: 'O nosso modelo de negócio é projetado para apoiar e/ou reconstruir nossa comunidade local' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 16,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual o posicionamento da sua empresa em relação à equidade de gênero?',
      options: [
        { value: 1, description: 'A empresa não possui política de relacionamento externo apoio à equidade de gênero' },
        { value: 2, description: 'As lideranças da empresa se posicionam publicamente a favor da equidade de gênero' },
        { value: 3, description: 'As lideranças da empresa se posicionam publicamente a favor da equidade de gênero e a empresa promove o trabalho feminino, com atitudes públicas de reconhecimento de funcionárias mulheres.' },
        { value: 4, description: 'As lideranças da empresa se posicionam publicamente a favor da equidade de gênero e a empresa investe em projetos externos que apoiam o fortalecimento da equidade de gênero.' },
        { value: 5, description: 'Possuir outras políticas de relacionamento com o público externo em prol da equidade de gênero' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 17,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual o posicionamento da sua empresa em relação à equidade de raça?',
      options: [
        { value: 1, description: 'A empresa não possui política de relacionamento externo apoio à equidade de gênero' },
        { value: 2, description: 'As lideranças da empresa se posicionam publicamente a favor da equidade de raça' },
        { value: 3, description: 'As lideranças da empresa se posicionam publicamente a favor da equidade de raça e a empresa promove o trabalho inclusivo, com atitudes públicas de reconhecimento de funcionários negras' },
        { value: 4, description: 'As lideranças da empresa se posicionam publicamente a favor da equidade de raça e a empresa investe em projetos externos que apoiam o fortalecimento da equidade de raça..' },
        { value: 5, description: 'Possuir outras políticas de relacionamento com o público externo em prol da equidade de raça' }
      ]
    }
  ]
)
# rubocop:enable Metrics/LineLength
