ActiveAdmin.register Airline do
  permit_params :name
  menu label: 'Авиакомпнии'
end
