module ApplicationHelper

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
