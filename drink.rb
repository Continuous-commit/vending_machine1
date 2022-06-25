class Drink
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # ここで定義しておかないと継承先の初期設定情報(コーラ)に対して使えなくなる
  def drink_details
    "#{name} : #{price}円"
  end
end