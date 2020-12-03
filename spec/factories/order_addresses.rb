FactoryBot.define do
  factory :order_address do
    token { 'tok_321e8dbe8388244b11c68353363a' }
    postal_code { '810-0033' }
    shipping_area_id { 1 }
    city { '福岡市中央区' }
    address { '小笹4丁目12-3' }
    building { 'レジデンスホテル' }
    number { '09028374847' }
  end
end
