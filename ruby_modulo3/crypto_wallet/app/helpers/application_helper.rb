module ApplicationHelper
    def date_br(data_usa)
        if I18n.locale == :"pt-BR"
        data_usa.strftime("%d/%m/%Y")
        else
            data_usa.strftime("%m-%d-%Y")
    end
end

    def locale(locale)
       
        if I18n.locale == :en
            "English (USA)"

        else
            "Portugues Brasil"
        end
    end

    def rails_ambience_br
        if Rails.env.development?
            "Desenvolvimento"
    elsif Rails.env.production?
              "Produção"
        else 
            "Teste" 
    end
  end
end
