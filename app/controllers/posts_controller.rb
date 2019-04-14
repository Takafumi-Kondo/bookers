class PostsController < ApplicationController
	def new#最初は空をビューへ
		@post = Post.new#form_for(入力欄)を使うためモデルをインスタ変数へ
	end
#送信されたフォームDBへ
	def create
		post = Post.new(post_params)#アクション内の受け渡しなのでローカル変数 ストロングパラメータ使用(一番下)
		if post.save
			flash[:notice] = 'Book was successfully created.'
			redirect_to post_path(post.id)
		else
			redirect_to '/posts'
		end
	end

#投稿一覧index。全てのデータを取り出す
	def index
		@posts = Post.all#メソッド。複数なので@postsインスタンス変数へ
		@post = Post.new#使うため
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
		if post.update(post_params)
			flash[:notice] = 'Book was successfully updated.'
			redirect_to post_path(post.id)
		end
	end

	def destroy
		post = Post.find(params[:id])
		if post.destroy
			flash[:notice] = 'Book was successfully destroyed.'
			redirect_to '/posts'
		end
	end


	private
#フォームからのデータ投稿ボタンから
	def post_params  #モデル名		　　　カラム
		params.require(:post).permit(:title, :body)
	end
end
