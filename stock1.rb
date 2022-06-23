require "date"
require "./drink"
require "./suica_info"

class Stock
  attr_accessor :stocks, :sales_total, :history_info

  def initialize
    @stocks = []
    additional_drink_info("コーラ", 120, 5)
    @sales_total = 0
    @history_info = []
  end

  # 在庫確認
  def additional_drink_info(name, price, num)    # 仮引数をインスタンス変数にすることはできない
    @stocks << Drink.new(name, price, num)
  end

  def stock_info
    puts "在庫"
    @stocks.map { |d| d.name }.each do |name|
      drink = @stocks.detect { |stock| stock.name == name }
      puts drink.drink_details
    end
  end

  def purchase(name, suica)    # 各々のスイカに対応しなければならない
    nowis = DateTime.now.to_time
    drink = @stocks.detect { |stock| stock.name == name }
    if drink.num <= 0
      puts "在庫が足りません" 
    elsif suica.total < drink.price
      puts "チャージ金額が足りません" 
    else
      drink.num -= 1
      suica.total -= drink.price    # なかなか難しかった
      @sales_total += drink.price
      puts "#{drink.name}を購入しました。#{nowis}"
      puts "#{drink.name}の在庫は#{drink.num}個です。"
      puts "チャージ残高は#{suica.total}円です。"
      puts "売り上げ金額は#{sales_total}です。"
      @history_info << {drink: drink.name, age: suica.age, sex: suica.sex, time: nowis}
    end
  end

  # チャージ
  def charge_money(money, suica)
    if money >= 100
      # チャージ金額の総計を取得できる。
      puts "#{money}円チャージします。"
      suica.total += money
      puts "チャージ金額の合計は#{suica.total}円です。"
    else
      puts "100円以上の金額をチャージしてください"
    end
  end

  def history
    puts "販売履歴です。"
    @history_info.each do |info|
      puts "飲み物：#{info[:drink]}、年齢：#{info[:age]}、性別：#{info[:sex]}"
    end
  end
end
