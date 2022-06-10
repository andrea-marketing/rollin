import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr(".range", {
    altInput: true,
    disableMobile: true
  });
  const bookingForm = document.querySelector('#new_booking')
  const startDate = document.querySelector('#range_start')
  const endDate = document.querySelector('#range_end')

  bookingForm.addEventListener("change", event => {
    const startValueInline = Number((startDate.value).replaceAll("-", ""));
    const endValueInline = Number((endDate.value).replaceAll("-", ""));
    const total = endValueInline - startValueInline
    const dayPrice = document.querySelector("#dayPrice");
    const price = Number(dayPrice.dataset.price)
    if ( total > 0) {
      totalPrice.innerHTML = `
       <h2>Nombres de jours : ${total} jours</h2>
       <h2> Total : ${total * price} €</h2> `
    }
  })
}

export { initFlatpickr };
/*
flatpickr("#range_end", {
  onChange: function(selectedDates, dateStr, instance) {
    console.log(selectedDates);
  }
}); */
