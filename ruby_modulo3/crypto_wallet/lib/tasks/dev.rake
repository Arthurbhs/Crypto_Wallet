namespace :dev do
  desc "Configurar o ambiente de desenvolvimento"
   task setup: :environment do
     
     if Rails.env.development?
 
 
 show_spinner("Apagando DB") { %x(rails db:drop)}
 
     show_spinner("Criando DB") {%x(rails db:create)}
  
     show_spinner("Migrando DB") { %x(rails db:migrate)}
 
     %x(rails dev:add_mining_types)
     %x(rails dev:add_coins)

 
    else
     puts "Você não está em mode de desenvolvimento"
    end
    end

    desc "Cadastramento de moedas"
    task add_coins: :environment do
      show_spinner("Cadastrando moedas....") do
coins = [
      {
description: "Bitcoin",
acronym: "BTC",
url_image: "https://s3.envato.com/files/246339957/bitc%20isolate%202.jpg",
mining_type: MiningType.find_by(acronym: "PoW")
      },
{
description: "Ethereum",
acronym: "ETH",
url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmf4h45l27Osu-a7PCvC-Hltyi_-pd23jZG13fqbrOepndgXNC4ciLIsoT5eTWXudesvA&usqp=CAU",
mining_type: MiningType.find_by(acronym: "PoS")
  },
{
description: "Dash",
acronym: "DSH",
url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ91eeq4awRCrO-WyyXc-KqSanvOk61vMvng&usqp=CAU",
mining_type: MiningType.find_by(acronym: "PoC")
}
  ]

  coins.each do |coin|
      Coin.find_or_create_by!(coin)
  end
 end
end

desc "Cadastro de mineração"
   task add_mining_types: :environment do
    show_spinner("Cadastrando mineração") do
 mining_types = [
  {description: "Proof of work", acronym: "PoW"},
  {description: "Proof of stake", acronym: "PoS"},
  {description: "Proof of capacity", acronym: "PoC"}
 ]

  mining_types.each  do |mining_type|
    MiningType.find_or_create_by(mining_type)
   end
  end
end




   private
   def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner]
    #{msg_start}, ")
     yield
    spinner.auto_spin
    spinner.success("#{msg_end}")
     end
    end
