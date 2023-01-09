import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // console.log('hello')
    var d1 = document.getElementById('banner');
    var contents = '<div id="logo-connect"> <img src="https://res.cloudinary.com/baptistev/image/upload/v1669296698/Capture_d_e%CC%81cran_2022-10-27_a%CC%80_14.40.23_tus73u.png" </div>';
    var d2 = document.getElementById("logo-connect")

    d1.insertAdjacentHTML('afterend', contents);
    if (window.top != window.self)
      return

    window.addEventListener ('load', function () {
      setInterval (closePop, 3000);
  }, false);

    // console.log(d2)
    function closePop() {
      const elementDelete = document.getElementById("logo-connect");
      elementDelete.remove();
    }
  }
}
