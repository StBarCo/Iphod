// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "deps/phoenix_html/web/static/js/phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

$(document).on('input', 'textarea', function () {
  $(this).outerHeight('1em').outerHeight(this.scrollHeight); // 38 or '1em' -min-height
}); 


$("button.more-options").click( function() {
  console.log("CLICKED MORE OPTIONS");
  $("ul#header-options").toggleClass("responsive");
})

// LOCAL STORAGE ------------------------

function storageAvailable(of_type) {
  try {
    var storage = window[of_type],
        x = '__storage_test__';
        storage.setItem(x, x);
        storage.removeItem(x);
        return true;
  }
  catch(e) { return false;}
}

function get_init(arg, arg2) {
  var s = window.localStorage
    , t = s.getItem(arg)
  if (t == null) { 
        s.setItem(arg, arg2);
        t = arg2;
      }
  return t;
}
function init_config_model() {
  var m = { ot: "ESV"
    , ps: "Coverdale"
    , nt: "ESV"
    , gs: "ESV"
    , fnotes: "True"
    , vers: ["ESV"]
    , current: "ESV"
    }
  if ( storageAvailable('localStorage') ) {
    m = { ot: get_init("iphod_ot", "ESV")
        , ps: get_init("iphod_ps", "Coverdale")
        , nt: get_init("iphod_nt", "ESV")
        , gs: get_init("iphod_gs", "ESV")
        , fnotes: get_init("iphod_fnotes", "True")
        , vers: get_versions("iphod_vers", ["ESV"])
        , current: get_init("iphod_current", "ESV")
        }
  }
  return m;
}

function init_shout() {
  var shout = { section: ""
  , text: ""
  , time: ""
  , user: get_init("user_name", "")
  , showChat: false
  , chat: []
  , comment: ""
  }
  return shout;
}

function get_versions(arg1, arg2) {
  var versions = get_init(arg1, arg2)
    , version_list = versions.split(",");
  return version_list;
}

function get_version(arg) {
  var m = { ot: "ESV"
  , ps: "Coverdale"
  , nt: "ESV"
  , gs: "ESV"
  }
  return get_init("iphod_" + arg, m[arg])
}

function save_version(abbr) {
  var s = window.localStorage
    , t = s.getItem("iphod_vers");
  if (t == null) { 
    t = [];
  }
  else {
    t = t.split(",");
  };
  if (t.indexOf(abbr) >= 0) {return true;};
  t.push(abbr);
  t = t.toString();
  s.setItem("iphod_vers", t);
  return true
}

function unsave_version(abbr) {
  var s = window.localStorage
    , t = s.getItem("iphod_vers");
  if (t == null) return true;
  t = t.split(",");
  t = t.filter(remove_abbr, abbr);
  t = t.toString();
  s.setItem("iphod_vers", t);
  return true;
}
function remove_abbr(v, i, ary){
  return v != this;
}

function save_user_name(name) {
  if (storageAvailable('localStorage')) {
    window.localStorage.setItem("user_name", name);
  }
}


// SOCKETS ------------------------

import "./menu"
import socket from "./socket"

let path = window.location.pathname
var now = new Date()
  , tz = now.toString().split("GMT")[1].split(" (")[0]; // timezone, i.e. -0700

// mobile landing page

if ( path.match(/mindex/)) {
  $('#header-elm-container').hide()
}

