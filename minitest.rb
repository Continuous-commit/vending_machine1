require 'minitest/autorun'
require "./stock"

class StockTest < Minitest::Test

  def test_vendingmachine
    stock = Stock.new
    stock.additional_drink_info("レッドブル", 200, 5)
    stock.additional_drink_info("水", 100, 5)
    stock.stock_info
    female_suica = Suica.new(500, 32, "女性")
    male_suica = Suica.new(600, 21, "男性")
    stock.purchase("レッドブル", female_suica)
    stock.purchase("コーラ", female_suica)
    stock.purchase("コーラ", female_suica)
    stock.purchase("コーラ", female_suica)
    stock.charge_money(200, female_suica)
    stock.history
  end
end