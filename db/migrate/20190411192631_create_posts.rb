class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	#タイトルと本文のカラム定義(文字列なのでstring)
    	t.string :title
    	t.string :body
		t.timestamps
    end
  end
end
