import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const flatpicker = document.getElementById('offer_deadline');
  if (flatpicker) {
    flatpickr(".datepicker", {
      disableMobile: true,
      minDate: "today"
    });
  }
}

export { initFlatpickr };