// MP/EP
// grr - match doesn't match utf8 codes, must find alt solution
if (path == "/" || path.match(/mp|morningPrayer|mp_cutrad|mp_cusimp|晨禱傳統|晨禱簡化|ep|eveningPrayer|ep_cutrad|ep_cusimp|晚報傳統祈禱|晚祷简化/)) {
  let channel = socket.channel("iphod:readings")
    , elmHeaderDiv = document.getElementById('header-elm-container')
    , elmHeaderApp = Elm.Header.embed(elmHeaderDiv)

  
  channel.join()
    .receive("ok", resp => { 
      channel.push("lessons_now", [now, tz]);
      elmHeaderApp.ports.portInitShout.send(init_shout())
    })
    .receive("error", resp => { console.log("Unable to join Iphod", resp) })
    
// ALT READINGS...
  $(".alt_reading").change( function(){
    let vss = $(this).val();
    $(this).val("");
    // vss, version, service, section
    channel.push("get_single_reading", [vss, "ESV", $(this).data("reading_target"), "mp"])
  })

  channel.on('single_lesson', data => {
    let resp = data.resp[0],
        target = "#" + resp.section;
    $(target).next().replaceWith(resp.body)
  })

  
  elmHeaderApp.ports.toggleChat.subscribe(function(request) {
    request ? showchat() : hidechat();
  })

  function showchat(){
    $("#chat-container").show();
    $(".toggle-chat").text("Hide Chat");
    $("#reading-container").css("width", "59%")
  }
  
  function hidechat(){
    $("#chat-container").hide();
    $(".toggle-chat").text("Show Chat");
    $("#reading-container").css("width", "99%")
  }

  $(".toggle-chat").click( function() {
    $("#chat-container").is(":visible") ? hidechat() : showchat()
  })
  
  elmHeaderApp.ports.submitComment.subscribe(function(data){
    var payload = {user: data.user, text: data.comment, time: new Date()}
    if (data.user.trim().length == 0) {
      alert("You may not post without a name.")
    }
    else {
      $('#say-this').html('')
      save_user_name(data.user);
      channel.push("shout", payload)
    }
  })

  channel.on('shout', data => {
    var stamp = new Date(data.time)
      , shout = data.text 
                + " " 
                + "<p class='whowhen'>" 
                + data.user 
                + " at " 
                + stamp.toLocaleString()
                + "</p>";
    elmHeaderApp.ports.portShout.send(shout);
  })

}


// landing page, calendar

