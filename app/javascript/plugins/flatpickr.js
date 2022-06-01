import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    disableMobile: true,
    minDate: "today"
  });
}

export { initFlatpickr };
