module ApplicationHelper

    def number_to_currency_br(number)
        ActionController::Base.helpers.number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
    end

    def notification_color flash_type
        flash_type = flash_type.to_sym if flash_type

        case flash_type
            when :success
                'success'
            when :error
                'error'
            when :alert
                'warning'
            when :notice
                'info'
            else
                flash_type.to_s
        end
    end

    def days_remaining(order)
        if order.state == 0
            "<i class=''><i class='fa fa-sort-asc'></i> Eberta</i>"
        elsif order.state == 2
            "<i class='green'><i class='fa fa-sort-asc'></i> Finalizada</i>"
        elsif Time.zone.now < order.final_date
            last_days = (order.final_date - Time.zone.now )
            "<i class='green'><i class='fa fa-sort-asc'></i> #{time_ago_in_words last_days.seconds.from_now}</i> para entrega"
        else
            last_days = (Time.zone.now - order.final_date)
            "<i class='red'><i class='fa fa-sort-desc'></i> #{time_ago_in_words last_days.seconds.from_now}</i> em atraso"
        end
    end

    def order_status(order)
        if order.state == 0
            "<button class='btn'>ABERTA</button>"
        elsif order.state == 2 
            "<button class='btn btn-success'>FINALIZADA</button>"
        elsif Time.zone.now > order.final_date
            "<button class='btn btn-danger'>EM ATRASO</button>"
        else
            "<button class='btn btn-primary'>EM EXECUÇÃO</button>"
        end
    end

    def order_percente(order_percent)
        if order_percent > 0
            "<i class='green'><i class='fa fa-sort-asc'></i>#{order_percent}% </i> de lucro"
        else
            "<i class='red'><i class='fa fa-sort-desc'></i>#{order_percent}% </i> de prejuizo"
        end
    end
    
end
