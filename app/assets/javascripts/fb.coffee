window.fbAsyncInit = ->
  window.FB.init
    appId: '464697373705005'
    xfbml: true
    version: 'v2.4'
  window.FB.Event.subscribe 'edge.create', ->
    window.ga 'send', 'event', 'fb', 'like'
  window.FB.Event.subscribe 'edge.remove', ->
    window.ga 'send', 'event', 'fb', 'unlike'

# Facebook SDK
`(function(d, s, id){
var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/en_US/sdk.js";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));`

# Facebook Pixel
`!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '1822684461321244');
fbq('track', 'PageView');`
