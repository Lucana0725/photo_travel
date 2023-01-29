module ApplicationHelper
  # app/views/layouts/application.html.erbに記述した検索フォームを、about, log_in, sign_upで表示したくないので、こちらでヘルパーメソッドとしてまとめて定義
  def hide_search_bar?
    current_page?(controller: 'public/sessions', action: 'new') ||
      current_page?(controller: 'public/registrations', action: 'new') ||
      current_page?(controller: 'public/homes', action: 'about')
  end
end
