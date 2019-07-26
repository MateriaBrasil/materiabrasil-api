# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
questionnaire = Questionnaire.create!(
  id: 3,
  name: 'Processo',
  about_type: 'Material',
  driver: 'process',
  sorting: 3
)

Question.create!(
  [
    {
      questionnaire: questionnaire,
      sorting: 1,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Como você define a sua matriz energética?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Fonte fóssil não renovável (Carvão, gás, diesel)' },
        { value: 2, description: 'Rede elétrica municipal (fontes desconhecidas/não renováveis)' },
        { value: 3, description: 'Rede elétrica municipal (ao menos 10% da energia é oriunda de fontes renováveis tais como energia solar, eólica)' },
        { value: 4, description: '100% de fontes renováveis (Eólica, solar, hidrelétricas de pequeno porte ou sem barragens, Biomassa....)' },
        { value: 5, description: '100% de fontes renováveis autossuficientes (produção própria)' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 2,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'A sua empresa implementou algum dos seguintes métodos de conservação de água no seu pocesso produtivo?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não monitoro meu consumo' },
        { value: 2, description: 'Monitoro meu consumo' },
        { value: 3, description: 'Monitoro e tenho metas de redução' },
        { value: 4, description: 'Já implementamos processos e tecnologias que visam a redução do consumo' },
        { value: 5, description: 'Processo produtivo isento de água' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 3,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua empresa implementou algum dos seguintes métodos de conservação de água nos seus escritórios e áreas administrativas?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não monitoro meu consumo' },
        { value: 2, description: 'Monitoro meu consumo' },
        { value: 3, description: 'Monitoro e tenho metas de redução' },
        { value: 4, description: 'Já implementamos processos e tecnologias que visam a redução do consumo, como por exemplo: Torneiras, banheiros e chuveiros de fluxo reduzido de água' },
        { value: 5, description: 'Além da redução contamos com iniciativas de Coleta de Água da chuva e Reutilização/reciclagem da água cinza.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 4,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Há substâncias tóxicas usadas como insumos em seus processos de produção?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Sim' },
        { value: 5, description: 'Não' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 5,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual é a destinação final dos resíduos de seus processos de produção?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Incinerado/queimado no local (não certificado) Coletado por Terceira parte  (não certificado) ' },
        { value: 2, description: 'Coleta de lixo municipal sem separação' },
        { value: 3, description: 'Serviço contratado de terceiros (certificada e pode fornecer documentação para descarte responsável)' },
        { value: 4, description: 'Os resíduos são separados para a reciclagem e doados / fornecidos a outras instituições desde que coletem no local (certificada e pode fornecer documentação para descarte responsável)' },
        { value: 5, description: 'Os resíduos são separados e reciclados / reutilizados para a produção própria da empresa ou encaminhados para cooperativas de reciclagem.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 6,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual porcentagem de resíduos perigosos/contaminantes foi eliminada com responsabilidade, com uma terceira parte documentada? resíduos perigosos incluem: pilhas, rejeitos médicos, equipamentos eletrônicos, solventes, óleos, pigmentos sintéticos, metais pesados, etcQual porcentagem de resíduos perigosos/contaminantes foi eliminada com responsabilidade, com uma terceira parte documentada? resíduos perigosos incluem: pilhas, rejeitos médicos, equipamentos eletrônicos, solventes, óleos, pigmentos sintéticos, metais pesados, etc',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: '< 80%' },
        { value: 2, description: 'De 80% à 90%' },
        { value: 3, description: 'De 90% à 100%' },
        { value: 4, description: '100%' },
        { value: 5, description: 'Não geramos resíduos perigosos' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 7,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Há programa de eliminação ou redução dos resíduos gerados de seus processos de produção?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não' },
        { value: 2, description: 'Existem metas por setor/ processo' },
        { value: 3, description: 'Temos princípios de redução do desperdício e produção mais limpa para a todo o processo produtivo' },
        { value: 4, description: 'Temos um programa de redução e já conseguimos reduzir em até 50% os nossos resíduos' },
        { value: 5, description: 'Temos um programa de redução e já conseguimos reduzir em mais de 50% os nossos resíduos gerados' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 8,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Há programa de reuso ou reciclagem dos resíduos gerados de seus processos de produção?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não' },
        { value: 2, description: 'Existem metas por setor/ processo' },
        { value: 3, description: 'Temos princípios de reciclagem e reuso para a todo o processo produtivo' },
        { value: 4, description: 'Temos um programa de reuso e reciclagem e já conseguimos encaminhar pra reciclagem 50% dos nossos resíduos' },
        { value: 5, description: 'Temos um programa de reuso e reciclagem e já conseguimos encaminhar pra reciclagem mais de 50% do nossos nossos resíduos' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 9,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 2,
      weight_for_service_companies: 2,
      description: 'Os processos da sua cadeia de valor/ciclo de vida são realizados através de colaborações com outras organizações ou indivíduos?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não, produto exclusivo, tecnologia própria e patenteada. Toda a cadeia controlda por um único grupo comercial.' },
        { value: 2, description: 'Não, produto exclusivo, tecnologia própria e patenteada. Contrata  fornecedores e prestadores de serviço terceirizados quando necessário.' },
        { value: 3, description: 'Possuo uma cadeia de fornecedores' },
        { value: 5, description: 'Produto resultante de colaborações multi laterais e Open Source (aberta)' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 10,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há processos de reciclagem para seu produto? ',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'O meu produto não possui tecnologia que permita sua reciclagem' },
        { value: 2, description: 'o meu produto possui tecnologia que permite que ele seja reciclado, mas ela não está disponível no local onde o comercializo' },
        { value: 3, description: 'o meu produto possui tecnologia que permite a sua reciclagem e nos locais onde ele é comercializado existem iniciativas privadas que já fazem sua reciclagem' },
        { value: 4, description: 'o meu produto possui tecnologia que permite a sua reciclagem e nos locais onde ele é comercializado a coleta de lixo pública o separa e encaminha para reciclagem' },
        { value: 5, description: '100% dos meus produtos são reciclados atendidos pela logística reversa, sob responsabilidade nossa ou de terceiros.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 11,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'A sua empresa implementou algum dos seguintes métodos de conservação de energia no seu processo produtivo',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não monitoro meu consumo' },
        { value: 2, description: 'Monitoro meu consumo' },
        { value: 3, description: 'Monitoro e tenho metas de redução' },
        { value: 4, description: 'Já implementamos processos e tecnologias que visam a redução do consumo' },
        { value: 5, description: 'Processo produtivo manual, artesanal' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 12,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A sua empresa implementou algum dos seguintes métodos de conservação de energia ou eficiência energética nos seus escritórios e áreas administrativas?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não monitoro' },
        { value: 2, description: 'Monitoro meu consumo' },
        { value: 3, description: 'Monitoro e tenho metas de redução' },
        { value: 4, description: 'Já implementamos processos e tecnologias que visam a redução do consumo, como por exemplo: Lampadas de led, equipamentos com selos de eficiência..' },
        { value: 5, description: 'Além das tecnologias que visam a redução de consumo energético, fizemos modificações nosso escritório visano a ventilação natural, iluminação passiva e geração de energia limpa.' }
      ]
    }
  ]
)
# rubocop:enable Metrics/LineLength
