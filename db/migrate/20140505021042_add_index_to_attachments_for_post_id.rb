class AddIndexToAttachmentsForPostId < ActiveRecord::Migration
  def change
  	add_index "attachments", ["post_id"], name: "index_attachments_on_post_id"
  end
end
