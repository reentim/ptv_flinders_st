const filterData = (data) => {
  const d = new Date

  return _.map(data, (array) => (
    _.filter(array, (object) => (
      return object.scheduled_departure_utc > d.toISOString()
    ))
  ))
}

const getData = () => {
  fetch('/flinders_st_departures.json')
    .then(function(response) {
      console.log(response.headers)
      response.json().then(function(responseData) {
        window.data = responseData
      })
    })
}


getData()

{/* setInterval(getData, 5000) */}
