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
import "phoenix_html";
import appcss from "../css/app.css";
import "../css/flyoutmenu.css";
import "../css/mpep.css";
import "../css/menu_styles.css";
import "../css/print.css";
import "../css/resources.css";
import "../css/stations.css";
import "./menu"
import socket from "./socket"

import { Elm as ElmStations } from '../src/Stations.elm';
// import { Elm as ElmHeader } from "../src/Header.elm"
import { Elm as ElmMIndex } from '../src/MIndex.elm';
import { Elm as ElmMPanel } from '../src/MPanel.elm';
import { Elm as ElmIphod } from '../src/Iphod.elm';
import { Elm as ElmTranslations } from '../src/Translations.elm';
import { Elm as ElmResources } from '../src/Resources.elm';
import { Elm as ElmReflections } from '../src/NewReflection.elm';

import $ from 'jquery';

var moment = require('moment');
var markdown = require('markdown').markdown;
// var Parser = require( "./parser.js" );
var LitYear = require( "./lityear.js" ).LitYear;
var BibleRef = require( "./bibleRef.js" );
var DailyPsalms = require( "./dailyPsalms.js");


// POUCHDB .................................
// var Pouchdb = require('pouchdb-browser');
import Pouchdb from 'pouchdb';
window.pdb = Pouchdb;
window.preferences = new Pouchdb('preferences');
// var Pouchdb = require('pouchdb')
//   , preferences = new Pouchdb('preferences')
window.iphod = new Pouchdb('iphod')
window.service = new Pouchdb('service')
window.psalms = new Pouchdb('psalms')
window.lectionary = new Pouchdb('lectionary')
var dbOpts = {live: true, retry: true}
  , remoteIphod = "http://legereme.com:5984/iphod"
  , remoteService = "http://legereme.com:5984/service"
  , remotePsalms = "http://legereme.com:5984/psalms"
  , remoteLectionary = "http://legereme.com:5984/lectionary"
  , default_prefs = {
      _id: 'preferences'
    , ot: 'ESV'
    , ps: 'BCP'
    , nt: 'ESV'
    , gs: 'ESV'
    , fnotes: 'True'
    , vers: ['ESV']
    , current: 'ESV'
  }

function sync() {
  iphod.replicate.to(remoteIphod, dbOpts, syncError);
  iphod.replicate.from(remoteIphod, dbOpts, syncError);
  service.replicate.to(remoteService, dbOpts, syncError);
  service.replicate.from(remoteService, dbOpts, syncError);
  psalms.replicate.to(remotePsalms, dbOpts, syncError);
  psalms.replicate.from(remotePsalms, dbOpts, syncError);
  lectionary.replicate.to(remoteLectionary, dbOpts, syncError);
  lectionary.replicate.from(remoteLectionary, dbOpts, syncError);
}

function syncError() {console.log("SYNC ERROR")};

sync();

function get_service(named) {
  // we might want to add offices other than acna
  var dbName = "acna_" + named;
  console.log("GET SERVICE: ", dbName)
  service.get(dbName).then( resp => {
    var now = moment()
      , day = [ "Sunday", "Monday", "Tuesday"
              , "Wednesday", "Thursday", "Friday"
              , "Saturday"
              ][now.weekday()]
      , season = LitYear.toSeason(now)
      , serviceHeader = [day, season.week.toString(), season.year, season.season, named]
    ;
    console.log("TODAY: ", serviceHeader.concat(resp.service))
    elmCalApp.ports.receivedOffice.send(serviceHeader.concat(resp.service))
  }).catch(err => {
    console.log("GET SERVICE ERROR: ", err);
  });
}

function get_preferences(do_this_too) {
  preferences.get('preferences').then(function(resp){
    return do_this_too(resp);
  }).catch(function(err){
    console.log("GET PREFERENCE ERR: ", err);
    return do_this_too(initialize_preferences());
  })
}

function initialize_preferences() {
  preferences.put( default_prefs ).then(function (resp) {
    return resp;
  }).catch( function (err) {
    return prefs;
  })
}

