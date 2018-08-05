# frozen_string_literal: true

User.create!(
  email: 'foo@bar.com',
  first_name: 'Foo',
  last_name: 'Bar',
  password: '123456789'
)

User.create!(
  email: 'bar@foo.com',
  first_name: 'Foo',
  last_name: 'Bar',
  password: '123456789',
  public_profile: false
)

Material.create(
  name: 'Tecido lona algodão reciclado',
  image_url: 'https://image.ibb.co/bPMTky/tecido.jpg',
  description: 'Lona com urdume de algodão natural, sem aplicação de'\
  ' tingimento e trama de algodão reciclado em cores. Foi desenvolvido com o'\
  ' intuito de ser ecologicamente correto e orgânico, por isso em sua'\
  ' composição foram utilizadas apenas fibras naturais. A mescla de fios de'\
  ' algodão novos com fios já reciclados garante um visual rústico e'\
  ' exclusivo.',
  average_price: 'R$ 111,00',
  code: '00672',
  supplier_name: 'Ita Moulding Process',
  supplier_contact: 'itamoulding@process.com',
  manufacturing_location: 'Rio de Janeiro/RJ',
  sales_location: 'São Paulo/SP',
  highlighted: true,
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  properties: %(
    Type: Composite (wood)
    Shape: Various
    Size: According to mould
    Thickness: According to mould
    Finishing: According to mould
    Density: According to project
    Certificates: PEFC Chain of custody (CoC) certification;
    Molded wood Standards'
  ),
  usage: %(
    #Any shape under moulding process with extraction angle
    #High scale of production
    #High replicability
    #Hot moulded
    #Furnishings and packaging
  )
)

Material.create(
  name: 'Madeira Serrada Certificada',
  image_url: 'https://image.ibb.co/ddazsd/madeira.jpg',
  description: 'Madeira serrada com certificação FSC - Forest Stewardship'\
  ' Council - de manejo florestal e industrialização do material.',
  average_price: 'R$ 111,00',
  code: '00647',
  supplier_name: 'Ita Moulding Process',
  supplier_contact: 'itamoulding@process.com',
  manufacturing_location: 'Rio de Janeiro/RJ',
  sales_location: 'São Paulo/SP',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  properties: %(
    Type: Composite (wood)
    Shape: Various
    Size: According to mould
    Thickness: According to mould
    Finishing: According to mould
    Density: According to project
    Certificates: PEFC Chain of custody (CoC) certification;
    Molded wood Standards'
  ),
  usage: %(
    #Any shape under moulding process with extraction angle
    #High scale of production
    #High replicability
    #Hot moulded
    #Furnishings and packaging
  )
)

Material.create(
  name: 'Matü quadrado',
  image_url: 'https://image.ibb.co/jmdKsd/matu.jpg',
  description: 'Tecido estampado 100% reciclado e produzido no Brasil.'\
  ' Reciclado a partir de garrafas plásticas PET',
  average_price: 'R$ 111,00',
  code: '00668',
  supplier_name: 'Ita Moulding Process',
  supplier_contact: 'itamoulding@process.com',
  manufacturing_location: 'Rio de Janeiro/RJ',
  sales_location: 'São Paulo/SP',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  properties: %(
    Type: Composite (wood)
    Shape: Various
    Size: According to mould
    Thickness: According to mould
    Finishing: According to mould
    Density: According to project
    Certificates: PEFC Chain of custody (CoC) certification;
    Molded wood Standards'
  ),
  usage: %(
    #Any shape under moulding process with extraction angle
    #High scale of production
    #High replicability
    #Hot moulded
    #Furnishings and packaging
  )
)

Material.create(
  name: 'Papel semente',
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
  supplier_name: 'Ita Moulding Process',
  supplier_contact: 'itamoulding@process.com',
  manufacturing_location: 'Rio de Janeiro/RJ',
  sales_location: 'São Paulo/SP',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  properties: %(
    Type: Composite (wood)
    Shape: Various
    Size: According to mould
    Thickness: According to mould
    Finishing: According to mould
    Density: According to project
    Certificates: PEFC Chain of custody (CoC) certification;
    Molded wood Standards'
  ),
  usage: %(
    #Any shape under moulding process with extraction angle
    #High scale of production
    #High replicability
    #Hot moulded
    #Furnishings and packaging
  )
)

Material.create(
  name: 'Pastilhas de PET reciclado',
  image_url: 'https://image.ibb.co/dRGHdJ/pastilhas.jpg',
  description: 'As pastilhas Rivesti possuem em sua composição 85% de PET'\
  ' reciclado, além de aditivos minerais reaproveitados e utiliza, em sua'\
  ' fabricação, o mais avançado conceito de tecnologia verde. Os produtos da'\
  ' Rivesti são ecológicos, isentos de metais pesados e contaminantes e são'\
  ' 100% recicláveis. Cada m² de pastilhas Rivesti evita o lançamento de 3kg'\
  ' de CO2 na atmosfera e retira do meio ambiente 66 garrafas PET.',
  average_price: 'R$ 111,00',
  code: '00666',
  supplier_name: 'Ita Moulding Process',
  supplier_contact: 'itamoulding@process.com',
  manufacturing_location: 'Rio de Janeiro/RJ',
  sales_location: 'São Paulo/SP',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  properties: %(
    Type: Composite (wood)
    Shape: Various
    Size: According to mould
    Thickness: According to mould
    Finishing: According to mould
    Density: According to project
    Certificates: PEFC Chain of custody (CoC) certification;
    Molded wood Standards'
  ),
  usage: %(
    #Any shape under moulding process with extraction angle
    #High scale of production
    #High replicability
    #Hot moulded
    #Furnishings and packaging
  )
)

Material.create(
  name: 'Piso Fibonacci',
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
  supplier_name: 'Ita Moulding Process',
  supplier_contact: 'itamoulding@process.com',
  manufacturing_location: 'Rio de Janeiro/RJ',
  sales_location: 'São Paulo/SP',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  properties: %(
    Type: Composite (wood)
    Shape: Various
    Size: According to mould
    Thickness: According to mould
    Finishing: According to mould
    Density: According to project
    Certificates: PEFC Chain of custody (CoC) certification;
    Molded wood Standards'
  ),
  usage: %(
    #Any shape under moulding process with extraction angle
    #High scale of production
    #High replicability
    #Hot moulded
    #Furnishings and packaging
  )
)

Material.create(
  name: 'Telhas Ecológicas',
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
  supplier_name: 'Ita Moulding Process',
  supplier_contact: 'itamoulding@process.com',
  manufacturing_location: 'Rio de Janeiro/RJ',
  sales_location: 'São Paulo/SP',
  technical_specification_url: 'https://www.w3.org/WAI/ER/tests/xhtml/'\
    'testfiles/resources/pdf/dummy.pdf',
  properties: %(
    Type: Composite (wood)
    Shape: Various
    Size: According to mould
    Thickness: According to mould
    Finishing: According to mould
    Density: According to project
    Certificates: PEFC Chain of custody (CoC) certification;
    Molded wood Standards'
  ),
  usage: %(
    #Any shape under moulding process with extraction angle
    #High scale of production
    #High replicability
    #Hot moulded
    #Furnishings and packaging
  )
)
