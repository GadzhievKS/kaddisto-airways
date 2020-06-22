ActiveAdmin.register Airport do
  permit_params :name, :city
  menu label: 'Аэропорты'
end
