When(/^захожу на страницу "(.*?)"$/) do |url|
  visit(url)
  puts "Открыта страница - #{url}"
end

When(/^ввожу в поисковой строке (Яндекса|Мвидео|Эльдорадо) текст "(.*?)"$/) do |search_name, text|
  find_field(tag_value(search_name)).set(text).native.send_keys(:enter)
  puts 'Поисковый запрос отправлен'
end

When(/^выбираю в результате поиска ссылку на (Мвидео|Эльдорадо)$/) do |name|
  cur_w, url = [current_window, get_url(name)]
  find("//a[contains(@class, 'link_theme_outer') and @href='#{url}']").click

  windows.each do |w|
    switch_to_window(w) if w != cur_w
  end

  cur_url = current_url
  if url.downcase == cur_url
    puts "Переход на страницу - #{url} осуществлен"
  else
    raise("Текущий адрес страницы - #{cur_url} не верный!")
  end
end

When(/^выбираю товар "(.*?)" в результате поиска (Мвидео|Эльдорадо) и запоминаю его стоимость$/) do |prod_name, name|
  find("//a[text()='#{prod_name}']").click
  current_price = find(xpath_price(name)).text.gsub(/\D/, '')
  store_current_price(name, current_price)
  puts "Цена для товара в - #{name} = #{current_price}!"
end

When(/^должен увидеть текст "(.*?)" на странице$/) do |text|
  page.should have_text text
end

When(/^цены на товар mi band в (Мвидео) и (Эльдорадо) должны быть равны$/) do |mv, el|
  mv_price, el_price = [get_current_price(mv), get_current_price(el)]
  if mv_price == el_price
    puts "Цены в торговых сетях #{mv} и #{el} совпадают и равны = #{mv_price}."
  else
    raise("Ожидаемый результат: цены совпадают. Фактический результат: Цена в #{mv} = #{mv_price}, в #{el} = #{el_price}!")
  end
end