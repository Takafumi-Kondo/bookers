class PostsController < ApplicationController
	def new#最初は空をビューへ
		@post = Post.new#form_for(入力欄)を使うためモデルをインスタ変数へ
	end
#送信されたフォームDBへ
	def create
		post = Post.new(post_params)#アクション内の受け渡しなのでローカル変数 ストロングパラメータ使用(一番下)
		post.save
		redirect_to post_path(post.id)#後で変更　編集完了ページ
	end

#投稿一覧index。全てのデータを取り出す
	def index
		@posts = Post.all#メソッド。複数なので@postsインスタンス変数へ
	end
#投稿詳細 params[:id]でURLid値を取得できる
	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.update(post_params)
		redirect_to post_path(post.id)
	end
	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to '/posts'
	end


	private
#フォームからのデータ投稿ボタンから
	def post_params  #モデル名		　　　カラム
		params.require(:post).permit(:title, :body)
	end

end
