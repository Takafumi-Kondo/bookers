Rails.application.routes.draw do
	get 'posts/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'top' => 'root#top'

	post 'posts' => 'posts#create' #/postsというURLにpostでリク→postscontroのCreateアクション

	get 'posts' => 'posts#index' #/postsでpostsコンのindexアクション
#:idでposts/数字らを含められる。
	get 'posts/:id' => 'posts#show', as: 'post'#名前付きルート。この設定をpostとして使える

	get 'posts/:id/edit' => 'posts#edit', as: 'edit_post'

	patch 'posts/:id' => 'posts#update', as: 'update_post'

	delete 'posts/:id' => 'posts#destroy', as: 'destroy_post'
end
