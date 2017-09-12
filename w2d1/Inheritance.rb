class Employee
  attr_accessor :name, :title, :salary, :boss, :emp_storage , :bonus
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    # add self to boss' employees
    boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    multiplier * salary
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees= []
  end

  def add_employee(emp)

    @employees << emp

  end

  def bonus(mult)
    return salary if self.class != Manager
    total = 0
    self.employees.each do |emp|
    # result = salary_of_employee(self.employees)
      if emp.class == Manager
         total += emp.salary
         total += emp.bonus(1)
       else
         total += emp.salary
       end
    end
    total*mult
  end


end


ned = Manager.new('Ned',"Founder",1000000,nil)
darren = Manager.new("Darren","TA manager",78000,ned)
shawna = Employee.new("Shawna","TA", 12000, darren)
david = Employee.new("david","TA", 10000, darren)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
