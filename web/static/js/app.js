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
var path = window.location.pathname
  , isOffice = !!(path == "/" || path.match(/office|midday|^\/mp\/|morningPrayer|mp_cutrad|mp_cusimp|晨禱傳統|晨禱簡化|^\/ep\/|eveningPrayer|ep_cutrad|ep_cusimp|晚報傳統祈禱|晚祷简化/))

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".
$(".alt_readings-select").click( function() {
  var show_this = "#" + $(this).data("ref");
  $(".this_alt_reading").hide();
  $(show_this).show();
})

$(document).on('input', 'textarea', function () {
  $(this).outerHeight('1em').outerHeight(this.scrollHeight); // 38 or '1em' -min-height
}); 


$("button.more-options").click( function() {
  $("ul#header-options").toggleClass("responsive");
})

$("input[name='footnote_show']").click(function() {
  $(this).val() == "show" ? $('.footnote, .footnotes').show() : $('.footnote, .footnotes').hide();
})

$("input[name='vss_show']").click(function() {
  $(this).val() == "show" ? $('.verse-num, .chapter-num').show() : $('.verse-num, .chapter-num').hide();
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

function get_versions(arg1, arg2) {
  var versions = get_init(arg1, arg2)
    , version_list = versions.split(",");
  return version_list;
}

function get_version(arg) {
  var m = { ot: "ESV"
  , ps: "BCP"
  , nt: "ESV"
  , gs: "ESV"
  }
  return get_init("iphod_" + arg, m[arg])
}

function version_list() {
  return [ get_version("ps")
  , get_version("ot")
  , get_version("nt")
  , get_version("gs")
  ]
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

var now = new Date()
  , tz = now.toString().split("GMT")[1].split(" (")[0] // timezone, i.e. -0700
  , am = now.toString().split(" ")[4] < "12";

if ( path.match(/office/) ) {
  var vers = get_version("ps") + "/" + get_version("ot")
    , till_midday = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 11, 30) - now
    , till_evening = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 15) - now
    , till_late = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 21, 30) - now
    , till_midnight = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 24) - now;


  function mp() { window.location.href = "/office/mp/" + vers }
  function np() { window.location.href = "/office/midday" }
  function ep() { window.location.href = "/office/ep/" + vers }
  function compline() { window.location.href = "/office/compline" + vers }

  history.pushState(path, "Legereme", "/office");
//  if (till_midday > 0) { setTimeout(np, till_midday) }
//  else if (till_evening > 0) { setTimeout(ep, till_evening)}   
//  else if (till_late > 0) { setTimeout(compline, till_late)}
//  else { setTimeout(mp, till_midnight) }
}

// HEADER ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

var elmHeaderDiv = document.getElementById('header-elm-container')
  , elmHeaderApp = Elm.Header.embed(elmHeaderDiv)
  , channel = socket.channel("iphod:readings")

channel.join()
  .receive("ok", resp => { 
    // elmHeaderApp.ports.portConfig.send(init_config_model());
  })
  .receive("error", resp => { console.log("Unable to join Iphod", resp) })

elmHeaderApp.ports.portConfig.send(init_config_model());

elmHeaderApp.ports.sendEmail.subscribe( function(email) {
  channel.push("request_send_email", email)
})
  
