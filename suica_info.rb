class Suica
  attr_accessor :total, :age, :sex

  def initialize(charge_money = 0, age, sex)
    @total = charge_money
    @age = age
    @sex = sex
  end

  def suica_info
    puts "残高：#{total}円、年齢：#{age}、性別：#{sex}"    # @をつけると入らない。インスタンス変数は他のクラスには通用しない。
  end
end