module ApplicationHelper

	def add_fields_link(name, f, association, partial, btn_class = nil)
  	  new_object = f.object.send(association).klass.new
  	  id = new_object.object_id
  	  fields = f.fields_for(association, new_object, child_index: id) do |builder|
  	  	render(partial, f: builder)
  	  end
  	  link_to(name, '#', class: btn_class, data: {id: id, fields: fields.gsub("\n", "")})
    end

    def add_review_link(obj, association)
      reviews_obj = obj.send(:reviews).klass.new
      form = form_for([obj, obj.reviews.new]) do |f|
      	render "servers/review_fields", builder: f, obj: obj
      end
      link_to "Add review", '#', class: "add-review-btn", data: { form: form.gsub("\n", "") }
    end
end
