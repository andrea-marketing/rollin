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
       <p>Total days : ${total}</p>
       <p> Total price: ${total * price} €</p> `
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
