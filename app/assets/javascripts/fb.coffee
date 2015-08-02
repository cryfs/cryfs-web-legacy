window.fbAsyncInit = ->
  window.FB.init
    appId: '464697373705005'
    xfbml: true
    version: 'v2.4'
  window.FB.Event.subscribe 'edge.create', ->
    window.ga 'send', 'event', 'fb', 'like'
  window.FB.Event.subscribe 'edge.remove', ->
    window.ga 'send', 'event', 'fb', 'unlike'

`(function(d, s, id){
var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/en_US/sdk.js";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));`