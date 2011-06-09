/**
 * @author Ai
 * Don't forget to add the following line to the controllers.
 * layout 'application' 
 */
function remove_fields(link) {
  
  $(link).previous("input[type=hidden]").value = "1"; // removing the record (region object)
  $(link).up(".fields").hide(); // hide the menu
}

// called from the helper.
// association is region, content is the HTML field inserted when clicked the link
function add_fields(link, association, content) {
  var new_id = new Date().getTime(); // object with unique id
  var regexp = new RegExp("new_" + association, "g") //   "/new_sregions/g"
  $(link).up().insert({before: content.replace(regexp, new_id)}); // adding the link
}