module AttachmentsHelper
	def attachment_params
		params.require(:attachment).permit(:post_id, :image)
	end
end