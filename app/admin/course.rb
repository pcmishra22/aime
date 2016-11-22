ActiveAdmin.register Course do
  permit_params :name, :status, :grade, :subject_area, :details

  index do
    selectable_column
    id_column
    column :name
    column :status
    column :subject_area
    column :grade
    column 'Schedule' do |course|
      link_to 'Schedule', [:admin, course, :schedules]
    end

    actions
  end


  form do |f|
    f.inputs "Course Details" do
      f.input :name
      f.input :details
      f.input :subject_area
      f.input :grade
    end
    f.actions
  end


end
