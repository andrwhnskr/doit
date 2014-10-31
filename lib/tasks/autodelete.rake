task delete_list: :environment do
  desc "Delete list items 7 days after creation"
  List.where("created_at <= ?", Time.now - 7.days).destroy_all
end