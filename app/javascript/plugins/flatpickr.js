import flatpickr from "flatpickr";

const initFlatpickr = () => {
  console.log('hey')
  flatpickr(".datepicker", {
    disableMobile: true,
    minDate: "today"
  });
}

export { initFlatpickr };
