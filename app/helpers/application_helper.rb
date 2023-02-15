module ApplicationHelper
  # app/views/layouts/application.html.erbに記述した検索フォームを、about, log_in, sign_upで表示したくないので、こちらでヘルパーメソッドとしてまとめて定義
  def hide_search_bar?
    # current_page?(controller: 'public/sessions', action: 'new') ||  # layouts/各レイアウトviewファイルで検索フォームの部分テンプレートが読み込まれていないから、ここに書かなくてもlayout/各ファイルに<%= render %>がなければ表示されない
    #   current_page?(controller: 'public/registrations', action: 'new') ||
    #   current_page?(controller: 'public/homes', action: 'about') ||
      current_page?(controller: 'public/users', action: 'unsubscribe')
  end
end
