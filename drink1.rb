class Drink
  attr_accessor :name, :price, :num

  def initialize(name, price, num)
    @name = name
    @price = price
    @num = num
  end

  # ここで定義しておかないと継承先の初期設定情報(コーラ)に対して使えなくなる
  def drink_details
    "#{name}, #{price}円, #{num}個"
  end
end