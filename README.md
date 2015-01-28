# day12
# day13
under _form for patients 
		<% @medications.each do |m| %>
		<%=check_box_tag 'patient[medication_ids][]', m.id, @patient.medications.include?(m) %>
		<%= m.name %>