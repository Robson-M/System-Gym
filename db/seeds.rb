# db/seeds.rb

#   users (independente) -> plans -> students (pertencem a um plan) -> payments (pertencem a student e plan)

SENHA_DEMO = "123456"
HOJE = Date.current

puts "Criando users..."

users = [
  { name_user: "Robson Admin", cpf: "22022697898", phone_user: "77999601475", birth_date_user: "1986-03-15" },
  { name_user: "Mariana Gerente", cpf: "58176252883", phone_user: "77980828714", birth_date_user: "1984-04-17" },
  { name_user: "Carlos Recepção", cpf: "59450283125", phone_user: "77988658096", birth_date_user: "1975-01-04" },
  { name_user: "Fernanda Financeiro", cpf: "37352866744", phone_user: "77997536950", birth_date_user: "1981-03-08" },
  { name_user: "Paulo Instrutor", cpf: "78971331178", phone_user: "77987243589", birth_date_user: "1997-04-10" },
  { name_user: "Juliana Atendimento", cpf: "63608244506", phone_user: "77988151156", birth_date_user: "1978-03-07" },
  { name_user: "Rafael Suporte", cpf: "45721283599", phone_user: "77989337183", birth_date_user: "1990-09-15" }
]

users.each do |attrs|
  User.find_or_create_by!(cpf: attrs[:cpf]) do |u|
    u.assign_attributes(attrs.merge(password: SENHA_DEMO, password_confirmation: SENHA_DEMO))
  end
end

puts "Criando plans..."

plans_data = {
  basico:     { name_plan: "Básico",     price: 69.90,  duration_days: 30,  active: true },
  mensal:     { name_plan: "Mensal",     price: 99.90,  duration_days: 30,  active: true },
  trimestral: { name_plan: "Trimestral", price: 269.90, duration_days: 90,  active: true },
  semestral:  { name_plan: "Semestral",  price: 499.90, duration_days: 180, active: true },
  anual:      { name_plan: "Anual",      price: 899.90, duration_days: 365, active: true }
}

plans = plans_data.transform_values do |attrs|
  Plan.find_or_create_by!(name_plan: attrs[:name_plan]) { |p| p.assign_attributes(attrs) }
end

puts "Criando students e payments..."

