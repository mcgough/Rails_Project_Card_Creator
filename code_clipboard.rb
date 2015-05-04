
<div class='row'>
  <div class='col-md-4 col-md-offset-4'>
  <div class='f1_container'>
    <div class='fl_card shadow'>
      <div class='front-face'>
    <table class='card-table'>
      <tr>
      <td>
        <h1 class='card-name'><%= @player.name %></h1>
        <% @photos.each do |photo| %>

        <div>
          <img src="<%= "http://farm#{photo['farm']}.staticflickr.com/#{photo["server"]}/#{photo["id"]}_#{photo["secret"]}.jpg" %>" class='player-image'>
        </div>
        <div class='text-center player-team-position'>
          <%= @player.team %>
          <%= @player.position %>
        </div>
      </td>
      </tr>
      </table>
      </div>
      <div class='back face center'>
      <table class='card-table'>
      <tr>
      <td>
        <h1 class='card-name'><%= @player.name %></h1>
        <h2>Stats</h2>
        <table class='stat-table-inner'>
        <tr>
        <td class='text-center player-team-position'>
            <ul>
            <% @tags.each do |tag| %><br>
              <li class='stat-tag'><%= link_to tag.name, tag_path(tag.id) %></li>
            </ul>
            <% end %>

        </td>
        </tr>
        </table>
      </table>
        </div>
      </div>
    </div>
        <% end %>


<div class='row  text-center'>
  <%= link_to '', edit_player_path, :class =>'btn btn-primary glyphicon glyphicon-pencil' %>
  <%= link_to '', player_path, :class =>'btn btn-danger glyphicon glyphicon-trash danger',
        method: :delete,
        data: {confirm: 'Are you sure?'} %>
</div>


</div>