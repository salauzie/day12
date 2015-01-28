# day12
# day13
under _form for patients 
		<% @medications.each do |m| %>
		<%=check_box_tag 'patient[medication_ids][]', m.id, @patient.medications.include?(m) %>
		<%= m.name %>

				<% @doctors.each do |d| %>
		<%=check_box_tag 'patient[doctor_ids][]', d.id, @patient.doctors.include?(d) %>
		<%= d.name %>
	<% end %>	



	under new patient views

	<% if @patient.errors.any? %>
	<% @patient.errors.full_messages.each do |message| %>
		<p><%= message %></p>
		<br>
	<% end %>
<% end %>

		<% @patients.each do |p| %>
		<%=check_box_tag 'clinic[patient_ids][]', p.id, @clinic.patients.include?(p) %>
		<%= p.name %>
	<% end %>