function save_preferences(prefs) {
  prefs._id = 'preferences';
  preferences.put(prefs).then(function(resp) {
    return resp;
  }).catch(function(err) {
    return prefs;
  })
}

function preference_list() {
  get_preferences(function(resp) {
    return [resp.ot, resp.ps, resp.nt, resp.gs];
  })
}

function preference_for(key) {
  get_preferences(function(resp) { return resp[key] })
}

function initElmHeader() {
  get_preferences(function(resp) {
    return elmHeaderApp.ports.portConfig.send(resp);
  })
}

// END OF POUCHDB ....................

// var elmDiv = $("#elm-container")
//   , elmApp = ElmIphod.Iphod.init({node: elmDiv})
//   ;
// 
//   elmApp.ports.requestOffice.subscribe( request => {
//     console.log("elmApp REQUEST SERVICE: ", request);
//   })


var channel = socket.channel("iphod:readings");
channel.join()
  .receive("ok", resp => {
    // console.log("OK: ", resp)
  })
  .receive("error", resp => { console.log("Unable to join Iphod", resp)});

channel.on("ping", ({count}) => console.log("SERVER PINGED: ", count))

var elmCalDiv = document.getElementById('cal-elm-container')
  , elmCalApp = ElmIphod.Iphod.init({node: elmCalDiv})
  ;

elmCalApp.ports.requestOffice.subscribe(request => {
  if (request == "currentOffice") { 
    // redirect to correct office based on local time
    var now = new moment().local()
      , mid = new moment().local().hour(11).minute(30).second(0)
      , ep = new moment().local().hour(15).minute(0).second(0)
      , cmp = new moment().local().hour(20).minute(0).second(0)
      ;
    if ( now.isBefore(mid)) { get_service("morning_prayer") }
    else if ( now.isBefore(ep) ) { get_service("midday")} // { get_service("midday")}
    else if ( now.isBefore(cmp) ) { get_service("morning_prayer")} // { get_service ("evening_prayer") }
    else { get_service("compline")}
  }
  else { get_service(request) }
});

elmCalApp.ports.toggleButtons.subscribe( request => {
  var [div, section_button] = request.map( r => { return r.toLowerCase(); } );
  var section_id = section_button.replace("button", "id")
  $("#alternatives_" + div + " .alternative").hide(); // hide all the alternatives
  $("#" + section_id).show(); // show the selected alternative
  // make all buttons unselected style
  $("#alternatives_" + div + " .default_button").removeClass("default_button").addClass("alt_button");
  // make the selected button selected style
  $("#" + section_button + ":button").removeClass("alt_button").addClass("default_button");
})

elmCalApp.ports.requestReference.subscribe( request => {
  console.log( "REQUEST READING: ", request)
  var [id, ref] = request
    , keys = BibleRef.dbKeys(ref)
    , allPromises = []
    ;
  keys.forEach( k => {
    allPromises.push( iphod.allDocs(
      { include_docs: true
      , startkey: k.from
      , endkey: k.to
      }
    ));
  }); // end of keys.forEach
  return Promise.all( allPromises )
  .then( resp => {
    var readingDiv = "<div id='ReferenceReading'></div>";
    $("#ReferenceReading").remove();
    $("#" + id).parent().append(readingDiv); 
    resp[0].rows.forEach( r => {
      $("#ReferenceReading").append(r.doc.vss);
    });
  })
  .catch( err => {
    console.log( "REQUEST READING ERROR: ", err);
  })
})

elmCalApp.ports.requestLessons.subscribe( request => {
  if ( ["morning_prayer", "evening_prayer", "eucharist"].includes(request) ) { 
    insertPsalms( request )
    insertLesson( "lesson1", request )
    insertLesson( "lesson2", request )
    insertGospel( request )
    insertCollect( request )
    insertProper( request )
  }
  // otherwise, don't do anything
})

