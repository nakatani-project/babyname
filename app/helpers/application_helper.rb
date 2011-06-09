module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    if new_object.instance_of?(Babylang)
      new_object.gender = 'Unisex'
    end
        
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(:partial => association.to_s.singularize + "_fields", :locals => {:f => builder})
    end
    # modified for rails 3
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
