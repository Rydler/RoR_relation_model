class Baby < ApplicationRecord
    has_many :breast_feedings, dependent: :destroy


    def total_drinking
        
        breast_feedings.sum(:quantity)
    end

    def total_duration
        breast_feedings.sum(:duration)
    end

    #cantidad de veces que el bebe tomo hoy hasta ahora
            
    def breast_feeding_times_today
         breast_feedings.where("created_at >= :start_at AND created_at <= :end_date", {start_at: Time.now.beginning_of_day, end_date: Time.now}).count
    end

    # fecha ultima vez que se alimento
    def last_time_drinking
        if breast_feedings.count > 0
            breast_feedings.last.created_at
        else
            ''
        end
    end
    # Cuanto tiempo a tomado hoy
    def breast_feeding_duration_today
        breast_feedings.where("created_at >= :start_at AND created_at <= :end_date", {start_at: Time.now.beginning_of_day, end_date: Time.now}).sum(:duration)
    end

    # Cuanta Cantidad de leche ha tomado hoy
    def breast_feeding_quantity_today
        breast_feedings.where("created_at >= :start_at AND created_at <= :end_date", {start_at: Time.now.beginning_of_day, end_date: Time.now}).sum(:quantity)
    end

end