students_data = [
  { name_student: "Marcos Silva Costa", cpf_student: "98716897641", email_student: "marcos.silva.costa@email.com", phone: "71987448554", birth_date: "1989-02-13", street: "Rua das Flores", house_number: 948, neighborhood: "Centro", plan: :trimestral, payments: 8 },
  { name_student: "Ana Ferreira Barbosa", cpf_student: "88093208160", email_student: "ana.ferreira.barbosa@email.com", phone: "77990745237", birth_date: "1988-10-16", street: "Avenida Brasil", house_number: 744, neighborhood: "Vila Nova", plan: :mensal, payments: 12 },
  { name_student: "Carlos Santos Ribeiro", cpf_student: "31778486452", email_student: "carlos.santos.ribeiro@email.com", phone: "77992748035", birth_date: "1992-03-16", street: "Rua Sete de Setembro", house_number: 571, neighborhood: "Alto do Cruzeiro", plan: :trimestral, payments: 1 },
  { name_student: "Maria Gomes Freitas", cpf_student: "66344002964", email_student: "maria.gomes.freitas@email.com", phone: "71996379223", birth_date: "2006-08-26", street: "Rua Bahia", house_number: 479, neighborhood: "Parque das Árvores", plan: :mensal, payments: 1 },
  { name_student: "João Rodrigues Moreira", cpf_student: "47787680431", email_student: "joao.rodrigues.moreira@email.com", phone: "77996459567", birth_date: "1993-06-07", street: "Avenida Getúlio Vargas", house_number: 334, neighborhood: "São Vicente", plan: :mensal, payments: 7 },
  { name_student: "Juliana Rocha Silva", cpf_student: "84726714708", email_student: "juliana.rocha.silva@email.com", phone: "77989372611", birth_date: "1990-12-23", street: "Rua São João", house_number: 389, neighborhood: "Bela Vista", plan: :mensal, payments: 3 },
  { name_student: "Pedro Lima Cavalcante", cpf_student: "01079819398", email_student: "pedro.lima.cavalcante@email.com", phone: "71981974188", birth_date: "1988-03-15", street: "Rua da Paz", house_number: 263, neighborhood: "Santa Clara", plan: :mensal, payments: 10 },
  { name_student: "Fernanda Cardoso Almeida", cpf_student: "52059972817", email_student: "fernanda.cardoso.almeida@email.com", phone: "77982471731", birth_date: "1996-05-22", street: "Rua Castro Alves", house_number: 238, neighborhood: "Jardim América", plan: :semestral, payments: 4 },
  { name_student: "Lucas Ribeiro Santos", cpf_student: "41622948602", email_student: "lucas.ribeiro.santos@email.com", phone: "77989683149", birth_date: "2000-12-17", street: "Avenida Central", house_number: 409, neighborhood: "Boa Vista", plan: :trimestral, payments: 3 },
  { name_student: "Camila Freitas Gomes", cpf_student: "01610550013", email_student: "camila.freitas.gomes@email.com", phone: "71996543433", birth_date: "1995-04-13", street: "Rua Rui Barbosa", house_number: 532, neighborhood: "Novo Horizonte", plan: :basico, payments: 12 },
  { name_student: "Rafael Martins Araújo", cpf_student: "51779922922", email_student: "rafael.martins.araujo@email.com", phone: "77989746370", birth_date: "2005-05-15", street: "Rua XV de Novembro", house_number: 542, neighborhood: "Centro", plan: :mensal, payments: 5 },
  { name_student: "Aline Cavalcante Teixeira", cpf_student: "93186032075", email_student: "aline.cavalcante.teixeira@email.com", phone: "77984238104", birth_date: "2001-06-15", street: "Rua das Palmeiras", house_number: 673, neighborhood: "Vila Nova", plan: :mensal, payments: 2 },
  { name_student: "Gabriel Dias Rocha", cpf_student: "70283822228", email_student: "gabriel.dias.rocha@email.com", phone: "71991151789", birth_date: "1990-11-07", street: "Rua Santa Luzia", house_number: 409, neighborhood: "Alto do Cruzeiro", plan: :basico, payments: 1 },
  { name_student: "Patrícia Correia Machado", cpf_student: "16425247789", email_student: "patricia.correia.machado@email.com", phone: "77985587969", birth_date: "1996-07-28", street: "Rua Dom Pedro II", house_number: 808, neighborhood: "Parque das Árvores", plan: :anual, payments: 2 },
  { name_student: "Felipe Teixeira Nogueira", cpf_student: "58771884106", email_student: "felipe.teixeira.nogueira@email.com", phone: "77996697811", birth_date: "1980-08-06", street: "Rua Tiradentes", house_number: 878, neighborhood: "São Vicente", plan: :mensal, payments: 9 },
  { name_student: "Beatriz Oliveira Costa", cpf_student: "56820525877", email_student: "beatriz.oliveira.costa@email.com", phone: "71984384790", birth_date: "1962-02-15", street: "Rua das Flores", house_number: 713, neighborhood: "Bela Vista", plan: :basico, payments: 7 },
  { name_student: "Bruno Nogueira Souza", cpf_student: "48939494890", email_student: "bruno.nogueira.souza@email.com", phone: "77991729820", birth_date: "1975-02-20", street: "Avenida Brasil", house_number: 145, neighborhood: "Santa Clara", plan: :anual, payments: 1 },
  { name_student: "Larissa Costa Ribeiro", cpf_student: "10521854954", email_student: "larissa.costa.ribeiro@email.com", phone: "77982075320", birth_date: "1968-07-06", street: "Rua Sete de Setembro", house_number: 867, neighborhood: "Jardim América", plan: :mensal, payments: 6 },
  { name_student: "Thiago Barros Nascimento", cpf_student: "41064600174", email_student: "thiago.barros.nascimento@email.com", phone: "71981305768", birth_date: "1982-03-09", street: "Rua Bahia", house_number: 250, neighborhood: "Boa Vista", plan: :basico, payments: 3 },
  { name_student: "Mariana Nascimento Moreira", cpf_student: "89557990635", email_student: "mariana.nascimento.moreira@email.com", phone: "77980476077", birth_date: "1969-02-22", street: "Avenida Getúlio Vargas", house_number: 333, neighborhood: "Novo Horizonte", plan: :basico, payments: 10 },
  { name_student: "Diego Silva Martins", cpf_student: "15846450679", email_student: "diego.silva.martins@email.com", phone: "77992444532", birth_date: "2000-08-14", street: "Rua São João", house_number: 909, neighborhood: "Centro", plan: :mensal, payments: 4 },
  { name_student: "Carolina Ferreira Cavalcante", cpf_student: "14659085368", email_student: "carolina.ferreira.cavalcante@email.com", phone: "71980485610", birth_date: "2006-06-10", street: "Rua da Paz", house_number: 584, neighborhood: "Vila Nova", plan: :anual, payments: 1 },
  { name_student: "Rodrigo Santos Mendes", cpf_student: "10285940627", email_student: "rodrigo.santos.mendes@email.com", phone: "77981142844", birth_date: "1972-10-04", street: "Rua Castro Alves", house_number: 602, neighborhood: "Alto do Cruzeiro", plan: :basico, payments: 5 },
  { name_student: "Amanda Gomes Santos", cpf_student: "36322808869", email_student: "amanda.gomes.santos@email.com", phone: "77982586832", birth_date: "1988-07-13", street: "Avenida Central", house_number: 416, neighborhood: "Parque das Árvores", plan: :mensal, payments: 11 },
  { name_student: "André Rodrigues Correia", cpf_student: "04876452946", email_student: "andre.rodrigues.correia@email.com", phone: "71998205177", birth_date: "1971-04-01", street: "Rua Rui Barbosa", house_number: 101, neighborhood: "São Vicente", plan: :trimestral, payments: 5 },
  { name_student: "Bruna Rocha Araújo", cpf_student: "84585003703", email_student: "bruna.rocha.araujo@email.com", phone: "77997193937", birth_date: "1997-01-21", street: "Rua XV de Novembro", house_number: 69, neighborhood: "Bela Vista", plan: :mensal, payments: 8 },
  { name_student: "Gustavo Lima Rodrigues", cpf_student: "26538453503", email_student: "gustavo.lima.rodrigues@email.com", phone: "77999864634", birth_date: "2005-09-28", street: "Rua das Palmeiras", house_number: 377, neighborhood: "Santa Clara", plan: :trimestral, payments: 2 },
  { name_student: "Letícia Cardoso Rocha", cpf_student: "94326270551", email_student: "leticia.cardoso.rocha@email.com", phone: "71989408496", birth_date: "1997-08-26", street: "Rua Santa Luzia", house_number: 843, neighborhood: "Jardim América", plan: :semestral, payments: 1 },
  { name_student: "Leonardo Ribeiro Carvalho", cpf_student: "02145842160", email_student: "leonardo.ribeiro.carvalho@email.com", phone: "77999569572", birth_date: "2006-07-26", street: "Rua Dom Pedro II", house_number: 935, neighborhood: "Boa Vista", plan: :basico, payments: 2 },
  { name_student: "Renata Freitas Nogueira", cpf_student: "49066882840", email_student: "renata.freitas.nogueira@email.com", phone: "77980379739", birth_date: "1975-12-19", street: "Rua Tiradentes", house_number: 117, neighborhood: "Novo Horizonte", plan: :anual, payments: 2 },
  { name_student: "Mateus Martins Cardoso", cpf_student: "84409324489", email_student: "mateus.martins.cardoso@email.com", phone: "71981753324", birth_date: "2008-07-11", street: "Rua das Flores", house_number: 564, neighborhood: "Centro", plan: :basico, payments: 9 },
  { name_student: "Vanessa Cavalcante Souza", cpf_student: "09765828055", email_student: "vanessa.cavalcante.souza@email.com", phone: "77985846852", birth_date: "1970-07-07", street: "Avenida Brasil", house_number: 193, neighborhood: "Vila Nova", plan: :anual, payments: 1 },
  { name_student: "Eduardo Dias Barros", cpf_student: "18051543890", email_student: "eduardo.dias.barros@email.com", phone: "77986449832", birth_date: "1971-03-01", street: "Rua Sete de Setembro", house_number: 167, neighborhood: "Alto do Cruzeiro", plan: :basico, payments: 6 },
  { name_student: "Jéssica Correia Nascimento", cpf_student: "71164941542", email_student: "jessica.correia.nascimento@email.com", phone: "71992275065", birth_date: "1970-02-11", street: "Rua Bahia", house_number: 495, neighborhood: "Parque das Árvores", plan: :basico, payments: 4 },
  { name_student: "Vinícius Teixeira Pereira", cpf_student: "35795111732", email_student: "vinicius.teixeira.pereira@email.com", phone: "77998629171", birth_date: "1969-09-17", street: "Avenida Getúlio Vargas", house_number: 806, neighborhood: "São Vicente", plan: :mensal, payments: 12 },
  { name_student: "Tatiane Oliveira Martins", cpf_student: "56885576565", email_student: "tatiane.oliveira.martins@email.com", phone: "77986395346", birth_date: "2004-04-06", street: "Rua São João", house_number: 190, neighborhood: "Bela Vista", plan: :trimestral, payments: 4 },
  { name_student: "Ricardo Nogueira Ferreira", cpf_student: "56963279233", email_student: "ricardo.nogueira.ferreira@email.com", phone: "71984028585", birth_date: "1976-12-12", street: "Rua da Paz", house_number: 451, neighborhood: "Santa Clara", plan: :trimestral, payments: 6 },
  { name_student: "Luciana Costa Mendes", cpf_student: "74284352857", email_student: "luciana.costa.mendes@email.com", phone: "77985486389", birth_date: "1969-06-09", street: "Rua Castro Alves", house_number: 800, neighborhood: "Jardim América", plan: :semestral, payments: 2 },
  { name_student: "Fábio Barros Dias", cpf_student: "66085651783", email_student: "fabio.barros.dias@email.com", phone: "77982525389", birth_date: "1980-10-15", street: "Avenida Central", house_number: 940, neighborhood: "Boa Vista", plan: :trimestral, payments: 7 },
  { name_student: "Priscila Nascimento Correia", cpf_student: "55062048419", email_student: "priscila.nascimento.correia@email.com", phone: "71993889952", birth_date: "1995-04-14", street: "Rua Rui Barbosa", house_number: 143, neighborhood: "Novo Horizonte", plan: :mensal, payments: 1 },
  { name_student: "Henrique Silva Pinto", cpf_student: "00314503773", email_student: "henrique.silva.pinto@email.com", phone: "77986847793", birth_date: "1992-08-11", street: "Rua XV de Novembro", house_number: 537, neighborhood: "Centro", plan: :trimestral, payments: 1 },
  { name_student: "Raquel Ferreira Rodrigues", cpf_student: "38012537320", email_student: "raquel.ferreira.rodrigues@email.com", phone: "77985677052", birth_date: "1967-09-23", street: "Rua das Palmeiras", house_number: 630, neighborhood: "Vila Nova", plan: :semestral, payments: 3 },
  { name_student: "Daniel Santos Oliveira", cpf_student: "96898210408", email_student: "daniel.santos.oliveira@email.com", phone: "71993783798", birth_date: "2007-05-03", street: "Rua Santa Luzia", house_number: 971, neighborhood: "Alto do Cruzeiro", plan: :semestral, payments: 1 },
  { name_student: "Débora Gomes Carvalho", cpf_student: "83755559757", email_student: "debora.gomes.carvalho@email.com", phone: "77988591728", birth_date: "1973-09-24", street: "Rua Dom Pedro II", house_number: 271, neighborhood: "Parque das Árvores", plan: :mensal, payments: 7 },
  { name_student: "Caio Rodrigues Lima", cpf_student: "72075473587", email_student: "caio.rodrigues.lima@email.com", phone: "77990006358", birth_date: "1978-01-21", street: "Rua Tiradentes", house_number: 290, neighborhood: "São Vicente", plan: :basico, payments: 11 },
  { name_student: "Natália Rocha Cardoso", cpf_student: "06188479100", email_student: "natalia.rocha.cardoso@email.com", phone: "71990497552", birth_date: "1981-04-19", street: "Rua das Flores", house_number: 883, neighborhood: "Bela Vista", plan: :semestral, payments: 2 },
  { name_student: "Renato Lima Barbosa", cpf_student: "55521824804", email_student: "renato.lima.barbosa@email.com", phone: "77990439559", birth_date: "2000-06-16", street: "Avenida Brasil", house_number: 543, neighborhood: "Santa Clara", plan: :anual, payments: 1 },
  { name_student: "Cláudia Cardoso Barros", cpf_student: "30733688250", email_student: "claudia.cardoso.barros@email.com", phone: "77997787272", birth_date: "2002-02-20", street: "Rua Sete de Setembro", house_number: 536, neighborhood: "Jardim América", plan: :trimestral, payments: 3 },
  { name_student: "Jorge Ribeiro Freitas", cpf_student: "85568983275", email_student: "jorge.ribeiro.freitas@email.com", phone: "71984325434", birth_date: "2007-08-05", street: "Rua Bahia", house_number: 631, neighborhood: "Boa Vista", plan: :mensal, payments: 3 },
  { name_student: "Sandra Freitas Pereira", cpf_student: "90044224800", email_student: "sandra.freitas.pereira@email.com", phone: "77991293508", birth_date: "2008-03-05", street: "Avenida Getúlio Vargas", house_number: 719, neighborhood: "Novo Horizonte", plan: :basico, payments: 8 }
]

