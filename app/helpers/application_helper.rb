module ApplicationHelper
	def hoverable_image_tag(name, extension = '.svg')
		src = name + extension
		hover_src = name + '_hover' + extension

		image_tag src, data: { orig_src: image_path(src), hover_src: image_path(hover_src) }
	end
end
