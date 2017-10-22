

module Helpers

    def remove_account(account)
        HTTParty.delete("https://nbooks.herokuapp.com/api/accounts/#{account['email']}")
    end
    
end