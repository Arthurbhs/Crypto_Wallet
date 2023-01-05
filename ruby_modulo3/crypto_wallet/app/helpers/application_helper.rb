module ApplicationHelper

    def rails_ambience_br
        if Rails.env.development?
          
            t("development")
    elsif Rails.env.production?
              t("Produção")
        else 
            t("Teste") 
    end
  end
end
