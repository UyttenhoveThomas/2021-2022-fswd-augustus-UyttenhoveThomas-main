'use strict';
// #region ***  DOM references                           ***********
let htmlZones,
  htmlSteps,
  htmlStatus,
  htmlkeuze
;
// #endregion

// #region ***  Callback-Visualisation - show___         ***********
const showZones = function (jsonObject) {
  try {
    console.log(jsonObject);
    let htmlstring = '';
    for (let zone of jsonObject.zones) {
      htmlstring += `<li class="c-dropoffzone__omschrijving js-dropoffzone-btn" data-zoneid="${zone.idDropOffZone}">${zone.omschrijving} (${zone.straat})</li>`;
    }
    console.log(htmlstring)
    htmlZones.innerHTML = htmlstring;
    listenToZone();
  } catch (err) {
    console.error(err);
  }
};

const showStatus = function (jsonObject) {
  try {
    console.log(jsonObject);
    


    
  } catch (err) {
    console.error(err);
  }
};



const showSteps = function (jsonObject) {
  try {
    console.log(jsonObject);
    let htmlstring = '';
    htmlkeuze.innerHTML = htmlstring;

    for (let step of jsonObject.steps) {
      htmlstring += `
                    <div class="c-steplist js-steplist">
                      <article class="c-stepinfo">
                        <div class="c-stepinfo__serienummer">  ${step.serienummer}      </div>
                        <div class="c-stepinfo__kleur">   ${step.kleur}     </div>
                        <div class="c-stepinfo__status js-status" data-stepid="11">..get status info..</div>
                      </article>
                    </div>
      `;
      
    }
    htmlSteps.innerHTML = htmlstring;
  } catch (err) {
    console.log(err);
  }
};




// #endregion

// #region ***  Callback-No Visualisation - callback___  ***********
// #endregion

// #region ***  Data Access - get___                     ***********
const getZones = function () {
  const url = 'http://127.0.0.1:5000/api/v1/dropoffzones/';
  handleData(url, showZones);
};





// #endregion

// #region ***  Event Listeners - listenTo___            ***********
const listenToZone = function () {
  for (const btn of document.querySelectorAll('.js-dropoffzone-btn')) {
    btn.addEventListener('click', function () {
      console.log(btn.getAttribute('data-zoneid'));
      let id = btn.getAttribute('data-zoneid');
      const url = `http://127.0.0.1:5000/api/v1/dropoffzones/${id}/steps/`;
      handleData(url, showSteps, null, 'GET');
    });
  }
};






// #endregion

// #region ***  Init / DOMContentLoaded                  ***********
const init = function () {
  console.log(`🚲 DOM geladen`);
  if (document.querySelector('.js-homepage')) {
    htmlZones = document.querySelector('.js-dropoffzone');
    htmlSteps = document.querySelector('.js-steplist');
    htmlStatus = document.querySelector('.js-status')
    htmlkeuze = document.querySelector('.js-keuze')
    getZones();
    getSteps();
    getStatus();
    

  }
};

document.addEventListener('DOMContentLoaded', init);
// #endregion
