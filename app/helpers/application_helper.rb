module ApplicationHelper

    def avatar_initials(full_name)
        return "" if full_name.blank?

        words = full_name.strip.split

        if words.length > 1
            "#{words.first[0]}#{words.last[0]}".upcase
        else
            words.first[0..1].upcase
        end
    end
end
