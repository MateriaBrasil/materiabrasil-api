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
  password: '123456789',
  public_profile: false
)

Subscription.create!(
  user: user1,
  state: 'active',
  iugu_id: '1'
)

supplier1 = Supplier.create!(
  user: user1,
  name: 'First supplier',
  description: 'Foo description',
  website: 'http://foo',
  email: 'foo@company.com',
  cnpj: '123456789',
  company_name: 'Foo Inc',
  municipal_subscription: 'does not apply',
  state_subscription: '987654321',
  phone: '5551987654321',
  company_revenue: '100000000',
  number_of_employees: 1000,
  reach: 'country',
  image_url: 'http://foo-image'
)

supplier2 = Supplier.create!(
  user: user2,
  name: 'Second supplier',
  description: 'Foo description',
  website: 'http://foo',
  email: 'bar@company.com',
  cnpj: '123456789',
  company_name: 'Foo Inc',
  municipal_subscription: 'does not apply',
  state_subscription: '987654321',
  phone: '5551987654321',
  company_revenue: '100000000',
  number_of_employees: 1000,
  reach: 'country',
  image_url: 'http://foo-image'
)

Material.create!(
  name: 'Tecido lona algodão reciclado',
  supplier: supplier1,
  image_url: 'https://image.ibb.co/bPMTky/tecido.jpg',
  description: 'Lona com urdume de algodão natural, sem aplicação de'\
  ' tingimento e trama de algodão reciclado em cores. Foi desenvolvido com o'\
  ' intuito de ser ecologicamente correto e orgânico, por isso em sua'\
  ' composição foram utilizadas apenas fibras naturais. A mescla de fios de'\
  ' algodão novos com fios já reciclados garante um visual rústico e'\
  ' exclusivo.',
  average_price: 'R$ 111,00',
  code: '00672',
  highlighted: true,
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

Material.create!(
  name: 'Madeira Serrada Certificada',
  supplier: supplier1,
  image_url: 'https://image.ibb.co/ddazsd/madeira.jpg',
  description: 'Madeira serrada com certificação FSC - Forest Stewardship'\
  ' Council - de manejo florestal e industrialização do material.',
  average_price: 'R$ 111,00',
  code: '00647',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

Material.create!(
  name: 'Matü quadrado',
  supplier: supplier1,
  image_url: 'https://image.ibb.co/jmdKsd/matu.jpg',
  description: 'Tecido estampado 100% reciclado e produzido no Brasil.'\
  ' Reciclado a partir de garrafas plásticas PET',
  average_price: 'R$ 111,00',
  code: '00668',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

Material.create!(
  name: 'Papel semente',
  supplier: supplier2,
  image_url: 'https://image.ibb.co/fiazsd/papel_semente.jpg',
  description: 'Papel Semente é feito a partir de aparas de papel reciclável'\
  ' (coletados através de parceria com catadores de recicláveis da ONG'\
  ' Guardiões do Mar) e são adicionadas sementes germináveis durante o seu'\
  ' processo de fabricação, podendo ser plantado após o uso – e não descartado'\
  ' como os demais papéis. Nossa produção é artesanal e ecológica, na qual'\
  ' durante o processo de reciclagem para fabricação do Papel Semente'\
  ' utilizamos de um sistema interno fechado de água - que garante que este'\
  ' recurso não é desperdiçado. O Papel Semente pode ser impresso ( frente ou'\
  ' frente e verso) e com ele é possível fazer: convites personalizados, tags,'\
  ' crachás, folders, cartões e kits ecológicos.',
  average_price: 'R$ 111,00',
  code: '00666',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

Material.create!(
  name: 'Pastilhas de PET reciclado',
  supplier: supplier2,
  image_url: 'https://image.ibb.co/dRGHdJ/pastilhas.jpg',
  description: 'As pastilhas Rivesti possuem em sua composição 85% de PET'\
  ' reciclado, além de aditivos minerais reaproveitados e utiliza, em sua'\
  ' fabricação, o mais avançado conceito de tecnologia verde. Os produtos da'\
  ' Rivesti são ecológicos, isentos de metais pesados e contaminantes e são'\
  ' 100% recicláveis. Cada m² de pastilhas Rivesti evita o lançamento de 3kg'\
  ' de CO2 na atmosfera e retira do meio ambiente 66 garrafas PET.',
  average_price: 'R$ 111,00',
  code: '00666',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

Material.create!(
  name: 'Piso Fibonacci',
  supplier: supplier2,
  image_url: 'https://image.ibb.co/cnj3JJ/piso.jpg',
  description: 'Desenvolvido em uma parceria entre a Parquet Nobre e a'\
  ' MateriaBrasil, o "Assoalho Fibonacci" toma partido dessa sequência para'\
  ' criar uma padronagem. Utilizando resíduos de madeira, todas as peças são'\
  ' trabalhadas manualmente para que suas medidas estejam dentro do padrão 3,'\
  ' 5, 8, 13, 21. O resultado é um material que encanta pela sua diversidade'\
  ' e desperta curiosidade sobre como medidas tão diversas podem se encaixar'\
  ' harmoniosamente.',
  average_price: 'R$ 111,00',
  code: '00666',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

Material.create!(
  name: 'Telhas Ecológicas',
  supplier: supplier2,
  image_url: 'https://image.ibb.co/fmkoky/telhas.jpg',
  description: 'Telhas ecológicas de alta resistência, material 100% reciclado'\
  ' de garrafa PET de ações pós-consumo e pós-indústria, limpos e refinados na'\
  ' unidade fabril do fornecedor. Pesam menos de 6 Kg por m². Isso corresponde'\
  ' a aproximadamente 10 vezes menos que as convencionais. A telha possui um'\
  ' excelente isolamento acústico. Estão disponíveis em diversas cores. kit de'\
  ' instalação já acompanha o produto. Fácil instalação. Alta durabilidade.'\
  ' Alta resistência às variações térmicas, evitam o ressecamento e não'\
  ' trincam. No final da obra as sobras de resíduos das telhas de pet poderão'\
  ' ser devolvidas para reciclagem. Possui aditivos de proteção anti UV. Não'\
  ' propagam fogo. São totalmente impermeáveis.',
  average_price: 'R$ 111,00',
  code: '00666',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  published: true
)

category1 = Category.create!(name: 'Classificação', multiple_choice: false)
cat1_child1 = category1.children.create!(name: 'Compósitos')
cat1_child1.children.create!(name: 'Naturais')
cat1_child1.children.create!(name: 'Sintéticos')
cat1_child1.children.create!(name: 'Misto')
cat1_child2 = category1.children.create!(name: 'Cerâmicos')
cat1_child2.children.create!(name: 'Tradicional')
cat1_child2.children.create!(name: 'Avançado')
cat1_child2.children.create!(name: 'Revestimento')
cat1_child3 = category1.children.create!(name: 'Poliméricos')
cat1_child3_child1 = cat1_child3.children.create!(name: 'Plásticos')
cat1_child3_child1.children.create!(name: 'Naturais')
cat1_child3_child1.children.create!(name: 'Sintéticos')
cat1_child3_child2 = cat1_child3.children.create!(name: 'Fibras')
cat1_child3_child2.children.create!(name: 'Naturais')
cat1_child3_child2.children.create!(name: 'Sintéticos')
cat1_child3_child3 = cat1_child3.children.create!(name: 'Borracha')
cat1_child3_child3.children.create!(name: 'Naturais')
cat1_child3_child3.children.create!(name: 'Sintéticos')
category1_child4 = category1.children.create!(name: 'Metálicos')
category1_child4.children.create!(name: 'Ferrosos')
category1_child4.children.create!(name: 'Não Ferrosos')
category1.children.create!(name: 'Têxtil')

category2 = Category.create!(name: 'Processos de manufatura')
cat2_child1 = category2.children.create!(name: 'Fabricação digital')
cat2_child1.children.create!(name: 'Corte laser')
cat2_child1.children.create!(name: 'CNC')
cat2_child1.children.create!(name: 'Impressão 3D')
cat2_child1.children.create!(name: 'Estereolitografia (SLA)')
cat2_child1.children.create!(name: 'Outro')

cat2_child2 = category2.children.create!(
  name: 'Processos materiais poliméricos'
)
cat2_child2_child3 = cat2_child2.children.create!(name: 'Moldagem por sopro')
cat2_child2_child3.children.create!(name: 'Moldagem por extrusão')
cat2_child2_child3.children.create!(name: 'Moldagem por injeção')
cat2_child2.children.create!(name: 'Moldagem por extrusão')
cat2_child2.children.create!(name: 'Moldagem por injeção')
cat2_child2.children.create!(name: 'Moldagem por termoformação')
cat2_child2.children.create!(name: 'Rotomoldagem')
cat2_child2.children.create!(name: 'Moldagem por compressão')
cat2_child2.children.create!(name: 'Calandragem')
cat2_child2.children.create!(name: 'Imersão')

cat2_child3 = category2.children.create!(name: 'Processos materiais metálicos')
cat2_child3_child1 = cat2_child3.children.create!(name: 'Fundição')
cat2_child3_child1.children.create!(name: 'Fundição em areia')
cat2_child3_child1.children.create!(name: 'Fundição em coquilha')

cat2_child3_child5 = cat2_child3.children.create!(name: 'Estampagem')
cat2_child3_child5.children.create!(name: 'A quente')
cat2_child3_child5.children.create!(name: 'A frio')

cat2_child3_child2 = cat2_child3.children.create!(name: 'Usinagem')
cat2_child3_child2.children.create!(name: 'Furação')
cat2_child3_child2.children.create!(name: 'Usinagem molde')

cat2_child3_child3 = cat2_child3.children.create!(name: 'Corte')
cat2_child3_child3.children.create!(name: 'A água')
cat2_child3_child3.children.create!(name: 'Com serra')
cat2_child3_child3.children.create!(name: 'Com arco')

cat2_child3_child4 = cat2_child3.children.create!(name: 'União')
cat2_child3_child4.children.create!(name: 'Soldagem a ponte')
cat2_child3_child4.children.create!(name: 'Soldagem GMAW')
cat2_child3_child4.children.create!(name: 'Soldagem fricção')
cat2_child3_child4.children.create!(name: 'MIG/MAG')
cat2_child3_child4.children.create!(name: 'TIG')
cat2_child3_child4.children.create!(name: 'Adesivo')

cat2_child3.children.create!(name: 'Sinterização (metalurgia do pó)')
cat2_child3.children.create!(name: 'Laminação')

cat2_child4 = category2.children.create!(name: 'Processos materiais têxteis')
cat2_child4_child1 = cat2_child4.children.create!(name: 'Tecelagem')
cat2_child4_child1.children.create!(name: 'Tecelagem')
cat2_child4_child1.children.create!(name: 'Malharia')
cat2_child4_child1.children.create!(name: 'Não tecido')
cat2_child4_child2 = cat2_child4.children.create!(name: 'Processos primários')
cat2_child4_child2.children.create!(name: 'Desengomagem')
cat2_child4_child2.children.create!(name: 'Alvejamento')
cat2_child4_child2.children.create!(name: 'Branqueamento ótico')
cat2_child4_child2.children.create!(name: 'Navalhagem')
cat2_child4_child2.children.create!(name: 'Flambagem')
cat2_child4_child2.children.create!(name: 'Prefixação')
cat2_child4_child3 = cat2_child4.children.create!(name: 'Tingimento')
cat2_child4_child3.children.create!(name: 'Sintético')
cat2_child4_child3.children.create!(name: 'Natural')
cat2_child4_child3.children.create!(name: 'Corantes diretos')
cat2_child4_child3.children.create!(name: 'Corantes a mordente')
cat2_child4_child3.children.create!(name: 'Corantes de cuba')
cat2_child4_child3.children.create!(name: 'Corantes a cobre')
cat2_child4_child3.children.create!(name: 'Corante ácido')
cat2_child4_child4 = cat2_child4.children.create!(name: 'Costura')
cat2_child4_child4.children.create!(name: 'Reta')
cat2_child4_child4.children.create!(name: 'Zig-zag')
cat2_child4_child4.children.create!(name: 'Overloque')
cat2_child4_child4.children.create!(name: 'Interloque')

cat2_child4_child5 = cat2_child4.children.create!(name: 'Fiação')
cat2_child4_child5.children.create!(name: 'Anel')
cat2_child4_child5.children.create!(name: 'Rotor')
cat2_child4_child6 = cat2_child4.children.create!(name: 'União')
cat2_child4_child6.children.create!(name: 'Por adesivo')
cat2_child4_child6.children.create!(name: 'Por solda')
cat2_child4_child7 = cat2_child4.children.create!(name: 'Estamparia')
cat2_child4_child7.children.create!(name: 'Batik')
cat2_child4_child7.children.create!(name: 'Bloco de Madeira')
cat2_child4_child7.children.create!(name: 'Rolo de Madeira')
cat2_child4_child7.children.create!(name: 'Cilindro')
cat2_child4_child7.children.create!(name: 'Silk')
cat2_child4_child7.children.create!(name: 'Cilindro Rotativo')
cat2_child4_child7.children.create!(name: 'Transfer')
cat2_child4_child7.children.create!(name: 'Estamparia Digital')
cat2_child4_child7.children.create!(name: 'Bordagem')

cat2_child4_cd8 = cat2_child4.children.create!(name: 'Demais beneficiamentos')
cat2_cd4_cd8_cd1 = cat2_child4_cd8.children.create!(name: 'Resinagem')
cat2_cd4_cd8_cd1.children.create!(name: 'PVC')
cat2_cd4_cd8_cd1.children.create!(name: 'Acrílica')
cat2_cd4_cd8_cd1.children.create!(name: 'Termofixagem')
cat2_child4_cd8.children.create!(name: 'Crackant')
cat2_child4_cd8.children.create!(name: 'Wash and wear')
cat2_child4_cd8.children.create!(name: 'Antifogo')
cat2_child4_cd8.children.create!(name: 'Antimanchas')
cat2_child4_cd8.children.create!(name: 'Antiestáticos')
cat2_child4_cd8.children.create!(name: 'Anti Microorganismos')
cat2_child4_cd8.children.create!(name: 'Anti parasitas')
cat2_child4_cd8.children.create!(name: 'Antirruga')
cat2_child4_cd8.children.create!(name: 'Aplicação de amaciantes')
cat2_child4_cd8.children.create!(name: 'Aplicação de encorpantes')
cat2_child4_cd8.children.create!(name: 'Calandragem')
cat2_child4_cd8.children.create!(name: 'Carregamento')
cat2_child4_cd8.children.create!(name: 'Escovagem')
cat2_child4_cd8.children.create!(name: 'Flanelagem')
cat2_child4_cd8.children.create!(name: 'Gofragem')
cat2_child4_cd8.children.create!(name: 'Hidrofugação')
cat2_child4_cd8.children.create!(name: 'Impermeabilização')
cat2_child4_cd8.children.create!(name: 'Lixagem')
cat2_child4_cd8.children.create!(name: 'Moiré')
cat2_child4_cd8.children.create!(name: 'Pré-encolhimento')
cat2_child4_cd8.children.create!(name: 'Prensagem permanente')

cat2_cd5 = category2.children.create!(name: 'Processos de materiais cerâmicos')
cat2_cd5.children.create!(name: 'Prensagem')
cat2_cd5.children.create!(name: 'Moldagem em barbotina (slip casting)')
cat2_cd5.children.create!(name: 'Moldagem em fita (tape casting)')
cat2_cd5.children.create!(name: 'Conformação plástica')
cat2_cd5.children.create!(name: 'Moldagem por injeção')

category3 = Category.create!(name: 'Superfície', multiple_choice: false)
category3.children.create!(name: 'Lisa')
category3.children.create!(name: 'Texturizada')
category3.children.create!(name: 'Outro')

category4 = Category.create!(name: 'Aspecto visual', multiple_choice: false)
category4.children.create!(name: 'Brilhoso')
category4.children.create!(name: 'Opaco')
category4.children.create!(name: 'Reflexivo')
category4.children.create!(name: 'Translúcido')
category4.children.create!(name: 'Semi-translúcido')
category4.children.create!(name: 'Outro')

category5 = Category.create!(name: 'Maleabilidade', multiple_choice: false)
category5.children.create!(name: 'Rígido')
category5.children.create!(name: 'Flexível')
category5.children.create!(name: 'Semi-flexível')
category5.children.create!(name: 'Outro')

category6 = Category.create!(name: 'Aplicação por indústria')
cat6_child2 = category6.children.create!(name: 'Indústria da construção civil')
cat6_child2.children.create!(name: 'Urbanismo')
cat6_child2.children.create!(name: 'Arquitetura')
cat6_child2.children.create!(name: 'Decoração')
category6.children.create!(name: 'Indústria da moda')
category6.children.create!(name: 'Indústria automotiva')
category6.children.create!(name: 'Indústria gráfica')
category6.children.create!(name: 'Indústria alimentícia')
category6.children.create!(name: 'Indústria de embalagem')
category6.children.create!(name: 'Indústria de eletroeletrônicos')
category6.children.create!(name: 'Indústria de beleza')
category6.children.create!(name: 'Outros')

category7 = Category.create!(name: 'Aplicação por funcionalidade')
cat7_child1 = category7.children.create!(name: 'Acabamentos')
cat7_child1.children.create!(name: 'Tinta')
cat7_child1.children.create!(name: 'Verniz')
cat7_child1.children.create!(name: 'Impermeabilizante')
cat7_child2 = category7.children.create!(name: 'Revestimento')
cat7_child2.children.create!(name: 'Para fachada interna')
cat7_child2.children.create!(name: 'Para fachada externa')
cat7_child5 = category7.children.create!(name: 'Isolamento e preenchimento')
cat7_child5.children.create!(name: 'Acústico')
cat7_child5.children.create!(name: 'Térmico')
cat7_child5.children.create!(name: 'Preenchimento')
cat7_child11 = category7.children.create!(name: 'Piso')
cat7_child11.children.create!(name: 'Piso interno')
cat7_child11.children.create!(name: 'Piso externo')
category7.children.create!(name: 'Estrutural')
category7.children.create!(name: 'Adesivo')
category7.children.create!(name: 'Têxtil')
category7.children.create!(name: 'Mobiliário')
category7.children.create!(name: 'Decoração')
category7.children.create!(name: 'Iluminação')
category7.children.create!(name: 'Preenchimento')
category7.children.create!(name: 'Brinquedos infantis')
category7.children.create!(name: 'Outro')

questionnaire = Questionnaire.create!(
  name: 'Humano Social - Para fora',
  about_type: 'Supplier',
  driver: 'materiality_driver',
  sorting: 1
)

question = Question.create!(
  questionnaire: questionnaire,
  description: 'Sua empresa busca formular políticas junto a outros atores ' \
    'economicos (incluindo concorrentes) para desenvolver ou defender uma ' \
    'maior adoção de padrões sociais e ambientais ou práticas voluntárias em ' \
    'seu setor?',
  sorting: 1
)

Option.create!(
  question: question,
  description: 'Não há nenhuma pratica vigente no momento',
  value: 1
)

Option.create!(
  question: question,
  description: 'Sim, a empresa forneceu tempo de trabalho de seus ' \
    'funcionários ou apoio financeiro',
  value: 2
)

Option.create!(
  question: question,
  description: 'Sim, a empresa realizou esforços ativamente para aprimorar ' \
    'os padrões atuais, seja fazendo recomendações e fornecendo expertise ' \
    'ou criando e comprovando novos padrões',
  value: 3
)

Option.create!(
  question: question,
  description: 'Sim, a empresa já trabalhou com outros atores do setor em ' \
    'uma iniciativa conjunta',
  value: 4
)

Option.create!(
  question: question,
  description: 'Sim, e os esforços resultaram em uma reforma institucional, ' \
    'setorial ou regulatória específica',
  value: 5
)

question = Question.create!(
  questionnaire: questionnaire,
  description: 'Existe política de Patrocínio/doação para iniciativas ou ' \
    'organizações de impacto positivo?',
  sorting: 2
)

Option.create!(
  question: question,
  description: 'Não há',
  value: 1
)

Option.create!(
  question: question,
  description: 'Sim, apoiamos causas mas não há politica estabelecida',
  value: 2
)

Option.create!(
  question: question,
  description: 'Sim, apoiamos regularmente e temos uma política de apoio a ' \
    'causas sociais e ambientais que é revisada anualmente',
  value: 3
)

questionnaire = Questionnaire.create!(
  name: 'Humano Social - Para dentro',
  about_type: 'Supplier',
  driver: 'manufacture_driver',
  sorting: 2
)

question = Question.create!(
  questionnaire: questionnaire,
  description: 'Qual a proporção de mulheres na empresa?',
  sorting: 1
)

Option.create!(
  question: question,
  description: '0-10%',
  value: 1
)

Option.create!(
  question: question,
  description: '10-20%',
  value: 2
)

Option.create!(
  question: question,
  description: '20-30%',
  value: 3
)

Option.create!(
  question: question,
  description: '30-40%',
  value: 4
)

Option.create!(
  question: question,
  description: 'Mais que 50%',
  value: 5
)

question = Question.create!(
  questionnaire: questionnaire,
  description: 'Sobre o processo de recrutamento e seleção da suea empresa: ' \
    'existem práticas voltadas para a equidade de gênero?',
  sorting: 2
)

Option.create!(
  question: question,
  description: 'Não.',
  value: 1
)

Option.create!(
  question: question,
  description: 'A empresa não possui política específica de equidade de ' \
    'gênero em relação à seleção de pessoas, mas os resultados dos ' \
    'processos seletivos passam por processo de justificativa e ' \
    'documentação formal.',
  value: 2
)

Option.create!(
  question: question,
  description: 'A empresa monitora a proporção de homens e mulheres ' \
    'contratados.',
  value: 3
)

Option.create!(
  question: question,
  description: 'Os resultados dos processos seletivos passam por processo ' \
    'de justificativa e documentação formal e a empresa monitora a ' \
    'proporção de homens e mulheres contratados.',
  value: 4
)

Option.create!(
  question: question,
  description: 'Os resultados dos processos seletivos passam por processo ' \
    'de justificativa e documentação formal, a empresa monitora a proporção ' \
    'de homens e mulheres contratados e possui percentual mínimo ' \
    'determinado para a contratação de mulheres.',
  value: 5
)

questionnaire = Questionnaire.create!(
  name: 'Circularidade - Materia Prima',
  about_type: 'Material',
  driver: 'management_driver',
  sorting: 1
)

question = Question.create!(
  questionnaire: questionnaire,
  description: 'Como voce caracteriza a sua materia-prima quanto a sua ' \
    'natureza?',
  sorting: 1
)

Option.create!(
  question: question,
  description: 'Sintético',
  value: 1
)

Option.create!(
  question: question,
  description: 'Artificial',
  value: 2
)

Option.create!(
  question: question,
  description: 'Mineral',
  value: 3
)

Option.create!(
  question: question,
  description: 'Animal',
  value: 4
)

Option.create!(
  question: question,
  description: 'Vegetal',
  value: 5
)

question = Question.create!(
  questionnaire: questionnaire,
  description: 'Há substâncias tóxicas ou contaminantes na composição da ' \
    'sua matéria-prima ou produto final?',
  sorting: 2
)

Option.create!(
  question: question,
  description: 'Sim',
  value: 1
)

Option.create!(
  question: question,
  description: 'Não',
  value: 5
)

questionnaire = Questionnaire.create!(
  name: 'Circularidade - Processos',
  about_type: 'Material',
  driver: 'social_driver',
  sorting: 2
)

question = Question.create!(
  questionnaire: questionnaire,
  description: 'Como você define a sua matriz energética?',
  sorting: 2
)

Option.create!(
  question: question,
  description: 'Fonte fóssil não renovável (Carvão, gás, diesel)',
  value: 1
)

Option.create!(
  question: question,
  description: 'Rede elétrica municipal (fontes desconhecidas/não renováveis)',
  value: 2
)

Option.create!(
  question: question,
  description: 'Rede elétrica municipal (ao menos 10% da energia é oriunda ' \
    'de fontes renováveis tais como energia solar, eólica)',
  value: 3
)

Option.create!(
  question: question,
  description: '100% de fontes renováveis (Eólica, solar, hidrelétricas de ' \
    'pequeno porte ou sem barragens, Biomassa...)',
  value: 4
)

Option.create!(
  question: question,
  description: '100% de fontes renováveis autosuficientes (produção própria)',
  value: 5
)

question = Question.create!(
  questionnaire: questionnaire,
  description: 'A sua empresa implementou algum dos seguintes métodos de ' \
    'conservação de água no seu processo produtivo',
  sorting: 1
)

Option.create!(
  question: question,
  description: 'Não monitoro meu consumo',
  value: 1
)

Option.create!(
  question: question,
  description: 'Monitoro meu consumo',
  value: 2
)

Option.create!(
  question: question,
  description: 'Monitoro e tenho metas de redução',
  value: 3
)

Option.create!(
  question: question,
  description: 'Já implementamos processos e tecnologias que visam a ' \
    'redução do consumo',
  value: 4
)

Option.create!(
  question: question,
  description: 'Processo produtivo isento de água',
  value: 5
)
