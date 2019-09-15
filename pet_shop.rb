def pet_shop_name(name_of_shop)
  return name_of_shop[:name]
end

def total_cash(name_of_shop)
  return name_of_shop[:admin][:total_cash]
end

def add_or_remove_cash(name_of_shop, number)
  name_of_shop[:admin][:total_cash] += number
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,number)
  pet_shop[:admin][:pets_sold] += number
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
breed_name_array = []
  for pets in pet_shop[:pets]
    breed_name_array.push(pets[:name]) if pets[:breed] == breed
  end
  return breed_name_array

end

def find_pet_by_name(shop, pet_name)
  for pet in shop[:pets]
    return pet if pet[:name] == pet_name
  end
  return nil
end

def remove_pet_by_name(shop, pet_name)
  for pet in shop[:pets]
    shop[:pets].delete(pet) if pet[:name] == pet_name
  end
end

def add_pet_to_stock(shop, pet)
  shop[:pets].push(pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  return true if customer[:cash] >= pet[:price]
  return false
end

def sell_pet_to_customer(shop, pet, customer)
  if pet == nil || customer_can_afford_pet(customer, pet) == false
    return
  else
    add_pet_to_customer(customer, pet)
    remove_customer_cash(customer, pet[:price])
    remove_pet_by_name(shop, pet[:name])
    add_or_remove_cash(shop, pet[:price])
    shop[:admin][:pets_sold] += 1
  end
end
