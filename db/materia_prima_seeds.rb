# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
questionnaire = Questionnaire.create!(
  id: 4,
  name: 'Matéria Prima',
  about_type: 'Material',
  driver: 'raw_material',
  sorting: 4
)

Question.create!(
  [
    {
      questionnaire: questionnaire,
      sorting: 1,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Como voce caracteriza a sua materia-prima quanto a sua natureza?',
      options_attributes: [
        {
          value: 1,
          description: 'Sintético'
        },
        {
          value: 2,
          description: 'Artificial'
        },
        {
          value: 3,
          description: 'Mineral'
        },
        {
          value: 4,
          description: 'Animal'
        },
        {
          value: 5,
          description: 'Vegetal'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 2,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual a característica da fonte de sua principal materia-prima?',
      options_attributes: [
        {
          value: 1,
          description: 'Matéria Prima Importada'
        },
        {
          value: 2,
          description: 'Produção industrial'
        },
        {
          value: 3,
          description: 'Produção agropecuária'
        },
        {
          value: 4,
          description: 'Extrativista'
        },
        {
          value: 5,
          description: 'Produção agloflorestal , consorciada com outras culturas com potencial regenerativo. Ou oriundos de cooperativas.'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 3,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Há substâncias tóxicas ou contaminantes na composição da sua matéria-prima ou produto final?',
      options_attributes: [
        {
          value: 1,
          description: 'sim'
        },
        {
          value: 5,
          description: 'Não'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 4,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Existem regulações, normas e certificações associadas a produção das suas materias primas',
      options_attributes: [
        {
          value: 1,
          description: 'Não possui'
        },
        {
          value: 2,
          description: 'Industrial'
        },
        {
          value: 3,
          description: 'Agro florestal'
        },
        {
          value: 4,
          description: 'Socioambientais'
        },
        {
          value: 5,
          description: 'Sócio ambientais'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 5,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual o percentual de materia Prima renovável na composição final do seu produto?',
      options_attributes: [
        {
          value: 1,
          description: 'De 0% à 20%'
        },
        {
          value: 2,
          description: 'De 20% à 40%'
        },
        {
          value: 3,
          description: 'De 40% à 60%'
        },
        {
          value: 4,
          description: 'De 60% à 80%'
        },
        {
          value: 5,
          description: 'De 80% à 100%'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 6,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: ' Qual o percentual de matéria prima reciclável na composição final do seu produto?',
      options_attributes: [
        {
          value: 1,
          description: 'De 0% à 20%'
        },
        {
          value: 2,
          description: 'De 20% à 40%'
        },
        {
          value: 3,
          description: 'De 40% à 60%'
        },
        {
          value: 4,
          description: 'De 60% à 80%'
        },
        {
          value: 5,
          description: 'De 80% à 100%'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 7,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual o percentual de materia Prima reciclada na composição final do seu produto?',
      options_attributes: [
        {
          value: 1,
          description: 'De 0% à 20%'
        },
        {
          value: 2,
          description: 'De 20% à 40%'
        },
        {
          value: 3,
          description: 'De 40% à 60%'
        },
        {
          value: 4,
          description: 'De 60% à 80%'
        },
        {
          value: 5,
          description: 'De 80% à 100%'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 8,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual a característica da fonte de sua materia-prima reciclada',
      options_attributes: [
        {
          value: 1,
          description: 'Resíduos industriais de pré consumo'
        },
        {
          value: 2,
          description: 'Resíduos de produção de terceiros'
        },
        {
          value: 3,
          description: 'Matéria prima reciclada pré beneficiada'
        },
        {
          value: 4,
          description: 'Resíduos pós consumo'
        },
        {
          value: 5,
          description: 'Resíduos pós consumo comprados de cooperativas'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 9,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'O número / diversidade de materiais / componentes é o mínimo possível ?',
      options_attributes: [
        {
          value: 1,
          description: 'Trabalhamos com matérias primas diversas de acordo com as exigências técnicas'
        },
        {
          value: 3,
          description: 'Buscamos reduzir ao máximo a complexidade dos nossos produtos e a diversidade de materiais para viabilizar o fechamento dos ciclos'
        },
        {
          value: 4,
          description: 'Trabalhamos com uma pequena variedade de matérias primas compatíveis e da mesma natureza (Ou não há combinação de materiais que inviabilize o fechamento de ciclos)'
        },
        {
          value: 5,
          description: 'Nosso produto / material é uniforme, homogêneo, mono componente'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 10,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'A configuração do seu produto permite a separação de materiais e componentes?',
      options_attributes: [
        {
          value: 1,
          description: 'Materiais e componentes não são passíveis de separação'
        },
        {
          value: 2,
          description: 'Os materiais podem ser separados para a reciclagem, mas não há separação de componentes para reuso, reparo e manutenção'
        },
        {
          value: 3,
          description: 'Componentes fácil separação'
        },
        {
          value: 4,
          description: 'Materiais e componentes de fácil separação, mas depende de mão de obra especializada, ferramentas ou processos especiais.'
        },
        {
          value: 5,
          description: 'Materiais e componentes de fácil separação'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 11,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'As peças são rotuladas para fácil identificação dos materiais?',
      options_attributes: [
        {
          value: 1,
          description: 'Não'
        },
        {
          value: 3,
          description: 'Temos informação sobre o principal material constituinte'
        },
        {
          value: 5,
          description: 'Todos os materiais são identificados'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 12,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Você oferece produto pra reuso ou remanufaturado?',
      options_attributes: [
        {
          value: 1,
          description: 'Não, nossos produtos são de uso único e não permitem re uso'
        },
        {
          value: 2,
          description: 'Nosso produto pode ser re utilizado, mas não há cadeia estabelecida e nós não oferecemos nenhum serviço associado a esse re uso'
        },
        {
          value: 3,
          description: 'Existe uma cadeia de manutenção e remanufatura, mas nós não somos os agentes desta transformação.'
        },
        {
          value: 4,
          description: 'Comercializamos produtos novos e usados/ remanufaturados em nossos canais de venda'
        },
        {
          value: 5,
          description: 'Todos os nossos produtos são remanufaturados ou oriundos de campanhas de re uso.'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 13,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 2,
      description: 'O seu produto ou serviço atende e se adapta a diferentes necessidades?',
      options_attributes: [
        {
          value: 1,
          description: 'Não, meu produto atende a uma função única definida'
        },
        {
          value: 5,
          description: 'Meu produto é adaptável a diferentes necessidades'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 14,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Qual a vida útil do seu produto com relação à média de mercado? Menos que a média, igual, mais etc?',
      options_attributes: [
        {
          value: 1,
          description: 'Meu produto é descartável'
        },
        {
          value: 2,
          description: 'Menor que a média do mercado'
        },
        {
          value: 3,
          description: 'Igual'
        },
        {
          value: 4,
          description: 'Maior que a média do mercado'
        },
        {
          value: 5,
          description: 'Ofereço garantia vitalícia'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 15,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Possui um manual de uso com instruções de montagem e desmontagem, assim como recomendações para o encaminhamento ambientalmente adequado?',
      options_attributes: [
        {
          value: 1,
          description: 'Não possui manual'
        },
        {
          value: 3,
          description: 'O manual compreende todas as etapas necessárias para manutenção, montagem e desmontagem.'
        },
        {
          value: 5,
          description: 'O manual compreende todas as etapas necessárias para manutenção, montagem e desmontagem. Assim como, recomendações para o encaminhamento correto visando a circularidade da cadeia como um todo.'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 16,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 3,
      weight_for_service_companies: 0,
      description: 'Sua empresa disponibiliza peças de reposição?',
      options_attributes: [
        {
          value: 1,
          description: 'Não'
        },
        {
          value: 3,
          description: 'Sim, enquanto o produto estiver sendo fabricado'
        },
        {
          value: 5,
          description: 'Sim, garantimos peça de reposição para toda a nossa linha de produtos ao longo de toda sua vida útil mesmo após saída de linha'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 17,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Existem políticas e práticas voltadas para a redução do impacto ambiental associado à sua embalagem?',
      options_attributes: [
        {
          value: 1,
          description: 'Não'
        },
        {
          value: 5,
          description: 'Sim'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 18,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 2,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Os materiais utilizados na sua embalagem são reciclados e recicláveis?',
      options_attributes: [
        {
          value: 1,
          description: 'Não'
        },
        {
          value: 3,
          description: 'Parte dos materiais é reciclada e reciclável'
        },
        {
          value: 5,
          description: 'O material é reciclável e reciclado'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 19,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há integração de serviço para garantir a qualidade do produto que você oferece? Quanto?',
      options_attributes: [
        {
          value: 1,
          description: 'Não ofereço serviço'
        },
        {
          value: 2,
          description: 'Manutenção somente durante a garantia'
        },
        {
          value: 3,
          description: 'Ofereço manutenção durante todo ciclo de vida útil'
        },
        {
          value: 4,
          description: 'Ofereço outros serviços além da manutenção?'
        },
        {
          value: 5,
          description: 'Não comercializo o produto, o negócio é voltado para o serviço'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 20,
      weight_for_small_companies: 0,
      weight_for_medium_companies: 0,
      weight_for_large_companies: 1,
      weight_for_service_companies: 3,
      description: 'Existem serviços ou funções específicas que são atendidas por via digital?',
      options_attributes: [
        {
          value: 1,
          description: 'Não'
        },
        {
          value: 5,
          description: 'Sim'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 21,
      weight_for_small_companies: 1,
      weight_for_medium_companies: 1,
      weight_for_large_companies: 2,
      weight_for_service_companies: 2,
      description: 'Você oferece alguma forma de compartilhamento de seu produto ou serviço?',
      options_attributes: [
        {
          value: 1,
          description: 'Não'
        },
        {
          value: 5,
          description: 'Sim'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 22,
      weight_for_small_companies: 3,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Como é o planejamento da produção do seu produto ou da oferta do seu serviço?',
      options_attributes: [
        {
          value: 1,
          description: 'Produção ininterrupta de larga escala'
        },
        {
          value: 3,
          description: 'Produção customizada por segmento e clientes'
        },
        {
          value: 5,
          description: 'Produto ou serviço é feito por demanda'
        }
      ]
    },
    {
      questionnaire: questionnaire,
      sorting: 23,
      weight_for_small_companies: 2,
      weight_for_medium_companies: 3,
      weight_for_large_companies: 3,
      weight_for_service_companies: 3,
      description: 'Há comunicação dos aspectos e impactos ambientais do seu produto?',
      options_attributes: [
        {
          value: 1,
          description: 'Não'
        },
        {
          value: 2,
          description: 'Comunicamos sobre as características do produto, mas não possuímos normas ou processos específicos'
        },
        {
          value: 3,
          description: 'Existe a comunicação, baseada em normas e critérios próprias'
        },
        {
          value: 4,
          description: 'Possuímos auditoria interna'
        },
        {
          value: 5,
          description: 'Possuímos e divulgamos normas e certificações auditadas por instuições independentes'
        }
      ]
    }
  ]
)
# rubocop:enable Metrics/LineLength
