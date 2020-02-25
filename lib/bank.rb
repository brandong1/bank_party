class Bank
    attr_reader :name, :city

    @@all = []

    def initialize(name, city)
        @name = name
        @city = city
        @@all << self
    end

    def self.all
        @@all
    end

    def accounts
        Account.all.select do |account|
            account.bank == self 
        end
    end

    def customers
        accounts.map do |account|
            account.customer
        end
    end

    def self.most_customers
        bank = all.max_by do |bank|
            bank.customers.size
        end
        p "#{bank.name} Bank has #{bank.accounts.size} customers."
    end

    def new_account(number, balance, customer)
        Account.new(number, balance, self, customer)
    end

    def oldest_account
        accounts.min_by {|account| account.open_year}
    end

    def self.customer_count
        
    end

end 
