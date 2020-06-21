ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation
  menu label: 'Пользователи'

  index do
    selectable_column
    id_column
    column :last_name
    column :first_name
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :last_name
      row :first_name
      row :email
      row :created_at
    end
  end

  show do
    attributes_table do
      row 'Имя' do |user|
        user.last_name
      end
      row 'Фамилия' do |user|
        user.first_name
      end
      row 'Email' do |user|
        user.email
      end
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :last_name, label: 'Имя'
      f.input :first_name, label: 'Фамилия'
      f.input :email, label: 'Email'
      f.input :password, label: 'Пароль'
      f.input :password_confirmation, label: 'Подтвердите пароль'
    end
    f.actions
  end
end
