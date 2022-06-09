const price = document.getElementById("range_start")
console.log(price)

const priceFinder = () => {
}

export { priceFinder }

// onChange: function(selectedDates, dateStr, instance) {
//   //...
// },

flatpickr("#range_end", {
  onChange: function(selectedDates, dateStr, instance) {
    console.log(selectedDates);
  }
});
