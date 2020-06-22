ActiveAdmin.register Flight do
  permit_params :airline_id, :price, :from, :to, :time, :state
  menu label: 'Авиарейсы'

  member_action :to_canceled, method: :put

  index do
    selectable_column
    id_column
    column :airline
    column :from
    column :to
    column :price
    column :time
    column :state
    actions defaults: false do |flight|
      item 'Отменить',
           to_canceled_admin_flight_path(flight),
           class: 'member_link',
           'data-method': :put if flight.pending?
      item 'Открыть', admin_flight_path(flight), class: 'view_link member_link'
      item 'Изменить', edit_admin_flight_path(flight), class: 'edit_link member_link'
      item 'Удалить',
           admin_flight_path(flight),
           'data-method': :delete,
           'data-confirm': 'Вы уверены, что хотите удалить это?',
           class: 'delete_link member_link'
    end
  end

  show do
    attributes_table do
      row 'Авиокомпания' do |flight|
        flight.aircraft.name
      end
      row 'Цена' do |flight|
        flight.price
      end
      row 'Откуда' do |flight|
        flight.from
      end
      row 'Куда' do |flight|
        flight.to
      end
      row 'Время' do |user|
        flight.time
      end
      row 'Статус' do |flight|
        flight.state
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :aircraft
      f.input :price
      f.input :from, as: :select, collection: Airport.select_options, label: 'Откуда'
      f.input :to, as: :select, collection: Airport.select_options, label: 'Куда'
      f.input :time, as: :date_time_picker, picker_options: { min_date: Date.current + 2.days,
                                                              step: 20 }
    end
    f.actions
  end

  controller do
    def to_canceled
      flight = Flight.find(params[:id])
      flight.to_canceled!
      redirect_to admin_flights_path
    end
  end
end
