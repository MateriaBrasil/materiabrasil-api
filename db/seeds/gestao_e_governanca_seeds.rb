# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
questionnaire = Questionnaire.create!(
  id: 2,
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
      description: 'Qual a proporção de mulheres na empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'De 0% à 10%' },
        { value: 2, description: 'De 10% à 20%' },
        { value: 3, description: 'De 20% à 30%' },
        { value: 4, description: 'De 30% à 40%' },
        { value: 5, description: 'Mais que 50%' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 2,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres nos cargos de decisão na empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'De 0% à 10%' },
        { value: 2, description: 'De 10% à 20%' },
        { value: 3, description: 'De 20% à 30%' },
        { value: 4, description: 'De 30% à 40%' },
        { value: 5, description: 'Mais que 50%' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 3,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Sobre o processo de recrutamento e seleção: a empresa possui políticas de equidade de gênero?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não há' },
        { value: 2, description: 'A empresa não possui política específica de equidade de gênero em relação à seleção de pessoas, mas os resultados dos processos seletivos passam por processo de justificativa e documentação formal.' },
        { value: 3, description: 'A empresa monitora a proporção de homens e mulheres contratados.' },
        { value: 4, description: 'Os resultados dos processos seletivos passam por processo de justificativa e documentação formal e a empresa monitora a proporção de homens e mulheres contratados.' },
        { value: 5, description: 'Os resultados dos processos seletivos passam por processo de justificativa e documentação formal, a empresa monitora a proporção de homens e mulheres contratados e possui percentual mínimo determinado para a contratação de mulheres.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 4,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui alguma instância responsável por promover e supervisionar a implementação de ações de promoção da equidade de gênero?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não possui' },
        { value: 2, description: 'Sim, mas a empresa não possui orçamento próprio para este fim.' },
        { value: 3, description: 'Sim, e a empresa possui orçamento próprio para essa instância.' },
        { value: 4, description: 'Sim. A empresa possui orçamento próprio para este fim e essa instância é liderada por mulheres.' },
        { value: 5, description: 'Sim. A empresa possui orçamento próprio para essa instância, liderada por mulheres e possui relacionamento com iniciativas externas à empresa.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 5,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui práticas ou políticas para combater o preconceito e a violência de gênero?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'A empresa não tem políticas oficiais para o tema.' },
        { value: 2, description: 'A empresa realiza campanhas internas de conscientização para aumentar a compreensão de colaboradores sobre a importância do combate ao preconceito e a violência de gênero e da valorização da força de trabalho com divresidade de gênero.' },
        { value: 3, description: 'A empresa realiza campanhas internas para a valorização da força de trabalho diversa. E possui código de conduta oficial que estabelece a proibição ao constrangimento ou discriminação em razão do gênero.' },
        { value: 4, description: 'A empresa realiza campanhas internas, possui código de conduta oficial, E ainda oferece treinamento de apoio a diversidade, liberdade e equidade de gênero.' },
        { value: 5, description: 'Além das anteriores, a empresa fomenta a formação de grupos de afinidade internos visando a desconstrução de estereótipos e o combate a discriminação de gênero.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 6,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui práticas ou políticas para promover e garantir a liberdade, equidade e diversidade sexual?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'A empresa não tem políticas oficiais para o tema.' },
        { value: 2, description: 'A empresa realiza campanhas internas de conscientização para aumentar a compreensão de colaboradores sobre a importância do combate ao preconceito e a violência em função da orientação sexual e a valorização da força de trabalho diversa.' },
        { value: 3, description: 'A empresa realiza campanhas internas para a valorização da força de trabalho diversa. E possui código de conduta oficial que estabelece a proibição ao constrangimento ou discriminação em razão da orientação sexual.' },
        { value: 4, description: 'A empresa realiza campanhas internas, possui código de conduta oficial, E ainda oferece treinamento de apoio a diversidade, liberdade e equidade com base na orientação sexual de funcionários e colaboradores.' },
        { value: 5, description: 'Além das anteriores, a empresa fomenta a formação de grupos de afinidade internos visando a desconstrução de estereótipos e o combate a discriminação com base na orientação sexual de funcionários e colaboradores.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 7,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres negras na empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'De 0% à 5%' },
        { value: 2, description: 'De 5% à 10%' },
        { value: 3, description: 'De 10% à 20%' },
        { value: 4, description: 'De 20% à 30%' },
        { value: 5, description: 'Mais que 30%' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 8,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de mulheres negras nos cargos de decisão na empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'De 0% à 5%' },
        { value: 2, description: 'De 5% à 10%' },
        { value: 3, description: 'De 10% à 20%' },
        { value: 4, description: 'De 20% à 30%' },
        { value: 5, description: 'Mais que 30%' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 9,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual a proporção de pessoas com deficiência (PCD) na empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'A empresa possui mais de 100 funcionários e não atinge a cota legal de PCDs' },
        { value: 2, description: 'A empresa possui menos de 100 funcionários e não possui PCDs' },
        { value: 3, description: 'A empresa possui mais de 100 funcionários e atinge a cota mínima legal de PCDs' },
        { value: 4, description: 'A empresa possui mais de 100 funcionários e supera a cota mínima legal de PCDs OU a empresa possui menos de 100 funcionários e possui pelo menos um PCD em seu quadro de funcionários' },
        { value: 5, description: 'A empresa possui mais de 10% de PCDs em seu quadro de funcionários' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 10,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa promove ações e campanhas intrenas de sensibilização para fomentar um ambiente inclusivo onde as pessoas com deficiência são envolvidas e participam do diálogo das ações inclusivas?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'A empresa possui mais de 100 funcionários e não atinge a cota legal de PCDs' },
        { value: 2, description: 'A empresa possui menos de 100 funcionários e não possui PCDs' },
        { value: 3, description: '(A empresa possui menos de 100 funcionários e possui pelo menos um PCD / a empresa possui mais de 100 funcionários e atinge a cota legal de PCDs) e possui programas de desenvolvimento/palestras e(ou) treinamentos facultativos a fim de estabelecer uma cultura de respeito e valorização da diversidade na empresa' },
        { value: 4, description: '(A empresa possui menos de 100 funcionários e possui pelo menos um PCD / a empresa possui mais de 100 funcionários e atinge a cota legal de PCDs) e possui programas de desenvolvimento/palestras e(ou) treinamentos obrigatórios a fim de estabelecer uma cultura de respeito e valorização da diversidade na empresa' },
        { value: 5, description: '(A empresa possui menos de 100 funcionários e possui pelo menos um PCD / a empresa possui mais de 100 funcionários e atinge a cota legal de PCDs) e possui uma área ou instância responsável por promover e garantir a implementação de ações inclusivas voltadas para pessoas com deficiência' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 11,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Em relação à licença-maternidade e paternidade, qual a política da empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'nossos funcionários ou colaboradores não contam com este benefício' },
        { value: 2, description: 'a empresa oferece apenas o mínimo estabelecido por lei' },
        { value: 3, description: 'a empresa concede até 30 dias além do mínimo estabelecido por lei para a licença maternidade e oferece apenas o mínimo estabelecido por lei para a licença-paternidade' },
        { value: 4, description: 'A empresa concede amais de 30 dias além do mínimo estabelecido por lei para a licença maternidade e oferece apenas o mínimo estabelecido por lei para a licença-paternidade' },
        { value: 5, description: 'A empresa concede mais de 30 dias além do mínimo estabelecido por lei para a licença maternidade e oferece até 30 dias licença-paternidade' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 12,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece plano de saúde para os empregados?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Nossos funcionários ou colaboradores não contam com este benefício' },
        { value: 2, description: 'oferece plano de saúde somente para os cargos de gestão' },
        { value: 3, description: 'oferece plano de saúde diferenciado entre os empregados' },
        { value: 4, description: 'oferece plano de saúde com participação igual ou superior a 20% do salário do empregado' },
        { value: 5, description: 'oferece o mesmo plano de saúde para todos os funcionários, com participação inferior a 20% do salário do empregado' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 13,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece benefícios de alimentação para o empregado?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'não oferece ticket restaurante ou vale alimentação, nem alimentação em restaurante da empresa' },
        { value: 2, description: 'Oferece ticket/vale alimentação ou alimentação em restaurante da empresa com participação igual ou maior que 20% do custo facial do ticket ou do custo da alimentação' },
        { value: 3, description: 'oferece ticket restaurante/vale alimentação ou alimentação em restaurante da empresa, com participação entre 19,99% e 10% do custo facil do ticket ou do custo da alimentação' },
        { value: 4, description: 'Oferece ticket restaurante / vale alimentação ou alimentação em restaurante da empresa, com participação entre 9,99% e 2% do custo facial do ticket ou do custo da alimentação.' },
        { value: 5, description: 'Oferece opção de escolha para o empregado entre ticket restaurante ou vale alimentação ou alimentação em restaurante da empresa, com participação simbólica - inferior a 1,99% do custo facial do ticket ou do custo da alimentação.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 14,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Com relação ao desenvolvimento técnico profissional',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'A empresa não pratica ações de treinamento técnico profissional.' },
        { value: 2, description: 'A empresa pratica apenas os treinamentos práticos no próprio local de trabalho.' },
        { value: 3, description: 'A empresa pratica somente os treinamentos que atendem as exigências Legais.' },
        { value: 4, description: 'A empresa investe em treinamentos internos e externos para o aperfeiçoamento dos empregados, relativamente as funções dos mesmos.' },
        { value: 5, description: 'A empresa investe em treinamentos internos e externos para o desenvolvimento dos empregados, com vista à plano de carreira.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 15,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Com relação ao desenvolvimento comportamental',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'A empresa não pratica ações formais de desenvolvimento comportamental funcional.' },
        { value: 2, description: 'A empresa pratica apenas ações de treinamento interno para desenvolvimento comportamental funcional.' },
        { value: 3, description: 'A empresa pratica ações de treinamento interno ou externo para desenvolvimento comportamental funcional, mediante solicitação do gestor da área.' },
        { value: 4, description: 'A empresa pratica ações de treinamento interno ou externo para desenvolvimento comportamental funcional em conformidade com o plano de carreira do empregado.' },
        { value: 5, description: 'A empresa pratica ações de treinamento interno ou externo para desenvolvimento comportamental funcional em conformidade com o plano de carreira do empregado, incluindo ações voltadas para o incremento de qualidade de vida.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 16,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui processo de avaliação do desempenho dos empregados?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não há processo de avaliação de desempenho dos empregados.' },
        { value: 2, description: 'O processo de avaliação dos empregados é feito pelos gestores, mas os empregados não conhecem os parâmetros e não conhecem os resultados.' },
        { value: 3, description: 'Há processo de avaliação dos empregados. Os empregados conhecem os parâmetros, mas não conhecem os resultados.' },
        { value: 4, description: 'Há processo de avaliação dos empregados. Os empregados conhecem os parâmetros e recebem o retorno dos resultados.' },
        { value: 5, description: 'Há processo de avaliação dos empregados, por metodologia 360 graus. Os empregados conhecem os parâmetros e recebem o retorno dos resultados' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 17,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Os funcionários tem um canal de feeback e sugestões de melhorias?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Os funcionários tem um canal de feeback e sugestões de melhorias?' },
        { value: 2, description: 'A empresa aplica pesquisa de opinião, mas não divulga os resultados.' },
        { value: 3, description: 'A empresa aplica pesquisa de opinião e divulga os resultados.' },
        { value: 4, description: 'A empresa aplica pesquisa de opinião, divulga os resultados e gerencia os indicadores de melhoria da satisfação dos empregados.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 18,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui registro de funcionários no e-social?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'não' },
        { value: 5, description: 'sim' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 19,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui PCMSO e PPRA atualizados?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'não' },
        { value: 5, description: 'sim' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 20,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa realiza e mantém os atestados de saúde ocupacional atualizados?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'não' },
        { value: 5, description: 'sim' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 21,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa oferece EPIs adequados para a realização das atividades para todos os funcionários?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'não' },
        { value: 5, description: 'sim' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 22,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Os equipamentos e mobiliários utilizados pelos funcionários são analisados ergonomicamente?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'não' },
        { value: 5, description: 'sim' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 23,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há política de gestão de resíduos dentro da empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'não' },
        { value: 2, description: 'Existe programa interno de coleta seletiva.' },
        { value: 3, description: 'Existe programa interno de coleta seletiva que é amparado ações informativas e periódicas de promoção da conscientização e o comprometimento de todos os profissionais da empresa com o programa.' },
        { value: 4, description: 'Existe programa interno de coleta seletiva que é amparado ações informativas e treinamentos práticos periódicos de promoção da conscientização e o comprometimento de todos os profissionais da empresa com o programa.' },
        { value: 5, description: 'Existe também um processo de supervisão da coleta seletiva.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 24,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual a proporção de negros na empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'De 0% à 10%' },
        { value: 2, description: 'De 10% à 20%' },
        { value: 3, description: 'De 20% à 30%' },
        { value: 4, description: 'De 30% à 40%' },
        { value: 5, description: 'Mais de 40%' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 25,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Qual a proporção de negros nos cargos de decisão na empresa?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'De 0% à 10%' },
        { value: 2, description: 'De 10% à 20%' },
        { value: 3, description: 'De 20% à 30%' },
        { value: 4, description: 'De 30% à 40%' },
        { value: 5, description: 'Mais de 50%' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 26,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'Sobre o processo de recrutamento e seleção: a empresa possui políticas de equidade de raça?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Não possui' },
        { value: 2, description: 'A empresa não possui política específica de equidade de raça em relação à seleção de pessoas, mas os resultados dos processos seletivos passam por processo de justificativa e documentação formal.' },
        { value: 3, description: 'A empresa monitora a proporção de contratados com base em sua raça.' },
        { value: 4, description: 'Os resultados dos processos seletivos passam por processo de justificativa e documentação formal e empresa monitora a proporção de contratados. ' },
        { value: 5, description: 'Os resultados dos processos seletivos passam por processo de justificativa e documentação formal, a empresa monitora a proporção de homens e mulheres contratados e possui percentual mínimo determinado para a contratação de negrxs.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 27,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'A empresa possui alguma instância responsável por promover e supervisionar a implementação de ações de promoção da diversidade e equidade de raça?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'A empresa não tem políticas oficiais para o tema.' },
        { value: 2, description: 'Sim, mas a empresa não possui orçamento próprio para essa instância.' },
        { value: 3, description: 'Sim, e a empresa possui orçamento próprio para essa instância.' },
        { value: 4, description: 'Sim. A empresa possui orçamento próprio para essa instância e essa instância é liderada por mulheres.' },
        { value: 5, description: 'Sim. A empresa possui orçamento próprio para essa instância, essa instância é liderada por mulheres e essa instância possui relacionamento com iniciativas externas à empresa.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 28,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'A empresa possui práticas ou políticas para combater o preconceito e a violência de raça?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'A empresa não tem políticas oficiais para o tema.' },
        { value: 2, description: 'A empresa realiza campanhas internas de conscientização para aumentar a compreensão de colaboradores sobre a importância do combate ao preconceito e a violência de raça e da valorização da força de trabalho com divresidade de raça' },
        { value: 3, description: 'A empresa realiza campanhas internas para a valorização da força de trabalho diversa. E possui código de conduta oficial que estabelece a proibição ao constrangimento ou discriminação em razão da raça.' },
        { value: 4, description: 'A empresa realiza campanhas internas, possui código de conduta oficial, E ainda oferece treinamento de apoio a diversidade, liberdade e equidade de raça.' },
        { value: 5, description: 'Além das anteriores, a empresa fomenta a formação de grupos de afinidade internos visando a desconstrução de estereótipos e o combate a discriminação de raça.' }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 29,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Qual o multiplicador de salário entre o menor e o maior salário da sua organização?',
      options_attributes: [
        { value: 0, description: 'N/A' },
        { value: 1, description: 'Maior que 40x' },
        { value: 2, description: 'De 30 à 40' },
        { value: 3, description: 'De 20 à 30' },
        { value: 4, description: 'De 10 à 20' },
        { value: 5, description: 'De 1 à 10' }
      ]
    }
  ]
)
# rubocop:enable Metrics/LineLength