if ( path.match(/calendar/) || path.match(/mindex/)) {
  
  let channel = socket.channel("iphod:readings")
  channel.join()
    .receive("ok", resp => { 
      elmHeaderApp.ports.portConfig.send(init_config_model());
      elmHeaderApp.ports.portInitShout.send(init_shout())
    })
    .receive("error", resp => { console.log("Unable to join Iphod", resp) })
    
  // channel.push("init_calendar", "");

// header

  var elmHeaderDiv = document.getElementById('header-elm-container')
    , elmHeaderApp = Elm.Header.embed(elmHeaderDiv)
  
  elmHeaderApp.ports.sendEmail.subscribe(function(email) {
    channel.push("request_send_email", email)
  })
  
  elmHeaderApp.ports.saveConfig.subscribe(function(config) {
    // {ot: "ESV", ps: "BCP", nt: "ESV", gs: "ESV", fnotes: "fnotes"}
    if ( storageAvailable('localStorage') ) {
      let s = window.localStorage;
      s.setItem("iphod_ot", config.ot)
      s.setItem("iphod_ps", config.ps)
      s.setItem("iphod_nt", config.nt)
      s.setItem("iphod_gs", config.gs)
      s.setItem("iphod_fnotes", config.fnotes)
      s.setItem("iphod_vers", config.vers.join(","))
      s.setItem("iphod_current", config.current)
    }
  })

  elmHeaderApp.ports.toggleChat.subscribe(function(request) {
    request ? showchat() : hidechat();
  })

  elmHeaderApp.ports.submitComment.subscribe(function(data){
    var payload = {user: data.user, text: data.comment, time: new Date()}
    if (data.user.trim().length == 0) {
      alert("You may not post without a name.")
    }
    else {
      $('#say-this').html('')
      save_user_name(data.user);
      channel.push("shout", payload)
    }
  })
  

  // mindex
if ( path.match(/mindex/) ) { 
    var elmMindexDiv = document.getElementById('m-elm-container')
    , elmMindexApp = Elm.MIndex.embed(elmMindexDiv)
    , elmMPanelDiv = document.getElementById('m-reading-container')
    , elmMPanelApp = Elm.MPanel.embed(elmMPanelDiv)

  $("#reflection-today-button").click( function() {
    channel.push("get_text", ["Reflection", (new Date).toDateString()])
  });

  $("#next-sunday-button").click( function() {
    channel.push("get_text", ["NextSunday", (new Date).toDateString() ] )
  })

  $("#m-reading-container").click( function() {
    $("#reading-panel").effect("drop", "fast");
  });

  $("#more-button").click( function() {$("#header-elm-container").toggle()})

  channel.on('shout', data => {
    console.log("MINDEX RECVD SHOUT: ", data)
  })

  channel.on('reflection_today', data => {
    elmMindexApp.ports.portReflection.send(data);
    rollup();
  })
  
  channel.on('eu_today', data => {
    data.config = init_config_model();
    elmMindexApp.ports.portEU.send(data);
    rollup();
  })
    
  channel.on('mp_today', data => {
    data.config = init_config_model();
    elmMindexApp.ports.portMP.send(data)
    rollup();
  })
    
  channel.on('ep_today', data => {
    data.config = init_config_model();
    elmMindexApp.ports.portEP.send(data)
    rollup();
  })
  
  channel.on("single_lesson", data => {
    elmMindexApp.ports.portOneLesson.send(data.resp)
  })
  

  // calendar 

  // mobile calendar
  $(".td_link").click( function() {
    var r = $(this).find("readings").data()
      , readings = 
          { date: $(this).attr("value")
          , title: r.title
          //, collect: r.collect
          , collect: {instruction: "", title: "", collects: [], show: true} // required place holder
          , mp1: r.mp1.split(",")
          , mp2: r.mp2.split(",")
          , mpp: r.mpp.split(",")
          , ep1: r.ep1.split(",")
          , ep2: r.ep2.split(",")
          , epp: r.epp.split(",")
          , ot: r.ot.split(",")
          , ps: r.ps.split(",")
          , nt: r.nt.split(",")
          , gs: r.gs.split(",")
          , show: true
          }
    elmMPanelApp.ports.portReadings.send(readings);
    // $(elmMPanelDiv).panel("open", {})
    $("#reading-panel").effect("slide", "fast")
  })


  elmMPanelApp.ports.requestReading.subscribe( function(request) {
    var [vss, ver, service] = request
    channel.push("get_single_reading", [vss, get_version(ver), service, ver])
  })

  elmMPanelApp.ports.requestService.subscribe( function(request) {
    channel.push("get_text", request)
  })

  elmMPanelApp.ports.requestReflection.subscribe( function(date) {
    channel.push("get_text", ["Reflection", date])
  })

  // function init_collect() {
  //   var empty_collect = {instruction: "", title: "", collects: [], show: true};
  //   empty_collect;
  // }
}
  
  function rollup() {
    $(".calendar-week").hide();
    $("#rollup").text("Roll Down");
  }
  function rolldown() {
    $(".calendar-week").show();
    $("#rollup").text("Roll Up");   
  }

  $("#rollup").click( function() {
    $(".calendar-week").is(":visible") ? rollup() : rolldown()
  });

  function showchat(){
    $("#chat-container").show();
    $(".toggle-chat").text("Hide Chat");
    $("#reading-container").css("width", "59%")
  }
  
  function hidechat(){
    $("#chat-container").hide();
    $(".toggle-chat").text("Show Chat");
    $("#reading-container").css("width", "99%")
  }

  $(".toggle-chat").click( function() {
    $("#chat-container").is(":visible") ? hidechat() : showchat()
  })
  
  $(".prayer-button").click(function() {
    let prayer_type = $(this).attr("data-prayer")
      , ps = get_init("iphod_ps", "Coverdale")
      , ver = get_init("iphod_current", "ESV");
    window.location = "/" + prayer_type + "/" + ps + "/" + ver
  })

  $("#next-sunday-button").click( function() {
    channel.push("get_text", ["NextSunday", (new Date).toDateString() ] )
  })

  channel.on('alt_lesson', data => {
    // let resp = data.resp[0]

    elmCalApp.ports.portLesson.send(data.resp);
  })  

  channel.on('shout', data => {
    var stamp = new Date(data.time)
      , shout = data.text 
                + " " 
                + "<p class='whowhen'>" 
                + data.user 
                + " at " 
                + stamp.toLocaleString()
                + "</p>";
    elmHeaderApp.ports.portShout.send(shout);
  })

  channel.on('reflection_today', data => {
    elmCalApp.ports.portReflection.send(data);
    rollup();
  })
  
  channel.on('eu_today', data => {
    data.config = init_config_model();
    elmCalApp.ports.portEU.send(data);
    rollup();
  })
    
  channel.on('mp_today', data => {
    data.config = init_config_model();
    elmCalApp.ports.portMP.send(data)
    rollup();
  })
    
  channel.on('ep_today', data => {
    data.config = init_config_model();
    elmCalApp.ports.portEP.send(data)
    rollup();
  })
  
  channel.on('update_lesson', data => {
    data.config = init_config_model();
    elmCalApp.ports.portLesson.send(data.lesson);
  })

  $(".reading_button").click( function() {
    let date = $(this).attr("data-date")
      , of_type = $(this).attr("data-type");
    if (date == null) {
      let d = new Date()
        , days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        , mons = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        , dow = days[d.getDay()]
        , mon = mons[d.getMonth()]
      date = dow + " " + mon + " " + d.getDate() + ", " + d.getFullYear();
    }
    channel.push("get_text", [of_type, date]);
  });
  
  var elmCalDiv = document.getElementById('cal-elm-container')
    , elmCalApp = Elm.Iphod.embed(elmCalDiv)

  elmCalApp.ports.requestReading.subscribe(function(request) {
    channel.push("get_lesson", request)
  })
  
  elmCalApp.ports.requestAltReading.subscribe(function(request) {
    var [section, ver, vss] = request;
    ver = get_version(section) 
    channel.push("get_alt_reading", [section, ver, vss])
  })

}


