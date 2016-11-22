ActiveAdmin.register Schedule do
  belongs_to :course
  permit_params :topic, :startdate, :enddate, :starttime, :endtime

  index do
    selectable_column
    id_column
    column :topic
    column :startdate
    column :enddate
    column :starttime
    column :endtime

    actions
  end


  form do |f|
    f.inputs "Schedule Details" do
      f.input :topic
      f.input :startdate
      f.input :enddate
      f.input :starttime
      f.input :endtime
    end
    f.actions
  end


end
