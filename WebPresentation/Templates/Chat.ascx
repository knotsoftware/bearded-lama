﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Chat.ascx.cs" Inherits="WebPresentation.Templates.Chat" %>
    <div class="chatContainer" style="width:200px; height:600px; color:blue;">
        
        <div class="navbar navbar-static-top navbar-inverse">
</div>

<div class="container">
  <div class="panel panel-info">
      <div class="panel-heading">Game Title</div>
    <dl class="dl-horizontal discussion" id="messages" style="height:400px; overflow-y:auto">

    </dl>
    <div class="">
      <div class="input-group">
          <asp:LoginView ID="ChatLogin" runat="server">
              <AnonymousTemplate>
                    <span class="input-group-addon">userId</span>
        <input type="text" class="form-control" placeholder="Login to chat! Or enter a temporary name here!" id="message" autocomplete="off" onkeyup="if (event.keyCode == 13) document.getElementById('sendmessage').click()">
        <span class="input-group-btn">
          <button class="btn btn-primary" type="button" value="Send">
              </AnonymousTemplate>
              <LoggedInTemplate>
  <span class="input-group-addon">userId</span>
        <input type="text" class="form-control" id="message" autocomplete="off" onkeyup="if (event.keyCode == 13) document.getElementById('sendmessage').click()">
        <span class="input-group-btn">
          <button class="btn btn-primary" type="button" value="Send">Go!</button>
        </span>
                  </LoggedInTemplate>
              </asp:LoginView>
      </div><!-- /input-group -->
    </div><!-- /.col-lg-6 -->
  </div>
</div>

        <input type="text" id="message" autocomplete="off" onkeyup="if (event.keyCode == 13) document.getElementById('sendmessage').click()" style="display:none;"/>
        <input type="button" id="sendmessage" value="Send" style="display:none;"/>

    </div>
    <!--Script references. -->
    <script src="/Scripts/jquery.signalR-1.1.4.js"></script>
    <!--Reference the autogenerated SignalR hub script. -->
    <script src="/signalr/hubs"></script>
    <!--Add script to update the page and send messages.-->
    <script type="text/javascript">
        var gameId = <%=gameId()%>
            gameId = 1;
        $(function () {
            // Declare a proxy to reference the hub. 
            var chat = $.connection.chatHub;
            // Create a function that the hub can call to broadcast messages.
            chat.client.broadcastMessage = function (userId, message) {
                // Html encode display userId and message. 
                var encodeduserId = $('<div />').text(userId).html();
                var encodedMsg = $('<div />').text(message).html();
                // Add the message to the page. 
                $('#messages').append('<dt>' + encodeduserId
                    + '</dt><dd>' + encodedMsg + '</dd>');
                var elem = document.getElementById('messages');
                elem.scrollTop = elem.scrollHeight;
            };
 
            $('#message').focus();
            // Start the connection.
            $.connection.hub.start().done(function () {
                chat.server.send("newconnection", "", gameId);
                $('#sendmessage').click(function () {
                    if ($('#message').val().length > 0) {
                        // Call the Send method on the hub. 
                        chat.server.send("", $('#message').val(), gameId);
                        // Clear text box and reset focus for next comment. 
                        $('#message').val('').focus();
                    }
                });
            });
        });
    </script>