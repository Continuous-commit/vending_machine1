require "./drink_stock"

stock = Stock.new

# レッドブルと水を追加
stock.add_drinks("レッドブル", 200, 5)
stock.add_drinks("水", 100, 5)

# 在庫情報
stock.stock_info

# スイカ情報
female_suica = Suica.new(1200, 32, "女性")
male_suica = Suica.new(600, 21, "男性")

# 購入
stock.purchase("レッドブル", female_suica)
stock.purchase("コーラ", female_suica)
stock.purchase("コーラ", female_suica)
stock.purchase("コーラ", female_suica)
stock.purchase("コーラ", female_suica)
stock.purchase("コーラ", female_suica)
stock.purchase("コーラ", female_suica)

# チャージ
stock.charge_money(200, female_suica)

# 履歴公開
stock.history