module ApplicationHelper

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def admin?
        current_user ? current_user.admin : false
    end

    def current_uri
        @current_uri ||= request.env['PATH_INFO']
    end

    def permission_to_edit?(object)
        if object.class == User
            object == current_user || admin?
        else
            object.try(:user_id) == current_user.id || admin?
        end
    end

    def permission_to_view?(object)
        logged_in? ? permission_to_edit?(object) : false
    end

    def navbar_options
        if false #username_required
        elsif admin?
            render 'layouts/admin_nav'
        elsif logged_in?
            render 'layouts/nav'
        else
            render 'layouts/logged_out_nav'
        end
    end

    def ago_in_words(time_stamp)
        return 'a very very long time ago' if time_stamp.year < 1800
        difference = Time.now - time_stamp
        return 'just now' if difference > -1 && difference < 1
        return '' if difference <= -1
        words = difference_to_words(difference)
        final = ago_in_words_singularize(words)
        final.size == 0 ? '' : final + ' ago'
    end
    
    def difference_to_words(difference)
        [[60, :seconds], [60, :minutes], [24, :hours], [100_000, :days]].map{ |count, name|
            if difference > 0
                difference, n = difference.divmod(count)
                "#{n.to_i} #{name}"
            end
        }.compact.reverse[0]
    end
    
    def ago_in_words_singularize(words)
        if words.split(" ")[0] == "1"
            words.chomp("s")
        else
            words
        end
    end

    def form_class(object, attribute)
        "form-control #{"is-invalid" unless object.errors[attribute].blank? }"
    end

    def invalid_feedback(object, attribute)
        content_tag(:div, field_errors(object, attribute), class: "invalid-feedback d-block") unless object.errors[attribute].blank?
    end

    def field_errors(object, attribute)
        object.errors[attribute].collect{|message| "#{attribute.to_s.capitalize} #{message}." }.join(" ")
    end

    def query_not_found_for(class_name)
        render partial: 'layouts/query_not_found', locals: {class_name: class_name}
    end

    def star_object(object)
        if starred?(object)
            button_to("Unstar #{object.class.to_s}", { action: :destroy, controller: :stars, id: current_user.stars.where(starable_id: object.id, starable_type: object.class.to_s).first.id }, method: :delete, params: { id: current_user.stars.where(starable_id: object.id, starable_type: object.class.to_s).first.id, uri: current_uri }, 
                class: "btn btn-outline-warning btn-block" ) if logged_in?
        else
            button_to("Star #{object.class.to_s}", { action: :create, controller: :stars }, params: { class: object.class.to_s, id: object.id, uri: current_uri }, 
                class: "btn btn-outline-warning btn-block" ) if logged_in?
        end
    end

    def starred?(object)
        logged_in? ? current_user.stars.where(starable_id: object.id, starable_type: object.class.to_s).exists? : false
    end

end