// translations
if ( path.match(/versions/) ) {
  let trans_channel = socket.channel("versions")
  trans_channel.join()
    .receive("ok", resp => { 
      // console.log("Joined Versions successfully", resp);
    })
    .receive("error", resp => { console.log("Unable to join Iphod", resp) })
  
  var elmTransDiv = document.getElementById("elm-versions")
    , elmTransApp = Elm.Translations.embed(elmTransDiv)
  
  trans_channel.on("all_versions", data => {
    var saved_vers = init_config_model().vers;
    data.list.forEach(function(ver){
      if (saved_vers.includes(ver.abbr)) {ver.selected = true;}
    })
    data.list.sort(function(a,b) {
      if (a.selected && !b.selected) {return -1};
      if (!a.selected && b.selected) {return 1};
      if (a.abbr < b.abbr) {return -1};
      if (a.abbr > b.abbr) {return 1};
      return 0;
    })
    elmTransApp.ports.allVersions.send(data.list);
  });
  
  elmTransApp.ports.updateVersions.subscribe(function(version){
    if (version.selected) { save_version(version.abbr) }
    else { unsave_version(version.abbr) }
  })
}

// reflections

if ( path.match(/reflections.+[new|edit]/) ) {
  var elmReflDiv = document.getElementById("reflection-elm-container")
    , elmReflApp = Elm.NewReflection.embed(elmReflDiv)
    , refl_channel = socket.channel("reflection")
  refl_channel.join()
    .receive("ok", resp => { 
      let refl = {
          id:     $("reflection").data("recno")
        , date:   $("reflection").data("date")
        , author: $("reflection").data("author")
        , text:   $("reflection").data("text")
        , published: $("reflection").data("published")
      }
      elmReflApp.ports.portReflection.send(refl);
    })
    .receive("error", resp => {console.log("Failed to join reflection")})

    elmReflApp.ports.portSubmit.subscribe(function(d) {
    //channel.push("request_send_email", email)
    refl_channel.push("submit", [d.id, d.date, d.text, d.author, d.published])
    });

    elmReflApp.ports.portReset.subscribe(function(data) {
    //channel.push("request_send_email", email)
      refl_channel.push("reset", data.id)
    });

    elmReflApp.ports.portBack.subscribe(function(data) {
    //channel.push("request_send_email", email)
      window.location = "/reflections"
    });

    refl_channel.on("reflection", data => {
      elmReflApp.ports.portReflection.send(data)
    })

    refl_channel.on("submitted", data => {
      console.log("SUBMITTED: ", data)
    })
} // END OF reflections

