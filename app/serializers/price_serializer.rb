class PriceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :amount, :currency
end
