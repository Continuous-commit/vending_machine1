require "date"
require "./drink"
require "./suica_info"

class Stock
  attr_accessor :stocks, :sales_total, :history_info

  def initialize
    @stocks = []
    add_drinks("コーラ", 120, 5)
    @sales_total = 0
    @history_info = []
  end

  # 在庫確認
  def add_drinks(name, price, drink_num)    # 仮引数をインスタンス変数にすることはできない
    drink_num.times.each { @stocks << Drink.new(name, price) }
  end

  def stock_info
    puts "在庫"
    @stocks.each do |drink|
      puts drink.drink_details
    end
  end

  def purchase(name, suica)    # 各々のスイカに対応しなければならない
    purchased_at = DateTime.now.to_time
    drink = @stocks.detect { |stock| stock.name == name }
    
    if not drink
      puts "在庫が足りません" 
    elsif suica.total < drink.price
      puts "チャージ金額が足りません" 
    else
      @stocks.delete(drink)
      suica.total -= drink.price    # なかなか難しかった
      @sales_total += drink.price
      puts "#{drink.name}を購入しました。#{purchased_at}"
      puts "チャージ残高は#{suica.total}円です。"
      puts "売り上げ金額は#{sales_total}です。"
      @history_info << {drink: drink.name, age: suica.age, sex: suica.sex}
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
    puts "販売履歴"
    @history_info.each do |info|
      puts "飲み物：#{info[:drink]}、年齢：#{info[:age]}、性別：#{info[:sex]}"
    end
  end
end
