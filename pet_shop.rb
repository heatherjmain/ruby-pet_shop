def pet_shop_name(pet_shop)
  return pet_shop[:name]
end



def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end



def add_or_remove_cash(pet_shop, money)
  return pet_shop[:admin][:total_cash] += money
end



def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end



def increase_pets_sold(pet_shop, sales)
  return pet_shop[:admin][:pets_sold] += sales
end



def stock_count(pet_shop)
  return pet_shop[:pets].length()
end



def pets_by_breed(pet_shop, breed)

count = []
  for pet in pet_shop[:pets] do

    if pet[:breed] == breed
      count.push(pet)
    end

  end
  return count

end



def find_pet_by_name(pet_shop, name)

  for pet in pet_shop[:pets] do

    if pet[:name] == name
      return pet
    end

  end
  return nil

end



def remove_pet_by_name(pet_shop, name)

  for pet in pet_shop[:pets] do

    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end

  end

end



def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end



def customer_pet_count(customer)
  return customer[:pets].length()
end



def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
  return customer[:pets].length()
end



def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end


def sell_pet_to_customer(pet_shop, pet, customer)
  if pet == nil
    return customer[:pets].length()

  elsif customer_can_afford_pet(customer, pet)

# add pet to customer/remove from stock
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet)

# add pet to pets_sold
    increase_pets_sold(pet_shop, 1)

# add cash to total_cash/remove from customer
    add_or_remove_cash(pet_shop, pet[:price])
    customer[:cash] -= pet[:price]
  end
end
