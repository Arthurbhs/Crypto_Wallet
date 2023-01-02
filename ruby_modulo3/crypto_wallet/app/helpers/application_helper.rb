module ApplicationHelper
    def date_br(data_usa)
        data_usa.strftime("%d/%m/%Y")
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
