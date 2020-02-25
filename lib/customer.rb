class Customer
    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def accounts
        Account.all.select do |account|
            account.customer == self
            # binding.pry
        end
    end

    def banks
        accounts.map do |account|
            account.bank
        end
    end

    def new_account(number, balance, bank)
        Account.new(number, balance, bank, self)
        
        #  binding.pry
        
    end

    def self.average_number_of_accounts
        (Account.all.size / all.size.to_f).round(2)
        # binding.pry

    end

    
    
end