METODOS = ["Pix", "Cartão de crédito", "Cartão de débito", "Dinheiro", "Boleto"].freeze

students_data.each_with_index do |row, i|
  plan = plans[row[:plan]]
  qtd  = row[:payments]

  ultimo_vencimento = HOJE + ((i * 7) % 40 - 25).days

  inadimplente = ultimo_vencimento < HOJE && (i % 4).zero?

  student = Student.find_or_create_by!(cpf_student: row[:cpf_student]) do |s|
    s.assign_attributes(
      row.except(:plan, :payments).merge(plan_id: plan.id, status: !inadimplente)
    )
  end

  next if Payment.exists?(student_id: student.id)

  qtd.times do |k|
    vencimento = ultimo_vencimento - ((qtd - 1 - k) * plan.duration_days).days
    ultimo     = (k == qtd - 1)

    pago = ultimo ? (vencimento <= HOJE && !inadimplente) : true

    Payment.create!(
      student_id:        student.id,
      plan_id:           plan.id,                       
      name_plan_payment: plan.name_plan,            
      amount:            plan.price,
      due_date:          vencimento,
      paid_at:           pago ? vencimento - ((i + k) % 4).days : nil,
      payment_method:    METODOS[(i + k) % METODOS.size],
      status:            pago
    )
  end
end

puts "Seed ok: #{User.count} users, #{Plan.count} plans, #{Student.count} students, #{Payment.count} payments."
puts "Login de demonstração: CPF de qualquer user listado acima / senha #{SENHA_DEMO}"