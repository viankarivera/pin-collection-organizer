class Helpers

    def self.current_owner(session)
      @owner = Owner.find_by_id(session[:owner_id])
    end
  
    def self.is_logged_in?(session)
      !!session[:owner_id]
    end
  end