Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'posts/new'
	get 'top' => 'root#top'
	root :to => "root#top"#railsページを自分のトップページに
	post 'posts' => 'posts#create' #/postsというURLにpostでリク→postscontroのCreateアクション

	get 'posts' => 'posts#index' #/postsでpostsコンのindexアクション
#:idでposts/数字らを含められる。
	get 'posts/:id' => 'posts#show', as: 'post'#名前付きルート。この設定をpostとして使える

	get 'posts/:id/edit' => 'posts#edit', as: 'edit_post'

	patch 'posts/:id' => 'posts#update', as: 'update_post'

	delete 'posts/:id' => 'posts#destroy', as: 'destroy_post'
end