function insertLesson(lesson, office) {
  // mpepmmdd - mpep0122
  var mpep = (office === "morning_prayer") ? "mp" : "ep"
    , mpepRef = "mpep" + moment().format("MMDD")
    ;
  lectionary.get(mpepRef)
    .then( resp => {
      var thisReading = resp[mpep + lesson.substr(-1)]
        , refs = thisReading.map( r =>  { return r.read })
        , styles = thisReading.map( r => { return r.style})
        , keys = BibleRef.dbKeys(refs)
        , allPromises = []
        ;
      keys.forEach( k => {
        allPromises.push( iphod.allDocs(
          { include_docs: true
          , startkey: k.from
          , endkey: k.to
          }
        ))
      });
      return Promise.all( allPromises )
        .then( resp => {
          var $thisLesson = $("#" + lesson);
          resp.forEach( function(r, i) {
            var klazz = "lessonTitle " + styles[i]
              , newId = lesson + "_" + i
              ;
            $thisLesson.append(
                "<div id='" + newId + "' class='" + klazz + "' >" 
              + BibleRef.lessonTitleFromKeys(keys[i].from, keys[i].to) 
              + "<br></div>");
            var $vss = $("#" + newId);
            r.rows.forEach( row => {
              $vss.append(row.doc.vss)
            })
          })
        })
      })
    .catch( err => {
      console.log("FAILED GETTING MPEP REFS: ", err)
    })
}

function insertGospel(office) {
  console.log("INSERT GOSPEL: ", office);
}

function insertCollect(office) {
  console.log("INSERT COLLECT: ", office)
    var now = moment()
    , season = LitYear.toSeason(now)
    , key = "collect_" + season.season
    , collectDiv = "#collectOfDay"
    ;
  if ( ! ["ashWednesday", "annunciation", "allSaints"].includes(season.season) ) {
    key = key + season.week
  } 
  iphod.get(key).then( resp => {
    console.log("COLLECT: ", resp)
    $(collectDiv + " .collectTitle").append("Collect of The Day <em>" + resp.title + "</em>")
    $(collectDiv + " .collectContent").append(resp.text[0])
  })
  .catch( err => {
    console.log("GET COLLET ERROR: ". err)
  })

}

function insertProper(office) {
  console.log("INSERT PROPER: ", office)
}

function insertPsalms(office) {
  var now = moment()
    , mpep = (office === "morning_prayer") ? "mp" : "ep"
    , dayOfMonth = now.date()
    , psalmRefs = DailyPsalms.dailyPsalms[dayOfMonth][mpep]
    , thesePsalms = psalmRefs.map( p => "acna" + p[0] )
    , allPromises = []
    ;
    thesePsalms.forEach( p => {
      allPromises.push( psalms.get(p) );
    })
    Promise.all( allPromises )
      .then( resp => {
        resp.map( function(r,i) {
          r.from = psalmRefs[i][1]
          r.to = psalmRefs[i][2]
        })
        showPsalms(resp);
      })
      .catch( err => {
        console.log("PROBLEM GETTING PSALMS: " + err);
      })
}

// p [class c] [ text name, span [] [ text title ]
// ( p [ class c ] [ sup [] [ text n], text s ]  :: htmlList)
function showPsalms(pss) {
  // $("#psalms").waitUntilExists(function() { console.log("PSALMS EXISTS!!!")});
  pss.forEach( ps => {
    var title = ps.title ? ps.title : "";
    $("#psalms").append("<p class='psalm_name'>" + ps.name + "<span>" + title + "</span></p>")
    for (var i = ps.from; i <= ps.to; i++) {
      if (ps[i] === undefined) break;
      var sectionTitle = ps[i].title ? ps[i].title : ""
        , hebrew = ps[i].hebrew ? ps[i].hebrew : ""
        ;
      if ( sectionTitle.length > 0 ) {
        $("#psalms").append("<p class='psalm_name'>" + sectionTitle + "<span>" + hebrew + "</span></p>")
      }
      $("#psalms").append("<p class='psalm1'><sup>" + i + "</sup>" + ps[i].first + "</p>");
      $("#psalms").append("<p class='psalm2'>" + ps[i].second + "</p>")
    }
  })
  return pss;
}
