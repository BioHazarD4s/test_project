def tag_value(search_name)
  case search_name
  when 'Яндекса'   then 'text'
  when 'Мвидео'    then 'Ntt'
  when 'Эльдорадо' then 'search'
  end
end

def xpath_price(name)
  case name
  when 'Мвидео'    then "//div[contains(@class, 'fl-pdp-price__offers')]/div[contains(@class, 'fl-pdp-price__current')]"
  when 'Эльдорадо' then "//div[contains(@class, 'priceContainerInner')]/div/div/div[contains(@class, 'product-box-price__active')]"
  end
end

def get_url(name)
  case name
  when 'Мвидео'    then 'https://www.mvideo.ru/'
  when 'Эльдорадо' then 'https://www.Eldorado.ru/'
  end
end

def store_current_price(key, price)
  @current_price ||= {}
  @current_price[key] = price
end

def get_current_price(key)
  @current_price[key]
end