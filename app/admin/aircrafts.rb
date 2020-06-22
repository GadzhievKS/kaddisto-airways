ActiveAdmin.register Aircraft do
  permit_params :name, :seat_counts, :airline_id
  menu label: 'Самолеты'
end
