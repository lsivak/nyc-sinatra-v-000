<form action="/figures" method="POST">

   <label>Figure Name:</label>
   <input type="text" id="figure_name" name="figure[name]"></input>
   <br>
   <label>Choose Figure Title:</label>
   <% Title.all.each do |title| %>

   <input type="checkbox" id="title_<%=title.id%>" name="figure[title_ids][]" value="<%= title.id%>"></input>

   <input type="checkbox" id=title_"<%=title.id%>" name="figure[title_ids][]" value="<%= title.id%>"></input><br>

 <%end%>
 <br>
   <label>Create New Title:</label>
   <input type="text" id="new_title" name="title[name]"></input></br>


   <label>Choose Landmark:</label>
   <% Landmark.all.each do |landmark| %>

   <input type="checkbox" name="figure[landmark_ids][]" id="landmark_<%=landmark.id%>" value="<%=landmark.id%>">
<% end %>
<br>
   <label>Create New Landmark:</label>

   <input type="checkbox" name="figure[landmark_ids][]" id="landmark_<%=landmark.id%>" value="<%=landmark.id%>"><br>
   <label>Year Completed:</label>
   <%= landmark.year_completed %><br>
<% end %>
   <label>Create New Landmark:</label><br>

     <input type="text" name="landmark[name]" id="new_landmark" ><br>
     <label>New Year_Completed:</label>
       <input type="text" name="landmark[year_completed]" ><br>
       <br>
     <input type="submit" value="Create New Figure">

   </form>
