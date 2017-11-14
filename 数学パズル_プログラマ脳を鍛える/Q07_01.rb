
# 日付を扱うDateクラスを読込
require 'date'

# 抽出対象の期間を設定
term = Date.parse('19461010')..Date.parse('20200724')

# 数値化
term_list = term.map{|d|d.strftime('%Y%m%d').to_i}

# 処理した結果が同じ値になるものを出力
puts term_list.select{|d|d==d.to_s(2).reverse.to_i(2)}



# Date.parseは与えられた日付表現を解析し、その情報に基づいて日付オブジェクトを生成する

# 時刻をformat文字列に従って文字列に変換した結果を返す

# mapメソッドは、要素の数だけ繰り返しブロックを実行し、ブロックの戻り値を集めた配列を作成して返す。

# to_sメソッドは、整数を文字列に変換します。引数baseに数値を渡すと、何進数として表すかを指定できます。デフォルトは10進数です