elmHeaderApp.ports.saveConfig.subscribe( function(config) {
  if (isOffice) {
    if ( config.ps != get_version("ps") ) {
      channel.push("get_prayer_reading", ["psalms", config.ps, $("#psalms").data("psalms")]) 
    }
    if ( config.ot != get_version("ot") ) { // taking OT ver as version for all
      channel.push("get_alt_reading", ["reading1", config.ot, $("#reading1").data("reading1")] )
      channel.push("get_alt_reading", ["reading2", config.ot, $("#reading2").data("reading2")] )
    }
  }
  else { // is Calendar
    if ( $("#eu .readings_table").is(":visible") ) {
      channel.push("get_text", ["EU", $("#readings").data("reading_date"), [config.ps, config.ot, config.nt, config.gs]])
    }
    if ( $("#mp .readings_table").is(":visible") ) {
      channel.push("get_text", ["MP", $("#readings").data("reading_date"), [config.ps, config.ot, config.nt, config.gs]])
    }
    if ( $("#ep .readings_table").is(":visible") ) {
      channel.push("get_text", ["EP", $("#readings").data("reading_date"), [config.ps, config.ot, config.nt, config.gs]])
    }
  }
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

  
if (isOffice) {
// ALT READINGS...
  channel.on('single_lesson', data => {
    let resp = data.resp[0],
        target = "#" + resp.section;
    $(target).next().replaceWith(resp.body)
  })

  channel.on('alt_lesson', data => {
    let resp = data.resp[0]
    $("#" + resp.id).replaceWith(resp.body)
  })  

  $(".alt_reading").change( function(){
    let vss = $(this).val();
    $(this).val("");
    // vss, version, service, section
    channel.push("get_single_reading", [vss, "ESV", $(this).data("reading_target"), "mp"])
  })

}


// landing page, calendar

if ( path.match(/calendar/) || path.match(/mindex/)) {
  elmHeaderApp.ports.portConfig.send(init_config_model());
  history.pushState(path, "Legereme", "/calendar");
  

  // mindex
  if ( path.match(/mindex/) ) { 
    var elmMindexDiv = document.getElementById('m-elm-container')
    , elmMindexApp = Elm.MIndex.embed(elmMindexDiv)
    , elmMPanelDiv = document.getElementById('m-reading-container')
    , elmMPanelApp = Elm.MPanel.embed(elmMPanelDiv)

    $("#reflection-today-button").click( function() {
      channel.push("get_text", ["Reflection", (new Date).toDateString(), version_list()])
    });
  
    $("#next-sunday-button").click( function() {
      channel.push("get_text", ["NextSunday", (new Date).toDateString(), version_list() ] )
    })
  
    $("#m-reading-container").click( function() {
      $("#reading-panel").effect("drop", "fast");
    });
  
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
      $("#reading-panel").effect("slide", "fast")
    })
  
    elmMPanelApp.ports.requestService.subscribe( function(request) {
      request.push( version_list() );
      channel.push("get_text", request )
    })
  
    elmMPanelApp.ports.requestReflection.subscribe( function(date) {
      var ref = ["Reflection", date];
      ref.push( version_list() )
      channel.push("get_text", ref);
    })
  
    elmMPanelApp.ports.requestReading.subscribe(function(request) {
      request.push( version_list() )
      channel.push("get_lesson", request)
    })
  
  } // end of mindex

  
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

  $("#reflection-today-button").click( function() {
    channel.push("get_text", ["Reflection", (new Date).toDateString(), version_list() ])
  });

  $("#next-sunday-button").click( function() {
    channel.push("get_text", ["NextSunday", (new Date).toDateString(), version_list() ] )
  })

  channel.on('latest_chats', data => {
    elmHeaderApp.ports.portInitShout.send( data)
  })

  channel.on('alt_lesson', data => {
    // let resp = data.resp[0]

    elmCalApp.ports.portLesson.send(data.resp);
  })  

  channel.on('reflection_today', data => {
    elmCalApp.ports.portReflection.send(data);
    rollup();
  })
  
  channel.on('eu_today', data => {
    data.config = init_config_model();
    $("#readings")
      .data("psalms",       readingList(data.ps) )
      .data("psalms_ver",   data.ps[0].version)
      .data("reading1",     readingList(data.ot) )
      .data("reading1_ver", data.ot[0].version)
      .data("reading2",     readingList(data.nt) )
      .data("reading2_ver", data.nt[0].version)
      .data("reading3",     readingList(data.gs) )
      .data("reading3_ver", data.gs[0].version)
      .data("reading_date", data.date)
    elmCalApp.ports.portEU.send(data);
    rollup();
  })
    
  channel.on('mp_today', data => {
    data.config = init_config_model();
    $("#readings")
      .data("psalms",       readingList(data.mpp) )
      .data("psalms_ver",   data.mpp[0].version)
      .data("reading1",     readingList(data.mp1) )
      .data("reading1_ver", data.mp1[0].version)
      .data("reading2",     readingList(data.mp2) )
      .data("reading2_ver", data.mp2[0].version)
      .data("reading3",     "")
      .data("reading3_ver", "")
      .data("reading_date", data.date)
    elmCalApp.ports.portMP.send(data)
    rollup();
  })

  function readingList(readings) {
    return readings.map( function(a) {return a.read}).join(", ")
  }
    
  channel.on('ep_today', data => {
    data.config = init_config_model();
    $("#readings")
      .data("psalms",       readingList(data.epp) )
      .data("psalms_ver",   data.epp[0].version)
      .data("reading1",     readingList(data.ep1) )
      .data("reading1_ver", data.ep1[0].version)
      .data("reading2",     readingList(data.ep2) )
      .data("reading2_ver", data.ep2[0].version)
      .data("reading3",     "")
      .data("reading3_ver", "")
      .data("reading_date", data.date)
    elmCalApp.ports.portEP.send(data)
    rollup();
  })
  
  channel.on('update_lesson', data => {
    data.config = init_config_model();
    elmCalApp.ports.portLesson.send(data.lesson);
  })

  $(".reading_button").click( function() {
    var date = $(this).attr("data-date")
      , of_type = $(this).attr("data-type");
    if (date == null) {
      var d = new Date()
        , days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        , mons = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        , dow = days[d.getDay()]
        , mon = mons[d.getMonth()]
      date = dow + " " + mon + " " + d.getDate() + ", " + d.getFullYear();
    }
    var request = [of_type, date];
    request.push( version_list() );
    channel.push("get_text", request);
  });
  
  var elmCalDiv = document.getElementById('cal-elm-container')
    , elmCalApp = Elm.Iphod.embed(elmCalDiv)

  if ( !!$("#these_readings").data("service") ) {
    // where the problem was
    var this_service = $("#these_readings").data("service")
      , this_date = $("#these_readings").data("date")
      , request = [this_service, this_date];

    request.push( version_list() );
    channel.push("get_text", request);
    $(window).scrollTop(0);
  }

  elmCalApp.ports.requestReading.subscribe(function(request) {
    channel.push("get_lesson", request)
  })
  
  elmCalApp.ports.requestAltReading.subscribe(function(request) {
    var [section, ver, vss] = request;
    ver = get_version(section) 
    channel.push("get_alt_reading", [section, ver, vss])
  })

  elmCalApp.ports.requestScrollTop.subscribe(function(request) {
    // if needs be, request to be used to scroll to a location from top
    // use `setTimeout` to give page a chance to load
    setTimeout("$(window).scrollTop(0)", 15);
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
    refl_channel.push("submit", [d.id, d.date, d.text, d.author, d.published])
  });

  elmReflApp.ports.portReset.subscribe(function(data) {
    refl_channel.push("reset", data.id)
  });

  elmReflApp.ports.portBack.subscribe(function(data) {
    window.location = "/reflections"
  });

  refl_channel.on("reflection", data => {
    elmReflApp.ports.portReflection.send(data)
  })

  refl_channel.on("submitted", data => {
    console.log("SUBMITTED: ", data)
  })
} // END OF reflections

