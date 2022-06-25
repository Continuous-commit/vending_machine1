require 'minitest/autorun'
require "./drink_stock"

class StockTest < Minitest::Test
  def test_drinkstock
    stock = Stock.new
    assert_equal 5, stock.add_drinks("コーラ", 120, 5)
    assert_equal ["コーラ"], stock.stock_info.uniq
    female_suica = Suica.new(500, 32, "女性")
    assert_equal [{drink: "コーラ", age: 32, sex: "女性"}], stock.purchase("コーラ", female_suica)
    assert_equal [{drink: "コーラ", age: 32, sex: "女性"}], stock.history
  end
end